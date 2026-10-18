# Linear Regression

The simple regression of $y$ on $x$ fits the line $\hat{y} = b_0 + b_1 x$ that minimises the sum of squared residuals.

## The Least-Squares Line

- **Slope**: $b_1 = s_{xy} / s_x^2$, the covariance of $x$ and $y$ divided by the variance of $x$.
- **Intercept**: $b_0 = \bar{y} - b_1 \bar{x}$, because the line passes through the point of means $(\bar{x}, \bar{y})$.

The regression of $x$ on $y$ is a different line, with slope $s_{xy} / s_y^2$.

## Fit

In a simple regression, $R^2 = r^2$, the square of the correlation: the share of the variance of $y$ that the line explains. The sign of $r$ does not matter; $1 - R^2$ is the share left in the residuals.

## Prediction

The predicted value at $x_0$ is $\hat{y}_0 = b_0 + b_1 x_0$. Leaving out the intercept is right only when the line goes through the origin.

## Interpretation

The slope compares the average of $y$ for units whose $x$ differs by one: an association in the data, not the effect of changing $x$ unless the data come from an experiment. It is not $R^2$, and it has the units of $y$ per unit of $x$.

## See Also

- [Overview](overview.md)
- [Descriptive Statistics](descriptive-statistics.md)
- [Hypothesis Tests](hypothesis-tests.md)
