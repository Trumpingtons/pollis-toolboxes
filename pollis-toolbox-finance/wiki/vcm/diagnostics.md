# GARCH-Type Models — Diagnostics

Checks look at what remains in the standardised residuals, at the tails of the distribution, and at how a fitted model behaves out of the estimation window.

## Reading Standardised Residual Checks

**Standardised Residual Checks** applies Ljung-Box to the standardised residuals and their squares, the ARCH-LM test and Jarque-Bera, per asset in DCC. A good variance model removes correlation from the squares and shows no remaining ARCH effects. If the squares still show correlation, try higher orders, or an asymmetric form. Correlation in the residuals themselves is a problem in the mean, not the variance. Jarque-Bera will usually reject even for a good model, because shocks often have fat tails, and that rejection says something about the distribution and not about the dynamics.

## Reading the QQ Plot of Standardised Residuals

**QQ Plot Against the Fitted Distribution** plots standardised residuals against quantiles of the fitted innovation distribution. Departure in the lower left means that large negative shocks are bigger than the distribution expects, and the Value-at-Risk will be too low. Departure in both tails suggests a heavier-tailed distribution. Departure only on the negative side suggests a skewed one. **Innovation Distributions** refits the same model with Gaussian, Student's t, GED and skewed t shocks, and the lowest AIC and BIC point to the best tail shape.

## Reading the Value-at-Risk Backtest

**Value-at-Risk Backtest** compares in-sample 5% Value-at-Risk with returns, counting exceedances against the 5% expected and applying the dynamic quantile test. The share of exceedances checks the level of the quantile. The dynamic test checks whether exceedances cluster or can be predicted, which a good model should rule out. A correct share with clustered exceedances means the model responds too slowly. Because the exercise is in-sample, passing is a low bar, and an out-of-sample run with rolling refits is a much stronger test of a risk model.

## Using the Published Benchmark

The **Replicate** action in the GARCH tab reruns GARCH(1,1) on data with published results, the benchmark of [Fiorentini, Calzolari and Panattoni (1996)](#ref-FCP1996a), as quoted to six significant figures by [Brooks, Burke and Persand (2001)](#ref-BBP2001a). Agreement confirms that the optimiser and likelihood reproduce a known answer, which matters because volatility likelihoods are flat near high persistence, and software packages have been shown to differ substantially. Disagreement in the last digits is a matter of numerical precision. The check verifies the estimation routine and says nothing about whether a GARCH(1,1) is the right model for a given dataset.

## References

<a id="ref-BBP2001a"></a>Brooks, C., Burke, S. P. and Persand, G. (2001). Benchmarks and the Accuracy of GARCH Model Estimation. *International Journal of Forecasting* 17(1), 45–56. [doi:10.1016/S0169-2070(00)00070-4](https://doi.org/10.1016/S0169-2070(00)00070-4)

<a id="ref-FCP1996a"></a>Fiorentini, G., Calzolari, G. and Panattoni, L. (1996). Analytic Derivatives and the Computation of GARCH Estimates. *Journal of Applied Econometrics* 11(4), 399–417. [doi:10.1002/(SICI)1099-1255(199607)11:4<399::AID-JAE401>3.0.CO;2-R](https://doi.org/10.1002/(SICI)1099-1255(199607)11:4<399::AID-JAE401>3.0.CO;2-R)

## See Also

- [Assumptions](assumptions.md) · [Interpretation](interpretation.md) · [Decision Guide](decision-guide.md)
