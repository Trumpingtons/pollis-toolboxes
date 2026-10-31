# Changing Contacts

## Why Contacts That Change Need Their Own Treatment

Real contacts differ from day to day, while a single fixed network treats yesterday's and tomorrow's contacts alike. The order of contacts carries information: person A cannot have infected person B through a meeting that came before A's own infection. Inference on a sequence of daily networks uses this order directly. The SmallCouplingDynamicCavity package takes one graph per day, and the method applies unchanged.

## How the Changing Contacts Tab Builds Its Networks

In the Changing Contacts tab, every day has a new random graph with about Contacts per Person edges for each person. From Day Contacts Change, each day has Contacts After instead. Infection and tests are the same as in Individual Risk. Next Steps > Contacts per Day shows the number of contacts each day, which is useful to confirm the change is the intended one.

## What Reduced Contacts Change in the Inference

The inference is told the contacts, and so it does not need a separate parameter for a measure that reduces contacts: lower numbers of edges from the given day on are enough. A lockdown shows as fewer paths for messages. Tests after the change then say less about people's links with those before it, since fewer contacts connect them. The comparison between Expected and Real Cases shows whether the course of the epidemic is followed through the change.

## Why Changing Contacts Help and Hinder Inference

Changing contacts bring fewer short cycles, since a pair of people meeting today may not meet tomorrow. Message-passing methods can do better on such networks, and the mean-field form fits them well. Yet each contact is seen only once, which weakens the evidence about any one path, and memory rises because each day's graph must be stored. Next Steps > Convergence shows whether messages still settle under this setting.

## Using Records of Real Contacts

Real records can replace the random graphs: `EpidemicModel` takes one graph per day, in order, together with the couplings on their edges. Contacts differ in length, and their couplings can differ too, by setting log(1 - infection) higher for long contacts. Records usually have gaps, and a day with no records should be read as a day without data, which is not the same as a day without contacts. Treating them alike lowers the risk of everyone that day.

## See Also
- [Individual Risk](risk.md) · [First Cases](source.md) · [Overview](overview.md) · [Assumptions](assumptions.md)
