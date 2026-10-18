# Hypothesis Tests

A test asks whether the data are compatible with a null hypothesis $H_0$, through a test statistic whose distribution under $H_0$ is known.

## The One-Sample t Test

For $H_0: \mu = \mu_0$, with sample mean $\bar{x}$ and sample standard deviation $s$:

$$t = \frac{\bar{x} - \mu_0}{s / \sqrt{n}}$$

Under $H_0$, for normal data, $t$ follows a t distribution with $n - 1$ degrees of freedom. The denominator $s / \sqrt{n}$ is the standard error of the mean.

## p-Values

The p-value is the probability, under $H_0$, of a statistic at least as extreme as the one observed.

- **Two-sided**: $p = 2 \, P(T > |t|)$.
- **One-sided**: $p = P(T > t)$ or $P(T < t)$, half the two-sided value when the sign agrees.

With few degrees of freedom the t distribution has heavier tails than the normal, so the normal gives p-values that are too small.

## Decisions

At significance level $\alpha$ (often 0.05), reject $H_0$ when $p < \alpha$. A p-value is not the probability that $H_0$ is true, and not rejecting $H_0$ does not prove it.

## Choosing a Test

| Data | Test |
|---|---|
| One sample, a mean against a value | One-sample t test |
| Two measurements on the same units (before and after) | Paired t test on the differences |
| Two independent groups | Two-sample t test |
| Two categorical variables | Chi-square test of independence |

## The Chi-Square Test of Independence

In a table of counts $O_{ij}$, the expected count under independence is $E_{ij} = (\text{row total}_i \times \text{column total}_j) / N$, and

$$\chi^2 = \sum_{i,j} \frac{(O_{ij} - E_{ij})^2}{E_{ij}},$$

with $(r - 1)(c - 1)$ degrees of freedom, 1 for a 2 by 2 table. The Yates continuity correction subtracts 0.5 from each $|O_{ij} - E_{ij}|$ before squaring.

## See Also

- [Overview](overview.md)
- [Descriptive Statistics](descriptive-statistics.md)
- [Linear Regression](linear-regression.md)
