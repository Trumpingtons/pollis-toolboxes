# Unconstrained

## What the Unconstrained Tab Fits

The Unconstrained tab fits the gravity model: each flow as a Poisson count whose logarithm is an intercept, plus the logarithms of the Origin Variables and of the Destination Variables, the Pair Variables as they are, and the distance or its logarithm. Wilson (1971) places this model, with no totals known, at the start of his family of spatial interaction models ([Wilson (1971)](#ref-Wil1971a)), and Flowerdew and Aitkin (1982) fit it as a Poisson regression ([Flowerdew and Aitkin (1982)](#ref-FA1982a)). The tab calls `nlreg` of GLFixedEffectModels.jl with one effect shared by every flow, the intercept ([Boehm (2020)](#ref-Boe2020a)).

## Reading the Output of the Unconstrained Tab

The Unconstrained tab prints a coefficient for each Origin Variable and Destination Variable, an elasticity since the variables enter in logs, a coefficient for each Pair Variable, and the distance coefficient, each with its standard error, z and p-value, then the intercept. The fit statistics follow: the pseudo R-squared, the AIC, the SRMSE and the Sørensen similarity index ([Oshan (2016)](#ref-Osh2016a)). The predicted flows need not add up to the observed outflow of an origin or inflow of a destination, so the Flows After Distances Shrink step shows the total flow changing.

## When to Use the Unconstrained Tab

The Unconstrained tab suits flows whose totals are themselves to be explained or predicted: how much more trade, migration or commuting larger places send and attract, and how much distance takes away. The Four Constrained Models step sets its distance coefficient and fit beside those of the three constrained models on the same flows ([Oshan (2016)](#ref-Osh2016a)). When the totals of each origin or destination are known, the constrained tabs reproduce them and measure the distance coefficient net of the places.

## References

<a id="ref-Boe2020a"></a>Boehm, J. (2020). GLFixedEffectModels.jl: fast estimation of generalized linear models with high-dimensional fixed effects in Julia. [github.com/jmboehm/GLFixedEffectModels.jl](https://github.com/jmboehm/GLFixedEffectModels.jl)

<a id="ref-FA1982a"></a>Flowerdew, R. and Aitkin, M. (1982). A method of fitting the gravity model based on the Poisson distribution. *Journal of Regional Science*, 22(2), 191–202. [doi:10.1111/j.1467-9787.1982.tb00744.x](https://doi.org/10.1111/j.1467-9787.1982.tb00744.x)

<a id="ref-Osh2016a"></a>Oshan, T. M. (2016). A primer for working with the Spatial Interaction modeling (SpInt) module in the Python Spatial Analysis Library (PySAL). *REGION*, 3(2), R11–R23. [doi:10.18335/region.v3i2.175](https://doi.org/10.18335/region.v3i2.175)

<a id="ref-Wil1971a"></a>Wilson, A. G. (1971). A family of spatial interaction models, and associated developments. *Environment and Planning A*, 3(1), 1–32. [doi:10.1068/a030001](https://doi.org/10.1068/a030001)

## See Also
- [Production](production.md) · [Decision Guide](decision-guide.md) · [Overview](overview.md)
