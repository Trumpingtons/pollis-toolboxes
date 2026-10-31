# Assumptions

## What the Renewal Equation Assumes About Case Counts

The renewal equation of Rt Estimation assumes that the daily counts are the infections of interest, shifted by a fixed delay at most. Reported counts in practice come late, by a spread of days, and with a share that changes over time. A delay left in the data moves the estimate later in time, and a change in testing looks like a change in transmission, a warning made at length by [Gostic, McGough, Baskerville, Abbott, Joshi, Tedijanto, Kahn, Niehus, Hay, De Salazar, Hellewell, Meakin, Munday, Bosse, Sherrat, Thompson, White, Huisman, Scire, Bonhoeffer, Stadler, Wallinga, Funk, Lipsitch and Cobey (2020)](#ref-GMBAJ...2020a).

## Why the Serial Interval Must Be Right

The reproduction number is read through the serial interval, so that a wrong mean rescales every estimate of Rt away from 1 without changing the fit to the cases. Growth rate fixes only a combination of Rt and the interval ([Wallinga and Lipsitch (2007)](#ref-WL2007a)). The serial interval also stands in for the generation interval, the time between infections, which is the quantity the renewal equation needs. The two have the same mean under common conditions but different spreads, and only the serial interval can be negative. Next Steps > Sensitivity shows what a different mean changes.

## How Smooth a Random Walk Makes Rt

A random walk on log Rt assumes that transmission changes gradually from day to day, with a step size that is itself estimated. A sudden drop after a measure is therefore smeared over several days. The prior on the step size decides how smooth the curve is when the data are few, for instance in the tails of a wave with few cases.

## What the Individual-Level Models Assume About People

Individual-level models assume that everyone in the population is known and that infection depends only on the listed risk functions ([Warriyar K. V., Almutiry and Deardon (2020)](#ref-WAD2020a)). The models in this panel have no covariates of susceptibility or transmissibility: everyone differs only by location. Infection from outside the population enters through the constant sparks term, and a person removed is removed for good.

## Which Distributions the Waiting Times Follow

Removal and latency in Pathogen.jl are exponential, with a constant rate. The exponential distribution makes very short periods the most likely, unlike most diseases, whose latent and infectious periods are more peaked. Observation delays are assumed to lie inside limits set by `EventExtents`, and an outbreak whose true delays exceed those limits cannot be fitted honestly.

## What Identifiability Limits in Small Outbreaks

An outbreak of few cases informs few parameters. Sparks and the distance kernel can trade off when cases are sparse in space, and in a nearly finished outbreak the removal rate is well informed while early transmission is not. Priors then carry much of the weight, which Next Steps > Sensitivity makes visible.

## References

<a id="ref-GMBAJ...2020a"></a>Gostic, K. M., McGough, L., Baskerville, E. B., Abbott, S., Joshi, K., Tedijanto, C., Kahn, R., Niehus, R., Hay, J. A., De Salazar, P. M., Hellewell, J., Meakin, S., Munday, J. D., Bosse, N. I., Sherrat, K., Thompson, R. N., White, L. F., Huisman, J. S., Scire, J., Bonhoeffer, S., Stadler, T., Wallinga, J., Funk, S., Lipsitch, M. and Cobey, S. (2020). Practical Considerations for Measuring the Effective Reproductive Number, Rt. *PLOS Computational Biology* 16(12), e1008409. [doi:10.1371/journal.pcbi.1008409](https://doi.org/10.1371/journal.pcbi.1008409)

<a id="ref-WL2007a"></a>Wallinga, J. and Lipsitch, M. (2007). How Generation Intervals Shape the Relationship between Growth Rates and Reproductive Numbers. *Proceedings of the Royal Society B* 274(1609), 599–604. [doi:10.1098/rspb.2006.3754](https://doi.org/10.1098/rspb.2006.3754)

<a id="ref-WAD2020a"></a>Warriyar K. V., V., Almutiry, W. and Deardon, R. (2020). Individual-Level Modelling of Infectious Disease Data: EpiILM. *The R Journal* 12(1), 87. [doi:10.32614/RJ-2020-020](https://doi.org/10.32614/RJ-2020-020)

## See Also
- [Diagnostics](diagnostics.md) · [Interpretation](interpretation.md) · [Decision Guide](decision-guide.md)
