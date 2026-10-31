# SIR Inference

## The Individual-Level SIR Model in Pathogen.jl

In an individual-level model, each person has a rate of infection given by who is infectious at that moment. For a susceptible person i, the rate is the sparks term plus the sum, over infectious k, of the transmissibility of k, the susceptibility of i and the infectivity kernel between them, as in [Angevaare, Feng and Deardon (2022)](#ref-AFD2022a). Here transmissibility and susceptibility are 1, and the kernel is d(k, i)^(-alpha) with distance d and power alpha. An infectious person is removed at a constant rate.

## How Event Times Are Inferred When Observations Are Late

True onset and removal times are not seen, only the observations made somewhat later. The sampler treats the true times as unknowns limited by `EventExtents`, which gives how long before each observation the event can lie. Each iteration then proposes new times for a batch of people, new parameters and new links in the transmission network. The joint update is what makes the method slow, and also what lets uncertainty about timing flow through to the parameters.

## How the Transmission Network Is Sampled

The transmission network assigns each infected person either a source or an external spark. Pathogen.jl samples it in a Gibbs step, with probabilities proportional to each candidate's contribution to the infection rate at the time of infection. Given a network and times, the likelihood factorises, which keeps each iteration feasible for up to a few hundred people. `condition_on_network = true` proposes new event times that keep the current network possible.

## Which Next Steps Are Specific to SIR Inference

Epidemic Curve reconstructs the number infectious over time from posterior draws. Reproduction Number reads the expected number of people each case infected. Forecast simulates final outbreak sizes from the posterior. Counterfactual asks how outbreak sizes change if cases were removed faster. Sensitivity refits with much wider priors. Growth and Transmission measures how well the sampled links recover the real transmission network, which only a simulation can show.

## References

<a id="ref-AFD2022a"></a>Angevaare, J., Feng, Z. and Deardon, R. (2022). Pathogen.jl: Infectious Disease Transmission Network Modeling with Julia. *Journal of Statistical Software* 104(4). [doi:10.18637/jss.v104.i04](https://doi.org/10.18637/jss.v104.i04)

## See Also
- [SEIR Inference](seir.md) · [Overview](overview.md) · [Diagnostics](diagnostics.md) · [Interpretation](interpretation.md)
