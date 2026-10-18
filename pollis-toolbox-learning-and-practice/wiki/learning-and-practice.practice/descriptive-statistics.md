# Descriptive Statistics

Summaries of the centre, the spread and the association of a sample $x_1, \dots, x_n$.

## Centre

- **Mean**: $\bar{x} = \frac{1}{n} \sum_{i=1}^n x_i$, the sum divided by $n$.
- **Median**: the middle value of the sorted sample; with an even $n$, the mean of the two middle values, the $(n/2)$-th and the $(n/2 + 1)$-th.
- **Midrange**: $(\min + \max) / 2$, rarely useful because it depends only on the two extremes.

## Spread

- **Sample variance**: $s^2 = \frac{1}{n - 1} \sum_{i=1}^n (x_i - \bar{x})^2$. Dividing by $n - 1$ instead of $n$ makes it an unbiased estimate of the population variance.
- **Sample standard deviation**: $s = \sqrt{s^2}$, in the units of the data.
- **Range**: $\max - \min$.

## Resistance to Outliers

A summary is resistant when a single extreme value barely moves it. The median and the interquartile range are resistant; the mean, the standard deviation and the range are not, because they use the extreme value itself.

## Association

- **Covariance**: $s_{xy} = \frac{1}{n - 1} \sum_{i=1}^n (x_i - \bar{x})(y_i - \bar{y})$, in the units of $x$ times the units of $y$.
- **Pearson correlation**: $r = s_{xy} / (s_x s_y)$, without units and always between $-1$ and $1$. It measures linear association only.

## Common Mistakes

| Mistake | What it gives |
|---|---|
| Dividing the sum of squares by $n$ | A standard deviation that underestimates the population value |
| Forgetting the square root | The variance, not the standard deviation |
| Taking one middle value when $n$ is even | Not the median |
| Reporting the covariance as the correlation | A number with units, not bounded by 1 |

## See Also

- [Overview](overview.md)
- [Hypothesis Tests](hypothesis-tests.md)
- [Linear Regression](linear-regression.md)
