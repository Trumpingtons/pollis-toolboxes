# Copyright (c) 2026 Antonio Saragga Seabra
# SPDX-License-Identifier: MIT

# Grow a Chocolate Chain. Rival teams each run a chocolate brand in one country, and make every tablet they
# sell in their own shops. Each year a team sets its price, beans, shops, staff per shop and marketing.
#
# The market grows each year, with a random shock. Each brand's appeal to buyers is
#
#   appeal = quality_appeal[beans] - price_sensitivity * log(price)
#            + brand_appeal * log(1 + brand / 100) + shop_appeal * log(shops)
#
# where brand, in thousand €, is brand_memory times last year's brand plus this year's marketing. Buyers
# choose among the brands and buying none (no_purchase_appeal) by a multinomial logit: a brand's share of the
# market is exp(appeal) over the sum of exp(appeal) of all brands and of buying none. A brand sells its
# demand up to its capacity, shops times staff per shop times tablets_per_staff; the rest are lost sales.
#
# Each game draws its own market size and price sensitivity from the ranges of [parameters], so that a price
# worked out in advance from this file does not carry over from one game to the next; the briefings give the
# ranges, and the debrief shows what was drawn.

"""A value drawn evenly from a range [low, high]."""
draw(rng, range) = range[1] + (range[2] - range[1]) * rand(rng)

"""The state before the first year: the market and the buyers' price sensitivity drawn for this game, and each team with its starting cash and no shops; and, for the debrief, what was drawn."""
function initial(rng, parameters, teams)
	p = parameters
	market = round(draw(rng, p["market_size"]); digits = -4)
	sensitivity = round(draw(rng, p["price_sensitivity"]); digits = 2)
	charge(bean) = round(Int, 100 * (exp(p["quality_appeal"][bean] / sensitivity) - 1))
	debrief = @sprintf("What this game drew: the country's buyers would buy %s tablets in the first year, and their price sensitivity was %.2f, so that a price 10%% higher lost %.1f%% of a brand's buyers, Fine Trinitario let a brand charge %d%% more than Bulk Forastero for the same buyers, and Single-Origin Criollo %d%% more, while its share of the market was small.",
		thousands(round(Int, market)), sensitivity, 100 * (1 - 1.1^-sensitivity), charge("fine"), charge("origin"))
	state = Dict{String,Any}(
		"year" => 0,
		"market" => market,
		"price_sensitivity" => sensitivity,
		"teams" => [Dict{String,Any}(
			"team" => team["team"],
			"name" => team["name"],
			"cash" => float(parameters["starting_cash"]),
			"shops" => 0,
			"brand" => 0.0,
			"cumulative_profit" => 0.0,
		) for team in teams],
	)
	return state, Dict{String,Any}("debrief" => debrief)
end

"""One year: the market, each brand's share, sales and accounts."""
function play(rng, state, decisions, parameters)
	p = parameters
	noise = p["demand_noise"]
	market = state["market"] * (1 + p["market_growth"]) * exp(noise * randn(rng) - noise^2 / 2)
	chosen = Dict(entry["team"] => entry["decisions"] for entry in decisions)

	brands = map(state["teams"]) do team
		d = chosen[team["team"]]
		price = float(d["price"])
		beans = d["beans"]
		shops = round(Int, d["shops"])
		staff = round(Int, d["staff"])
		marketing = float(d["marketing"])
		brand = p["brand_memory"] * team["brand"] + marketing
		appeal = p["quality_appeal"][beans] - state["price_sensitivity"] * log(price) +
			p["brand_appeal"] * log1p(brand / 100) + p["shop_appeal"] * log(shops)
		(; team, price, beans, shops, staff, marketing, brand, appeal)
	end
	weights = [exp(b.appeal) for b in brands]
	total = exp(p["no_purchase_appeal"]) + sum(weights)

	teams = Dict{String,Any}[]
	public = Dict{String,Any}[]
	private = Dict{String,Any}()
	for (b, weight) in zip(brands, weights)
		share = weight / total
		demand = round(Int, share * market)
		capacity = b.shops * b.staff * p["tablets_per_staff"]
		sales = min(demand, capacity)
		revenue = sales * b.price
		tablet_costs = sales * (p["bean_cost"][b.beans] + p["other_unit_cost"])
		rent = b.shops * p["rent"]
		wages = b.shops * b.staff * p["wage"]
		opening = max(b.shops - b.team["shops"], 0) * p["opening_cost"]
		marketing = 1000 * b.marketing
		profit = revenue - tablet_costs - rent - wages - opening - marketing
		cash = b.team["cash"] + profit
		cumulative = b.team["cumulative_profit"] + profit
		push!(teams, Dict{String,Any}(
			"team" => b.team["team"], "name" => b.team["name"], "cash" => cash, "shops" => b.shops,
			"brand" => b.brand, "cumulative_profit" => cumulative,
		))
		push!(public, Dict{String,Any}(
			"team" => b.team["name"], "price" => b.price, "beans" => b.beans, "shops" => b.shops,
			"share" => 100 * sales / market, "sales" => sales, "profit" => profit, "cumulative_profit" => cumulative,
		))
		private[string(b.team["team"])] = [Dict{String,Any}(
			"demand" => demand, "capacity" => capacity, "lost_sales" => demand - sales, "revenue" => revenue,
			"tablet_costs" => tablet_costs, "rent" => rent, "wages" => wages, "opening" => opening,
			"marketing" => marketing, "profit" => profit, "cash" => cash,
		)]
	end

	year = state["year"] + 1
	leader = argmax(team -> team["cumulative_profit"], teams)
	text = @sprintf("Year %d: the market would buy %s tablets. %s leads, with a cumulative profit of %s €.",
		year, thousands(round(Int, market)), leader["name"], thousands(round(Int, leader["cumulative_profit"])))
	return Dict{String,Any}("year" => year, "market" => market, "price_sensitivity" => state["price_sensitivity"], "teams" => teams),
		Dict{String,Any}("public" => public, "private" => private, "text" => text)
end

"""An integer with its thousands separated by commas."""
thousands(n::Integer) = replace(string(n), r"(?<=\d)(?=(\d{3})+$)" => ",")
