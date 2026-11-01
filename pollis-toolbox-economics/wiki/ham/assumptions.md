# Heterogeneous-Agent Models — Assumptions

The stationary equilibrium relies on assumptions about markets, income risk and the numerical grid.

## Incomplete Markets and an Ad Hoc Limit

Households can trade only one asset, and they cannot insure income shocks directly, which is what makes saving precautionary. The limit in **phi (borrowing limit)** is imposed rather than derived from default or lending. Results depend on it: a tighter limit raises the share of constrained households and lowers the interest rate in the Huggett economy. Partial insurance through family, taxes or transfers is absent, unless the income process is reinterpreted as net of such channels. The model then attributes all consumption smoothing to the single asset.

## A Single Income Process

Income is one Ornstein-Uhlenbeck process with a mean of 1 and two parameters. The process is continuous and has no permanent component in the strict sense, since it always mean-reverts. Earnings data include rare large shocks and very persistent ones, and these change precautionary motives. The income grid is bounded, so extreme values are truncated. Treat **sigma (income vol)** and **kappa (mean reversion)** as a stylised description. Higher income risk raises precautionary saving, and the elasticity of this response is one of the main comparative statics of the framework.

## Preferences and Stationarity

Households have power utility with **gamma (risk aversion)**, which also sets the elasticity of intertemporal substitution as its inverse. All share one **rho (discount rate)**. A stationary distribution of wealth exists only when the interest rate is below the discount rate, or else households accumulate without limit. In the partial-equilibrium solve at a given rate, a rate at or above **rho (discount rate)** pushes wealth to the top of the grid, and the resulting density is meaningless. The market-clearing search stays between 0.05 and 0.001 below **rho (discount rate)** for that reason.

## Grid Bounds and Accuracy

A wealth grid must extend from the limit to well above where households save. If the upper bound binds, the density piles up at the top and aggregates are wrong. Near the limit, policies have strong curvature, and few grid points there can blur the mass of constrained households. Raising **N (grid points)** improves accuracy at a cost that rises with the size of a sparse system. Results that change noticeably as the grid is refined should not be reported. Upwinding helps stability, but the first-order accuracy of the scheme means that fine grids are needed.

## See Also

- [Diagnostics](diagnostics.md) · [Interpretation](interpretation.md) · [Decision Guide](decision-guide.md)
