# Historical Borders — Cliopatria

Cliopatria is an open geospatial database of political entities of the world from 3400 BCE to 2024, part of the Seshat Global History Databank ([Bennett and 12 coauthors (2025)](#ref-BMTCB...2025a)).

## What Does Cliopatria Record for Each Polity?

Cliopatria is one GeoJSON file in longitude and latitude, with one or more rows for each entity. A row holds the name, the polygons, the area, the type, and a range of years from FromYear to ToYear, both included, in which the row applies. Years are whole numbers, negative for BCE. Rows can also link to a Wikipedia page, a Wikidata identifier and a Seshat polity. The polities of any year are the rows whose range holds that year, which is how the Historical Borders panel fills its year slider ([Bennett and 12 coauthors (2025)](#ref-BMTCB...2025a)).

## How Does Cliopatria Represent Kingdoms Made of Several Parts?

Cliopatria writes the name of a composite polity in parentheses, and lists its parts in the column Components. Each part names the composite in its column MemberOf. The territory of a kingdom can therefore be present twice: once as the whole and once as its members. Units in the Historical Borders panel chooses one level. Realms keeps the polities with an empty MemberOf, so the wholes and the states that belong to none. Their Parts keeps the polities whose names are outside parentheses, so the members and the same independent states. The parentheses are removed from the names shown.

## Are Personal Unions and Vassalages States in Cliopatria?

Cliopatria distinguishes rows of type POLITY from rows of type RELATION. A relation joins polities that stay distinct, as in a personal union of two crowns, a vassalage, an alliance or an allegiance, and its polygon covers territory that those polities already have. The Historical Borders panel keeps the rows of type POLITY and leaves out those of type RELATION, so that the land is drawn once and a union of crowns appears as the kingdoms it joins. The relations remain in the downloaded file for an analysis of such bonds.

## How Precise Are the Years and Borders of Cliopatria?

Cliopatria samples polities at varying time steps and spatial scales, and its authors discuss the limits that follow for construction and use ([Bennett and 12 coauthors (2025)](#ref-BMTCB...2025a)). Borders change in the file at frame years, the years sampled, so an event between two frames can show at one of them and not in the year it happened. The maintainers publish numbered releases that add polities and correct names, years and shapes, and ask for errors to be reported. The Historical Borders panel reads release 0.2.1, so that a map can be repeated.

## References

<a id="ref-BMTCB...2025a"></a>Bennett, J. S., Mutch, E., Tollefson, A., Chalstrey, E., Benam, M., Cioni, E., Reddish, J., Zsambok, J., Levine, J., Cook, C. J., Francois, P., Hoyer, D. and Turchin, P. (2025). Cliopatria - A geospatial database of world-wide political entities from 3400BCE to 2024CE. *Scientific Data* 12(1), 247. [doi:10.1038/s41597-025-04516-9](https://doi.org/10.1038/s41597-025-04516-9)

## See Also
- [Factsheet](factsheet.md) · [Overview](overview.md) · [Diagnostics](diagnostics.md) · [Decision Guide](decision-guide.md) · [Historical Basemaps](historical-basemaps.md) · [CShapes 2.0](cshapes.md)
