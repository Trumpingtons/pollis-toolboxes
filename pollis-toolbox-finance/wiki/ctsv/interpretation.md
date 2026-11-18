# Continuous-Time Stochastic Volatility Models — Interpretation

The parameters of these models have direct meanings, and the Next Steps turn them into smiles and distributions. This page says how to read each one.

## What the Variance Parameters Mean in Heston and Bates

The square root of **theta (theta)** is the long-run volatility, and the square root of **v₀ (variance)** is the current volatility. **kappa (kappa)** gives the speed of return, with a half-life of log(2) / kappa years, so a value of 2 halves any gap in about four months. **xi (xi)**, the volatility of variance, controls how far volatility wanders, and it sets the curvature of the smile and the fatness of the tails. **Parameters in Plain Terms** reports these values.

## What the Correlation Does to the Smile

A negative **rho (rho)** in **Heston** and **Bates** links falling prices with rising volatility, the leverage effect. It fattens the left tail and thins the right one, and it makes implied volatility fall as the strike rises. Equity index options normally show this skew. With a zero correlation, the smile is roughly symmetric around the forward, and a positive value tilts it the other way. In **SABR**, the separate **rho (rho)** input plays the same part for the slope of the smile.

## What the Jump Parameters Mean in Bates

**lambda (intensity)** is the expected number of jumps per year, **muJ (mean jump)** the mean log size and **deltaJ (jump vol)** the spread of log sizes. A negative mean produces crash-type moves, and it steepens the left wing of the smile. **Parameters in Plain Terms** gives the mean jump as a percentage and the jump share of variance, which is lambda (muJ² + deltaJ²) over theta plus that same quantity. A small share means that diffusion, not jumps, drives most of the variance.

## What the SABR Parameters Mean

**alpha (alpha)** sets the level, on a scale that depends on **beta (beta)** and the forward. **beta (beta)** sets the backbone, which is how the at-the-money volatility moves as the forward moves: log-normal at 1, normal at 0 and of the constant elasticity of variance type between. **nu (vol of vol)** gives the curvature of the smile. Because **beta (beta)** and **rho (rho)** both tilt the smile, practitioners often fix **beta (beta)** on prior grounds and fit the others.

## How to Read the Risk Figures

**Terminal Price Risk** reports price quantiles at 5%, 50% and 95%, with a 95% value at risk and an expected shortfall, both as positive fractions of the starting price over the whole horizon. A value at risk of 0.2 is a loss of 20% or worse in the worst twentieth of paths. These figures come from the chosen parameters and describe the model, not any market, and their worth depends entirely on those parameters.

## What the Comparison with a Normal Distribution Shows

**Against Black-Scholes** sets simulated quantiles beside those of geometric Brownian motion with the volatility of the current instant, as in [Black and Scholes (1973)](#ref-BS1973a). Gaps in the 1% and 99% rows show how much the model adds in the tails. **Log Returns Against the Normal** gives skewness and excess kurtosis. In **SABR**, an absorbed path has a log return floored at an extremely negative value, so a few absorbed paths can dominate those two statistics, which should then not be read as a shape of the distribution.

## References

<a id="ref-BS1973a"></a>Black, F. and Scholes, M. (1973). The pricing of options and corporate liabilities. *Journal of Political Economy* 81(3), 637–654. [doi:10.1086/260062](https://doi.org/10.1086/260062)

## See Also

- [Diagnostics](diagnostics.md) · [Assumptions](assumptions.md) · [Decision Guide](decision-guide.md)
