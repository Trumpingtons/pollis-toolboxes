# Line Lists

## What a Simulated Line List Contains

A line list has one row per case, with dates of infection, onset, reporting and admission, and the outcome. A contact table has one row per contact, with its case. EpiBranch.jl builds both from a simulated outbreak, with `clinical_presentation` adding the clinical course. Hospitalisation, reporting and outcome are drawn for each case from their own probabilities and delays. The panel reads the tables with `Tables.columntable`, so that its code needs no data frame package.

## What Simulated Data Are Good For

Simulated data have a known truth, so that an analysis can be tested before any real data arrive: does the estimate recover R, does the delay correction work, how fast does a report arrive? A line list of the shape the real one will have also shows up mistakes in code, which are cheaper to find at this stage. Simulated data cannot show that the analysis matches the real outbreak, however, since it contains what its own model assumed.

## Why an Outbreak Selected by Size Is Biased

The tab repeats its simulation until an outbreak ends within Smallest Outbreak and Largest Outbreak. Outbreaks chosen this way are a selected subset, whose realised R, timing and generation structure differ from those of the model that produced them. Next Steps > Chains and Offspring shows how far the realised mean and variance differ. An analysis of a selected outbreak that recovers its own values, rather than the input values, is therefore not wrong.

## Why Onset and Reporting Curves Differ

Each case is reported some delay after onset, which shifts the curve by reporting to the right of the curve by onset and spreads it out. Near the most recent date, cases already infected are not yet known, so that the last part of any real curve falls for reasons that have nothing to do with the epidemic. Next Steps > Onset and Reporting Curves shows the gap.

## How Competing Outcomes Change Fatality

A case due to die and one due to recover are in competition, so that the share who die is lower than Death Probability when recovery can come first. A simple ratio of deaths to cases during an outbreak is biased as well, because the deaths of recent cases have not yet happened. Next Steps > Reading the Line List gives the outcomes as simulated.

## See Also
- [Containment](contain.md) · [Estimating R and k](fit.md) · [Overview](overview.md) · [Interpretation](interpretation.md)
