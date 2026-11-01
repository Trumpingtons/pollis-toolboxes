# Range-Based Volatility Estimation — Alizadeh-Brandt-Diebold

The **Alizadeh-Brandt-Diebold** tab returns a daily series rather than a single estimate, ready to be used as a noisy observation of volatility.

## What the Log Range Measures

`alizadeh_brandt_diebold(H, L)` returns log(log(H(t)) - log(L(t))) for each day. For a continuously observed random walk, the log range is close to normal, with a mean of about 0.43 + log(sigma(t)) and a standard deviation of about 0.29, and [Alizadeh, Brandt and Diebold (2002)](#ref-ABD2002a) use those properties. The noise is much smaller and far more Gaussian than the noise in the log of squared returns, which is strongly skewed. No annualisation is applied, because the function produces an observable and not a variance estimate. Exponentiating the output recovers the range itself.

## How to Use the Log Range in a State-Space Model

A linear Gaussian state-space model treats the log range as log volatility plus nearly Gaussian noise, so a Kalman filter gives a close approximation to full likelihood estimation. That route is simple and avoids the simulation methods usually required for stochastic volatility. **Rolling Volatility** in this tab averages the log range over the window, subtracts 0.43 and exponentiates to give a volatility level. Days with a zero range return `-Inf` and must be dropped with `filter(isfinite, lr)`. Discrete sampling lowers the mean below the continuous-time value, so the constant should be estimated and not imposed.

## References

<a id="ref-ABD2002a"></a>Alizadeh, S., Brandt, M. W. and Diebold, F. X. (2002). Range-Based Estimation of Stochastic Volatility Models. *Journal of Finance* 57(3), 1047–1091. [doi:10.1111/1540-6261.00454](https://doi.org/10.1111/1540-6261.00454)

## See Also

- [Overview](overview.md) · [Decision Guide](decision-guide.md) · [Close-to-Close](close-to-close.md)
