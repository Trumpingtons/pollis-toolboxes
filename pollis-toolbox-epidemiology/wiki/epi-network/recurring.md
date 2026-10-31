# SIS and SIRS

## SIS and SIRS on a Network

Under SIS a person who recovers is at once susceptible again, while under SIRS the person first stays immune for a while, with the daily chance set by Loss of Immunity per Day. The infection can therefore persist on a network, and the question turns from size to whether it persists, and at which level.

## The Endemic Threshold on a Network

The mean-field theory of [Pastor-Satorras and Vespignani (2001)](#ref-PV2001a) sets the threshold for SIS at the ratio of mean contacts to mean squared contacts: the infection persists if transmission per recovery exceeds mean(k) / mean(k^2). Heterogeneous contacts therefore lower the threshold. Next Steps > Threshold by Network shows the endemic level as Basic R rises, on a random and a scale-free network, against the level with no network. Close to the threshold, chance makes the level of each run differ, which limits the comparison.

## Reading the Endemic Level on a Network

The simulated level, read over the last third of a run, should be compared with the level for a well-mixed population. Next Steps > The Endemic Level does this. On a network the level is usually lower at the same Basic R, because infections are repeated within neighbourhoods, whereas a hub keeps being reinfected. On a heterogeneous network, the same level can hide very different risks for people with few and with many contacts.

## Why Every Finite Network Eventually Loses an Infection

In a finite network, all infectious people can recover at once by chance, after which the infection cannot return. Strictly, the only permanent state is its loss. In practice, above the threshold that takes an extremely long time, and the level the run shows until then is quasi-stationary. Close to the threshold, or on a small network, extinction comes soon, and is measured by Next Steps > Chance of Dying Out.

## How Waning Immunity Changes Persistence

Under SIRS, each recovered person is out of circulation for a while, so that the endemic level is lower than under SIS, and depends on the length of immunity. Waves may also appear, since immune people return together after a large outbreak. Next Steps > SIS or SIRS sets the endemic level with no immunity against immunity lasting about 100, 30 and 10 days. Short immunity brings SIRS close to SIS.

## References

<a id="ref-PV2001a"></a>Pastor-Satorras, R. and Vespignani, A. (2001). Epidemic Spreading in Scale-Free Networks. *Physical Review Letters* 86(14), 3200–3203. [doi:10.1103/PhysRevLett.86.3200](https://doi.org/10.1103/PhysRevLett.86.3200)

## See Also
- [SIR](sir.md) · [Continuous Time](continuous.md) · [Interpretation](interpretation.md) · [Decision Guide](decision-guide.md)
