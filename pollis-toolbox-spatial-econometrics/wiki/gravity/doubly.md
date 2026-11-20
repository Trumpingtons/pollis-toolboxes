# Doubly Constrained

## What the Doubly Constrained Tab Fits

The Doubly Constrained tab fits the doubly constrained model of Wilson (1971): the total outflow of each origin and the total inflow of each destination are both known, and the model distributes them across the pairs by distance ([Wilson (1971)](#ref-Wil1971a)). It is a Poisson regression of the flows on the Pair Variables and the distance, with one effect per origin and one per destination. The tab calls `nlreg` of GLFixedEffectModels.jl with `fe(:origin)` and `fe(:destination)` ([Boehm (2020)](#ref-Boe2020a)), and is the default tab of the panel.

## The Origin and Destination Effects

The origin and destination effects make the predicted flows add up to the observed totals at both ends, the part Wilson's balancing factors play ([Wilson (1971)](#ref-Wil1971a)). Anderson and van Wincoop (2003) derive the gravity equation of trade with multilateral resistance terms, which measure how hard it is for each exporter to reach all its markets and for each importer to be reached, and note that fixed effects of the regions can stand for them in estimation ([Anderson and van Wincoop (2003)](#ref-AW2003a)). Only the differences between places are identified, so the Map of the Origin and Destination Effects step measures each effect from the average of its side.

## Reading the Output of the Doubly Constrained Tab

The Doubly Constrained tab prints the coefficients of the Pair Variables and the distance coefficient, with their standard errors, then the fit statistics ([Oshan (2016)](#ref-Osh2016a)). The Origin and Destination Variables are not used, since the effects take in everything about each place that affects all its flows alike. The Flows After Distances Shrink step restores both totals after the change in distance, as Wilson's balancing factors do, and shows which pairs gain and which lose.

## References

<a id="ref-AW2003a"></a>Anderson, J. E. and van Wincoop, E. (2003). Gravity with gravitas: a solution to the border puzzle. *American Economic Review*, 93(1), 170–192. [doi:10.1257/000282803321455214](https://doi.org/10.1257/000282803321455214)

<a id="ref-Boe2020a"></a>Boehm, J. (2020). GLFixedEffectModels.jl: fast estimation of generalized linear models with high-dimensional fixed effects in Julia. [github.com/jmboehm/GLFixedEffectModels.jl](https://github.com/jmboehm/GLFixedEffectModels.jl)

<a id="ref-Osh2016a"></a>Oshan, T. M. (2016). A primer for working with the Spatial Interaction modeling (SpInt) module in the Python Spatial Analysis Library (PySAL). *REGION*, 3(2), R11–R23. [doi:10.18335/region.v3i2.175](https://doi.org/10.18335/region.v3i2.175)

<a id="ref-Wil1971a"></a>Wilson, A. G. (1971). A family of spatial interaction models, and associated developments. *Environment and Planning A*, 3(1), 1–32. [doi:10.1068/a030001](https://doi.org/10.1068/a030001)

## See Also
- [Production](production.md) · [Negative Binomial](negbin.md) · [Decision Guide](decision-guide.md)
