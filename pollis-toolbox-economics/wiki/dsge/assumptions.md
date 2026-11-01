# Dynamic Stochastic General Equilibrium (DSGE) — Assumptions

A DSGE result rests on the model's equations as much as on its data, so its assumptions deserve the same attention as those of a regression.

## Rational Expectations and a Correct Model

Agents in the model know its structure and form expectations from it. Forward-looking terms such as `c[1]` are therefore expectations computed by the model itself. A misspecified model gives precise but misleading answers, since the likelihood treats the equations as the true data-generating process. Parameters interpreted as structural may also absorb omitted features. [Del Negro, Giannoni and Schorfheide (2015)](#ref-DGS2015a) show how much the interpretation of an episode can depend on which financial frictions are included in a New Keynesian model, which illustrates the risk.

## A Local Solution Around a Steady State

Perturbation approximates the solution near one point. Accuracy falls as the economy moves away, so a linear solution gives poor answers for big shocks or highly nonlinear models. A first-order solution has certainty equivalence: the size of risk does not influence behaviour, and means equal the steady state. Second order adds a constant risk correction, and third order lets risk affect responses, as with [Andreasen, Fernández-Villaverde and Rubio-Ramírez (2018)](#ref-AFR2018a). Each order is still local, and nothing in the method handles a constraint that binds only sometimes.

## A Unique Stable Solution

Rational-expectations models may have no stable solution, one, or many. [Blanchard and Kahn (1980)](#ref-BK1980a) give the conditions: the number of unstable eigenvalues must match the number of forward-looking variables. Modern solvers such as [Klein (2000)](#ref-Kle2000a) and [Villemot (2011)](#ref-Vil2011a) implement the same idea with a generalised Schur decomposition, which also handles singular systems. A calibration that violates the conditions has no meaningful output, and policy rules that respond too weakly to inflation are a well-known source of indeterminacy.

## Identification, Priors and Observables

Estimation needs at least as many shocks as observables, or the likelihood is singular: with too few shocks, the model implies an exact relation among series that real data never satisfy. Some parameters barely change the likelihood, and their posteriors then just repeat the prior. The panel's priors are centred on the calibration: Beta for values in (0, 1), inverse gamma for other positive values, and normal otherwise. A posterior near the prior should be reported as such. Observables must match model variables in their units and transformation, and this mapping often goes wrong.

## References

<a id="ref-AFR2018a"></a>Andreasen, M. M., Fernández-Villaverde, J. and Rubio-Ramírez, J. F. (2018). The pruned state-space system for non-linear DSGE models: Theory and empirical applications. *The Review of Economic Studies* 85(1), 1–49. [doi:10.1093/restud/rdx037](https://doi.org/10.1093/restud/rdx037)

<a id="ref-BK1980a"></a>Blanchard, O. J. and Kahn, C. M. (1980). The Solution of Linear Difference Models under Rational Expectations. *Econometrica* 48(5), 1305. [doi:10.2307/1912186](https://doi.org/10.2307/1912186)

<a id="ref-DGS2015a"></a>Del Negro, M., Giannoni, M. P. and Schorfheide, F. (2015). Inflation in the Great Recession and New Keynesian Models. *American Economic Journal: Macroeconomics* 7(1), 168–196. [doi:10.1257/mac.20140097](https://doi.org/10.1257/mac.20140097)

<a id="ref-Kle2000a"></a>Klein, P. (2000). Using the generalised Schur form to solve a multivariate linear rational expectations model. *Journal of Economic Dynamics and Control* 24(10), 1405–1423. [doi:10.1016/S0165-1889(99)00045-7](https://doi.org/10.1016/S0165-1889(99)00045-7)

<a id="ref-Vil2011a"></a>Villemot, S. (2011). Solving rational expectations models at first order: what Dynare does. [Link](https://www.dynare.org/wp-repo/dynarewp002.pdf)

## See Also

- [Diagnostics](diagnostics.md) · [Interpretation](interpretation.md) · [Decision Guide](decision-guide.md)
