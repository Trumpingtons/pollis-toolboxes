# Historical Borders — Historical Basemaps

Historical Basemaps is the tab of the Historical Borders panel for historical-basemaps, a collection by André Ourednik of georeferenced boundaries of world countries and cultural regions at chosen years ([Ourednik (2026)](#ref-Our2026b)).

## Which Years Do the Maps of Historical Basemaps Cover?

The historical-basemaps project publishes one GeoJSON file for each year mapped, from prehistory to 2010, closer together in recent centuries and around well-known turning points. The Historical Borders panel uses the maps from the year 100 onwards. It shows each map from its year until the year before the next map, and the last map in its own year only. A map of a year in between is therefore the latest snapshot before it, and the popup of a state gives the years over which that snapshot is shown.

## What Does Border Precision Mean in Historical Basemaps?

| BORDERPRECISION | Meaning |
|---|---|
| 1 | An approximate border |
| 2 | A moderately precise border |
| 3 | A border determined by international law |

The project suggests drawing approximate borders blurred or transparent, as overlaps and fuzzy limits are part of the history of pre-modern societies ([Ourednik (2026)](#ref-Our2026b)). The geometry is made for maps of the world and of continents. The project describes itself as work in progress and asks that its maps be checked against other sources before academic use.

## Which Names Does Historical Basemaps Give?

| Column | Meaning |
|---|---|
| NAME | The name of the country or region, which the Historical Borders panel shows |
| SUBJECTO | The colonial power exercising authority on the country or region, or otherwise the region itself |
| PARTOF | The larger cultural area of which the region is part |
| BORDERPRECISION | How precise the border is, from 1 to 3 |

Cultural regions and peoples without a state have shapes beside countries, so a count of names in Historical Basemaps counts more than sovereign states in some periods. Shapes without a name are left out of the Historical Borders map ([Ourednik (2026)](#ref-Our2026b)).

## References

<a id="ref-Our2026b"></a>Ourednik, A. (2026). Historical boundaries of world countries and cultural regions (historical-basemaps). [github.com/aourednik/historical-basemaps](https://github.com/aourednik/historical-basemaps)

## See Also
- [Factsheet](factsheet.md) · [Overview](overview.md) · [Diagnostics](diagnostics.md) · [Decision Guide](decision-guide.md) · [Cliopatria](cliopatria.md) · [CShapes 2.0](cshapes.md)
