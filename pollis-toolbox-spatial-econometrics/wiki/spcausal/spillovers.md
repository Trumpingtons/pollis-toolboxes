# Spillovers and Exposure

## What an Exposure Mapping Is

An exposure mapping names what an area's outcome may depend on besides its own policy status. The documentation of `ExposureMap` in SpatialEconometrics.jl describes it as a named, finite summary of the policy around each area, which replaces the assumption that an area responds only to its own status; the spillover is then defined relative to that summary ([Randsley (2026)](#ref-Ran2026a)). In the Spatial Causal Inference panel the summary is the share of an area's neighbours under the policy and, with Exposure Order 2, the share of the neighbours of its neighbours. Delgado and Florax (2015) write the potential outcome of an area as depending on its own policy status and on that of proximate neighbours ([Delgado and Florax (2015)](#ref-DF2015a)).

## The Share of Neighbours Under the Policy

`exposure(D, W; order, standardize)` builds the exposure columns from the 0 and 1 column of the policy and the neighbours. With the rows of the neighbours made to sum to one, the default, the first column is the share of an area's neighbours under the policy, between 0 and 1 and comparable between areas with different numbers of neighbours; without it, the column is a count, and an area with twenty neighbours is more exposed than one with two by construction ([Randsley (2026)](#ref-Ran2026a)). The second column, with Exposure Order 2, lets the second ring of neighbours have an effect of its own instead of one tied to the first.

## The Spillover Depends on the Neighbours Chosen

The documentation of `ExposureMap` states that the mapping is an assumption, not a measurement: a spillover estimated with five nearest neighbours answers a different question from one estimated with a band of 50 km, and neither is the spillover. It adds that reporting the mapping beside the estimate is required, which is why `fit_spatial_did` keeps it in its result ([Randsley (2026)](#ref-Ran2026a)). The Neighbours input of the panel sets the mapping, and the Interference Check step shows how the counts of exposed and unexposed comparison areas change from one definition to another.

## Spillovers in a Synthetic Control

A synthetic control has no exposure column. Its protection against a spillover is the pool of comparison areas: with Exclude Neighbours, `fit_synthetic_control` leaves out every area not under the policy that neighbours an area under it ([Randsley (2026)](#ref-Ran2026a)). `spillover_gaps` turns the areas left out into an estimate: each is given a synthetic control of its own from the same comparison areas, and its gap after the policy is read as the spillover it receives. Its documentation calls this the synthetic control counterpart of the spillover onto the comparison areas of `fit_spatial_did`, and asks for the same check of the fit before the policy. The Spillover Onto the Neighbours step runs it.

## Exposure in a Shift-Share Design

In a shift-share design, an area's exposure is its shares in the shocks, and the regressor is the shares times the shocks. The documentation of `ShiftShareDesign` notes that two areas with similar shares have correlated values of the regressor, and so correlated residuals, whether or not they are near each other ([Randsley (2026)](#ref-Ran2026a)). Adão, Kolesár and Morales (2019) find this correlation independent of geographic location ([Adão, Kolesár and Morales (2019)](#ref-AKM2019a)). The neighbours on the map matter less here than the similarity of the shares: the Moran's I of the Shares and Residuals step measures the first, and AKM Against HC1 the second.

## References

<a id="ref-AKM2019a"></a>Adão, R., Kolesár, M. and Morales, E. (2019). Shift-share designs: theory and inference. *Quarterly Journal of Economics*, 134(4), 1949–2010. [doi:10.1093/qje/qjz025](https://doi.org/10.1093/qje/qjz025)

<a id="ref-DF2015a"></a>Delgado, M. S. and Florax, R. J. G. M. (2015). Difference-in-differences techniques for spatial data: local autocorrelation and spatial interaction. *Economics Letters*, 137, 123–126. [doi:10.1016/j.econlet.2015.10.035](https://doi.org/10.1016/j.econlet.2015.10.035)

<a id="ref-Ran2026a"></a>Randsley, N. (2026). SpatialEconometrics.jl: spatial econometrics in Julia. [github.com/randsley/SpatialEconometrics.jl](https://github.com/randsley/SpatialEconometrics.jl)

## See Also
- [Spatial DiD](spdid.md) · [Synthetic Control](synth.md) · [Shift-Share](shiftshare.md)
