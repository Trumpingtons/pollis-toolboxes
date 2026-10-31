# First Cases

## What First Cases Infers

First Cases gives the probability that each person was infected on the first day, given tests at the end of an outbreak. The result is a list of candidates in order. The number of first cases is known to the inference, and not who they are. This tab uses the SI disease model, in which infection lasts, so that final tests still show who has been reached.

## Earlier Methods of Finding the Origin of an Epidemic

Rumor centrality takes the person from whom the infected group could have spread in the most orders ([Shah and Zaman (2011)](#ref-SZ2011a)), using only the network and who is infected. Dynamic message passing sums over times of infection ([Lokhov, Mézard, Ohta and Zdeborová (2014)](#ref-LMOZ2014a)). These methods take in the final state at once, and they differ in how much they need to know about the rates and how much they cost.

## Why Waiting Makes the Origin Harder to Find

With time, the outbreak grows over the network, and many different starting points become consistent with the same final state. Beyond some point, no method can recover the origin. [Antulov-Fantulin, Lančić, Šmuc, Štefančić and Šikić (2015)](#ref-ALSSS2015a) examine this limit directly, in static and temporal networks. Next Steps > Compare Waiting Times shows how the place of the true first case in the list worsens with a longer wait.

## Why Testing a Share of People Can Be Enough

The inference does not need every person's final state. Tests of a share of people narrow down the candidates, and more tests help less and less. Next Steps > Compare Shares Tested shows the gain from each added share. Tests near the edge of the infected group also tend to say the most about how far infection has spread, and hence about the centre it spread from.

## Reading a Candidate List

Next Steps > Candidates for First Case shows the list, and Place of the First Case the rank of the true one in a simulation. Next Steps > Length of the Candidate List gives how long a list must be to contain the true case with a chosen probability. A simple rule ranks people by their mean distance to those who tested positive, which Compare With a Simple Rule sets beside the method. A list is worth reporting along with its probabilities, as an honest result can be flat.

## References

<a id="ref-ALSSS2015a"></a>Antulov-Fantulin, N., Lančić, A., Šmuc, T., Štefančić, H. and Šikić, M. (2015). Identification of Patient Zero in Static and Temporal Networks: Robustness and Limitations. *Physical Review Letters* 114(24), 248701. [doi:10.1103/PhysRevLett.114.248701](https://doi.org/10.1103/PhysRevLett.114.248701)

<a id="ref-LMOZ2014a"></a>Lokhov, A. Y., Mézard, M., Ohta, H. and Zdeborová, L. (2014). Inferring the origin of an epidemic with a dynamic message-passing algorithm. *Physical Review E* 90(1), 012801. [doi:10.1103/PhysRevE.90.012801](https://doi.org/10.1103/PhysRevE.90.012801)

<a id="ref-SZ2011a"></a>Shah, D. and Zaman, T. (2011). Rumors in a Network: Who's the Culprit?. *IEEE Transactions on Information Theory* 57(8), 5163–5181. [doi:10.1109/TIT.2011.2158885](https://doi.org/10.1109/TIT.2011.2158885)

## See Also
- [Individual Risk](risk.md) · [Changing Contacts](changing.md) · [Interpretation](interpretation.md) · [Assumptions](assumptions.md)
