# Goodness of Fit

## The Fit Statistics of the Spatial Interaction Models Panel

| Statistic | What it compares | Better |
|---|---|---|
| Pseudo R-squared | The log-likelihood of the model with that of a constant alone | Higher |
| Adjusted pseudo R-squared | The same, less one for each parameter | Higher |
| AIC | Minus twice the log-likelihood, plus twice the number of parameters | Lower |
| SRMSE | The root mean square error of the flows, over their mean | Lower, 0 a perfect fit |
| Sørensen similarity index | The share each observed and predicted flow have in common, averaged over the pairs | Higher, 1 a perfect fit |

Oshan (2016) reports these five statistics for the models of spint ([Oshan (2016)](#ref-Osh2016a)). Every tab prints them, and the Goodness of Fit step explains each.

## Comparing Models and Comparing Systems of Flows

Oshan (2016) notes that the pseudo R-squared and the AIC are designed for choosing between models of the same flows, and should not be used to compare different spatial systems; the SRMSE, standardised by the mean flow, and the Sørensen similarity index answer that need ([Oshan (2016)](#ref-Osh2016a)). The Four Constrained Models step and the Exponential Against Power Decay step compare models of the same flows, where all five statistics apply. A model of commuting in one region and a model of migration in another are compared by the SRMSE and the Sørensen similarity index alone.

## Counting the Parameters

The AIC and the adjusted pseudo R-squared depend on the number of parameters. The Spatial Interaction Models panel counts the slopes and the effects of the constraint: one shared effect, the intercept, for the Unconstrained tab; one per origin for Production; one per destination for Attraction; and one per origin and per destination, less the one level the two sets share, for the Doubly Constrained tab. The Negative Binomial tab counts the dispersion alpha as one more. The Replicate step sets the AIC and the adjusted pseudo R-squared so counted beside those of Oshan (2016) ([Oshan (2016)](#ref-Osh2016a)).

## Fit Statistics of the Negative Binomial Tab

The pseudo R-squared of the Negative Binomial tab compares its log-likelihood with that of a constant alone under the same negative binomial variance, as the documentation of `fit_gravity` states, so it is not on the same footing as the pseudo R-squared of the Poisson tabs ([Randsley (2026)](#ref-Ran2026a)). The SRMSE and the Sørensen similarity index compare the predicted flows with the observed ones whatever the model, and can be set beside those of the Poisson tabs. The Poisson Against Negative Binomial step compares the two models by their distance coefficients and standard errors.

## References

<a id="ref-Osh2016a"></a>Oshan, T. M. (2016). A primer for working with the Spatial Interaction modeling (SpInt) module in the Python Spatial Analysis Library (PySAL). *REGION*, 3(2), R11–R23. [doi:10.18335/region.v3i2.175](https://doi.org/10.18335/region.v3i2.175)

<a id="ref-Ran2026a"></a>Randsley, N. (2026). SpatialEconometrics.jl: spatial econometrics in Julia. [github.com/randsley/SpatialEconometrics.jl](https://github.com/randsley/SpatialEconometrics.jl)

## See Also
- [Distance Decay](distance-decay.md) · [Decision Guide](decision-guide.md) · [Negative Binomial](negbin.md)
