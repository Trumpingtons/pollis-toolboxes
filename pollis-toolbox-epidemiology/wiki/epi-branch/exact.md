# Superspreading

## The Offspring Distribution

Each case has an individual reproduction number nu drawn from Gamma(k, R / k), and offspring drawn from Poisson(nu), which together give a negative binomial with mean R and dispersion k. Its probability generating function is g(s) = (1 + R (1 - s) / k)^(-k). The share of cases that infect nobody is (1 + R / k)^(-k), which grows quickly as k falls. Next Steps > Offspring Distribution shows this next to a Poisson distribution of the same mean.

## The Chance That an Introduction Dies Out

The extinction probability q is the smallest solution of q = g(q). For R at or below 1, q = 1, and every chain ends. For R above 1, q is below 1 and depends strongly on k: with small k most introductions die out even at a high R. The chance of an epidemic from n independent introductions is 1 - q^n, which Next Steps > Several Introductions shows.

## The Share of Transmission from the Top Cases

The most infectious share of cases is found by ranking individual reproduction numbers, and `proportion_transmission` gives the part of all transmission they cause. Small k gives a large share, and the idea is known as the 80/20 rule. The result follows only from k when ranked this way, and not from R. Next Steps > Share of Transmission shows how it varies with k.

## The Distribution of Chain Sizes

For R below 1, the probability that a chain ends with y cases in all has the closed form of [Blumberg and Lloyd-Smith (2013)](#ref-BL2013a): Gamma(k y + y - 1) / (Gamma(k y) Gamma(y + 1)) x (R / k)^(y - 1) / (1 + R / k)^(k y + y - 1). The mean size is 1 / (1 - R). Small k makes chains of one case far more common and yet leaves the mean unchanged, with a long tail of large chains.

## The Chance That an Outbreak Is Over

Each case's offspring are infected some time after that case, a time drawn from the generation time distribution F. The chance that a case d days past its infection has no offspring still to come is g(F(d)). Multiplying over all recent cases gives `end_of_outbreak_probability`. Small k makes this reassurance arrive sooner, since most cases have no offspring to wait for.

## References

<a id="ref-BL2013a"></a>Blumberg, S. and Lloyd-Smith, J. O. (2013). Inference of R0 and Transmission Heterogeneity from the Size Distribution of Stuttering Chains. *PLoS Computational Biology* 9(5), e1002993. [doi:10.1371/journal.pcbi.1002993](https://doi.org/10.1371/journal.pcbi.1002993)

## See Also
- [Containment](contain.md) · [Estimating R and k](fit.md) · [Interpretation](interpretation.md) · [Overview](overview.md)
