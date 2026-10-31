# Assumptions

## What Homogeneous Mixing Assumes

Every susceptible person is taken to be equally likely to meet every infectious person, which is the source of the term beta S I / N. Real contacts are clustered by household, age, place and behaviour. Heterogeneous mixing usually lowers the final size and the herd immunity threshold, because the most connected people are infected first, as the review of [Fine (1993)](#ref-Fin1993a) discusses.

## Why Large Numbers Are Needed for Differential Equations

Treating people as a continuous quantity makes sense only when the compartments are large. At the start and end of an epidemic, when there are few infected people, chance dominates. An ordinary differential equation gives a smooth rise from any seed, however small, while in reality a new introduction often dies out. Fractions of a person are possible in the solution, and should warn against reading its tail as real.

## Why Exponential Waiting Times Distort Timing

Constant rates between compartments imply exponentially distributed waiting times, with most people leaving early and a few staying very long. Real infectious and latent periods are more concentrated. The choice has a price: for a given growth rate, the exponential assumption understates R0, and control can seem easier than it is ([Wearing, Rohani and Keeling (2005)](#ref-WRK2005a)). Splitting a compartment into stages in series gives a more peaked distribution.

## Why Rates Are Taken as Constant

Beta and gamma are fixed through the run. In reality transmission changes with seasons, behaviour and measures, and fitting a constant beta to an epidemic that people have reacted to overstates its size. Next Steps > Intervention Timing shows the effect of one such change.

## Which Populations Are Left Out

The models here have no births, no deaths from other causes and no migration, which is reasonable for a single wave but not across decades. Long-term endemic behaviour depends on replenishing susceptible people, either by waning immunity or by births, as [Hethcote (2000)](#ref-Het2000a) sets out.

## Whether Rates Can Be Recovered from a Curve

An epidemic's early growth fixes only a combination of the rates, and different pairs give nearly the same curve. Models with more states can fit well without saying more, a problem of identifiability ([Raue, Kreutz, Maiwald, Bachmann, Schilling, Klingmüller and Timmer (2009)](#ref-RKMBS...2009a)). [Roda, Varughese, Han and Li (2020)](#ref-RVHL2020a) show that SIR and SEIR fits to the same early COVID-19 data can give very different forecasts.

## References

<a id="ref-Fin1993a"></a>Fine, P. E. M. (1993). Herd Immunity: History, Theory, Practice. *Epidemiologic Reviews* 15(2), 265–302. [doi:10.1093/oxfordjournals.epirev.a036121](https://doi.org/10.1093/oxfordjournals.epirev.a036121)

<a id="ref-Het2000a"></a>Hethcote, H. W. (2000). The Mathematics of Infectious Diseases. *SIAM Review* 42(4), 599–653. [doi:10.1137/S0036144500371907](https://doi.org/10.1137/S0036144500371907)

<a id="ref-RKMBS...2009a"></a>Raue, A., Kreutz, C., Maiwald, T., Bachmann, J., Schilling, M., Klingmüller, U. and Timmer, J. (2009). Structural and practical identifiability analysis of partially observed dynamical models by exploiting the profile likelihood. *Bioinformatics* 25(15), 1923–1929. [doi:10.1093/bioinformatics/btp358](https://doi.org/10.1093/bioinformatics/btp358)

<a id="ref-RVHL2020a"></a>Roda, W. C., Varughese, M. B., Han, D. and Li, M. Y. (2020). Why is it difficult to accurately predict the COVID-19 epidemic?. *Infectious Disease Modelling* 5, 271–281. [doi:10.1016/j.idm.2020.03.001](https://doi.org/10.1016/j.idm.2020.03.001)

<a id="ref-WRK2005a"></a>Wearing, H. J., Rohani, P. and Keeling, M. J. (2005). Appropriate Models for the Management of Infectious Diseases. *PLoS Medicine* 2(7), e174. [doi:10.1371/journal.pmed.0020174](https://doi.org/10.1371/journal.pmed.0020174)

## See Also
- [Diagnostics](diagnostics.md) · [Interpretation](interpretation.md) · [Decision Guide](decision-guide.md)
