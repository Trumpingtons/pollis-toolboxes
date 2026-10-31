# Assumptions

## What Is Assumed When the Network Is Fixed

Each edge stays in place through the whole run. Partnerships and households change slowly and may fit this well, while brief daily contacts do not. If contacts change quickly, the network effects become weaker and the epidemic behaves more like one in a well-mixed population. Removing a person's edges during illness, an obvious change in behaviour, is also not in these models.

## Why the Stylised Network Types Are Limited

Erdős–Rényi, scale-free, small-world and regular graphs each have one striking feature, and are simpler than real contact patterns. Few real contact networks are strictly scale-free. They also lack age and household structure. A result that holds across all four types is more likely to carry over than one that holds on only one, and a real network, when available, can replace them.

## What the Discrete Daily Steps Assume

In the daily steps of the SIR, SEIR and SIS and SIRS tabs, each infectious person infects each susceptible contact with a fixed daily probability, and everyone updates at the same time. Long days and large probabilities make the difference from continuous time larger, while the Continuous Time tab has no such step. Next Steps > Daily Steps Against Events shows the difference on the same rates.

## What Equal Edges Assume

Every edge carries the same chance of infection per day. Real contacts differ widely in length and closeness: the household and the bus are not alike. Weak contacts between groups matter for spread out of proportion to their numbers, while strong ones repeat within groups and reach people already infected. Reading a share of transmission as coming from people with many edges needs this caveat.

## What Is Assumed About Infectiousness

Infectiousness is the same for all in most tabs, and drawn from a Gamma distribution in the Unequal option of SEIR. In the Unequal option, this is a property of each person and not of each contact, the same form as in [Lloyd-Smith, Schreiber, Kopp and Getz (2005)](#ref-LSKG2005a). Contacts and infectiousness are drawn independently of one another, although in reality the two may be linked.

## References

<a id="ref-LSKG2005a"></a>Lloyd-Smith, J. O., Schreiber, S. J., Kopp, P. E. and Getz, W. M. (2005). Superspreading and the effect of individual variation on disease emergence. *Nature* 438(7066), 355–359. [doi:10.1038/nature04153](https://doi.org/10.1038/nature04153)

## See Also
- [Diagnostics](diagnostics.md) · [Interpretation](interpretation.md) · [Decision Guide](decision-guide.md)
