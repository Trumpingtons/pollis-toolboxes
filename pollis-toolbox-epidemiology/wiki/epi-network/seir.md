# SEIR

## The SEIR Model on a Network

In SEIR on a network, an infected person first enters a latent state and then becomes infectious with a daily chance set by End of Latency per Day. Edges carry infection only during the infectious state. A latent period delays a person's contribution without changing how much it infects on each edge overall, so that the transmissibility T is the same as in SIR.

## How Latency Changes an Epidemic on a Network

A latent period delays each generation and reduces the peak, which spreads the epidemic over a longer time. The final size on a given network does not change with latency, since T is not altered. Next Steps > With and Without Latency shows the same epidemic both ways. Short-run measures depend on the delay, as do decisions about when to act, which is why latency matters for timing although not for final size.

## What Unequal Infectiousness Adds

Under the Unequal option, each person's infectiousness is drawn from a Gamma distribution with mean 1 and the chosen Gamma Shape, in the manner of [Lloyd-Smith, Schreiber, Kopp and Getz (2005)](#ref-LSKG2005a), where a small shape means that a few people do most of the infecting. In `SEIRHetModel`, superspreading therefore comes out of the model rather than being set by hand. On a network, infectiousness can be limited by the contacts available: a very infectious person with few contacts can only infect those contacts.

## How Unequal Infectiousness Changes an Outbreak

Unequal infectiousness at the same mean lowers the chance that an outbreak takes off, as an overdispersed branching process does, and often lowers the final size too. The effect comes from infectiousness that saturates on each person's edges: infecting everyone in reach many times over is wasted. Next Steps > Equal or Unequal Infectiousness gives both results for the same mean, and needs many runs since the outbreaks differ greatly.

## References

<a id="ref-LSKG2005a"></a>Lloyd-Smith, J. O., Schreiber, S. J., Kopp, P. E. and Getz, W. M. (2005). Superspreading and the effect of individual variation on disease emergence. *Nature* 438(7066), 355–359. [doi:10.1038/nature04153](https://doi.org/10.1038/nature04153)

## See Also
- [SIR](sir.md) · [SIS and SIRS](recurring.md) · [Interpretation](interpretation.md) · [Decision Guide](decision-guide.md)
