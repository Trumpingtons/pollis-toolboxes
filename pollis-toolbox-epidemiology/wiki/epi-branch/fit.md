# Estimating R and k

## Estimating from Offspring Counts

Offspring counts are the number of secondary cases of each case, and their likelihood is the negative binomial, evaluated directly. [Lloyd-Smith, Schreiber, Kopp and Getz (2005)](#ref-LSKG2005a) fitted these to case studies of several infections, and [Althaus (2015)](#ref-Alt2015a) to Ebola. Zero counts need care: cases that infected nobody are easy to miss, and reporting only people known to have transmitted biases both R and k upwards. The count of cases that infected nobody says the most about k.

## Estimating from Chain Sizes

Chain sizes need only the final number of cases in each cluster. The likelihood is the exact chain size distribution of [Blumberg and Lloyd-Smith (2013)](#ref-BL2013a), which assumes that R is below 1 and that every chain is complete. For an infection able to grow, the same likelihood conditioned on extinction is the approach of [Nishiura, Yan, Sleeman and Mode (2012)](#ref-NYSM2012a), and [Endo, CMMID COVID-19 Working Group, Abbott, Kucharski and Funk (2020)](#ref-ECAKF2020a) estimated k for COVID-19 from the sizes of outbreaks in a similar way. Missing small clusters, or truncating them at reporting, biases R up and needs its own correction.

## Maximum Likelihood and NUTS on the Same Likelihood

`maximum_likelihood` returns the estimates quickly, and NUTS ([Hoffman and Gelman (2014)](#ref-HG2014a)) run through Turing.jl ([Ge, Xu and Ghahramani (2018)](#ref-GXG2018a)) adds full uncertainty. On plenty of data the two agree. Differences are visible for k with few observations, where the likelihood is flat toward large k, and the prior begins to matter. The priors in the Example Code are stated there, and should be changed according to what is known about the infection.

## Testing Whether Overdispersion Is Needed

Poisson offspring are the limit of the negative binomial as k grows. Next Steps > Poisson or Negative Binomial gives the AIC of each. Note that the Poisson fit has one fewer parameter, and on small datasets it may be preferred by that criterion even if the truth is overdispersed: a preference for Poisson is thus not strong evidence of equal cases.

## Turning Estimates into Risks

Sampling R and k from the posterior carries their uncertainty into any derived figure. Next Steps > Chance of an Epidemic takes each draw of R and k, computes the extinction probability, and gives the posterior for the chance that one new introduction takes off. Reading R and k also gives the chance that R is above 1, which is often the question that matters.

## References

<a id="ref-Alt2015a"></a>Althaus, C. L. (2015). Ebola superspreading. *The Lancet Infectious Diseases* 15(5), 507–508. [doi:10.1016/S1473-3099(15)70135-0](https://doi.org/10.1016/S1473-3099(15)70135-0)

<a id="ref-BL2013a"></a>Blumberg, S. and Lloyd-Smith, J. O. (2013). Inference of R0 and Transmission Heterogeneity from the Size Distribution of Stuttering Chains. *PLoS Computational Biology* 9(5), e1002993. [doi:10.1371/journal.pcbi.1002993](https://doi.org/10.1371/journal.pcbi.1002993)

<a id="ref-ECAKF2020a"></a>Endo, A., CMMID COVID-19 Working Group, Abbott, S., Kucharski, A. J. and Funk, S. (2020). Estimating the overdispersion in COVID-19 transmission using outbreak sizes outside China. *Wellcome Open Research* 5, 67. [doi:10.12688/wellcomeopenres.15842.3](https://doi.org/10.12688/wellcomeopenres.15842.3)

<a id="ref-GXG2018a"></a>Ge, H., Xu, K. and Ghahramani, Z. (2018). Turing: A Language for Flexible Probabilistic Inference. *Proceedings of Machine Learning Research* 84, 1682–1690. [proceedings.mlr.press/v84/ge18b.html](https://proceedings.mlr.press/v84/ge18b.html)

<a id="ref-HG2014a"></a>Hoffman, M. D. and Gelman, A. (2014). The No-U-Turn Sampler: Adaptively Setting Path Lengths in Hamiltonian Monte Carlo. *Journal of Machine Learning Research* 15(47), 1593–1623. [jmlr.org/papers/v15/hoffman14a.html](https://jmlr.org/papers/v15/hoffman14a.html)

<a id="ref-LSKG2005a"></a>Lloyd-Smith, J. O., Schreiber, S. J., Kopp, P. E. and Getz, W. M. (2005). Superspreading and the effect of individual variation on disease emergence. *Nature* 438(7066), 355–359. [doi:10.1038/nature04153](https://doi.org/10.1038/nature04153)

<a id="ref-NYSM2012a"></a>Nishiura, H., Yan, P., Sleeman, C. K. and Mode, C. J. (2012). Estimating the transmission potential of supercritical processes based on the final size distribution of minor outbreaks. *Journal of Theoretical Biology* 294, 48–55. [doi:10.1016/j.jtbi.2011.10.039](https://doi.org/10.1016/j.jtbi.2011.10.039)

## See Also
- [Superspreading](exact.md) · [Interpretation](interpretation.md) · [Diagnostics](diagnostics.md) · [Overview](overview.md)
