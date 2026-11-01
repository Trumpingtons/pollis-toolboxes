# Continuous-Time Stochastic Volatility Models — Decision Guide

The choice among these models depends on the asset, the maturities that matter, and whether the aim is a whole set of paths or a quick smile. All three need parameters from elsewhere, since this panel does not calibrate.

## Which Stochastic Volatility Tab Fits a Problem

| Situation | Tab | Why |
|---|---|---|
| Equity or index dynamics across several maturities | **Heston** | Mean-reverting variance links the maturities with one parameter set |
| Short-dated options with a steep skew, or crash risk | **Bates** | Jumps add short-term tail risk that diffusion builds only slowly |
| Interest rate or forward smiles at a single expiry | **SABR** | Each strike's volatility comes from a formula, and the parameters read directly off the smile |
| Long-horizon risk with volatility returning to a level | **Heston** or **Bates** | **SABR** has no mean reversion |

## When Jumps Are Worth Adding

Add jumps when short-maturity smiles are steeper than the diffusion fit can reach, or when the aim is to study sudden losses. Three more parameters bring more flexibility, and also more parameters that are hard to tell apart: jump intensity and size trade off against each other, and jumps can partly substitute for **xi (xi)**. If jump share of variance from **Parameters in Plain Terms** is very small, the simpler **Heston** tab may do the same job.

## When to Prefer the SABR Formula or Its Simulation

Use `sabr_vol` to fit or quote a smile: it is immediate and has no sampling noise. Use `simulate` when a payoff needs the full distribution, or when strikes are low enough for the formula to be doubtful. Comparing the two on the same strikes is a good test of the parameter set, and a large disagreement at low strikes signals that the expansion is outside its reliable range.

## How to Choose Sensible Parameter Values

Annualised variances are small numbers: 0.04 means 20% volatility. Start **v₀ (variance)** and **theta (theta)** from an observed level of volatility, with **kappa (kappa)** between 1 and 5 and **rho (rho)** negative for equity. Then use **Positivity Check**, and raise **kappa (kappa)** or lower **xi (xi)** if the scheme struggles. For a real application, calibrate the parameters to option prices elsewhere, and enter the fitted values here.

## When a Simpler Model Is Enough

For a standard option at one strike, the formula of Black and Scholes with an implied volatility may be all that is needed, and **Against Black-Scholes** shows how much the distribution differs from that benchmark. If the aim is to model past return data instead of options, a discrete-time volatility model fitted to those returns is a more direct route. Stochastic volatility earns its cost when a whole smile, or the joint behaviour of price and volatility, is the question.

## See Also

- [Factsheet](factsheet.md) · [Overview](overview.md) · [Interpretation](interpretation.md)
