# Production

## What the Production Tab Fits

The Production tab fits the production-constrained model of Wilson (1971): the total outflow of each origin is known, and the model spreads it over the destinations by their attraction and the distance ([Wilson (1971)](#ref-Wil1971a)). It is a Poisson regression of the flows on the logarithms of the Destination Variables, the Pair Variables and the distance, with one effect per origin. Those effects make the predicted flows leaving each origin add up to the observed ones, the part that Wilson's balancing factors play. The tab calls `nlreg` of GLFixedEffectModels.jl with `fe(:origin)` ([Boehm (2020)](#ref-Boe2020a)).

## Reading the Output of the Production Tab

The Production tab prints the coefficients of the Destination Variables, elasticities, of the Pair Variables and of the distance, with their standard errors, then the fit statistics ([Oshan (2016)](#ref-Osh2016a)). The Origin Variables are not used: whatever is true of an origin is taken in by its effect. The Map of the Origin and Destination Effects step maps the origin effects, each measured from their average, since only differences between places are identified.

## When to Use the Production Tab

The Production tab suits flows whose totals at the origins are known and whose destinations are to be predicted, as in where the people who leave each place go, or where the goods each producer ships end up. Oshan (2016) fits the production-constrained model in spint with an effect for each origin and the totals of the destinations, as the tab does with the default Destination Variables ([Oshan (2016)](#ref-Osh2016a)). With the inflows known as well, the Doubly Constrained tab holds both.

## References

<a id="ref-Boe2020a"></a>Boehm, J. (2020). GLFixedEffectModels.jl: fast estimation of generalized linear models with high-dimensional fixed effects in Julia. [github.com/jmboehm/GLFixedEffectModels.jl](https://github.com/jmboehm/GLFixedEffectModels.jl)

<a id="ref-Osh2016a"></a>Oshan, T. M. (2016). A primer for working with the Spatial Interaction modeling (SpInt) module in the Python Spatial Analysis Library (PySAL). *REGION*, 3(2), R11–R23. [doi:10.18335/region.v3i2.175](https://doi.org/10.18335/region.v3i2.175)

<a id="ref-Wil1971a"></a>Wilson, A. G. (1971). A family of spatial interaction models, and associated developments. *Environment and Planning A*, 3(1), 1–32. [doi:10.1068/a030001](https://doi.org/10.1068/a030001)

## See Also
- [Attraction](attraction.md) · [Doubly Constrained](doubly.md) · [Decision Guide](decision-guide.md)
