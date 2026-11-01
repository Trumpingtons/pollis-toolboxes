# Heterogeneous-Agent Models — Factsheet

The Heterogeneous-Agent Models panel solves economies in which households face uninsurable income risk, save or borrow to smooth consumption, and end up with a distribution of wealth. The Huggett and Aiyagari economies are written in continuous time, following [Achdou, Han, Lasry, Lions and Moll (2022)](#ref-AHLLM2022a). EconPDEs.jl solves the household problem, and a sparse linear system gives the distribution.

| | |
|---|---|
| **Purpose** | Compute household policies, the stationary wealth distribution and the market-clearing interest rate |
| **Julia stack** | EconPDEs.jl, with SparseArrays, LinearAlgebra and Plots.jl |
| **Models** | Huggett, Aiyagari |
| **Output** | Consumption and saving policies, a wealth density, a Gini index, an equilibrium interest rate |
| **Key choice** | The bond or capital economy, the borrowing limit, and the income process |

## When to Use a Heterogeneous-Agent Model

A heterogeneous-agent model suits questions in which the distribution matters: precautionary saving, inequality, borrowing constraints, or why aggregate behaviour differs from that of an average household. A representative agent cannot address such questions, because in that framework everyone is insured and nobody is close to a limit. The method here gives a stationary equilibrium, without aggregate shocks, in two state variables: income and wealth. That is the standard setting for learning the method and for steady-state comparisons of policy.

## What the Panel's Models Omit

The models have no aggregate shocks, so there are no business cycles or transition paths, only a stationary equilibrium. Income follows one continuous process, which leaves out the large rare earnings changes seen in microdata. Household differences arise only from income luck, so features like life-cycle saving, heterogeneous patience and illiquid assets are absent. Those missing features explain why a simple model tends to understate wealth concentration at the top. [Kaplan, Moll and Violante (2018)](#ref-KMV2018a) show how a richer version of the framework, with liquid and illiquid assets, changes the analysis of monetary policy.

## References

<a id="ref-AHLLM2022a"></a>Achdou, Y., Han, J., Lasry, J., Lions, P. and Moll, B. (2022). Income and Wealth Distribution in Macroeconomics: A Continuous-Time Approach. *The Review of Economic Studies* 89(1), 45–86. [doi:10.1093/restud/rdab002](https://doi.org/10.1093/restud/rdab002)

<a id="ref-KMV2018a"></a>Kaplan, G., Moll, B. and Violante, G. L. (2018). Monetary Policy According to HANK. *American Economic Review* 108(3), 697–743. [doi:10.1257/aer.20160042](https://doi.org/10.1257/aer.20160042)

## See Also

- [Overview](overview.md) · [Decision Guide](decision-guide.md) · [Assumptions](assumptions.md)
