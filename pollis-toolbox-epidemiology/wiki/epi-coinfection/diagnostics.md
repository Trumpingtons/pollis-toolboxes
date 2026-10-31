# Diagnostics

## How Much of a Coinfection Result Is Chance

Coinfection runs differ widely, since strains can die out early by chance. Next Steps > Run-to-Run Variation repeats a run with the same settings and shows how the peaks vary. A difference between scenarios means little unless it exceeds this variation. Near the threshold, in particular, a single run can mislead about which strain does better.

## Is Coinfection Above What Chance Would Give

Next Steps > Coinfection Against Chance compares coinfected hosts with the number expected if the two strains ignored each other, I1 x I2 / N. [Hamelin, Allen, Bokil, Gross, Hilker, Jeger, Manore, Power, Rúa and Cunniffe (2019)](#ref-HABGH...2019a) warn that pathogens with no interaction need not be independent. A difference from this number is therefore not proof of an interaction, and should be judged against a run with all interactions set to 1.

## Reading the Interaction Matrix

Next Steps > Interaction Matrix and Matrix Summary show what was actually drawn. The matrix should be looked at before the results: with few strains, a random draw can be mostly competitive or mostly facilitative, whatever share was asked for. Several draws of the matrix are needed for any statement about the setting rather than about one draw, and the Compare actions use them.

## Did a Strain Really Establish

A strain seeded late, or with low transmission, can fail to spread for reasons that have nothing to do with interactions. Next Steps > Still Circulating shows the chance that each strain lasts to the last step, while Strains Still Circulating counts them in a community. Take care with the run's length: an SIR epidemic will end anyway, so that being gone at the last step means little without births.

## Checking the Sampled Survey

Next Steps > Sensitivity and Specificity gives, for each strain, the share of steps circulating that were detected and of steps absent that were not. Both depend on sampling and on test errors. A strain at low prevalence is often missed even with a perfect test, since no infected host may be in the sample. Report results at the level of the survey and not only of the test.

## References

<a id="ref-HABGH...2019a"></a>Hamelin, F. M., Allen, L. J. S., Bokil, V. A., Gross, L. J., Hilker, F. M., Jeger, M. J., Manore, C. A., Power, A. G., Rúa, M. A. and Cunniffe, N. J. (2019). Coinfections by noninteracting pathogens are not independent and require new tests of interaction. *PLOS Biology* 17(12), e3000551. [doi:10.1371/journal.pbio.3000551](https://doi.org/10.1371/journal.pbio.3000551)

## See Also
- [Assumptions](assumptions.md) · [Interpretation](interpretation.md) · [Overview](overview.md)
