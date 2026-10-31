# Strain Community

## How the Strain Community Matrix Is Drawn

The matrix is drawn by `create_interaction_matrix` for the number of Strains. Interaction Strength sets the range, with entries between 1 - strength and 1 + strength. Share Facilitative sets the share of entries above 1. When Priority Effects are on, the entries for a pair differ by direction; when off, they are the same. A strength of 0 removes all interactions.

## What Many Strains Add to Pairs

A strain's fate depends on all the others, in ways no pair shows alone. A strain may gain from a helper, while being held back by a competitor of that helper. Theoretical work on strain structure shows that strains interacting through shared immunity can give complex dynamics, including persistent cycles and chaos ([Gupta, Ferguson and Anderson (1998)](#ref-GFA1998a)). Many-strain systems are hard to handle by the number of states alone, and approximations are usually needed ([Gog and Grenfell (2002)](#ref-GG2002a)).

## How Strength and Sign Change Persistence

Mostly competitive matrices tend to lower the number of strains co-circulating, as well as the number of coinfected hosts. Mostly facilitative ones raise coinfection and let weak strains spread on the back of others. Next Steps > Compare Communities uses no interaction, mostly competitive and mostly facilitative matrices, with several draws of each. Comparing only one draw of each risks showing the matrix rather than the setting.

## What Priority Effects Mean in a Community

Priority Effects describe asymmetric entries: the first strain to arrive can then change which others can establish. They show up mainly with staggered arrivals, so that Next Steps > With and Without Priority Effects uses them. If all strains arrive together at the first step, the order is less a matter of arrival than of chance in the first few steps. Results that depend on order mean that no single final community can be predicted from the matrix alone.

## Why Strains Helped Most Do Not Always Win

Next Steps > Which Strains Gain checks whether the strains helped most by the others reached the highest peaks. Help does not always translate into a peak: a strain's helpers must be present at the right time, and a strain's peak is also limited by the hosts its rivals have used up. Next Steps > Strains per Host gives the share of hosts with none, one, two or more strains when coinfection peaks.

## References

<a id="ref-GG2002a"></a>Gog, J. R. and Grenfell, B. T. (2002). Dynamics and selection of many-strain pathogens. *Proceedings of the National Academy of Sciences* 99(26), 17209–17214. [doi:10.1073/pnas.252512799](https://doi.org/10.1073/pnas.252512799)

<a id="ref-GFA1998a"></a>Gupta, S., Ferguson, N. and Anderson, R. (1998). Chaos, Persistence, and Evolution of Strain Structure in Antigenically Diverse Infectious Agents. *Science* 280(5365), 912–915. [doi:10.1126/science.280.5365.912](https://doi.org/10.1126/science.280.5365.912)

## See Also
- [Two Strains](two.md) · [Detection](detection.md) · [Interpretation](interpretation.md) · [Overview](overview.md)
