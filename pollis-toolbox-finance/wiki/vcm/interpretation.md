# GARCH-Type Models — Interpretation

Reading a volatility model centres on persistence, asymmetry and the level to which forecasts converge.

## Reading Persistence and Half-Life

**Persistence and Half-Life** measures how long a volatility shock lasts. In a GARCH(1,1), persistence is alpha + beta, and the half-life is ln(0.5) / ln(alpha + beta) periods. A persistence of 0.98 gives a half-life of about 34 periods, and one of 0.90 about 7. Alpha reflects the immediate reaction to news, and beta reflects the memory of past variance. A higher alpha gives a spikier path, and a higher beta gives a smoother one. Half-life estimates are sensitive near 1, where a small error changes the answer greatly, so a confidence interval should be considered together with the value.

## Reading the News Impact Curve

**News Impact Curve** plots next-period variance against today's shock, with past variances held at their sample average. A GARCH curve is a symmetric parabola, GJR-GARCH has two half-parabolas with different slopes, and EGARCH is built on the logarithm, so its curve rises exponentially. Lopsidedness is the leverage effect: declines raise future volatility more than equal rises. A curve is the quickest way to compare asymmetric models, since their coefficients are not directly comparable. Commodities and some currencies can show the reverse pattern or none.

## Reading Estimates and Confidence Intervals

**Estimates with Confidence Intervals** lists every parameter with its 95% interval and whether it excludes zero. A significant asymmetry term confirms the leverage effect. The omega term is usually small and hard to read directly; the implied long-run variance is more useful and is annualised by multiplying by the number of periods per year. Parameters are correlated, so alpha and beta can trade off against each other even when their sum is tightly estimated. Tests against zero for alpha and the GARCH terms are not standard, because zero is on the boundary of the parameter space.

## Reading Volatility Forecasts and Correlations

**Volatility Forecast Path** shows forecasts from 1 to 20 steps converging to the long-run level for GARCH and GJR-GARCH, and DCC shows the one-step covariance matrix. Convergence speed reflects persistence. Forecasts describe expected variance, and realised volatility will scatter widely around them, so judge them with proxies such as realised variance or range estimators. Under DCC, conditional correlations rising during market falls imply that diversification weakens precisely when it is needed. Check that the rise exceeds what estimation noise would produce, and remember that high-volatility periods are known to bias simple correlation estimates upward.

## See Also

- [Diagnostics](diagnostics.md) · [Decision Guide](decision-guide.md) · [Overview](overview.md)
