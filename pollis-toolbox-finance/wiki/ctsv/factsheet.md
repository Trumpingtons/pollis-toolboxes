# Continuous-Time Stochastic Volatility Models — Factsheet

The Continuous-Time Stochastic Volatility Models panel simulates price and volatility paths from three standard models with StochasticVolatility.jl, and prices European options on them in closed form and by Monte Carlo. The panel does not estimate parameters from data: every parameter is an input.

## What the Stochastic Volatility Panel Does

| Item | Description |
|---|---|
| **Purpose** | Simulate paths and terminal prices under a chosen volatility model |
| **Julia stack** | StochasticVolatility.jl for every tab; Distributions.jl for the Black formula and the normal density |
| **Models** | **Heston**, **Bates** and **SABR** tabs |
| **Output** | `model`, which the Next Steps pass to the functions of the package, and one path as `t`, `S` and `v` |
| **Not included** | Calibration to option prices, and American prices, which the package gives with `longstaff_schwartz_price` and `finite_difference_price` |

## How Each Stochastic Volatility Tab Simulates

| Tab | Variance or volatility | Scheme for terminal prices | Drift of the price |
|---|---|---|---|
| **Heston** | Mean-reverting square root variance | Quadratic-exponential, 252 steps | **mu (drift)** |
| **Bates** | Same as Heston, plus log-normal jumps in price | Quadratic-exponential, 252 steps | **mu (drift)**, with the jumps compensated |
| **SABR** | Log-normal volatility, no mean reversion | Euler on the forward, exact step on volatility, 252 steps | None, as the forward is a martingale |

## Which Inputs Each Stochastic Volatility Tab Uses

**Heston** and **Bates** share **kappa (kappa)**, **theta (theta)**, **xi (xi)**, **rho (rho)**, **S₀ (price)**, **v₀ (variance)**, **T (horizon)** and **mu (drift)**. **lambda (intensity)**, **muJ (mean jump)** and **deltaJ (jump vol)** apply to **Bates**. **SABR** has its own **alpha (alpha)**, **beta (beta)**, **rho (rho)**, **F₀ (forward)**, **T (expiry)** and **nu (vol of vol)**.

## See Also

- [Overview](overview.md) · [Decision Guide](decision-guide.md) · [Interpretation](interpretation.md)
