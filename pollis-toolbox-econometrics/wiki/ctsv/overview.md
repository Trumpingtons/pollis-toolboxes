# Continuous-Time Stochastic Volatility Models — Overview

Option prices imply a volatility that changes with the strike, the smile, which a constant volatility cannot produce. Stochastic volatility models let volatility follow its own random process, correlated with the price, and so generate a smile and fat tails from a small number of parameters.

## How the Heston Model Works

[Heston (1993)](#ref-Hes1993a) lets the variance v follow a mean-reverting square root process alongside the price S:

dS = mu S dt + sqrt(v) S dW₁

dv = kappa (theta − v) dt + xi sqrt(v) dW₂

The two Brownian motions have correlation rho. Variance is pulled towards theta at speed kappa, and xi sets how much it moves. A negative rho makes volatility rise as prices fall, which tilts the smile towards low strikes. The original article gives a closed form for option prices, which the **Heston** tab does not use, as it prices by simulation.

## How the Bates Model Adds Jumps

[Bates (1996)](#ref-Bat1996a) adds to the Heston dynamics jumps in the price of the kind in [Merton (1976)](#ref-Mer1976a). Jumps arrive at rate lambda, and each multiplies the price by the exponential of a normal draw with mean muJ and standard deviation deltaJ. The drift subtracts lambda × kbar, where kbar = exp(muJ + deltaJ²/2) − 1 is the mean relative jump, so the jumps do not change the expected return. Stochastic volatility moves slowly, whereas a jump acts at once, and this gives short-dated smiles a steepness that diffusion alone struggles to produce.

## How the SABR Model Works

The SABR model of [Hagan, Kumar, Lesniewski and Woodward (2002)](#ref-HKLW2002a) describes a forward F and its volatility sig:

dF = sig F^beta dW₁

dsig = nu sig dW₂

The two Brownian motions have correlation rho. The exponent beta sets the backbone, from normal at 0 to log-normal at 1. Volatility has no mean reversion. The model's main appeal is an approximate formula for the implied Black volatility of each strike, which the **SABR** tab implements as `sabr_vol(K)`. That formula is an expansion, and it loses accuracy at low strikes and at long expiries.

## How the Panel Simulates and Prices

Each tab draws one path and defines `simulate(n)`, which returns n terminal prices. Next Steps then work from those simulations. **Option Prices by Strike** averages discounted payoffs for five strikes. **Implied Volatility Smile** inverts simulated prices with bisection on the Black formula for **Heston** and **Bates**, and evaluates `sabr_vol` directly for **SABR**. Every Monte Carlo figure changes between runs, since no seed is set and the results carry sampling error.

## References

<a id="ref-Bat1996a"></a>Bates, D. S. (1996). Jumps and stochastic volatility: exchange rate processes implicit in Deutsche Mark options. *Review of Financial Studies* 9(1), 69–107. [doi:10.1093/rfs/9.1.69](https://doi.org/10.1093/rfs/9.1.69)

<a id="ref-HKLW2002a"></a>Hagan, P. S., Kumar, D., Lesniewski, A. S. and Woodward, D. E. (2002). Managing smile risk. *Wilmott Magazine*. [wilmott.com](https://wilmott.com/?p=3482)

<a id="ref-Hes1993a"></a>Heston, S. L. (1993). A closed-form solution for options with stochastic volatility with applications to bond and currency options. *Review of Financial Studies* 6(2), 327–343. [doi:10.1093/rfs/6.2.327](https://doi.org/10.1093/rfs/6.2.327)

<a id="ref-Mer1976a"></a>Merton, R. C. (1976). Option pricing when underlying stock returns are discontinuous. *Journal of Financial Economics* 3(1–2), 125–144. [doi:10.1016/0304-405X(76)90022-2](https://doi.org/10.1016/0304-405X(76)90022-2)

## See Also

- [Factsheet](factsheet.md) · [Assumptions](assumptions.md) · [Diagnostics](diagnostics.md) · [Decision Guide](decision-guide.md)
