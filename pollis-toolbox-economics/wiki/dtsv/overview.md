# Discrete-Time Stochastic Volatility Models — Overview

Each tab fits y(t) = exp(h(t) / 2) e(t), with h(t) = mu + phi (h(t-1) - mu) + sigma_eta n(t). Log-variance h(t) is latent and follows an AR(1). **Returns** supplies the data, **Posterior draws**, **Burn-in** and **Seed** control the sampler, and **Horizon** sets forecast length.

## The Basic Tab

The **Basic** tab calls `estimate_sv` with Gaussian shocks. Taking logs of squared returns gives a linear state-space model with non-Gaussian noise. [Kim, Shepherd and Chib (1998)](#ref-KSC1998a) approximate the noise with a mixture of normals and draw the whole volatility path at once, which improves on earlier samplers that moved one step at a time, such as [Jacquier, Polson and Rossi (1994)](#ref-JPR1994a). The package uses the 10-component mixture of [Omori, Chib, Shephard and Nakajima (2007)](#ref-OCSN2007a). Three parameters result: mu sets the level, phi the persistence, and sigma_eta the size of the shocks to log-variance.

## The Leverage Tab

The **Leverage** tab sets `leverage=true`, adding a correlation rho between the return shock and the next shock to log-variance. A negative rho means that falling prices raise later volatility more than rising prices do. In the sampler, h(t) depends on the standardised return at t - 1. [Yu (2005)](#ref-Yu2005a) favours that timing over a correlation between shocks at the same date, because it fits the interpretation of leverage and gives a return series that is a martingale difference. Equity returns usually show a clearly negative rho.

## The Student-t Tab

The **Student-t** tab sets `dist=:studentt`, drawing a Student-t return shock with estimated degrees of freedom nu, implemented as a scale mixture of normals. Heavy tails let a single extreme return be treated as an outlier, instead of forcing a jump in the volatility path. Standardised-return kurtosis should drop toward 3 compared with the Gaussian model, unless the tails were already well explained. A low nu signals strongly heavy tails, and a high nu suggests that the Gaussian model is adequate.

## Common Workflow for Stochastic Volatility

1. Check for clustering with **Volatility Clustering** before fitting.
2. Fit, then confirm that the chain is reliable with **MCMC Convergence** and **Posterior Traces**.
3. See the path with **Volatility Path**, and test the fit with **Standardised Returns**.
4. Compare models with **Compare SV Variants** and **Compare with GARCH(1,1)**.
5. Read **Posterior Summary**, **Volatility Persistence** and **Volatility of Volatility**.
6. Forecast with **Variance Forecast** and **Long-Run Volatility**.

## References

<a id="ref-JPR1994a"></a>Jacquier, E., Polson, N. G. and Rossi, P. E. (1994). Bayesian analysis of stochastic volatility models. *Journal of Business & Economic Statistics* 12(4), 371–389. [doi:10.1080/07350015.1994.10524553](https://doi.org/10.1080/07350015.1994.10524553)

<a id="ref-KSC1998a"></a>Kim, S., Shepherd, N. and Chib, S. (1998). Stochastic volatility: Likelihood inference and comparison with ARCH models. *Review of Economic Studies* 65(3), 361–393. [doi:10.1111/1467-937X.00050](https://doi.org/10.1111/1467-937X.00050)

<a id="ref-OCSN2007a"></a>Omori, Y., Chib, S., Shephard, N. and Nakajima, J. (2007). Stochastic Volatility with Leverage: Fast and Efficient Likelihood Inference. *Journal of Econometrics* 140(2), 425–449. [doi:10.1016/j.jeconom.2006.07.008](https://doi.org/10.1016/j.jeconom.2006.07.008)

<a id="ref-Yu2005a"></a>Yu, J. (2005). On leverage in a stochastic volatility model. *Journal of Econometrics* 127(2), 165–178. [doi:10.1016/j.jeconom.2004.08.002](https://doi.org/10.1016/j.jeconom.2004.08.002)

## See Also

- [Factsheet](factsheet.md) · [Decision Guide](decision-guide.md) · [Interpretation](interpretation.md)
