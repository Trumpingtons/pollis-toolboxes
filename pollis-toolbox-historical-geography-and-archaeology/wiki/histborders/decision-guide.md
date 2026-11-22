# Historical Borders — Decision Guide

The choices of the Historical Borders panel are the source, the level of the units, the area and the years.

## Which Source of Historical Borders Should I Use?

| Question | Tab | Reason |
|---|---|---|
| How did the states of an area change over several centuries? | Cliopatria | One dataset by ranges of years, from 3400 BCE to 2024 |
| What did the map look like in a well-known year? | Historical Basemaps | A world map made for that year, where the project has one |
| How did borders change in the late 19th or the 20th century? | CShapes 2.0 | Dated changes of states and dependencies from 1886 to 2019 |
| Does a finding depend on the source? | Two tabs in turn | The datasets were compiled separately |
| What happened after 2019? | Cliopatria | Records to 2024 |

## Should I Choose Realms or Their Parts?

Realms, in the Cliopatria tab, draws the polities that are inside no other: a kingdom, empire or independent state once, as a whole, standing for the duchies, counties and other members Cliopatria places within it. Realms suits a map of Europe, a count of states and the areas of great powers. Their Parts leaves out those wholes and draws the members, so that a county or house with lands of its own is seen separately. Their Parts suits the history of a region inside a composite monarchy or empire, where Cliopatria maps such members. Where a polity has no members in the dataset, both levels draw it alike ([Bennett and 12 coauthors (2025)](#ref-BMTCB...2025a)).

## Which Box and Years Should I Choose for a Local History?

For the history of a town or region, set Place to its longitude and latitude, and choose a Box that also holds the states that competed for it, usually a country and its neighbours. A small Box makes a lighter map and a shorter list in States of the Year, while areas are then cut at its edges. Set From and Until to the period of interest. Run the Example Code, watch the slider, then use History of a Place for the succession of states and Years of Change to see how finely the source dates that period. Near a border, try a point on each side: a point stands for one spot and may miss that the territory of a municipality was divided.

## How Should I Cite a Map Made With Historical Borders?

A map made with Historical Borders should name the dataset, its version and the year shown. The Cliopatria tab reads version 0.2.1 of Cliopatria, whose paper is the work to cite ([Bennett and 12 coauthors (2025)](#ref-BMTCB...2025a)). The Historical Basemaps tab reads a fixed commit of the historical-basemaps repository, named in the Example Code ([Ourednik (2026)](#ref-Our2026b)). The CShapes 2.0 tab reads the file CShapes-2.0 from ETH Zurich, described in the paper of its authors ([Schvitz, Girardin, Rüegger, Weidmann, Cederman and Gleditsch (2022)](#ref-SGRWC...2022a)). The map's attribution also names OpenFreeMap and OpenStreetMap for the land beneath. Saying whether Realms or Their Parts was chosen lets a reader repeat the map.

## References

<a id="ref-BMTCB...2025a"></a>Bennett, J. S., Mutch, E., Tollefson, A., Chalstrey, E., Benam, M., Cioni, E., Reddish, J., Zsambok, J., Levine, J., Cook, C. J., Francois, P., Hoyer, D. and Turchin, P. (2025). Cliopatria - A geospatial database of world-wide political entities from 3400BCE to 2024CE. *Scientific Data* 12(1), 247. [doi:10.1038/s41597-025-04516-9](https://doi.org/10.1038/s41597-025-04516-9)

<a id="ref-Our2026b"></a>Ourednik, A. (2026). Historical boundaries of world countries and cultural regions (historical-basemaps). [github.com/aourednik/historical-basemaps](https://github.com/aourednik/historical-basemaps)

<a id="ref-SGRWC...2022a"></a>Schvitz, G., Girardin, L., Rüegger, S., Weidmann, N. B., Cederman, L.-E. and Gleditsch, K. S. (2022). Mapping the international system, 1886-2019: the CShapes 2.0 dataset. *Journal of Conflict Resolution* 66(1), 144-161. [doi:10.1177/00220027211013563](https://doi.org/10.1177/00220027211013563)

## See Also
- [Factsheet](factsheet.md) · [Overview](overview.md) · [Diagnostics](diagnostics.md) · [Cliopatria](cliopatria.md) · [Historical Basemaps](historical-basemaps.md) · [CShapes 2.0](cshapes.md)
