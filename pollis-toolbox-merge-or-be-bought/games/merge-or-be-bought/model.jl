# Copyright (c) 2026 Antonio Saragga Seabra
# SPDX-License-Identifier: MIT

# Merge or Be Bought. Three listed bicycle makers, each run by a team as its board. Each quarter a team can bid
# cash for each share of each rival, and sets its walk-away price: the lowest bid for its own shares its board
# accepts.
#
# A company's earnings grow each quarter, with a random shock. The market values a company at
# earnings_multiple times its yearly earnings and the yearly savings still to come, plus its cash, less its debt; its share price is that value over
# its shares, moved toward the highest bid it received when it is not sold. A company receives the highest bid
# it can be paid (the bidder's cash plus what it can still borrow, borrowing_multiple times its yearly earnings,
# must cover it); when that bid is at least its walk-away price, it is bought: the buyer pays its shareholders in
# cash, takes on its business, cash and debt, and saves synergy a year once the two are merged, phased in over
# synergy_quarters. Each team's score is the return of its original shareholders: its share price, or the price
# it was bought at, over its price before the first quarter.
#
# The savings of each pair are drawn for each game, and each board's analysts give a range with the true savings
# somewhere inside it, so that a student who has read this file knows how the savings are drawn, not what they are.
# The debrief shows them, and, each quarter, each pair's zone of possible agreement: the target's value on its own,
# the least its shareholders should accept, and its value to the bidder with the savings, the most the bidder
# should pay.

"""A range of width `width` times x with x somewhere inside it, drawn, so that its middle does not give x away."""
function around(rng, x, width)
	u = rand(rng)
	return (x * (1 - width * u), x * (1 + width * (1 - u)))
end

"""The companies before the first quarter, and what each team sees: the prices, and its own analysts' estimates of the savings."""
function initial(rng, parameters, teams)
	p = parameters
	n = length(teams)
	companies = [Dict{String,Any}(
		"team" => team["team"],
		"name" => team["name"],
		"active" => true,
		"earnings" => float(p["annual_earnings"][i]),
		"growth" => float(p["growth"][i]),
		"cash" => float(p["cash"][i]),
		"debt" => 0.0,
		"shares" => float(p["shares"][i]),
		"pending" => 0.0,
		"synergy_step" => 0.0,
		"sold_price" => 0.0,
		"buyer" => "",
	) for (i, team) in enumerate(teams)]
	for c in companies
		c["price"] = value_per_share(c, p)
		c["start_price"] = c["price"]
	end
	# The yearly savings of each pair, buyer first, as a share of the smaller company's yearly earnings
	synergy = [i == j ? 0.0 : (p["synergy_low"] + (p["synergy_high"] - p["synergy_low"]) * rand(rng)) *
		min(companies[i]["earnings"], companies[j]["earnings"]) for i in 1:n, j in 1:n]
	state = Dict{String,Any}("quarter" => 0, "companies" => companies, "synergy" => [synergy[i, :] for i in 1:n])
	public = [Dict{String,Any}(
		"team" => c["name"], "status" => "Independent", "price" => c["price"], "market_value" => c["price"] * c["shares"],
		"earnings" => c["earnings"], "return" => 0.0,
	) for c in companies]
	notes = Dict{String,Any}()
	secrets = String[]
	for (i, c) in enumerate(companies)
		estimates = String[]
		for j in 1:n
			j == i && continue
			low, high = around(rng, synergy[i, j], p["estimate_width"])
			push!(estimates, @sprintf("buying %s would save between %.1f and %.1f m € a year", companies[j]["name"], low, high))
			push!(secrets, @sprintf("| %s | %s | %.2f | %.1f to %.1f |", c["name"], companies[j]["name"], synergy[i, j], low, high))
		end
		notes[string(c["team"])] = "Your analysts estimate that " * join(estimates, ", and ") * ". Only your team knows these estimates."
	end
	debrief = join(vcat(["The yearly savings this game drew for each pair, which no board knew exactly: each board's analysts gave it the range beside them.", "",
		"| Buyer | Target | Yearly Savings (m €) | The Analysts' Range (m €) |", "| --- | --- | --- | --- |"], secrets), "\n")
	return state, Dict{String,Any}("public" => public, "private_text" => notes, "debrief" => debrief,
		"text" => "Three bicycle makers are listed: each is valued at its earnings, cash and debt. Bids open in Quarter 1.")
end

"""Whether a share is above or below: "12% above", "8% below", or "equal to" below half a percent."""
above(x) = abs(x) < 0.005 ? "equal to" : @sprintf("%.0f%% %s", 100 * abs(x), x >= 0 ? "above" : "below")

"""
What the debrief says of a quarter's bids, from the model's figures before the deals: for each company still listed,
its value per share on its own, the least its shareholders should accept, and its walk-away price; for each rival,
the company's value to it with the savings, the most it should pay, what it could pay, and its bid; then whether a
deal was possible, and what came of it.
"""
function bids_debrief(companies, synergy, chosen, bids, p, sold)
	lines = ["Each pair's zone of possible agreement, from the model's figures this quarter before the deals: a company's value on its own is the least its shareholders should accept, and its value to a rival, with the savings of buying it valued like earnings, the most that rival should pay, when its cash and borrowing cover it.", "",
		"| Company | Value on Its Own (€) | Walk-Away (€) | Rival | Value to the Rival (€) | Most the Rival Could Pay (€) | Rival's Bid (€) |",
		"| --- | --- | --- | --- | --- | --- | --- |"]
	verdicts = String[]
	for (j, target) in enumerate(companies)
		target["active"] || continue
		own = value_per_share(target, p)
		walk = float(chosen[target["team"]]["walk_away"])
		worth = Float64[]
		for (i, rival) in enumerate(companies)
			(i != j && rival["active"]) || continue
			value = own + p["earnings_multiple"] * synergy[i][j] / target["shares"]
			# The most this rival should and could pay
			push!(worth, min(value, capacity(rival, p) / target["shares"]))
			bid = something(findfirst(x -> x[1] == i, get(bids, j, Tuple{Int,Float64}[])), 0)
			made = bid == 0 ? 0.0 : bids[j][bid][2]
			push!(lines, @sprintf("| %s | %.2f | %.2f | %s | %.2f | %.2f | %s |", target["name"], own, walk, rival["name"], value, capacity(rival, p) / target["shares"], made > 0 ? @sprintf("%.2f", made) : "none"))
		end
		isempty(worth) && continue
		verdict = @sprintf("- **%s:** its walk-away price was %s its value on its own.", target["name"], above(walk / own - 1))
		if haskey(sold, j)
			i, b = sold[j]
			value = own + p["earnings_multiple"] * synergy[i][j] / target["shares"]
			buyer = companies[i]["name"]
			if b > value
				verdict *= @sprintf(" %s bought it at %.2f € a share, %.2f € above its value to %s: %s's shareholders lost by the deal.", buyer, b, b - value, buyer, buyer)
			elseif b < own
				verdict *= @sprintf(" %s bought it at %.2f € a share, below its value on its own: its shareholders sold too cheaply.", buyer, b)
			else
				verdict *= @sprintf(" %s bought it at %.2f € a share, within the zone: of the %.2f € a share the savings were worth, its shareholders took %.2f and %s kept %.2f.", buyer, b, value - own, b - own, buyer, value - b)
			end
		elseif maximum(worth) < own
			verdict *= @sprintf(" No rival could pay even its value on its own: the most any could and should pay was %.2f € a share, so no deal was possible.", maximum(worth))
		elseif walk > maximum(worth)
			verdict *= @sprintf(" That was above what any rival could and should pay, at most %.2f € a share: no rival should have paid it, and no deal was possible at it, though one was between %.2f and %.2f.", maximum(worth), own, maximum(worth))
		elseif !isempty(get(bids, j, ())) && maximum(last.(bids[j])) >= walk
			verdict *= " A bid reached its walk-away price, but a company takes part in one deal a quarter, and another deal went first."
		else
			verdict *= @sprintf(" A deal was possible: a rival could and should have paid up to %.2f € a share, at or above its walk-away price, but no bid reached it.", maximum(worth))
		end
		push!(verdicts, verdict)
	end
	return join(vcat(lines, "", verdicts), "\n")
end

"""The market's value of a company per share: earnings_multiple years of its earnings and of the savings still to come, plus cash, less debt."""
value_per_share(c, p) = (p["earnings_multiple"] * (c["earnings"] + c["pending"]) + c["cash"] - c["debt"]) / c["shares"]

"""What a company can pay in cash: its cash, and what it can still borrow."""
capacity(c, p) = c["cash"] + max(p["borrowing_multiple"] * c["earnings"] - c["debt"], 0.0)

"""One quarter: earnings, bids and deals, and the share prices."""
function play(rng, state, decisions, parameters)
	p = parameters
	companies = state["companies"]
	synergy = state["synergy"]
	n = length(companies)
	chosen = Dict(entry["team"] => entry["decisions"] for entry in decisions)
	index = Dict(c["team"] => i for (i, c) in enumerate(companies))
	quarter = state["quarter"] + 1
	notes = Dict{String,Vector{String}}()
	note(c, text) = push!(get!(notes, string(c["team"]), String[]), text)

	# Earnings, with the savings of earlier deals phased in, and a quarter's profit after interest
	noise = p["earnings_noise"]
	for c in companies
		c["active"] || continue
		step = c["pending"] > 0 ? c["synergy_step"] : 0.0
		c["pending"] = max(c["pending"] - step, 0.0)
		c["earnings"] = (c["earnings"] + step) * (1 + c["growth"] + p["market_growth"]) * exp(noise * randn(rng) - noise^2 / 2)
		c["cash"] += c["earnings"] / 4 - p["interest_rate"] / 4 * c["debt"]
	end

	# The bids each company received that its bidder can pay
	bids = Dict{Int,Vector{Tuple{Int,Float64}}}()
	for c in companies, (j, target) in enumerate(companies)
		(c["active"] && target["active"] && target !== c) || continue
		offers = get(chosen[c["team"]], "bid", Dict{String,Any}())
		b = float(get(offers, string(target["team"]), 0.0))
		b > 0 || continue
		cost = b * target["shares"]
		if cost > capacity(c, p)
			note(c, @sprintf("Your bid of %.2f € for %s would cost %.1f m €, more than your cash and borrowing (%.1f m €): it was not made.", b, target["name"], cost, capacity(c, p)))
			continue
		end
		push!(get!(bids, j, Tuple{Int,Float64}[]), (index[c["team"]], b))
	end

	before = [c["price"] for c in companies]

	# Deals: the highest bid for each company, when at least its walk-away price, the largest premiums first
	candidates = Tuple{Int,Int,Float64}[]
	for (j, offers) in bids
		i, b = offers[argmax(last.(offers))]
		walk = float(chosen[companies[j]["team"]]["walk_away"])
		b >= walk && push!(candidates, (i, j, b))
	end
	sort!(candidates; by = x -> x[3] / companies[x[2]]["price"], rev = true)
	dealt = Set{Int}()
	sold = Dict{Int,Tuple{Int,Float64}}()
	# The debrief's zones, from the figures before the deals, filled in once the deals are known
	values_before = [deepcopy(c) for c in companies]
	deals = String[]
	out = Dict{String,Any}()
	for (i, j, b) in candidates
		(i in dealt || j in dealt) && continue
		push!(dealt, i, j)
		sold[j] = (i, b)
		buyer, target = companies[i], companies[j]
		cost = b * target["shares"]
		paid = clamp(buyer["cash"], 0.0, cost)
		buyer["cash"] += target["cash"] - paid
		buyer["debt"] += target["debt"] + cost - paid
		buyer["earnings"] += target["earnings"]
		buyer["pending"] += synergy[i][j]
		buyer["synergy_step"] = buyer["pending"] / p["synergy_quarters"]
		premium = 100 * (b / target["price"] - 1)
		target["active"] = false
		target["sold_price"] = b
		target["buyer"] = buyer["name"]
		target["price"] = b
		push!(deals, @sprintf("%s bought %s at %.2f € a share, a premium of %.1f%%", buyer["name"], target["name"], b, premium))
		out[string(target["team"])] = @sprintf("Bought by %s at %.2f € a share, a premium of %.1f%% over its price.", buyer["name"], b, premium)
		note(buyer, @sprintf("You bought %s for %.1f m €; its business is now yours, and the savings come in over %d quarters.", target["name"], cost, round(Int, p["synergy_quarters"])))
	end

	# Prices: the value per share, moved toward the highest bid a company received and did not take
	public = Dict{String,Any}[]
	private = Dict{String,Any}()
	for (j, c) in enumerate(companies)
		highest = haskey(bids, j) ? maximum(last.(bids[j])) : 0.0
		if c["active"]
			value = value_per_share(c, p)
			c["price"] = value + p["bid_belief"] * max(highest - value, 0.0)
		end
		price = c["active"] ? c["price"] : c["sold_price"]
		owned = [o["name"] for o in companies if o["buyer"] == c["name"]]
		status = c["active"] ? (isempty(owned) ? "Independent" : "Owns " * join(owned, ", ")) : "Bought by " * c["buyer"]
		push!(public, Dict{String,Any}(
			"team" => c["name"], "status" => status, "price" => price, "change" => 100 * (price / before[j] - 1),
			"highest_bid" => highest, "market_value" => c["active"] ? price * c["shares"] : 0.0,
			"earnings" => c["active"] ? c["earnings"] : 0.0, "return" => 100 * (price / c["start_price"] - 1),
		))
		if c["active"]
			private[string(c["team"])] = [Dict{String,Any}(
				"earnings" => c["earnings"], "profit" => c["earnings"] / 4 - p["interest_rate"] / 4 * c["debt"],
				"cash" => c["cash"], "debt" => c["debt"], "borrowing_left" => max(p["borrowing_multiple"] * c["earnings"] - c["debt"], 0.0),
				"capacity" => capacity(c, p), "value" => value_per_share(c, p),
			)]
		end
	end

	offers = String[]
	for (j, list) in bids, (i, b) in list
		push!(offers, @sprintf("%s bid %.2f € for %s", companies[i]["name"], b, companies[j]["name"]))
	end
	active = [c for c in companies if c["active"]]
	leader = argmax(c -> c["price"] / c["start_price"], companies)
	text = "Quarter $quarter: " * (isempty(deals) ? "no deal." : join(deals, "; ") * ".") *
		(isempty(offers) ? "" : " Bids: " * join(sort(offers), "; ") * ".") *
		@sprintf(" %s leads, with a return of %.1f%%.", leader["name"], 100 * (leader["price"] / leader["start_price"] - 1))
	state["quarter"] = quarter
	return state, Dict{String,Any}(
		"public" => public, "private" => private, "text" => text, "out" => out,
		"debrief" => bids_debrief(values_before, synergy, chosen, bids, p, sold),
		"private_text" => Dict{String,Any}(team => join(lines, " ") for (team, lines) in notes),
		"over" => length(active) < 2,
	)
end
