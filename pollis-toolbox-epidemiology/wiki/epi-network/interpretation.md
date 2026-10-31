# Interpretation

## Why Unequal Contacts Raise the Reproduction Number

A person reached by an edge is not a random person, since people with many contacts are reached more often and also pass infection on more widely. With transmissibility T on each edge, the network's reproduction number is T times the mean excess degree, written T (mean(k^2) - mean(k)) / mean(k). Greater variance of contacts raises the figure at the same mean. This is the basic insight of network epidemiology, and it is a case of the general definition of R0 by [Diekmann, Heesterbeek and Metz (1990)](#ref-DHM1990a).

## Why Hubs Change the Threshold

On a network with very unequal contacts, a low transmissibility can sustain an infection. For SIS on an infinite scale-free network with a heavy tail, the threshold vanishes altogether ([Pastor-Satorras and Vespignani (2001)](#ref-PV2001a)). Finite networks do retain a threshold, though it may be very low. The practical meaning is that an infection persisting at a low level may be carried mainly by the people with most contacts, in which case a low overall figure is not evidence of low risk among them.

## Who Is Infected, and When

People with many contacts are infected early and with high probability, so that the susceptible people left later have fewer contacts ([Volz (2008)](#ref-Vol2008a)). An epidemic on a heterogeneous network is therefore often earlier and faster at first, and then slows sooner than a well-mixed one. Next Steps > Who Gets Infected shows the share infected among people with few and with many contacts.

## Reading Shares of Secondary Cases

Next Steps > Secondary Cases reads how transmission was shared from who infected whom. Part of the unevenness comes from chance and from the time infection arrives, and some from contacts or infectiousness. Early cases infect more, because later cases meet people who are no longer susceptible. A share of transmission from a run is therefore not simply a property of those people.

## Why Vaccinating by Contacts Is Worth So Much

Removing the people with many contacts takes out many edges at once, and also lowers the variance of contacts that drives spread. [Pastor-Satorras and Vespignani (2002)](#ref-PV2002a) show that random vaccination works poorly on a scale-free network, in contrast with vaccination aimed at hubs. Knowledge of the network is what this requires, which may be missing: vaccinating a random contact of a random person reaches well-connected people without knowing the network ([Cohen, Havlin and ben-Avraham (2003)](#ref-CHB2003a)).

## References

<a id="ref-CHB2003a"></a>Cohen, R., Havlin, S. and ben-Avraham, D. (2003). Efficient Immunization Strategies for Computer Networks and Populations. *Physical Review Letters* 91(24), 247901. [doi:10.1103/PhysRevLett.91.247901](https://doi.org/10.1103/PhysRevLett.91.247901)

<a id="ref-DHM1990a"></a>Diekmann, O., Heesterbeek, J. A. P. and Metz, J. A. J. (1990). On the definition and the computation of the basic reproduction ratio R0 in models for infectious diseases in heterogeneous populations. *Journal of Mathematical Biology* 28(4), 365–382. [doi:10.1007/BF00178324](https://doi.org/10.1007/BF00178324)

<a id="ref-PV2001a"></a>Pastor-Satorras, R. and Vespignani, A. (2001). Epidemic Spreading in Scale-Free Networks. *Physical Review Letters* 86(14), 3200–3203. [doi:10.1103/PhysRevLett.86.3200](https://doi.org/10.1103/PhysRevLett.86.3200)

<a id="ref-PV2002a"></a>Pastor-Satorras, R. and Vespignani, A. (2002). Immunization of complex networks. *Physical Review E* 65(3), 036104. [doi:10.1103/PhysRevE.65.036104](https://doi.org/10.1103/PhysRevE.65.036104)

<a id="ref-Vol2008a"></a>Volz, E. (2008). SIR dynamics in random networks with heterogeneous connectivity. *Journal of Mathematical Biology* 56(3), 293–310. [doi:10.1007/s00285-007-0116-4](https://doi.org/10.1007/s00285-007-0116-4)

## See Also
- [Assumptions](assumptions.md) · [Diagnostics](diagnostics.md) · [Decision Guide](decision-guide.md)
