# Rt Estimation

## The Renewal Equation for Daily Cases

The renewal equation says that today's expected cases are Rt times the infectiousness of past cases, Lambda(t) = sum over s of w(s) I(t - s), where w(s) is the share of transmission s days after a case's onset. The framework of [Cori, Ferguson, Fraser and Cauchemez (2013)](#ref-CFFC2013a) made this a standard tool for estimating Rt during an outbreak. Cases are Poisson with mean Rt Lambda(t). The weights come from a Gamma serial interval, discretised into days and normalised.

## A Random Walk on Log Rt

The original method estimates Rt in sliding windows, which gives a closed-form posterior but makes the result depend on the window. A random walk instead lets log Rt change by a small step each day, log Rt = log R(t-1) + sigma z(t), with z(t) standard normal and the size sigma estimated. Keeping the model in this non-centred form, with the z values sampled rather than the Rt values, makes the geometry easier for the sampler. The price is one parameter per day, handled well by NUTS.

## Why the First Days Are Not Fitted

Early in a series, the sum over past cases is missing most of its terms, so that infectiousness is understated and Rt overstated. The model therefore starts after a seed week of observed cases. The first estimate still carries more uncertainty than later ones. Real data that begin with a large first count, or with imported cases, need care: [Thompson, Stockwin, van Gaalen, Polonsky, Kamvar, Demarsh, Dahlqwist, Li, Miguel, Jombart, Lessler, Cauchemez and Cori (2019)](#ref-TSGPK...2019a) show how imported and local cases can be separated.

## Which Next Steps Are Specific to Rt Estimation

Forecast continues the random walk from posterior draws and applies the renewal equation with simulated cases, so that uncertainty grows with the horizon. Counterfactual holds Rt at its value before the change. Model Comparison sets the estimate against a naive day-on-day growth factor, which ignores the serial interval. Sensitivity refits with shorter and longer serial intervals and overlays the medians.

## References

<a id="ref-CFFC2013a"></a>Cori, A., Ferguson, N. M., Fraser, C. and Cauchemez, S. (2013). A New Framework and Software to Estimate Time-Varying Reproduction Numbers During Epidemics. *American Journal of Epidemiology* 178(9), 1505–1512. [doi:10.1093/aje/kwt133](https://doi.org/10.1093/aje/kwt133)

<a id="ref-TSGPK...2019a"></a>Thompson, R. N., Stockwin, J. E., van Gaalen, R. D., Polonsky, J. A., Kamvar, Z. N., Demarsh, P. A., Dahlqwist, E., Li, S., Miguel, E., Jombart, T., Lessler, J., Cauchemez, S. and Cori, A. (2019). Improved inference of time-varying reproduction numbers during infectious disease outbreaks. *Epidemics* 29, 100356. [doi:10.1016/j.epidem.2019.100356](https://doi.org/10.1016/j.epidem.2019.100356)

## See Also
- [Overview](overview.md) · [Assumptions](assumptions.md) · [Diagnostics](diagnostics.md) · [Interpretation](interpretation.md)
