# Decision Guide

| Situation | Tab |
|---|---|
| One known interaction, in each direction | **Two Strains** |
| Many strains; the interactions unknown or only described in general | **Strain Community** |
| A planned or real survey, with false positives and false negatives | **Detection** |

## Choosing a Disease Model for Coinfection

| Disease Model | Host's course | Long-run result |
|---|---|---|
| SI | Infected for good | Strains accumulate in hosts until they die |
| SIR | Lasting immunity | One wave per strain, unless births supply new hosts |
| SEIR | Latent period and lasting immunity | Slower waves, with later coinfection |
| SEIRS | Latent period and waning immunity | Recurrent infections, and long-run persistence |

## When a Coinfection Simulation Is the Wrong Tool

Move to the Compartmental Models panel if one infection is at stake and an average is enough. Move to the Epidemics on Networks panel if who meets whom is at stake, as this panel has no contact structure. Strains with cross-immunity from shared antigens have their own literature, in which the state of each host is usually simplified ([Castillo-Chavez, Hethcote, Andreasen, Levin and Liu (1989)](#ref-CHALL1989a), [Gog and Swinton (2002)](#ref-GS2002a)).

## Rules of Thumb for Coinfection Runs

- **Baseline**: always include a run with no interaction.
- **Several draws**: a community result needs many matrices, and not only many runs.
- **Run length**: long enough for the strains to meet.
- **Host population**: check that it does not collapse.
- **Share Sampled**: raise it before improving the test, if strains are rare.

## References

<a id="ref-CHALL1989a"></a>Castillo-Chavez, C., Hethcote, H. W., Andreasen, V., Levin, S. A. and Liu, W. M. (1989). Epidemiological models with age structure, proportionate mixing, and cross-immunity. *Journal of Mathematical Biology* 27, 233–258. [doi:10.1007/bf00275810](https://doi.org/10.1007/bf00275810)

<a id="ref-GS2002a"></a>Gog, J. R. and Swinton, J. (2002). A status-based approach to multiple strain dynamics. *Journal of Mathematical Biology* 44(2), 169–184. [doi:10.1007/s002850100120](https://doi.org/10.1007/s002850100120)

## See Also
- [Factsheet](factsheet.md) · [Overview](overview.md) · [Assumptions](assumptions.md)
