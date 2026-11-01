# Dynamic Stochastic General Equilibrium (DSGE) — Diagnostics

Checks move from the solution to the fit: a model that has no solution cannot be estimated, and a posterior from a poorly mixed chain cannot be read.

## Reading the Steady State

**Steady State** shows the non-stochastic steady state and the stochastic steady state, which accounts for risk at second order. The non-stochastic value is where the economy rests when no shocks exist or are expected. The stochastic value is where it settles when shocks are expected but do not happen. A gap between them measures precautionary effects. Negative consumption, a capital stock near zero or a failed computation usually means a wrong equation or a poor calibration, and it should be fixed before moving on.

## Reading Saddle-Path Stability

**Saddle-Path Stability** checks that a unique stable first-order solution exists under the conditions of [Blanchard and Kahn (1980)](#ref-BK1980a), and reports how persistent the state dynamics are. Failure means either no bounded solution or an indeterminate model, and any moment or response at that point has no meaning. Timing conventions in the equations are the usual cause, for example a capital stock dated `k[0]` where `k[-1]` is meant, along with parameters outside a sensible range. Very persistent states are not an error, but they can make moments and estimates sensitive.

## Reading the Model-Implied ACF

**Model-Implied ACF** gives the theoretical autocorrelations of each variable from the first-order solution. Comparing them with sample autocorrelations shows whether the model has enough internal propagation. Basic real business cycle models owe nearly all their persistence to the exogenous process, and a model with output autocorrelation lower than the data has a propagation problem. Frictions like habits and adjustment costs were introduced into larger models for this reason. Autocorrelations are also unaffected by the scale of the shocks, unlike volatilities.

## Comparing First and Second Order

**First vs Second Order** compares standard deviations from the two perturbation orders. Small differences show that a linear solution is adequate for second moments, so the fast Kalman filter is a reasonable basis for estimation. Large differences signal important nonlinearity, or a calibration with big shocks. For estimation, checks on convergence belong to the sampler output: look at the effective sample size and R-hat in the chain summary, and compare posterior means with known values when **Data** is `simulated`. Failing to recover a known value on simulated data points to weak identification.

## References

<a id="ref-BK1980a"></a>Blanchard, O. J. and Kahn, C. M. (1980). The Solution of Linear Difference Models under Rational Expectations. *Econometrica* 48(5), 1305. [doi:10.2307/1912186](https://doi.org/10.2307/1912186)

## See Also

- [Assumptions](assumptions.md) · [Interpretation](interpretation.md) · [Decision Guide](decision-guide.md)
