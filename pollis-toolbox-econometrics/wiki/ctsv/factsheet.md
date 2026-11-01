# Continuous-Time Stochastic Volatility Models — Factsheet

The Continuous-Time Stochastic Volatility Models panel simulates price and volatility paths from three standard models and prices options on them by Monte Carlo. The panel does not estimate parameters from data: every parameter is an input.

## What the Stochastic Volatility Panel Does

| Item | Description |
|---|---|
| **Purpose** | Simulate paths and terminal prices under a chosen volatility model |
| **Julia stack** | DiffEqFinancial.jl and StochasticDiffEq.jl for Heston; hand-written loops and Distributions.jl for Bates and SABR |
| **Models** | **Heston**, **Bates** and **SABR** tabs |
| **Output** | One path as `t`, `S` and `v`, and `simulate(n)`, which returns n terminal prices |
| **Not included** | Calibration to option prices, and closed-form option prices |

## How Each Stochastic Volatility Tab Simulates

| Tab | Variance or volatility | Scheme for terminal prices | Drift of the price |
|---|---|---|---|
| **Heston** | Mean-reverting square root variance | `EM()` with `dt = 0.01` | **mu (drift)** |
| **Bates** | Same as Heston, plus log-normal jumps in price | Euler with full truncation, 252 steps | **mu (drift)**, with the jumps compensated |
| **SABR** | Log-normal volatility, no mean reversion | Euler on the forward, exact step on volatility, 252 steps | None, as the forward is a martingale |

## Which Inputs Each Stochastic Volatility Tab Uses

**Heston** and **Bates** share **kappa (kappa)**, **theta (theta)**, **xi (xi)**, **rho (rho)**, **S₀ (price)**, **v₀ (variance)**, **T (horizon)** and **mu (drift)**. **lambda (intensity)**, **muJ (mean jump)** and **deltaJ (jump vol)** apply to **Bates**. **SABR** has its own **alpha (alpha)**, **beta (beta)**, **rho (rho)**, **F₀ (forward)**, **T (expiry)** and **nu (vol of vol)**.

## See Also

- [Overview](overview.md) · [Decision Guide](decision-guide.md) · [Interpretation](interpretation.md)
