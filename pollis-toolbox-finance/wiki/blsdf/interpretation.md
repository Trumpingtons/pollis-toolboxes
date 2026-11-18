# Bayesian Linear Stochastic Discount Factor — Interpretation

Output reads differently from a two-pass regression. The panel reports risk prices, which measure marginal contributions to the discount factor, and it reports them with inclusion probabilities where a selection prior is used.

## Risk Prices and Risk Premia Are Different

A risk price measures the contribution of a factor to the discount factor, holding the other candidates fixed. A risk premium measures the reward per unit of beta, and it can be large for a factor that adds nothing once others are included. A factor correlated with a priced factor therefore has a premium but may have a price near zero. **Risk Price Table** reports the posterior mean, a 90% credible interval and the probability of a positive price. A zero price says that the factor is redundant within the candidate set, not necessarily that it is unrelated to returns.

## Reading Inclusion Probabilities

**Factor Relevance** gives each factor's posterior probability of being in the model, under Spike-and-Slab. Comparing it with the prior probability is the key step: under a uniform Beta prior, the prior mean is 0.5, so a posterior of 0.6 is weak support, and one of 0.95 is strong. **Which Factors Are Priced** applies a simple threshold of 0.5, which is a plain-language guide and not a test. Correlated factors share probability, so a group of factors can each stand near 0.4 while the group as a whole is almost certainly present.

## Reading the SDF Sharpe Ratio

**SDF Sharpe Ratio** shows the posterior of the highest Sharpe ratio the factors can deliver, computed as sqrt(lambda' Corr(f) lambda), monthly and annualised. The number offers a reality check. An annualised value several times that of the market, with a posterior far from the prior, suggests that the prior is too diffuse or the model overfitted. With the Spike-and-Slab tabs, the prior scale **psi0** implies its own Sharpe ratio, and comparing the prior belief to the posterior shows how much the data have spoken. A posterior close to the prior says that they have spoken little.

## Comparing with a Two-Pass Regression

**Against Two-Pass Regression** places frequentist t-statistics beside the posterior probability that each risk price is positive. Agreement between the two for strong factors is common. Disagreement points to a factor with a large t-statistic and a posterior that stays around zero: typically a weak factor or one whose effect is absorbed by others. Those two outputs measure different quantities, since the t-statistic refers to the premium and the probability refers to the price, so disagreement alone does not settle the matter. The Fama-MacBeth Regression panel treats the premium side in more detail.

## See Also

- [Diagnostics](diagnostics.md) · [Decision Guide](decision-guide.md) · [Overview](overview.md)
