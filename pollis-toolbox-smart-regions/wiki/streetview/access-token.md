# Access Token

## The Token the Mapillary Street-Level Viewer Needs

Both halves of the Mapillary Street-Level Viewer need a Mapillary client access token: the Julia code, to search the images and read their fields, and the viewer, to load the images and the coverage tiles into the page ([Mapillary (2026)](#ref-Map2026a); [Mapillary (2023)](#ref-Map2023a)). A client access token comes from the developer dashboard of Mapillary once an application is registered there. The key on the Powered by line asks for it and keeps it in Pollis's Secret Storage, and the Julia REPL receives it as the variable `MAPILLARY_ACCESS_TOKEN`. Mapillary Street-Level Imagery uses the same key, so one token serves both panels.

## The Token Goes into the Output of the Viewer

`Pollis.streetview` writes the token into its output beside the id of the image, since the viewer runs in the page of the plot pane or of the notebook and asks Mapillary for the images itself. The documentation of the Mapillary API warns that whoever obtains a client token can make requests on behalf of its application ([Mapillary (2026)](#ref-Map2026a)). A notebook saved with a viewer among its outputs therefore keeps the token in its file: clear the outputs, or that of the cell, before sharing or committing the notebook.

## How the Panel Sends the Token

The code of the tabs sends the token in the header `Authorization: OAuth` of each search and image request, so that it never appears in an address, and the messages of the tabs show only Mapillary's answer ([Mapillary (2026)](#ref-Map2026a)). The viewer hands the token to MapillaryJS, which sends it with its own requests for the images ([Mapillary (2023)](#ref-Map2023a)). The coverage map adds it as the parameter `access_token` of the address of each tile, the way the documentation of the API gives for vector tiles. The thumbnails and images the Next Steps download come from the addresses the API returns, without the token.

## Running the Viewer Code in an Editor or a Notebook

Code sent to an editor or to a notebook is saved to a file without the token, and runs in a Julia session that may not have it. There the tabs stop with a message asking for it. Set `ENV["MAPILLARY_ACCESS_TOKEN"]` in that session first, from its REPL or from the shell that starts Julia, or give the token to `Pollis.streetview` with its keyword `token`. A viewer given no token opens empty, with a message over it, rather than failing.

## References

<a id="ref-Map2023a"></a>Mapillary (2023). MapillaryJS: Interactive, Extendable Street Imagery Map Experiences in the Browser. Version 4.1.2. [github.com/mapillary/mapillary-js](https://github.com/mapillary/mapillary-js)

<a id="ref-Map2026a"></a>Mapillary (2026). Mapillary API Documentation. [www.mapillary.com/developer/api-documentation](https://www.mapillary.com/developer/api-documentation)

## See Also
- [Factsheet](factsheet.md) · [Diagnostics](diagnostics.md) · [Using the Viewer](viewer.md) · [Overview](overview.md)
