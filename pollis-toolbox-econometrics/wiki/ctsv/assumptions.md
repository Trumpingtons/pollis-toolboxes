# Continuous-Time Stochastic Volatility Models — Assumptions

These models describe price dynamics with a few parameters, each fixed over the whole horizon. The assumptions below decide when their paths and option prices can be trusted.

## When Variance Stays Positive: the Feller Condition

The square root process of Heston and Bates stays strictly positive only when 2 kappa theta > xi², the boundary condition that traces back to [Feller (1951)](#ref-Fel1951a). When it fails, the exact process can touch zero and then leave it again. Failure is common in fitted models, and it is not an error in itself, but the discretised variance can then go below zero, and simulation needs care.

## What Constant Parameters Assume

All the models hold their parameters fixed through time, including the long-run variance theta, the correlation rho and the jump intensity lambda. Real markets change regime, so parameters calibrated today describe today's smile and may not describe next month's. Maturities also pose a problem: one parameter set often cannot fit short and long expiries at the same time, and SABR is normally fitted separately for each expiry.

## What Assumption Each Model Makes About Large Moves

Heston has continuous paths, so a large one-day move requires high variance beforehand. Bates allows sudden moves, but with one log-normal size distribution, independent of the state of volatility, and a constant arrival rate. Clustered jumps or jumps that also strike volatility lie outside the model. The SABR forward moves continuously, and its volatility has no floor or long-run level, so over long horizons its volatility can drift far from where it began.

## What Happens at Zero in the SABR Model

With **beta (beta)** below 1, the forward can reach zero, and the simulation absorbs it there, so the path stays at zero until expiry. The Hagan formula does not treat this boundary, and it can imply a negative probability density at low strikes. Prices from the Monte Carlo paths and from `hagan_implied_vol` should therefore disagree most at low strikes. Absorption also rules out negative rates or forwards in this tab.

## Which Measure the Panel's Simulations Use

An option price needs a risk-neutral measure, and a risk forecast needs the real-world one. **Heston** and **Bates** use **mu (drift)** in both roles: it is the drift of the price and also the rate for discounting and for the forward. **SABR** prices in forward terms, with no discounting. **Terminal Price Risk** reads the same simulated distribution, so a risk figure inherits whichever drift the tab has, and it also ignores any premium for bearing variance risk.

## References

<a id="ref-Fel1951a"></a>Feller, W. (1951). Two singular diffusion problems. *Annals of Mathematics* 54(1), 173. [doi:10.2307/1969318](https://doi.org/10.2307/1969318)

## See Also

- [Diagnostics](diagnostics.md) · [Interpretation](interpretation.md) · [Decision Guide](decision-guide.md)
