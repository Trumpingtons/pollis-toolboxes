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
	for (i, c) in enumerate(companies)
		estimates = [@sprintf("buying %s would save about %.1f m € a year", companies[j]["name"], synergy[i, j]) for j in 1:n if j != i]
		notes[string(c["team"])] = "Your analysts estimate that " * join(estimates, ", and ") * ". Only your team knows these estimates."
	end
	return state, Dict{String,Any}("public" => public, "private_text" => notes,
		"text" => "Three bicycle makers are listed: each is valued at its earnings, cash and debt. Bids open in Quarter 1.")
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
	deals = String[]
	out = Dict{String,Any}()
	for (i, j, b) in candidates
		(i in dealt || j in dealt) && continue
		push!(dealt, i, j)
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
		"private_text" => Dict{String,Any}(team => join(lines, " ") for (team, lines) in notes),
		"over" => length(active) < 2,
	)
end
