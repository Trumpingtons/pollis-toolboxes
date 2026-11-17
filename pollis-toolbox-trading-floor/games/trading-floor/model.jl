# Copyright (c) 2026 Antonio Saragga Seabra
# SPDX-License-Identifier: MIT

# Trading Floor. Teams are trading desks on a market for one share: Corvane Robotics, a listed maker of warehouse
# robots. Pollis keeps the order book on the facilitator's computer while each period trades by the clock; this
# model runs at the close of each period, with each desk's position.
#
# The share's value starts at `value`. At the close of each period Corvane announces results that move the value by
# a random change, normal with standard deviation change_sd, and by any news the facilitator released in the period.
# Before each period, half of the desks, in turn, receive their analysts' hint of the change, the change plus a
# normal error with standard deviation hint_error. At the end of the game Corvane is taken over at its value, so a
# desk's wealth is its cash plus its shares at that value; its score is its return over its wealth at the start.
#
# The changes and the hints are drawn for each game, and the news is drawn by Pollis from the ranges of case.toml,
# so a student who has read the files knows how the market moves, not where. The debrief shows, for each period,
# the hints, the change the results brought, the news, and the prices the desks traded at.

const GOOD = ["won a contract with a supermarket chain", "launched a faster picking robot", "beat its sales forecast", "signed a partnership with a logistics firm"]
const BAD = ["lost a large customer", "recalled a batch of robots", "missed its sales forecast", "delayed its new model"]
const SHOCKS = ("rival_recall", "warehouse_strike")

"""The desks that receive a hint before a period: every other desk, in turn."""
informed(state, period) = [team for (i, team) in enumerate(state["teams"]) if isodd(i + period)]

"""The hints for a period, by team number as a string."""
function hints(state, p, period)
	period > length(state["changes"]) && return Dict{String,Any}()
	change = state["changes"][period]
	return Dict{String,Any}(string(team) => @sprintf("Only your desk knows this: your analysts expect Corvane's results at the close of %s to move its value by about %s%.2f a share.",
		period_name(p, period), (change + state["hint_errors"][period]) < 0 ? "-£" : "+£", abs(change + state["hint_errors"][period])) for team in informed(state, period))
end

period_name(p, period) = "Period $period"

"""Each desk's row of the public results, its shares counted at `value`."""
function standings(state, positions, value)
	return [Dict{String,Any}(
		"team" => state["names"][string(team)], "cash" => positions[team][1], "shares" => positions[team][2],
		"wealth" => positions[team][1] + positions[team][2] * value,
		"return" => 100 * ((positions[team][1] + positions[team][2] * value) / state["start_wealth"] - 1),
	) for team in state["teams"]]
end

"""Corvane before the first period: its value, the changes its results will bring, and the first hints."""
function initial(rng, parameters, teams)
	p = parameters
	m = p["market"]
	periods = round(Int, p["rounds"])
	state = Dict{String,Any}(
		"period" => 0, "value" => float(p["value"]),
		"changes" => [p["change_sd"] * randn(rng) for _ in 1:periods],
		"hint_errors" => [p["hint_error"] * randn(rng) for _ in 1:periods],
		"teams" => [t["team"] for t in teams], "names" => Dict{String,Any}(string(t["team"]) => t["name"] for t in teams),
		"start_wealth" => m["cash"] + m["shares"] * p["value"],
		"shocks" => Dict{String,Any}(key => 0.0 for key in SHOCKS),
	)
	positions = Dict(t["team"] => (float(m["cash"]), float(m["shares"])) for t in teams)
	text = @sprintf("Corvane Robotics is valued at £%.2f a share. Each desk starts with £%.2f of cash and %d shares. Results are announced at the close of every period.", p["value"], m["cash"], m["shares"])
	return state, Dict{String,Any}("public" => standings(state, positions, state["value"]), "private_text" => hints(state, p, 1), "text" => text)
end

"""The close of a period: Corvane's results, its new value, each desk's wealth, and the hints for the next period."""
function play(rng, state, decisions, parameters)
	p = parameters
	s = state
	period = s["period"] + 1
	s["period"] = period
	positions = Dict(entry["team"] => (float(entry["decisions"]["cash"]), float(entry["decisions"]["shares"])) for entry in decisions)
	market = first(decisions)["decisions"]
	change = s["changes"][period]
	results = change
	# News the facilitator released in the period moves the value once, at this close
	for key in SHOCKS
		if p[key] != s["shocks"][key]
			change += p[key] - s["shocks"][key]
			s["shocks"][key] = p[key]
		end
	end
	hinted = [s["names"][string(team)] for team in informed(s, period)]
	hint = results + s["hint_errors"][period]
	before = s["value"]
	s["value"] = max(before + change, 1.0)
	event = change >= 0 ? rand(rng, GOOD) : rand(rng, BAD)
	last = periods_over(p, period)
	text = @sprintf("At the close of %s, Corvane %s: its value is now £%.2f a share, %s £%.2f.", period_name(p, period), event, s["value"], s["value"] >= before ? "up" : "down", abs(s["value"] - before))
	text *= market["volume"] > 0 ? @sprintf(" The market traded %d shares, the last at £%.2f, on average £%.2f.", market["volume"], market["last_price"], market["average_price"]) : " No shares traded."
	last && (text *= @sprintf(" Corvane is taken over at £%.2f a share: every desk's shares are paid that in cash.", s["value"]))
	private = Dict{String,Any}(string(entry["team"]) => [Dict{String,Any}(
		"bought" => entry["decisions"]["bought"], "sold" => entry["decisions"]["sold"],
		"average_buy" => entry["decisions"]["average_buy"], "average_sell" => entry["decisions"]["average_sell"],
	)] for entry in decisions)
	traded = market["volume"] > 0 ? @sprintf("%.2f", market["average_price"]) : "none"
	debrief = join([
		@sprintf("%s had their analysts' hint before this period: a change of %s£%.2f a share. The results brought %s£%.2f, ",
			join(hinted, " and "), hint < 0 ? "-" : "+", abs(hint), results < 0 ? "-" : "+", abs(results)) *
			(change == results ? "and no news moved the value." : @sprintf("and the news released in the period %s£%.2f.", change - results < 0 ? "-" : "+", abs(change - results))), "",
		"| Value Before the Close (£) | Results (£) | News (£) | Value After the Close (£) | Average Price Traded (£) |", "| --- | --- | --- | --- | --- |",
		@sprintf("| %.2f | %+.2f | %+.2f | %.2f | %s |", before, results, change - results, s["value"], traded),
	], "\n")
	return s, Dict{String,Any}("public" => standings(s, positions, s["value"]), "private" => private, "text" => text,
		"private_text" => last ? Dict{String,Any}() : hints(s, p, period + 1), "over" => last, "debrief" => debrief)
end

periods_over(p, period) = period >= p["rounds"]
