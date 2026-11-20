# Authentication

## The OpenTopography API Key

Every download of the OpenTopography API, of a global elevation model or of the rasters of the 3D Elevation Program, needs an API key, which a user requests through myOpenTopo in the OpenTopography portal ([OpenTopography (2026)](#ref-Ope2026a)). The key goes with each request as the parameter `API_Key`. Find Datasets in the OpenTopography panel needs no key, as the catalogue is searched without one; Global DEM and USGS 3DEP need it for each file they download, and Two Models Side by Side for the second model.

## Where Pollis Keeps the OpenTopography API Key

The key on the Powered by line of the OpenTopography panel asks for the API key and keeps it in Pollis's Secret Storage, encrypted by the operating system, never in a setting or a file. When the code runs in the Julia REPL, Pollis sets it for that session as the environment variable `OPENTOPOGRAPHY_API_KEY`, which the code reads; the code itself never holds it, and the messages of the tabs never show the address of a request, which contains it. The same key removes it.

## Access to the USGS 3DEP 1 m Elevation

The rasters of the 3D Elevation Program at 1 m are restricted to academic users, who request access to them through the OpenTopography portal; the 10 m and 30 m rasters are open to every key ([OpenTopography (2026)](#ref-Ope2026a)). With a key that has no access to the 1 m data, USGS 3DEP stops with the message of the API when its Resolution is 1 m (Academic Users).

## Running the OpenTopography Code Outside the Julia REPL

Code sent to an editor or a notebook does not receive the API key, since it is saved to a file. Before running it there, set the environment variable in the Julia session yourself, for example with `ENV["OPENTOPOGRAPHY_API_KEY"] = "..."` typed in the REPL, or set it in the shell that starts Julia. Writing the key into a notebook that is saved or shared would leave it there.

## References

<a id="ref-Ope2026a"></a>OpenTopography (2026). OpenTopography API. [portal.opentopography.org/apidocs](https://portal.opentopography.org/apidocs/)

## See Also
- [Overview](overview.md) · [Diagnostics](diagnostics.md) · [USGS 3D Elevation Program](usgs-3dep.md) · [Factsheet](factsheet.md)
