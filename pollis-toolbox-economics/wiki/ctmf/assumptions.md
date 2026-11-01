# Continuous-Time Macro-Finance — Assumptions

Results follow from a chain of modelling choices, which should be made explicit whenever the output is reported.

## The Representative Investor With Recursive Preferences

The model has a single investor with Epstein-Zin preferences, complete markets and no frictions. Heterogeneity, limited participation and borrowing constraints are all absent. Risk premia arise solely from the covariance of returns with the marginal value of wealth. Under this model, the elasticity of substitution matters greatly: if **psi (EIS)** is below 1, then good growth news lowers the wealth-consumption ratio, and the sign of the long-run risk premium changes. Empirical estimates of the elasticity vary, and that disagreement is an active dispute in the long-run risk literature.

## A Persistent, Hard-to-Detect Growth Component

The mechanism relies on a small persistent component of consumption growth. Such a component is difficult to identify in consumption data, so the data neither clearly confirm nor reject its size. A calibration with low **kappa** and moderate **nu (growth-news volatility)** can seem plausible and imply a very different premium from one with slightly faster mean reversion. Investors are assumed to observe expected growth directly, so there is no learning. Since the equilibrium depends on an unobservable state, results for prices should be read as conditional on a chosen calibration.

## Constant Volatility and a Consumption Claim

Consumption volatility **sigma (consumption volatility)** is constant here, unlike the second state in [Bansal and Yaron (2004)](#ref-BY2004a), so the panel has no time variation in risk premia from volatility. The Sharpe ratio is nearly flat over the state. The priced asset is also a claim to consumption and not a levered equity claim, so the excess return is lower than an equity premium. A similar parameter set in the original paper yields a larger premium for dividends, which carry more exposure to growth news. A direct comparison to equity data would therefore be misleading.

## Grid and Boundary Treatment

The state grid is truncated at plus or minus three stationary standard deviations of expected growth, and the solution at the edge depends on that truncation. Stationary density puts little mass there, so moments are largely unaffected, but extreme values of p at the edges should not be read as economic results. Parameters near a singularity can make the solver fail or give meaningless output: for example, psi close to 1, or growth so high that wealth is infinite. **N (grid points)** must be large enough for the state's stationary spread to be well resolved.

## References

<a id="ref-BY2004a"></a>Bansal, R. and Yaron, A. (2004). Risks for the Long Run: A Potential Resolution of Asset Pricing Puzzles. *The Journal of Finance* 59(4), 1481–1509. [doi:10.1111/j.1540-6261.2004.00670.x](https://doi.org/10.1111/j.1540-6261.2004.00670.x)

## See Also

- [Diagnostics](diagnostics.md) · [Interpretation](interpretation.md) · [Decision Guide](decision-guide.md)
