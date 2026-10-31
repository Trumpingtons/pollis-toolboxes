# Diagnostics

## How Many Simulated Outbreaks Are Enough

A containment probability from n outbreaks has standard error sqrt(p (1 - p) / n). Next Steps > Monte Carlo Error prints it. Comparing two sets of measures needs an error that is small compared with their difference, and more outbreaks are the only remedy. Results close to 0 or 1 need more runs for a reliable relative error.

## Is the Case Cap Large Enough

An outbreak that reaches the Case Cap is stopped and counted as not contained. If the cap is too small, an outbreak that would have died out is counted wrongly. Raising the cap should leave the containment probability nearly unchanged, and the stopping rules in Monte Carlo Error show how many outbreaks ended each way. A subcritical process under strong measures can still take long to end when k is small, and then it needs a generous cap.

## Testing Whether Measures Bring R Below 1

Next Steps > Generation Ratio divides the cases in each generation by those in the generation before, with no cap, and estimates the effective reproduction number under the measures. A ratio below 1 means that outbreaks must all end eventually, whereas above 1 some will always grow. Early generations are noisy and depend on the first case, so that the later ones are more informative.

## Checking the Exact Results Against Simulation

Next Steps > Against Simulation sets the exact chance of dying out beside the share of simulated outbreaks that die out. The difference should be within simulation error. A larger gap usually means the outbreak cap is low, or that the parameters of the simulated and the exact offspring distributions are not the same.

## Sampling Checks for the Estimated R and k

Next Steps > Convergence reports R-hat and effective sample sizes of R and k, and R-hat should be close to 1. Next Steps > Posterior Predictive Check compares the share of the smallest count and the largest value with datasets drawn from the posterior. A model that fails on the largest value has a tail too thin for the data, which often shows the effect of one extreme event.

## See Also
- [Assumptions](assumptions.md) · [Interpretation](interpretation.md) · [Overview](overview.md)
