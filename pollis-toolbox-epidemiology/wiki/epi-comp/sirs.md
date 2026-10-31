# SIRS

## The SIRS Equations

SIRS returns recovered people to the susceptible state at a waning rate xi:

- dS/dt = -beta S I / N + xi R
- dI/dt = beta S I / N - gamma I
- dR/dt = gamma I - xi R

The mean length of immunity is 1 / xi. R0 is again beta / gamma, since waning does not change what happens when one case arrives among susceptible people. The problem of endemic persistence was treated early by [Kermack and McKendrick (1932)](#ref-KM1932a).

## What the SIRS Endemic Level Is

Above the threshold, the susceptible share settles at S* / N = 1 / R0, as it does in all such models. The rest divide between infectious and recovered in proportion to their residence times: I* / N = (1 - 1 / R0) xi / (xi + gamma). Long immunity compared with the infectious period therefore means a low endemic level. As xi becomes large, the model approaches SIS.

## Why SIRS Waves Damp Down

After a first wave, the infection is rare until enough people have lost immunity. A smaller second wave follows, and later waves shrink further until the curve settles at the endemic level. Damped oscillations of this kind have a period set by the infectious and immune periods. Persistent waves do not come from this model alone, since sustained cycles need something more, such as seasonal forcing or stochastic effects ([Keeling and Rohani (2008)](#ref-KR2008a)).

## What Limits SIRS as a Model of Waning Immunity

A person loses immunity at a constant rate here, and is fully protected until the moment of loss, then entirely susceptible. Real immunity declines gradually and partly protects against severe disease, and new variants can bring a sudden loss. A chain of partly immune stages is the usual extension. SIRS is therefore good for a first view of long-run burden, but does not reproduce the timing of real waves.

## References

<a id="ref-KR2008a"></a>Keeling, M. J. and Rohani, P. (2008). *Modeling Infectious Diseases in Humans and Animals*. Princeton University Press. [doi:10.1515/9781400841035](https://doi.org/10.1515/9781400841035)

<a id="ref-KM1932a"></a>Kermack, W. O. and McKendrick, A. G. (1932). Contributions to the Mathematical Theory of Epidemics. II. The Problem of Endemicity. *Proceedings of the Royal Society A* 138(834), 55–83. [doi:10.1098/rspa.1932.0171](https://doi.org/10.1098/rspa.1932.0171)

## See Also
- [SIS](sis.md) · [SIR](sir.md) · [Interpretation](interpretation.md) · [Decision Guide](decision-guide.md)
