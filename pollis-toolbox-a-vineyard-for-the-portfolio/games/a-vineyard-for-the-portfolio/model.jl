# Copyright (c) 2026 Antonio Saragga Seabra
# SPDX-License-Identifier: MIT

# A Vineyard for the Portfolio. Harrowgate Drinks, a British drinks group, wants to buy one of three wineries: in
# Chile, Italy and Australia. One team is Harrowgate's board (side buyer), three teams the wineries' owners (side
# winery). Money is in millions of pounds.
#
# Round 1, Due Diligence: Harrowgate pays for diligence on each winery; each winery's owners say nothing about its
# hidden issue or disclose it. Rounds 2 and 3, First Offers and Last Offers: Harrowgate offers cash and an earn-out
# for one winery; the winery's owners set the least cash and the least cash plus earn-out they accept, and a deal is
# signed when the offer meets both. Rounds 4 to 6, Years 1 to 3: every winery sets its prices, marketing and
# investment; Harrowgate sets the distribution and the currency hedge of the winery it owns.
#
# A winery's earnings grow each year by its growth, changed by its decisions and by Harrowgate's distribution, with
# a random shock; its exchange rate against the pound moves at random and with the news. The market values a
# winery at multiple = (1 + growth) / (cost_of_capital - growth) times its earnings. Each team's score, Value
# Created, is what its owners have at the end over what they started with, both carried forward at the cost of
# capital: a winery's owners started with its stated value, and Harrowgate with nothing. The owners are ranked
# among themselves, and Harrowgate against doing nothing, 0.

"""The wineries, Harrowgate, and what each team alone knows before the first round."""
function initial(rng, parameters, teams)
	p = parameters
	buyer = only(t for t in teams if get(t, "side", "") == "buyer")
	wineries = [t for t in teams if get(t, "side", "") == "winery"]
	r = p["cost_of_capital"]
	list = map(enumerate(wineries)) do (i, t)
		key = p["wineries"][i]
		g = float(p["growth"][key])
		stated = float(p["stated_earnings"][key])
		Dict{String,Any}(
			"team" => t["team"], "name" => t["name"], "key" => key,
			"stated" => stated, "earnings" => stated - float(p["earnings_gap"][key]), "reported" => stated,
			"growth" => g, "multiple" => (1 + g) / (r - g), "fx" => 1.0, "boost" => 0.0, "replanted" => 0.0,
			"disclosed" => false, "owned" => false, "flows" => 0.0, "earnout" => 0.0, "price_paid" => 0.0,
			"harvest_seen" => 0.0,
		)
	end
	for w in list
		w["start_value"] = w["multiple"] * w["stated"]
	end
	state = Dict{String,Any}(
		"round" => 0, "buyer" => buyer["team"], "buyer_name" => buyer["name"], "deal" => 0,
		"diligence" => 0.0, "price_paid" => 0.0, "earnout" => 0.0, "flows" => 0.0, "wineries" => list,
	)
	notes = Dict{String,Any}()
	notes[string(buyer["team"])] = "Your analysts estimate the yearly savings of owning each winery, in bottling, buying and overheads: " *
		join([@sprintf("%s about %.1f m £", w["name"], p["synergy"][w["key"]]) for w in list], ", ") *
		". Only your board knows these estimates."
	for w in list
		notes[string(w["team"])] = "Only your team knows this: " * issue(w, p) *
			" Harrowgate can find it with its diligence, or you can disclose it in Due Diligence."
	end
	return state, Dict{String,Any}("public" => standings(state, p, 0), "private_text" => notes,
		"text" => "Harrowgate Drinks is looking at three wineries. Each is valued at its stated earnings; the value each team creates is 0 to begin with.")
end

"""A winery's hidden issue, as its owners know it."""
function issue(w, p)
	key = w["key"]
	if key == "chile"
		return @sprintf("the winery's water rights are disputed, and about %.1f m £ of its stated yearly earnings of %.1f m £ will not be there.", p["earnings_gap"][key], w["stated"])
	elseif key == "italy"
		return @sprintf("a third of the vines are old: unless about %.1f m £ is spent replanting them, the harvest falls about %d%% a year.", p["replant_need"], round(Int, 100 * p["old_vine_decline"]))
	else
		return @sprintf("%d%% of the winery's sales go to one export market, which is debating a tariff on imported wine.", round(Int, 100 * p["export_share"]))
	end
end

"""What a desk review finds: the issue roughly."""
function rough(w, p)
	key = w["key"]
	key == "chile" && return @sprintf("its stated earnings may be between %.1f and %.1f m £ a year too high.", 0.5 * p["earnings_gap"][key], 1.5 * p["earnings_gap"][key])
	key == "italy" && return @sprintf("many vines look old, and replanting could cost between %.0f and %.0f m £.", 0.5 * p["replant_need"], 1.5 * p["replant_need"])
	return "much of its sales seem to go to a single export market."
end

"""Each team's row of the public results: its earnings, value and the value it has created so far, `years` years in."""
function standings(state, p, years)
	r = p["cost_of_capital"]
	grow = (1 + r)^years
	rows = Dict{String,Any}[]
	owned = [w for w in state["wineries"] if w["owned"]]
	# Harrowgate: what it receives and what its winery is worth, less what it paid, all carried to now
	if isempty(owned)
		gain = -state["diligence"] * grow
		push!(rows, Dict{String,Any}("team" => state["buyer_name"], "status" => "No winery", "earnings" => 0.0, "value" => 0.0, "gain" => gain))
	else
		w = owned[1]
		synergy = p["synergy"][w["key"]]
		value = w["multiple"] * (w["reported"] + synergy)
		due = earnout_due(w, years)
		gain = state["flows"] + value - (state["price_paid"] + state["diligence"]) * grow - due
		push!(rows, Dict{String,Any}("team" => state["buyer_name"], "status" => "Owns " * w["name"], "earnings" => w["reported"] + synergy, "value" => value, "gain" => gain))
	end
	for w in state["wineries"]
		value = w["multiple"] * w["reported"]
		gain = w["owned"] ? w["price_paid"] * grow + earnout_due(w, years) - w["start_value"] * grow : w["flows"] + value - w["start_value"] * grow
		push!(rows, Dict{String,Any}("team" => w["name"], "status" => w["owned"] ? "Owned by " * state["buyer_name"] : "Independent",
			"earnings" => w["reported"], "value" => w["owned"] ? 0.0 : value, "gain" => gain))
	end
	return rows
end

"""The earnings of a winery's plan, `years` years in: its stated earnings grown at its stated growth."""
plan(w, years) = w["stated"] * (1 + w["growth"])^years

"""The earn-out a winery's owners are due: the share of its plan's earnings it reached in the latest year, at most all of it."""
earnout_due(w, years) = w["owned"] ? w["earnout"] * clamp(w["reported"] / plan(w, years), 0.0, 1.0) : 0.0

"""One round: diligence, an offer, or a year of running the wineries."""
function play(rng, state, decisions, parameters)
	p = parameters
	chosen = Dict(entry["team"] => entry["decisions"] for entry in decisions)
	round = state["round"] + 1
	state["round"] = round
	buyer = state["buyer"]
	b = chosen[buyer]
	wineries = state["wineries"]
	notes = Dict{String,Vector{String}}()
	note(team, text) = push!(get!(notes, string(team), String[]), text)
	text = ""

	if round == 1
		# Due Diligence: what Harrowgate pays for, and what the owners disclose
		cost = Dict("none" => 0.0, "light" => p["desk_review_cost"], "full" => p["full_diligence_cost"])
		for w in wineries
			level = get(b, "diligence_" * w["key"], "none")
			state["diligence"] += cost[level]
			w["disclosed"] = get(chosen[w["team"]], "disclose", "no") == "yes"
			if w["disclosed"]
				note(buyer, w["name"] * "'s owners disclosed that " * issue(w, p))
				note(w["team"], "You disclosed your issue to Harrowgate.")
			elseif level == "full"
				note(buyer, "Your full due diligence on " * w["name"] * " found that " * issue(w, p))
			elseif level == "light"
				note(buyer, "Your desk review of " * w["name"] * " suggests that " * rough(w, p))
			else
				note(buyer, "You looked at " * w["name"] * " no further than its stated figures.")
			end
			level != "none" && !w["disclosed"] && note(w["team"], "Harrowgate's analysts have been looking at your books.")
		end
		text = @sprintf("Due Diligence is over: Harrowgate spent %.1f m £ on it. Offers open in First Offers.", state["diligence"])
		return state, results(state, p, 0, text, notes)
	end

	if round <= 3
		# An offer: signed when it meets both of the owners' least amounts
		if state["deal"] != 0
			text = "The deal was signed in First Offers: the offers of Last Offers count for nothing."
			return state, results(state, p, 0, text, notes)
		end
		target = get(b, "target", "none")
		cash = float(get(b, "offer_cash", 0.0))
		earnout = float(get(b, "offer_earnout", 0.0))
		w = findfirst(x -> x["key"] == target, wineries)
		if w === nothing || cash + earnout <= 0
			text = round == 2 ? "Harrowgate made no offer in First Offers." : "Harrowgate made no offer, and buys no winery."
		else
			w = wineries[w]
			d = chosen[w["team"]]
			ask_cash, ask_total = float(d["ask_cash"]), float(d["ask_total"])
			offer = @sprintf("%.1f m £ in cash and up to %.1f m £ of earn-out", cash, earnout)
			if cash >= ask_cash && cash + earnout >= ask_total
				state["deal"] = w["team"]
				state["price_paid"] = cash
				state["earnout"] = earnout
				w["owned"] = true
				w["price_paid"] = cash
				w["earnout"] = earnout
				text = "Harrowgate Drinks has bought " * w["name"] * " for " * offer * ", paid on its earnings in Year 3."
				note(w["team"], "You accepted Harrowgate's offer of " * offer * ". Your team now runs the winery for Harrowgate, and the earn-out depends on its earnings in Year 3.")
			else
				text = round == 2 ? "No deal was signed in First Offers." : "No deal was signed: Harrowgate buys no winery."
				note(w["team"], "Harrowgate offered you " * offer * ": less than you asked, so no deal was signed.")
				note(buyer, w["name"] * "'s owners turned down your offer of " * offer * ".")
			end
		end
		return state, results(state, p, 0, text, notes)
	end

	# Years 1 to 3
	year = round - 3
	r = p["cost_of_capital"]
	owned = state["deal"]
	price_level = Dict("keep" => 1.0, "raise" => 1 + p["price_margin"], "cut" => 1 - p["price_margin"])
	price_growth = Dict("keep" => 0.0, "raise" => -p["price_volume"], "cut" => p["price_volume"])
	buyer_flow = 0.0
	for w in wineries
		key = w["key"]
		d = chosen[w["team"]]
		price = get(d, "price", "keep")
		marketing = float(get(d, "marketing", 0.0))
		investment = float(get(d, "investment", 0.0))
		g = w["growth"] + w["boost"] + price_growth[price] + p["marketing_effect"] * log1p(marketing)
		distribution = w["owned"] ? get(b, "distribution", "none") : "none"
		g += Dict("none" => 0.0, "partial" => 0.5, "full" => 1.0)[distribution] * p["distribution_fit"][key]
		if key == "italy" && w["replanted"] < p["replant_need"]
			g -= p["old_vine_decline"]
		end
		noise = p["earnings_noise"]
		w["earnings"] *= (1 + g) * exp(noise * randn(rng) - noise^2 / 2)
		# Investment raises growth from next year; in Italy it replants the old vines first
		w["replanted"] += investment
		w["boost"] += p["investment_effect"] * investment
		# The exchange rate: a random walk, shifted by the news
		w["fx"] *= exp(p["fx_volatility"] * randn(rng))
		currency = w["fx"] * (1 + p["fx_shift"][key])
		factor = currency * price_level[price]
		key == "australia" && (factor *= 1 - p["export_share"] * p["tariff"])
		# A harvest the news makes better or worse, this year only
		harvest = p["harvest"][key]
		if harvest != w["harvest_seen"]
			factor *= 1 + harvest
			w["harvest_seen"] = harvest
		end
		w["reported"] = w["earnings"] * factor
		flow = w["reported"] - marketing - investment
		if w["owned"]
			hedge = float(get(b, "hedge", 0.0)) / 100
			# The hedge keeps that share of the currency's move out of Harrowgate's pounds, at a cost
			hedged = w["reported"] * (hedge / currency + 1 - hedge)
			cost = Dict("none" => 0.0, "partial" => p["distribution_cost"] / 2, "full" => p["distribution_cost"])[distribution]
			buyer_flow = hedged - marketing - investment + p["synergy"][key] - cost - p["hedge_cost"] * hedge * w["reported"]
			note(w["team"], @sprintf("Your winery earned %.1f m £ this year, %.0f%% of its plan's %.1f m £: the earn-out pays the share reached in Year 3, at most all of it.", w["reported"], 100 * w["reported"] / plan(w, year), plan(w, year)))
		else
			w["flows"] = w["flows"] * (1 + r) + flow
		end
	end
	state["flows"] = state["flows"] * (1 + r) + buyer_flow
	owned == 0 && note(buyer, "Harrowgate owns no winery: its distribution and hedge change nothing.")
	# Each side is ranked on its own: Harrowgate against doing nothing, the owners against each other
	rows = standings(state, p, year)
	best = argmax(row -> row["gain"], rows[2:end])
	text = @sprintf("Year %d is over. %s has created %.1f m £ of value so far; among the wineries' owners, %s leads, with %.1f m £.", year, rows[1]["team"], rows[1]["gain"], best["team"], best["gain"])
	return state, results(state, p, year, text, notes, round == 6)
end

"""The results of a round: the standings, each team's own figures, and what each team alone is told."""
function results(state, p, years, text, notes, over = false)
	grow = (1 + p["cost_of_capital"])^years
	private = Dict{String,Any}()
	owned = [w for w in state["wineries"] if w["owned"]]
	private[string(state["buyer"])] = [Dict{String,Any}(
		"diligence" => state["diligence"], "price_paid" => state["price_paid"],
		"earnout_due" => isempty(owned) ? 0.0 : earnout_due(owned[1], years),
		"winery_earnings" => isempty(owned) ? 0.0 : owned[1]["reported"],
		"synergy" => isempty(owned) ? 0.0 : p["synergy"][owned[1]["key"]],
		"cash_flow" => state["flows"],
	)]
	for w in state["wineries"]
		private[string(w["team"])] = [Dict{String,Any}(
			"earnings" => w["reported"], "fx" => w["fx"] * (1 + p["fx_shift"][w["key"]]), "investment_total" => w["replanted"],
			"cash_flow" => w["flows"], "earnout_due" => earnout_due(w, years),
			"start_value" => w["start_value"] * grow,
		)]
	end
	return Dict{String,Any}(
		"public" => standings(state, p, years), "private" => private, "text" => text,
		"private_text" => Dict{String,Any}(team => join(lines, " ") for (team, lines) in notes), "over" => over,
	)
end
