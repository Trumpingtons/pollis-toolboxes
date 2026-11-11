# Out-of-Sample Evaluation

A portfolio is judged by the returns that follow the period it was chosen on. The panel's Predict and Compare Next Steps refit the selected method on rolling windows and keep only the returns of the days after each window.

## How the Walk-Forward Backtest Works

**Out-of-Sample Performance** trains the selected method on 504 days, about two years, holds the weights for the next 63 days, about a quarter, then moves the window forward by 63 days and trains again. The held-out returns of all folds are joined into one series of daily portfolio returns, which no set of weights saw while it was chosen. The panel prints the number of folds and of out-of-sample days, the annualised excess return, the annualised volatility, the annualised Sharpe ratio with its standard error, and the maximum drawdown, and it draws the growth of 1 over the held-out days.

## How Precise an Out-of-Sample Sharpe Ratio Is

[Lo (2002)](#ref-Lo2002a) showed that Sharpe ratios are estimated with error and derived their distributions for independent and identically distributed returns and for stationary ones. Under iid returns, the standard error of a daily Sharpe ratio SR over T days is about sqrt((1 + SR^2 / 2) / T), and the panel annualises it with the square root of 252. Lo (2002) also showed that monthly Sharpe ratios cannot be annualised by multiplying by the square root of 12 except in special cases, as serial correlation changes the factor. Differences between methods well inside about two standard errors are not evidence that one is better.

## How the Comparison with Equal Weights Is Tested

**vs Equal Weight** runs the selected method and the 1/N portfolio on the same folds and tests whether their Sharpe ratios differ. [DeMiguel, Garlappi and Uppal (2009)](#ref-DGU2009a) found that none of 14 models was consistently better than 1/N, which makes it the natural benchmark. The test is the one of [Jobson and Korkie (1981)](#ref-JK1981a) with the correction of Memmel (2003): |z| above 1.96 rejects equal Sharpe ratios at the 5% level. [Ledoit and Wolf (2008)](#ref-LW2008a) showed that this test is not valid when returns have heavier tails than the normal or are of a time-series nature, and proposed a studentized time-series bootstrap confidence interval for the difference instead.

## How Compare Methods Scores Every Method

**Compare Methods** runs seven strategies on identical folds: **Min Variance**, **Max Sharpe**, **Min ES 5%**, **HRP**, **HERC**, **Inverse Vol** and **Equal Weight**. For each, it prints the annualised Sharpe ratio with its standard error, the annualised volatility and the maximum drawdown of the held-out returns. Inverse Vol and Equal Weight are naive benchmarks that use no optimisation. Because the folds are the same, the methods face the same days, and differences come from the weights alone.

## References

<a id="ref-DGU2009a"></a>DeMiguel, V., Garlappi, L. and Uppal, R. (2009). Optimal versus naive diversification: how inefficient is the 1/N portfolio strategy? *Review of Financial Studies* 22(5), 1915–1953. [doi:10.1093/rfs/hhm075](https://doi.org/10.1093/rfs/hhm075)

<a id="ref-JK1981a"></a>Jobson, J. D. and Korkie, B. M. (1981). Performance hypothesis testing with the Sharpe and Treynor measures. *The Journal of Finance* 36(4), 889–908. [doi:10.1111/j.1540-6261.1981.tb04891.x](https://doi.org/10.1111/j.1540-6261.1981.tb04891.x)

<a id="ref-LW2008a"></a>Ledoit, O. and Wolf, M. (2008). Robust performance hypothesis testing with the Sharpe ratio. *Journal of Empirical Finance* 15(5), 850–859. [doi:10.1016/j.jempfin.2008.03.002](https://doi.org/10.1016/j.jempfin.2008.03.002)

<a id="ref-Lo2002a"></a>Lo, A. W. (2002). The statistics of Sharpe ratios. *Financial Analysts Journal* 58(4), 36–52. [doi:10.2469/faj.v58.n4.2453](https://doi.org/10.2469/faj.v58.n4.2453)

## See Also

- [Diagnostics](diagnostics.md) · [Interpretation](interpretation.md) · [Decision Guide](decision-guide.md)
