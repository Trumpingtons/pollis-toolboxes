# Fama-MacBeth Regression — Decision Guide

Two choices shape a Fama-MacBeth analysis: the inference method and the cross-sectional weighting. The test assets matter as much as either.

## Bayesian or Classical Two-Pass Inference

| Situation | Tab | Reason |
|---|---|---|
| Candidate factors that may be weak or useless | **Bayesian** | The posterior widens when identification fails |
| Short samples | **Bayesian** | Beta uncertainty is carried through without an approximation |
| A few well-established factors with strong betas in long samples | **Classical** | OLS or GLS premia with Shanken-corrected t-statistics are fast and familiar |
| A result to report to readers who expect t-statistics | Both | **Bayesian vs Classical** displays the two side by side |

## OLS or GLS in the Cross-Section

Set **Cross-Sectional Estimator** to OLS when test assets are many relative to the sample, when the economic interest is in those particular portfolios, or when the residual covariance is poorly estimated. GLS suits a sample much longer than the number of assets and a model believed to be well specified, since it then gains efficiency. Running both costs little: **OLS vs GLS** reports them together. Results that hold under both weighting schemes are more convincing than results under only one, especially when the factor is not itself a traded portfolio.

## Choosing Test Assets and the Next Panel

Test assets decide what is being asked, and sorted portfolios only test the dimensions they were sorted on. Adding portfolios sorted on other characteristics, or industry portfolios, weakens the strong factor structure that flatters a model. With many candidate factors, use the Bayesian Linear Stochastic Discount Factor panel, which computes inclusion probabilities instead of testing each factor alone. Portfolio construction questions, and those about individual stock characteristics at a high frequency, fall outside what this method was designed to answer, and they should be addressed with data at the level of single firms.

## See Also

- [Factsheet](factsheet.md) · [Overview](overview.md) · [Interpretation](interpretation.md)
