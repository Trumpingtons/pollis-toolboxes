# VAR Models — Interpretation

The interpretation actions read an identified system, so each result depends on the choice of **Identification**.

## Reading Impulse Responses

**Impulse Responses** plots each variable's response to each identified shock over 20 quarters, with bands. Under recursive or long-run identification, the bands come from a residual bootstrap. Under **Sign Restrictions**, they span the accepted rotations, which is the identified set rather than sampling uncertainty, a distinction stressed in [Kilian and Lütkepohl (2017)](#ref-KL2017a). Bands that include zero at every horizon mean the data cannot sign the effect. Changing the column order under **Recursive (Cholesky)** is a good robustness check, and a response that changes sign is fragile.

## Reading Variance and Historical Decompositions

**Variance Decomposition** gives the share of each variable's forecast error variance due to each shock, at each horizon. A monetary shock explaining a small share of output variance can still have a large effect when it happens. **Historical Decomposition** splits each observed series into initial conditions and the contribution of each shock, which supports stories about particular episodes. Contributions add up to the data by construction, and the action verifies this. Both results depend on identification, and an unidentified shock has no meaning beyond the residual.

## Reading Transmission Channels

**Transmission Channels** splits the response of variable 2 to the last shock into a part going through variable 1 and a direct part, using TransmissionChannelAnalysis.jl, which implements the method of [Wegner, Lieb, Smeekes and Wilms (2024)](#ref-WLSW2024a). The table shows the total, through and direct parts by quarter, in the **VAR** and **SVAR** tabs only. Under **Sign Restrictions**, the entries are medians over accepted rotations. A transmission order puts the shock's variable first, then the channel, then the outcome, and this ordering is itself a modelling choice. A large share through the channel implies that the channel's response matters for the outcome in the fitted dynamics.

## Reading Granger Causality and Forecasts

**Granger Causality** tests whether lags of one variable help predict another, the notion introduced by [Granger (1969)](#ref-Gra1969a). The test concerns predictability and does not establish causation in a structural sense, because a forward-looking variable may precede what it anticipates. In the **VECM** tab, the test also separates short-run and long-run channels. **Forecast** predicts each variable 12 quarters ahead with 95 percent intervals, based on the reduced form, so identification plays no role. Intervals assume that coefficients stay constant over the horizon.

## References

<a id="ref-Gra1969a"></a>Granger, C. W. J. (1969). Investigating Causal Relations by Econometric Models and Cross-spectral Methods. *Econometrica* 37(3), 424. [doi:10.2307/1912791](https://doi.org/10.2307/1912791)

<a id="ref-KL2017a"></a>Kilian, L. and Lütkepohl, H. (2017). Structural Vector Autoregressive Analysis. *Cambridge University Press*. [doi:10.1017/9781108164818](https://doi.org/10.1017/9781108164818)

<a id="ref-WLSW2024a"></a>Wegner, E., Lieb, L., Smeekes, S. and Wilms, I. (2024). Transmission Channel Analysis in Dynamic Models. *arXiv preprint arXiv:2405.18987*. [Link](https://arxiv.org/abs/2405.18987)

## See Also

- [Diagnostics](diagnostics.md) · [Decision Guide](decision-guide.md) · [Overview](overview.md)
