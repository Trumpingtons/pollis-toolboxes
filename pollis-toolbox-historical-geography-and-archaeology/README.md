# Historical Geography and Archaeology Toolbox

**Historical Geography and Archaeology: The Past on the Map.** The borders, places and landscapes of the past, read from open data and mapped in Julia. For historians, archaeologists, heritage officers and museums, and for the municipalities and regional authorities whose places have history attached.

Installing it adds the **Historical Geography and Archaeology** submenu to the end of the **Extend** menu; its **Edit** button in the Installed section of the Extensions pane moves it, or any of its panels, to another menu. Each panel has key points, a decision table, example code you can send to the Julia REPL or a notebook, reference wikis and Next Steps.

## Panels

| Panel | What it covers | Powered by |
|---|---|---|
| Historical Borders | The states of an area on a map with a year slider and a Play button, Europe from 1300 by default: the polities of Cliopatria from 3400 BCE to 2024, as realms or as their parts, the world maps of historical-basemaps at chosen years from 100 to 2010, and the states and dependencies of CShapes 2.0 from 1886 to 2019; with the states that held a place over the centuries, the years in which each source changes a border, two years side by side, and export to GeoParquet | [DuckDB.jl](https://github.com/duckdb/DuckDB.jl), [Tables.jl](https://github.com/JuliaData/Tables.jl) |

The menu also lists, greyed, Old Maps, Historical Populations, Historical Episodes, Sites and Monuments, and Landscape Analysis.

## Requirements

Julia. Each panel lists the Julia packages it uses on its Powered by line and offers to install the missing ones. The panels read geographic files through DuckDB's spatial extension, which Pollis downloads from DuckDB's repository when the toolbox is installed, and keeps if the toolbox is uninstalled. Historical Borders needs the Internet to download each source once into its Folder, and for the base map under the slider.

The data belong to their authors, whose terms apply: [Cliopatria](https://github.com/Seshat-Global-History-Databank/cliopatria), [historical-basemaps](https://github.com/aourednik/historical-basemaps) and [CShapes 2.0](https://icr.ethz.ch/data/cshapes/).

## License

AGPL-3.0
