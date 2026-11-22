# Historical Borders — Diagnostics

The Historical Borders panel reports what its sources record. The checks below tell a change in history from a property of the data.

## Why Does the Map Stay the Same for Many Years?

The slider of Historical Borders moves one year at a time, while each source has its own years of change. Cliopatria samples polities at varying time steps and gives each shape a range of years, so a change can appear at the next year sampled and later than it happened ([Bennett and 12 coauthors (2025)](#ref-BMTCB...2025a)). Historical Basemaps has maps at chosen years, and the panel shows each until the next. CShapes 2.0 dates each change, from 1886. Years of Change lists, by century, the years in which a shape starts or stops in the Box. A shape is clipped to the Box after reading, so a change outside the Box can also be listed. Between two years listed, the source says nothing new.

## Why Do Two States Overlap on the Map?

States can share land in a source because their rights overlapped, because a smaller polity lies on a larger one that was drawn without a hole, or because outlines digitised separately do not meet exactly. Overlapping States lists the pairs that share at least 100 square kilometres in Year, largest first, with the area shared. A very large overlap usually calls for a look at both shapes in Map of the Year and in a history of the region. In the Cliopatria tab, Realms and Their Parts are never drawn together, and relations such as personal unions are left out, as both would repeat the territory of the polities they join ([Bennett and 12 coauthors (2025)](#ref-BMTCB...2025a)).

## Why Is a Name or Date Different From My History Book?

Each dataset follows conventions of its own for the name of a state, the year it begins and whether a dependency is separate. A name can be a modern label for a historical polity, and one state can change name between two shapes, which History of a Place then lists as two states and Two Years as one state lost and one gained. The maintainers of Cliopatria say that their maps reflect one version of the territory held by past polities, and that users should judge their suitability for each purpose ([Bennett and 12 coauthors (2025)](#ref-BMTCB...2025a)). Setting a second tab beside the first, and both beside a regional history, shows which statements depend on the source.

## Why Are Coasts, Small States or Areas Not Exact?

Global datasets of historical borders are drawn for maps of continents, so city states, enclaves and small islands can be coarse or absent. Shorelines, rivers and lakes change over the centuries, while the base map shows those of today ([Ourednik (2026)](#ref-Our2026b)). The year slider draws simplified shapes, and very small territories can disappear from it. Map of the Year, the areas and Save as GeoParquet use the shapes as the source gives them. An area from Historical Borders counts only the land inside the Box, so compare areas between years only for states that lie within it, or widen the Box.

## References

<a id="ref-BMTCB...2025a"></a>Bennett, J. S., Mutch, E., Tollefson, A., Chalstrey, E., Benam, M., Cioni, E., Reddish, J., Zsambok, J., Levine, J., Cook, C. J., Francois, P., Hoyer, D. and Turchin, P. (2025). Cliopatria - A geospatial database of world-wide political entities from 3400BCE to 2024CE. *Scientific Data* 12(1), 247. [doi:10.1038/s41597-025-04516-9](https://doi.org/10.1038/s41597-025-04516-9)

<a id="ref-Our2026b"></a>Ourednik, A. (2026). Historical boundaries of world countries and cultural regions (historical-basemaps). [github.com/aourednik/historical-basemaps](https://github.com/aourednik/historical-basemaps)

## See Also
- [Factsheet](factsheet.md) · [Overview](overview.md) · [Decision Guide](decision-guide.md) · [Cliopatria](cliopatria.md) · [Historical Basemaps](historical-basemaps.md) · [CShapes 2.0](cshapes.md)
