# Heterogeneous-Agent Models — Diagnostics

Diagnostics check the numerical solution and then whether the economy looks sensible.

## Reading the Convergence Check

**Convergence Check** confirms that the Hamilton-Jacobi-Bellman solver converged and that the stationary distribution is a valid probability distribution: non-negative and summing to one. A failed check should stop further interpretation. Common causes are a rate too close to **rho (discount rate)** or too few grid points. A limit that is too loose stops the run with an error, because the lowest income could not pay the interest on the maximum debt, so that household could never stay solvent. A negative probability on the grid is not meaningful, and a finer grid is the first remedy to try.

## Reading the Wealth Distribution

**Wealth Distribution** plots the stationary wealth density, the marginal over income of the solution to the forward equation, and the share of households at the limit. Mass piling up at the top of the grid means that the grid is too short, or that the rate is too high. Some mass at the limit is expected, and its share is itself a result: that fraction of households has no buffer. A tighter limit or lower rate will generally raise the share at the limit, whereas more income risk increases saving.

## Reading the Policy Function

**Policy Function** plots consumption and saving against wealth for low, median and high income. Consumption should increase with both wealth and income. Saving should be negative at high wealth when r is below **rho (discount rate)**, and low-income households near the limit should stop dissaving there. Curvature is strongest near the limit, which is where marginal propensities to consume are highest. Kinks or oscillations suggest a numerical problem, and a concave consumption policy is the visual signature of precautionary behaviour under borrowing constraints.

## Checking Market Clearing

**Equilibrium Interest Rate** searches for the rate at which aggregate bond holdings are zero in the **Huggett** tab, or at which household wealth equals firm capital in the **Aiyagari** tab. Residual excess supply should be small relative to the size of asset positions. The rate should sit below **rho (discount rate)**. When excess supply has no sign change in the search range, the action stops with an error, so check that **phi (borrowing limit)** is below 0 in the Huggett economy. Aggregate saving is very sensitive near the discount rate, so grid errors matter most at that point.

## See Also

- [Assumptions](assumptions.md) · [Interpretation](interpretation.md) · [Decision Guide](decision-guide.md)
