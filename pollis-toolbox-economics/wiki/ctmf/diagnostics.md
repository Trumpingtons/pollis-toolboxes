# Continuous-Time Macro-Finance — Diagnostics

Numerical checks come first, and economic checks second. Good-looking curves do not show that the equation was solved.

## Reading the Convergence Check

**Convergence Check** reports the solver residual and re-solves on a grid twice as fine, to see whether moments change. A small residual means that the discretised equation holds, and matching moments mean that the grid is fine enough. Moving a moment in the third decimal place when the grid is doubled shows that the grid error is small relative to the economics. A moment that continues to drift requires a finer **N (grid points)**, and a large residual means that the solver has not found a solution, so the output should not be used.

## When the Solver Fails

Failure usually has an economic cause. With high **gamma (risk aversion)**, a long-lived shock to expected growth, or a low **rho (discount rate)**, the value of the consumption claim may be infinite, and no solution exists. An elasticity very close to 1 makes the coefficient (gamma psi - 1) / (psi - 1) explode. Lowering **gamma (risk aversion)** or raising **kappa (mean reversion)** is a useful way to find out whether the model has a solution in that region, then moving toward the target gradually, starting each solve from the previous one.

## Sanity Checks Against the Benchmark

Limiting cases provide tests of the code and of intuition. Setting gamma = 1 / psi gives power utility, so the price of long-run risk should fall to zero and the **Risk Premium** should contain only its short-run part. Setting **nu (growth-news volatility)** near zero removes growth news altogether, leaving a nearly flat p(mu). The **Sharpe Ratio** action shows the maximum Sharpe ratio next to the power-utility benchmark gamma sigma, so a large gap measures the contribution of long-run risk. A result failing these limits points to an input error.

## Checking the Calibration

**State Variable Dynamics** reports the half-life of shocks to expected growth, its stationary standard deviation nu sigma / sqrt(2 kappa), and its share of consumption-growth variance. The half-life is ln(2) / kappa years. A small share of variance implies a process that is hard to detect in consumption data, in line with the argument for the mechanism. A share that is too large would imply far more predictability in consumption growth than the data show. **Asset Pricing Moments** then gives the returns and risk-free rate to compare with target values.

## See Also

- [Assumptions](assumptions.md) · [Interpretation](interpretation.md) · [Decision Guide](decision-guide.md)
