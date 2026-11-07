# Hypothesis Tests

A test asks whether the data are compatible with a null hypothesis H0, through a test statistic whose distribution under H0 is known.

## The One-Sample t Test

For H0: mu = mu0, with sample mean xbar and sample standard deviation s:

- t = (xbar - mu0) / (s / sqrt(n))

Under H0, for normal data, t follows a t distribution with n - 1 degrees of freedom. The denominator s / sqrt(n) is the standard error of the mean.

## p-Values

The p-value is the probability, under H0, of a statistic at least as extreme as the one observed.

- **Two-sided**: p = 2 P(T > |t|).
- **One-sided**: p = P(T > t) or P(T < t), half the two-sided value when the sign agrees.

With few degrees of freedom the t distribution has heavier tails than the normal, so the normal gives p-values that are too small.

## Decisions

At significance level alpha (often 0.05), reject H0 when p < alpha. A p-value is not the probability that H0 is true, and not rejecting H0 does not prove it.

## Choosing a Test

| Data | Test |
|---|---|
| One sample, a mean against a value | One-sample t test |
| Two measurements on the same units (before and after) | Paired t test on the differences |
| Two independent groups | Two-sample t test |
| Two categorical variables | Chi-square test of independence |

## The Chi-Square Test of Independence

In a table of counts O_ij, with r rows and c columns, the expected count under independence is E_ij = (row total i × column total j) / N, and

- chi-square = the sum over all cells of (O_ij - E_ij)^2 / E_ij

with (r - 1)(c - 1) degrees of freedom, 1 for a 2 by 2 table. The Yates continuity correction subtracts 0.5 from each |O_ij - E_ij| before squaring.

## See Also

- [Overview](overview.md)
- [Descriptive Statistics](descriptive-statistics.md)
- [Linear Regression](linear-regression.md)
