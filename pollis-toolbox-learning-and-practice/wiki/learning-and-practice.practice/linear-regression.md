# Linear Regression

The simple regression of y on x fits the line yhat = b0 + b1 x that minimises the sum of squared residuals.

## The Least-Squares Line

- **Slope**: b1 = s_xy / s_x^2, the covariance of x and y divided by the variance of x.
- **Intercept**: b0 = ybar - b1 xbar, because the line passes through the point of means (xbar, ybar).

The regression of x on y is a different line, with slope s_xy / s_y^2.

## Fit

In a simple regression, R^2 = r^2, the square of the correlation: the share of the variance of y that the line explains. The sign of r does not matter; 1 - R^2 is the share left in the residuals.

## Prediction

The predicted value at x0 is yhat0 = b0 + b1 x0. Leaving out the intercept is right only when the line goes through the origin.

## Interpretation

The slope compares the average of y for units whose x differs by one: an association in the data, not the effect of changing x unless the data come from an experiment. It is not R^2, and it has the units of y per unit of x.

## See Also

- [Overview](overview.md)
- [Descriptive Statistics](descriptive-statistics.md)
- [Hypothesis Tests](hypothesis-tests.md)
