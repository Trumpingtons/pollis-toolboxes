# Copyright (c) 2026 Antonio Saragga Seabra
# SPDX-License-Identifier: MIT

# Save the Company. Thistledown Home & Garden, a British chain of home-and-garden stores, cannot pay its debts:
# 220 m £ of senior loans from a bank syndicate, secured on its stores and stock, and 150 m £ of junior bonds behind
# them. One team is its shareholders, one the banks, one the bondholders. Money is in millions of pounds.
#
# Each quarter the shareholders can propose a plan: new money they put in, a cut to each debt, and a share of the
# company for the bondholders; and they can close loss-making stores. The banks set the largest cut they accept,
# or call in their loan; the bondholders set the largest cut and the least share of the company they accept, or
# sell their bonds to a distressed-debt fund, which then holds out for its own price. A plan both meet is adopted,
# and the game ends. Calling in the loan, running out of cash, or reaching the last quarter without a plan puts the
# company into administration, and the game ends.
#
# A going concern is worth multiple times its earnings for the coming year; in administration, the company is
# worth what its stores and stock fetch, less the administrators' costs. Either way the claims are paid in order:
# the banks first, then the bondholders, then the shareholders, who share what is left with the bondholders as the
# plan says. A plan must leave the company min_cash of cash to keep trading. Each team's score is the value of
# its claim at the end less its market value at the start.
#
# Each game draws its own secrets from the ranges of [parameters], so that a student who has read this file knows
# what may be hidden, not what is: the sales trend, the new money the shareholders can put in and what closing
# stores saves, the stores' and stock's value in an administration, of which the banks' appraiser gives a range,
# and the fund's offer for the bonds and the price it holds out for. The debrief shows what was drawn, and, each
# quarter, what each team would have had in administration then, beside what the plan proposed gave it.

"""A value drawn evenly from a range [low, high], rounded to `digits`."""
draw(rng, range, digits) = round(range[1] + (range[2] - range[1]) * rand(rng); digits)

"""Earnings for the coming year, from this quarter's: four quarters at the trend."""
next_year(e, trend) = e * sum((1 + trend)^k for k in 1:4)

"""What the stores and stock would fetch in an administration, before its costs, as property prices now stand: the true value, or the banks' appraisal of it."""
fetch(s, p; appraised = false) = (appraised ? s["secrets"]["appraisal"] : s["secrets"]["liquidation_value"]) * (1 + p["property_shock"])

"""What each claim would have in an administration now, without the chance of the sale: Thistledown in all, the banks, the bondholders, the shareholders."""
function wound_up(s, p)
	total = fetch(s, p) - p["administration_cost"] + max(s["cash"], 0.0)
	return total, waterfall(total, s["senior"], s["junior"])...
end

"""The claims, paid in order from `total`: the banks, the bondholders, then what is left."""
function waterfall(total, senior, junior)
	banks = clamp(total, 0.0, senior)
	bonds = clamp(total - banks, 0.0, junior)
	return banks, bonds, max(total - banks - bonds, 0.0)
end

"""A quarter's cash burn as the company stands: interest and capital spending, less earnings."""
burn(s, p) = s["senior"] * p["senior_rate"] / 4 + s["junior"] * p["junior_rate"] / 4 + p["capex"] - s["ebitda"]

"""Thistledown before the first quarter, with enough cash for about runway_share of the game's quarters, and the secrets drawn for this game."""
function initial(rng, parameters, teams)
	p = parameters
	team(side) = only(t for t in teams if get(t, "side", "") == side)
	value = draw(rng, p["liquidation_value"], 0)
	# The appraiser's range: appraisal_width times the true value, with the true value somewhere inside it
	u = rand(rng)
	low, high = round(value * (1 - p["appraisal_width"] * u)), round(value * (1 + p["appraisal_width"] * (1 - u)))
	bid = draw(rng, p["fund_bid"], 2)
	secrets = Dict{String,Any}(
		"trend" => draw(rng, p["trend"], 3), "capacity" => draw(rng, p["capacity"], 0), "closure_gain" => draw(rng, p["closure_gain"], 2),
		"liquidation_value" => value, "appraisal_low" => low, "appraisal_high" => high, "appraisal" => (low + high) / 2,
		"fund_bid" => bid, "fund_hurdle" => bid + draw(rng, p["fund_premium"], 2),
	)
	s = Dict{String,Any}(
		"secrets" => secrets,
		"quarter" => 0, "ebitda" => float(p["ebitda"]), "senior" => float(p["senior"]), "junior" => float(p["junior"]),
		"closed" => 0, "pending" => 0.0, "sold" => false, "outcome" => "",
		"teams" => Dict{String,Any}(side => team(side)["team"] for side in ("shareholders", "banks", "bondholders")),
		"names" => Dict{String,Any}(side => team(side)["name"] for side in ("shareholders", "banks", "bondholders")),
		"shocks" => Dict{String,Any}("weather_shock" => 0.0, "rival_exit" => 0.0),
	)
	runway = ceil(Int, p["runway_share"] * p["rounds"])
	s["cash"] = runway * burn(s, p) + 2.0
	s["start"] = Dict{String,Any}("banks" => p["senior_price"] * s["senior"], "bondholders" => p["junior_price"] * s["junior"], "shareholders" => float(p["equity_value"]))
	t = s["teams"]
	x = secrets
	notes = Dict{String,Any}(
		string(t["shareholders"]) => @sprintf("Only your team knows this: your management accounts show like-for-like sales falling about %.1f%% a quarter, faster than the market thinks. Your family and its backers can put in up to %.0f m £ of new money. Closing 20 loss-making stores costs about %.0f m £ and adds about %.2f m £ to every later quarter's earnings.", -100 * x["trend"], x["capacity"], p["closure_cost"], x["closure_gain"]),
		string(t["banks"]) => @sprintf("Only your team knows this: your appraiser values Thistledown's stores, leases and stock at between %.0f and %.0f m £ in an administration, before about %.0f m £ of the administrators' costs.", low, high, p["administration_cost"]),
		string(t["bondholders"]) => @sprintf("Only your team knows this: a distressed-debt fund has offered to buy all your bonds at %.0fp in the pound, %.1f m £, in any quarter you choose. If you sell, the fund takes your place and agrees only to a plan it likes.", 100 * bid, bid * s["junior"]),
	)
	text = @sprintf("Thistledown Home & Garden has broken its loan covenants. It owes %.0f m £ to its banks and %.0f m £ to its bondholders, has %.1f m £ of cash, and earned %.1f m £ last quarter. At this rate its cash lasts about %d quarters.", s["senior"], s["junior"], s["cash"], s["ebitda"], runway)
	debrief = join([
		"What this game drew, which each team knew only of its own:", "",
		@sprintf("- **The shareholders:** sales falling %.1f%% a quarter; up to %.0f m £ of new money; closing 20 stores adding %.2f m £ to each later quarter's earnings.", -100 * x["trend"], x["capacity"], x["closure_gain"]),
		@sprintf("- **The banks:** the stores and stock would fetch %.0f m £ in an administration, before its costs and the chance of the sale; the appraiser said between %.0f and %.0f m £.", value, low, high),
		@sprintf("- **The bondholders:** the fund offered %.0fp in the pound, and would agree only to a plan giving it at least %.0fp.", 100 * bid, 100 * x["fund_hurdle"]),
	], "\n")
	return s, Dict{String,Any}("public" => standings(s, p, nothing), "private" => accounts(s, p), "private_text" => notes, "text" => text, "debrief" => debrief)
end

"""The public results: each team's claim, and, once the outcome is settled, the claim's value and its gain over its market value at the start; bonds sold to the fund are worth the fund's price."""
function standings(s, p, status)
	settled = get(s, "settled", nothing)
	return map(("shareholders", "banks", "bondholders")) do side
		row = Dict{String,Any}(
			"team" => s["names"][side], "status" => side == "bondholders" && s["sold"] ? "Sold to a Fund" : something(status, "Negotiating"),
			"claim" => side == "banks" ? s["senior"] : side == "bondholders" ? s["junior"] : 0.0,
		)
		value = settled !== nothing ? settled[side] : side == "bondholders" && s["sold"] ? s["secrets"]["fund_bid"] * p["junior"] : nothing
		if value !== nothing
			row["value"] = value
			row["gain"] = value - s["start"][side]
		end
		row
	end
end

"""Each team's own figures."""
function accounts(s, p)
	t = s["teams"]
	return Dict{String,Any}(
		string(t["shareholders"]) => [Dict{String,Any}("cash" => s["cash"], "ebitda" => s["ebitda"], "closed" => 20 * s["closed"], "burn" => burn(s, p))],
		# The banks' estimate of what they would recover, from the middle of their appraiser's range
		string(t["banks"]) => [Dict{String,Any}("cash" => s["cash"], "wound_up" => waterfall(fetch(s, p; appraised = true) - p["administration_cost"] + max(s["cash"], 0.0), s["senior"], s["junior"])[1])],
		string(t["bondholders"]) => [Dict{String,Any}("cash" => s["cash"], "fund_offer" => s["secrets"]["fund_bid"] * p["junior"])],
	)
end

"""Administration: the stores and stock sold, less the costs, paid to the banks, then the bondholders."""
function administration!(rng, s, p)
	total = fetch(s, p) * exp(p["liquidation_noise"] * randn(rng)) - p["administration_cost"] + max(s["cash"], 0.0)
	banks, bonds, equity = waterfall(total, s["senior"], s["junior"])
	s["settled"] = Dict{String,Any}("banks" => banks, "bondholders" => s["sold"] ? s["secrets"]["fund_bid"] * p["junior"] : bonds, "shareholders" => equity)
	return total
end

"""One quarter: the bondholders' sale, the stores, the banks' call, the plan, and the quarter's trading."""
function play(rng, state, decisions, parameters)
	p = parameters
	s = state
	chosen = Dict(entry["team"] => entry["decisions"] for entry in decisions)
	t = s["teams"]
	n = s["names"]
	sh, bk = chosen[t["shareholders"]], chosen[t["banks"]]
	bd = get(chosen, t["bondholders"], Dict{String,Any}())
	q = s["quarter"] + 1
	s["quarter"] = q
	lines = String[]
	out = Dict{String,Any}()
	notes = Dict{String,Any}()

	# News: a shock to trading moves earnings once, when it is released
	for key in ("weather_shock", "rival_exit")
		if p[key] != s["shocks"][key]
			s["ebitda"] *= 1 + p[key] - s["shocks"][key]
			s["shocks"][key] = p[key]
		end
	end

	if !s["sold"] && get(bd, "sell", "hold") == "sell"
		s["sold"] = true
		price = s["secrets"]["fund_bid"] * s["junior"]
		push!(lines, @sprintf("%s sold their bonds to a distressed-debt fund for %.1f m £.", n["bondholders"], price))
		out[string(t["bondholders"])] = @sprintf("You sold your bonds to a distressed-debt fund for %.1f m £: the fund negotiates in your place from now on.", price)
	end

	if get(sh, "closures", "keep") == "close" && s["closed"] < p["max_closures"]
		s["closed"] += 1
		s["cash"] -= p["closure_cost"]
		s["pending"] += s["secrets"]["closure_gain"]
		push!(lines, @sprintf("Thistledown is closing 20 loss-making stores, %d in all.", 20 * s["closed"]))
	end

	# What each claim would have in administration now, and Thistledown's value saved, for the debrief
	x = s["secrets"]
	now = wound_up(s, p)
	going = p["multiple"] * next_year(s["ebitda"] + s["pending"], x["trend"]) + s["cash"]
	proposal = nothing

	status = nothing
	if get(bk, "enforce", "wait") == "enforce"
		total = administration!(rng, s, p)
		push!(lines, @sprintf("%s called in their loan: Thistledown is in administration. Its stores and stock fetched %.1f m £ after the costs.", n["banks"], total))
		status = "Administration"
	elseif get(sh, "propose", "no") == "yes"
		equity_in = min(float(sh["new_equity"]), x["capacity"])
		cut_s, cut_j, share = sh["senior_cut"] / 100, sh["junior_cut"] / 100, sh["equity_share"] / 100
		senior, junior = s["senior"] * (1 - cut_s), s["junior"] * (1 - cut_j)
		total = going + equity_in
		banks, bonds, equity = waterfall(total, senior, junior)
		to_bonds = bonds + share * equity
		plan = @sprintf("%.0f m £ of new money, the banks' loans cut %.0f%%, the bonds cut %.0f%%, and %.0f%% of the company for the bondholders", equity_in, 100 * cut_s, 100 * cut_j, 100 * share)
		banks_yes = cut_s <= bk["max_cut"] / 100
		bonds_yes = s["sold"] ? to_bonds >= x["fund_hurdle"] * s["junior"] : cut_j <= bd["max_cut"] / 100 && share >= bd["min_share"] / 100
		who = s["sold"] ? "the fund" : n["bondholders"]
		push!(lines, "The shareholders proposed " * plan * ". " * n["banks"] * (banks_yes ? " agreed" : " turned it down") * "; " * who * (bonds_yes ? " agreed." : " turned it down."))
		viable = s["cash"] + equity_in >= p["min_cash"]
		proposal = (; total, banks, to_bonds, shareholders = (1 - share) * equity - equity_in, banks_yes, bonds_yes, viable)
		viable || push!(lines, @sprintf("The plan would leave Thistledown %.1f m £ of cash, less than the %.0f m £ it needs to keep trading: it cannot be adopted.", s["cash"] + equity_in, p["min_cash"]))
		if banks_yes && bonds_yes && viable
			s["senior"], s["junior"], s["cash"] = senior, junior, s["cash"] + equity_in
			s["settled"] = Dict{String,Any}("banks" => banks, "bondholders" => s["sold"] ? x["fund_bid"] * p["junior"] : to_bonds,
				"shareholders" => (1 - share) * equity - equity_in)
			push!(lines, @sprintf("The plan is adopted: Thistledown is saved, worth %.1f m £ with its cash.", total))
			status = "Plan Adopted"
		end
	end

	if status === nothing
		# The quarter's trading: earnings at the trend, with the stores closed, less interest and capital spending
		noise = p["earnings_noise"]
		s["ebitda"] = (s["ebitda"] + s["pending"]) * (1 + x["trend"]) * exp(noise * randn(rng) - noise^2 / 2)
		s["pending"] = 0.0
		s["cash"] -= burn(s, p)
		if s["cash"] < 0
			total = administration!(rng, s, p)
			push!(lines, @sprintf("Thistledown has run out of cash: it is in administration. Its stores and stock fetched %.1f m £ after the costs.", total))
			status = "Administration"
		elseif q >= p["rounds"]
			total = administration!(rng, s, p)
			push!(lines, @sprintf("No plan was adopted before the loans fell due: Thistledown is in administration. Its stores and stock fetched %.1f m £ after the costs.", total))
			status = "Administration"
		else
			push!(lines, @sprintf("No plan yet: Thistledown earned %.1f m £ this quarter and has %.1f m £ of cash left.", s["ebitda"], s["cash"]))
		end
	end
	over = status !== nothing
	return s, Dict{String,Any}("public" => standings(s, p, status), "private" => accounts(s, p), "text" => join(lines, " "),
		"private_text" => notes, "out" => out, "over" => over,
		"debrief" => quarter_debrief(s, p, now, going, proposal, get(bk, "enforce", "wait") == "enforce"))
end

"""Whether an amount is a gain or a loss: "a gain of 4.2 m £", "a loss of 1.0 m £"."""
gain(x) = @sprintf("%s of %.1f m £", x >= 0 ? "a gain" : "a loss", abs(x))

"""
What the debrief says of a quarter, from the model's true figures as the quarter was decided: what Thistledown and each
claim would have had in an administration then, without the chance of the sale, beside what the plan proposed gave
each, if one was; the value a plan could save; and whether each team's answer to the plan served it.
"""
function quarter_debrief(s, p, now, going, proposal, called)
	n = s["names"]
	total, banks, bonds, _ = now
	# The bondholders could always sell to the fund instead, while they held the bonds
	fund = s["secrets"]["fund_bid"] * p["junior"]
	walk_bonds = s["sold"] ? s["secrets"]["fund_hurdle"] * p["junior"] : max(bonds, fund)
	lines = [going > total ?
		@sprintf("As this quarter was decided, Thistledown was worth %.1f m £ as a going concern, before any new money, and %.1f m £ in an administration: a plan could save %.1f m £.", going, total, going - total) :
		@sprintf("As this quarter was decided, Thistledown was worth %.1f m £ as a going concern, before any new money, and %.1f m £ in an administration: no plan could be worth more than administration.", going, total), ""]
	if proposal === nothing
		push!(lines, "| Claim | In Administration Now (m £) |", "| --- | --- |",
			@sprintf("| %s | %.1f |", n["banks"], banks), @sprintf("| %s | %.1f |", s["sold"] ? "The fund" : n["bondholders"], bonds), @sprintf("| %s | 0.0 |", n["shareholders"]))
	else
		q = proposal
		push!(lines, "| Claim | In Administration Now (m £) | Under the Plan Proposed (m £) |", "| --- | --- | --- |",
			@sprintf("| %s | %.1f | %.1f |", n["banks"], banks, q.banks), @sprintf("| %s | %.1f | %.1f |", s["sold"] ? "The fund" : n["bondholders"], bonds, q.to_bonds),
			@sprintf("| %s, after their new money | 0.0 | %.1f |", n["shareholders"], q.shareholders))
		answer(name, yes, plan, walk, against) = @sprintf("- **%s** %s: the plan gave %.1f m £, against %.1f m £ %s, %s.", name, yes ? "agreed" : "turned it down", plan, walk, against, gain(plan - walk))
		bonds_against = s["sold"] ? @sprintf("at the %.0fp in the pound the fund held out for", 100 * s["secrets"]["fund_hurdle"]) :
			fund > bonds ? "by selling to the fund instead" : "in an administration now"
		push!(lines, "", answer(n["banks"], q.banks_yes, q.banks, banks, "in an administration now"),
			answer(s["sold"] ? "The fund" : n["bondholders"], q.bonds_yes, q.to_bonds, walk_bonds, bonds_against),
			"- **$(n["shareholders"])** proposed it: it left them " * gain(q.shareholders) * ", against nothing in an administration.")
		q.viable || push!(lines, "- The plan left too little cash to keep trading, so it could not be adopted whatever the lenders answered.")
	end
	called && going > total && push!(lines, "", @sprintf("%s called in the loan: the %.1f m £ a plan could have saved were lost to every claim.", n["banks"], going - total))
	return join(lines, "\n")
end
