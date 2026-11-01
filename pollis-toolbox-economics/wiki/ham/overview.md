# Heterogeneous-Agent Models — Overview

Both tabs solve the same pair of equations: a Hamilton-Jacobi-Bellman equation for the household, and a Kolmogorov forward equation for the distribution. The tabs differ in what households save in and what clears the market.

## The Huggett Tab

The **Huggett** tab solves the bond economy of [Huggett (1993)](#ref-Hug1993a) in continuous time. Income y follows an Ornstein-Uhlenbeck process around 1, with **sigma (income vol)** and **kappa (mean reversion)**. Households hold a bond paying r, down to a limit set by **phi (borrowing limit)**. Bonds are in zero net supply, so the lending of savers must equal the borrowing of debtors, and the interest rate adjusts to achieve this. A value of phi below 0 is required, because with no borrowing nobody could hold a negative position and the market could clear only with all bond holdings at zero.

## The Aiyagari Tab

The **Aiyagari** tab solves the production economy of [Aiyagari (1994)](#ref-Aiy1994a). Households earn a wage times their labour efficiency, and they save in capital. A Cobb-Douglas firm with **alpha (capital share)** rents capital at r + **delta (depreciation)**, so `capital_demand(r)` and `wage(r)` follow from its first-order conditions. Market clearing requires household wealth to equal firm capital. Precautionary saving pushes capital above the level a representative agent would hold, and the equilibrium interest rate is below **rho (discount rate)**, which is the main result of that article.

## How the Household Problem Is Solved

`household_hjb` writes the residual of the Hamilton-Jacobi-Bellman equation in the form EconPDEs.jl expects, and the solver returns a value function on a grid of income and wealth, with **N (grid points)** points for wealth and 15 for income. Consumption follows from the first-order condition. [Achdou, Han, Lasry, Lions and Moll (2022)](#ref-AHLLM2022a) note that the borrowing limit enters only as a boundary condition, and that continuous time makes the first-order condition static, which avoids the root-finding step of discrete-time methods. Saving is upwinded: forward differences where saving is positive, backward where saving is negative.

## How the Distribution Is Computed

The Kolmogorov forward equation describes how the mass of households moves through income and wealth under the saving policy and the income process. Its discretised form is the transpose of the matrix from the household problem, which is an important practical advantage of the method. The panel builds it as a sparse matrix, and the stationary distribution is the solution of a sparse linear system, with one equation replaced by the condition that probabilities sum to one. A mass point at the borrowing limit can appear, reflecting households who are saving nothing while waiting for income to rise.

## Common Workflow for a Stationary Equilibrium

1. Choose **Huggett** or **Aiyagari**, then set preferences, income and the limit.
2. Run **Convergence Check**, which confirms both the household solution and the distribution.
3. See household behaviour with **Policy Function** and **Wealth Distribution**.
4. Find the market-clearing price with **Equilibrium Interest Rate**, since the first solve uses a rate just below **rho (discount rate)**.
5. Read **Wealth Gini Coefficient** and **Consumption Insurance**.
6. Change one parameter, and compare steady states.

## References

<a id="ref-AHLLM2022a"></a>Achdou, Y., Han, J., Lasry, J., Lions, P. and Moll, B. (2022). Income and Wealth Distribution in Macroeconomics: A Continuous-Time Approach. *The Review of Economic Studies* 89(1), 45–86. [doi:10.1093/restud/rdab002](https://doi.org/10.1093/restud/rdab002)

<a id="ref-Aiy1994a"></a>Aiyagari, S. R. (1994). Uninsured Idiosyncratic Risk and Aggregate Saving. *The Quarterly Journal of Economics* 109(3), 659–684. [doi:10.2307/2118417](https://doi.org/10.2307/2118417)

<a id="ref-Hug1993a"></a>Huggett, M. (1993). The Risk-Free Rate in Heterogeneous-Agent Incomplete-Insurance Economies. *Journal of Economic Dynamics and Control* 17(5-6), 953–969. [doi:10.1016/0165-1889(93)90024-M](https://doi.org/10.1016/0165-1889(93)90024-M)

## See Also

- [Factsheet](factsheet.md) · [Decision Guide](decision-guide.md) · [Interpretation](interpretation.md)
