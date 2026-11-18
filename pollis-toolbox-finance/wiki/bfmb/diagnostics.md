# Fama-MacBeth Regression — Diagnostics

The first diagnostic question is whether a premium is identified at all, and the second is whether the model prices the test assets.

## Reading the Weak Factor Check

**Weak Factor Check** runs a Wald test that all test-asset loadings on a given factor are zero. A clear rejection means assets do load on the factor, so a premium can be estimated. A failure to reject is a warning that the factor is weak or useless, and any large t-statistic the second pass reports for it should be disregarded. Rejection alone does not guarantee strong identification. If loadings are small and nearly identical across assets, the premium remains poorly identified; the spread of betas across assets is the feature that matters.

## Reading the Pricing Errors

**Pricing Errors** reports the pricing error, or alpha, of each test asset, with t-statistics from the Shanken-corrected two-pass regression. Systematic patterns are more informative than single rejections: errors that line up with size or momentum sorts indicate a missing factor. With many test assets, some individual errors will reject by chance, so a joint view is preferable. Average errors that are small in economic terms can still be statistically significant in long samples. A monthly error of a tenth of a percent corresponds to more than one percent per year, which is a large amount for a portfolio manager.

## Using the Pricing Plot

**Pricing Plot** draws realised average returns of the test assets against the returns the model implies. Points close to the 45-degree line suggest a model that prices those assets well. The plot has a known weakness: with only a few test assets or with portfolios that have a strong factor structure, even a poor model can line up the points. Adjusted R2 from **OLS vs GLS** has the same weakness, since OLS R2 can be high for a factor that has almost no relation to true risk. A GLS fit is a harder test because it focuses on portfolios with low residual variance.

## Comparing Bayesian and Classical Output

**Bayesian vs Classical** places two-pass estimates and t-statistics beside Bayesian posterior means and 95% credible intervals. For strong factors in long samples, the two answers are close, which gives reassurance about both. A wide gap for one factor is the informative outcome: a large classical t-statistic combined with a posterior that straddles zero is the signature of weak identification. That pattern says to trust the Bayesian reading. Differences in the point estimates alone are less important, because the two methods also weight assets differently.

## See Also

- [Assumptions](assumptions.md) · [Interpretation](interpretation.md) · [Decision Guide](decision-guide.md)
