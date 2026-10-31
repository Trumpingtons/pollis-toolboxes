# Decision Guide

| Situation | Tab |
|---|---|
| Lasting immunity; who meets whom matters | **SIR** |
| A latent period, or people unequally infectious | **SEIR** |
| No lasting immunity; the question is persistence | **SIS and SIRS** |
| Rates rather than daily probabilities; exact timing | **Continuous Time** |

## Choosing a Network Type

| Network | Main feature | Use it to ask |
|---|---|---|
| Random | Contacts close to the mean, short paths | The baseline: what happens with no special structure? |
| Scale-Free | A few people with very many contacts | What do hubs change? Is aiming at them worthwhile? |
| Small-World | Clustered neighbours with a few long links | What do repeated local contacts change? |
| Regular | Everyone with the same number of contacts | What is left with no variance of contacts at all? |

## When a Network Model Is the Wrong Tool

Move to the Compartmental Models panel when the contact structure is not the question: a well-mixed model is faster and easier to explain. Move to the Branching Processes panel for chance in an outbreak's first cases, with superspreading as a stated distribution. Move to the Inference on Contact Networks panel when real contacts and test results are known, and the question is about specific people.

## Rules of Thumb for Network Simulations

- **Report both** Basic R and the network's own reproduction number.
- **People**: enough that hubs are not limited by size; results on scale-free networks change with size.
- **Many runs**: chance is large near the threshold.
- **Size**: report it for the runs that take off, with the share that do.
- **Comparison across networks**: look at both equal infection rates and equal reproduction numbers.

## See Also
- [Factsheet](factsheet.md) · [Overview](overview.md) · [Assumptions](assumptions.md)
