# Attraction

## What the Attraction Tab Fits

The Attraction tab fits the attraction-constrained model of Wilson (1971): the total inflow of each destination is known, and the model draws it from the origins by their size and the distance ([Wilson (1971)](#ref-Wil1971a)). It is a Poisson regression of the flows on the logarithms of the Origin Variables, the Pair Variables and the distance, with one effect per destination, which makes the predicted flows into each destination add up to the observed ones. The tab calls `nlreg` of GLFixedEffectModels.jl with `fe(:destination)` ([Boehm (2020)](#ref-Boe2020a)).

## Reading the Output of the Attraction Tab

The Attraction tab prints the coefficients of the Origin Variables, elasticities, of the Pair Variables and of the distance, with their standard errors, then the fit statistics ([Oshan (2016)](#ref-Osh2016a)). The Destination Variables are not used: whatever is true of a destination is taken in by its effect. The Map of the Origin and Destination Effects step maps the destination effects, each measured from their average.

## When to Use the Attraction Tab

The Attraction tab suits flows whose totals at the destinations are known and whose origins are to be predicted, as in where the customers of a shopping centre or the workers of a business district come from. Oshan (2016) fits the attraction-constrained model in spint with an effect for each destination and the totals of the origins, as the tab does with the default Origin Variables ([Oshan (2016)](#ref-Osh2016a)). With the outflows known as well, the Doubly Constrained tab holds both ([Wilson (1971)](#ref-Wil1971a)).

## References

<a id="ref-Boe2020a"></a>Boehm, J. (2020). GLFixedEffectModels.jl: fast estimation of generalized linear models with high-dimensional fixed effects in Julia. [github.com/jmboehm/GLFixedEffectModels.jl](https://github.com/jmboehm/GLFixedEffectModels.jl)

<a id="ref-Osh2016a"></a>Oshan, T. M. (2016). A primer for working with the Spatial Interaction modeling (SpInt) module in the Python Spatial Analysis Library (PySAL). *REGION*, 3(2), R11–R23. [doi:10.18335/region.v3i2.175](https://doi.org/10.18335/region.v3i2.175)

<a id="ref-Wil1971a"></a>Wilson, A. G. (1971). A family of spatial interaction models, and associated developments. *Environment and Planning A*, 3(1), 1–32. [doi:10.1068/a030001](https://doi.org/10.1068/a030001)

## See Also
- [Production](production.md) · [Doubly Constrained](doubly.md) · [Decision Guide](decision-guide.md)
