# Bayesian Linear Stochastic Discount Factor — Decision Guide

The tab depends on the question: shrink the risk prices of a fixed model, or select from a candidate list. The prior scale follows from a view of the plausible Sharpe ratio.

## Which Prior and Tab to Use

| Question | Tab | Reason |
|---|---|---|
| What are the risk prices of a model with a fixed set of factors? | **Bayesian SDF** with the Normal prior | Weak factors are shrunk and all remain in the model |
| A benchmark without prior information | **Bayesian SDF** with the Flat prior | Results lean only on the data, at the risk of being misled by weak factors |
| Which of many candidates price the assets? | **Spike-and-Slab** | Inclusion probabilities average across all factor combinations |
| Some candidates are traded portfolios | **Spike-and-Slab (Traded)** | Their mean returns add pricing restrictions |

## How to Set the Prior Scale and Inclusion Prior

Pick **psi0** through its implied prior Sharpe ratio, not as a bare number: choose a value that gives a belief in a plausible range, and then repeat with one lower and one higher value. Results across that range are the honest answer. For **Inclusion Prior (aw)** and **Inclusion Prior (bw)**, the uniform default expresses no view on the number of factors. With dozens of candidates a sparser prior may be more reasonable, because a uniform prior expects half of a large list to enter. Keep **Spike Ratio (r)** at its small default unless there is a specific reason to change it.

## How Many Draws Are Enough

Set **MCMC draws** so that **Effective Sample Size** reaches a few hundred for every price that matters, and use **Burn-in** to discard the early draws. The default values suit a first look; [Bryzgalova, Huang and Julliard (2023)](#ref-BHJ2023a) rely on far longer chains for inference with large factor sets, as a posterior over many combinations needs many visits. Doubling the draws and seeing whether the table changes is a direct test. The cost grows with the number of factors, so a first exploratory run with fewer draws is reasonable before a final run with more.

## Choosing Between This Panel and Fama-MacBeth

Use this panel to compare many candidates jointly or to estimate marginal contributions to the discount factor. Use the Fama-MacBeth Regression panel to estimate premia for a small agreed set and to report them in the form most readers expect. The two can complement each other: first select with Spike-and-Slab, then report premia and pricing errors for the factors that survive. Reusing the same data for both steps overstates the evidence, so the second step's intervals should be treated as optimistic, and a holdout of later data gives a cleaner assessment.

## References

<a id="ref-BHJ2023a"></a>Bryzgalova, S., Huang, J. and Julliard, C. (2023). Bayesian Solutions for the Factor Zoo: We Just Ran Two Quadrillion Models. *Journal of Finance* 78(1), 487–557. [doi:10.1111/jofi.13197](https://doi.org/10.1111/jofi.13197)

## See Also

- [Factsheet](factsheet.md) · [Overview](overview.md) · [Interpretation](interpretation.md)
