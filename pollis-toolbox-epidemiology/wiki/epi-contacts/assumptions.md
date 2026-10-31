# Assumptions

## Why Contacts Must Be Known and Complete

Every infection is assumed to pass along a recorded contact. An unrecorded one forces the inference to explain a case by some other route, which can raise the risk of an innocent neighbour and lower that of the true source. Data from digital tracing or diaries always miss contacts. Results on simulated complete contacts are therefore a best case.

## Why the Rates Are Taken as Known

Infection and recovery rates are given to the method, and it does not estimate them here. A rate set wrongly shifts the level of risk, while the ranking can hold up better. Next Steps > Compare a Wrong Infection Rate shows both effects. Equal rates are also assumed across contacts and people, although people differ in practice, and an actual contact has its own length and closeness.

## What the Test Model Assumes

Errors are independent across tests, and their rates are known and given to the inference. Real false-negative rates depend on the day of infection and on sampling, and they are often high early and late in an infection. A positive result is read as being infected at that moment, whereas a recovered person is read as testing negative. Testing that is targeted at people with symptoms is informative in itself, which the method does not represent.

## What the Mean-Field Approximation Assumes

The small-coupling approach takes the chance of infection along each contact to be small, working with the coupling log(1 - infection) as its small parameter ([Braunstein, Catania, Dall'Asta, Mariani, Mazza and Tarabolo (2025)](#ref-BCDMM...2025a)). Results are at their best when infection along one contact is small. Short cycles in the network also strain cavity methods, which rest on a nearly tree-like structure of messages, so that households and cliques deserve more caution.

## Why the Result Is an Approximation of a Marginal

Exact probabilities on a whole network are impossible to compute, and the method returns an approximation of each person's marginal probability. Joint statements, for instance about two people infected together, are out of reach by multiplying them. Independent checks are thus part of the method: when approximate marginals are the only result, they must be judged by calibration against a truth or a simulation.

## References

<a id="ref-BCDMM...2025a"></a>Braunstein, A., Catania, G., Dall'Asta, L., Mariani, M., Mazza, F. and Tarabolo, M. (2025). Small-coupling dynamic cavity: A Bayesian mean-field framework for epidemic inference. *Physical Review Research* 7(2), 023089. [doi:10.1103/physrevresearch.7.023089](https://doi.org/10.1103/physrevresearch.7.023089)

## See Also
- [Diagnostics](diagnostics.md) · [Interpretation](interpretation.md) · [Decision Guide](decision-guide.md)
