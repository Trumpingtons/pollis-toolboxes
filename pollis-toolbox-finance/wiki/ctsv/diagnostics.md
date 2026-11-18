# Continuous-Time Stochastic Volatility Models — Diagnostics

A simulation can look plausible and still be biased. These checks ask whether the numerical scheme behaves and whether the parameters mean what was intended.

## How to Read the Positivity Check

For **Heston** and **Bates**, **Positivity Check** compares 2 kappa theta with xi², and counts the steps of the path at which variance is zero, which the scheme can reach but not pass. A failed condition with many such steps means that variance spends time at its boundary, so compare the simulated prices with the closed form in **Option Prices by Strike**. Raising **kappa (kappa)** or lowering **xi (xi)** restores the condition. For **SABR**, the check reports the minimum forward and whether the path was absorbed at zero, which grows more likely with a low **beta (beta)** and a long **T (expiry)**.

## How to Read the Monte Carlo Mean Check

**Monte Carlo Mean Check** compares the mean of 2000 terminal prices with its known value: S₀ exp(mu T) in **Heston** and in **Bates**, where jumps are compensated, and F₀ in **SABR**, as the forward is a martingale. The z value divides the gap by the standard error. A value beyond about 2 points to discretisation bias, though about one run in twenty goes beyond it by chance, so repeat the check before concluding. The scheme of **Heston** and **Bates** sets its drift to hold this mean, wherever the moment that needs exists, so **SABR** is where the check has most to find.

## Why Discretisation Bias Arises in Square Root Variance

Euler schemes can push the square root process below zero, and any fix for that changes the distribution. [Lord, Koekkoek and van Dijk (2010)](#ref-LKD2010a) compared such fixes and found full truncation to have the smallest bias among the Euler variants they studied. **Heston** and **Bates** use the quadratic-exponential scheme of [Andersen (2008)](#ref-And2008a) instead, which matches the conditional mean and variance of the exact process and never goes negative. A Monte Carlo price more than about two standard errors from the closed form in **Option Prices by Strike** points to bias, as the standard error measures sampling error only. `simulate_terminal` takes `steps` and `scheme`, so refine the steps, or try `FullTruncation()`, before trusting a price that moves with them.

## How to Judge Noise in a Smile and in Prices

**Implied Volatility Smile** inverts closed-form prices for **Heston** and **Bates**, with strikes from 70% to 130% of the forward, so it has no sampling noise and repeats exactly. A value stuck at the bottom of the search range, 0.0001, means that the price was at or below the option's intrinsic value. Noise lies in the Monte Carlo columns of **Option Prices by Strike**, which use 5000 paths. Far from the money, few paths pay off, so read those prices with their standard errors.

## How to Compare Realised and Integrated Volatility

**Realised Against Integrated Volatility** computes both on the single simulated path. Without jumps, the two should be close, and their gap shrinks as the time grid gets finer. In **Bates**, realised volatility includes jumps and integrated volatility does not, so a path with a jump shows a positive gap. A large gap in **Heston** suggests that the time grid is too coarse, or that the path spent a long time with variance near zero.

## How to Spot Unintended Parameter Scales

**Parameters in Plain Terms** translates the inputs into long-run volatility, half-life, and jump share of variance. Check these first, since a wrong scale produces results that look fine. **SABR** is the main trap: the log-normal volatility is about alpha × F^(beta − 1), so **alpha (alpha)** of 0.4 with **beta (beta)** of 0.5 and a forward of 100 means about 4%, and not 40%. The printed at-the-money implied volatility shows the level at once.

## References

<a id="ref-And2008a"></a>Andersen, L. (2008). Simple and efficient simulation of the Heston stochastic volatility model. *Journal of Computational Finance* 11(3), 1–42. [doi:10.21314/JCF.2008.189](https://doi.org/10.21314/JCF.2008.189)

<a id="ref-LKD2010a"></a>Lord, R., Koekkoek, R. and van Dijk, D. (2010). A comparison of biased simulation schemes for stochastic volatility models. *Quantitative Finance* 10(2), 177–194. [doi:10.1080/14697680802392496](https://doi.org/10.1080/14697680802392496)

## See Also

- [Assumptions](assumptions.md) · [Interpretation](interpretation.md) · [Decision Guide](decision-guide.md)
