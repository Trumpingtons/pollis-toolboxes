# Interpretation

## Reading One Person's Risk

The risk of one person is the marginal probability of being infected on a given day, given all tests and contacts. It takes in information from tests on people several steps away, as well as from before and after that day. Later tests can change an earlier risk, because a person's later positive contacts make an earlier infection more likely. Next Steps > Read the Risk of One Person gives the course over time, and how much it depends on the tests of neighbours.

## Why a Ranking Can Be Good When the Level Is Not

A risk estimate might be high across the board, or low across the board, and still rank people correctly. Ranking is what guides a limited number of tests, for which the order matters and not the level. A policy with a fixed threshold, on the other hand, such as isolating everyone above one chance in ten, does rely on the level. The two require different checks, Calibration for levels and Read the Ranking for order.

## Why Early Infections Are Hard to Place

A test today says more about the recent past than about the distant past, since many different histories fit the same current state. The candidates for the first case therefore grow in number with the wait since the outbreak began. Inference from final tests alone also has limits set by the network itself ([Antulov-Fantulin, Lančić, Šmuc, Štefančić and Šikić (2015)](#ref-ALSSS2015a)), so that a long candidate list is sometimes an honest result and not a failure.

## Which Tests Do the Most

Next Steps > Whom to Test First orders untested people by their risk. Testing people at high risk finds cases and confirms contacts, while the most informative person to test may be someone close to even odds. Testing many people on the same few contacts yields less than the number suggests, which Compare Testing Effort explores. [Baker, Biazzo, Braunstein, Catania, Dall'Asta, Ingrosso, Krzakala, Mazza, Mézard, Muntoni, Refinetti, Sarao Mannelli and Zdeborová (2021)](#ref-BBBCD...2021a) use estimated risks in this way to decide who is tested and who is quarantined.

## What a Risk Estimate Should Not Be Used For

Individual risks are model results from incomplete records, and their errors are not evenly spread: people whose contacts are recorded in more detail may look riskier. Decisions affecting a person should treat the estimate as a reason to test or to contact, and not as a finding that the person is infected. Records of contacts and tests are also sensitive, and an estimate should not be shared without care.

## References

<a id="ref-ALSSS2015a"></a>Antulov-Fantulin, N., Lančić, A., Šmuc, T., Štefančić, H. and Šikić, M. (2015). Identification of Patient Zero in Static and Temporal Networks: Robustness and Limitations. *Physical Review Letters* 114(24), 248701. [doi:10.1103/PhysRevLett.114.248701](https://doi.org/10.1103/PhysRevLett.114.248701)

<a id="ref-BBBCD...2021a"></a>Baker, A., Biazzo, I., Braunstein, A., Catania, G., Dall'Asta, L., Ingrosso, A., Krzakala, F., Mazza, F., Mézard, M., Muntoni, A. P., Refinetti, M., Sarao Mannelli, S. and Zdeborová, L. (2021). Epidemic mitigation by statistical inference from contact tracing data. *Proceedings of the National Academy of Sciences* 118(32), e2106548118. [doi:10.1073/pnas.2106548118](https://doi.org/10.1073/pnas.2106548118)

## See Also
- [Assumptions](assumptions.md) · [Diagnostics](diagnostics.md) · [Decision Guide](decision-guide.md)
