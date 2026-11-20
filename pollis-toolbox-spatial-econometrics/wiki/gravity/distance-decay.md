# Distance Decay

## Exponential and Power Distance Decay

The Distance Decay input sets how the flows fall with distance. Exponential enters the distance as it is, so that the flows fall by the same proportion for each further unit of distance; Power enters its logarithm, so that they fall by the same proportion for each further proportion of distance. Wilson (1971) writes his models with a function of the cost of travel, among them the negative exponential function of the cost ([Wilson (1971)](#ref-Wil1971a)). Oshan (2016) describes both forms as the cost functions spint offers ([Oshan (2016)](#ref-Osh2016a)). Power decay takes the logarithm of the distance, so a distance of zero, as between a place and itself, has to be left out with Flows Within a Place set to Drop.

## Reading the Distance Coefficient

With Exponential decay, the distance coefficient is the change in the logarithm of the flow for one more unit of distance, in the units of the Distance Column or in kilometres between centroids: a coefficient of -0.01 is about one per cent fewer flows for each further kilometre. With Power decay, the coefficient is an elasticity: a coefficient of -1 is about one per cent fewer flows for each one per cent more distance. The Distance Decay in Plain Numbers step prints the change for one and for a hundred more units of distance, or for ten per cent more, and the distance over which the flows halve, or the factor by which the distance has to grow for them to halve.

## The Distance Coefficient Under Each Constraint

The distance coefficient is estimated net of whatever the regression holds about the places. In the Unconstrained tab it sits beside the Origin and Destination Variables; in the Doubly Constrained tab beside one effect per origin and per destination, which take in everything about each place that affects all its flows alike. The Four Constrained Models step fits the four models on the same flows and prints their distance coefficients side by side. Anderson and van Wincoop (2003) show in trade that leaving out the multilateral resistance terms, which the origin and destination effects stand for, biases the estimated effect of trade costs ([Anderson and van Wincoop (2003)](#ref-AW2003a)).

## Choosing Between Exponential and Power Decay

The Exponential Against Power Decay step fits the tab's model with each form on the same flows and prints the distance coefficient, the AIC, the SRMSE and the Sørensen similarity index of each. The two models have the same number of parameters, so the lower AIC points to the form that fits the flows better. Oshan (2016) reports these statistics for comparing spatial interaction models ([Oshan (2016)](#ref-Osh2016a)). The Flows After Distances Shrink step shows what each form implies: with Power decay, ten per cent off every distance multiplies every flow by the same factor, which the constraints of the Production, Attraction and Doubly Constrained tabs take back.

## References

<a id="ref-AW2003a"></a>Anderson, J. E. and van Wincoop, E. (2003). Gravity with gravitas: a solution to the border puzzle. *American Economic Review*, 93(1), 170–192. [doi:10.1257/000282803321455214](https://doi.org/10.1257/000282803321455214)

<a id="ref-Osh2016a"></a>Oshan, T. M. (2016). A primer for working with the Spatial Interaction modeling (SpInt) module in the Python Spatial Analysis Library (PySAL). *REGION*, 3(2), R11–R23. [doi:10.18335/region.v3i2.175](https://doi.org/10.18335/region.v3i2.175)

<a id="ref-Wil1971a"></a>Wilson, A. G. (1971). A family of spatial interaction models, and associated developments. *Environment and Planning A*, 3(1), 1–32. [doi:10.1068/a030001](https://doi.org/10.1068/a030001)

## See Also
- [Goodness of Fit](goodness-of-fit.md) · [Decision Guide](decision-guide.md) · [Overview](overview.md)
