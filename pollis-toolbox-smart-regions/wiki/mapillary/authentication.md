# Authentication

## The Mapillary Client Access Token

Every request to the Mapillary API, for vector tiles or for entities, must be authorised with an access token ([Mapillary (2026)](#ref-Map2026a)). A client access token identifies the application that generated it, and is obtained from the developer dashboard of Mapillary once an application is registered there; a user access token, obtained through the OAuth flow, also authenticates the user. The Mapillary Street-Level Imagery panel uses a client access token for all three tabs. The documentation warns that someone who steals a client token can make requests on behalf of its application, so the token is best kept private.

## Where Pollis Keeps the Mapillary Access Token

The key on the Powered by line of the Mapillary Street-Level Imagery panel asks for the client access token and keeps it in Pollis's Secret Storage, encrypted by the operating system, never in a setting or a file. When the code runs in the Julia REPL, Pollis sets it for that session as the environment variable `MAPILLARY_ACCESS_TOKEN`, which the code reads; the messages of the tabs never show the address of a request. The same key removes it.

## How the Mapillary Panel Sends the Token

The Mapillary API accepts a token in two ways: as the parameter `access_token` of the address, the method it prefers for vector tiles, or in the header `Authorization: OAuth`, which works for the calls of the entity endpoints ([Mapillary (2026)](#ref-Map2026a)). Coverage sends the token as the parameter of each tile it downloads. Images and Map Features send it in the header of each search. The thumbnails of the images are downloaded from the addresses the image search returns, without the token.

## Running the Mapillary Code Outside the Julia REPL

Code sent to an editor or a notebook does not receive the access token, since it is saved to a file. Before running it there, set the environment variable in the Julia session yourself, for example with `ENV["MAPILLARY_ACCESS_TOKEN"] = "..."` typed in the REPL, or set it in the shell that starts Julia. Writing the token into a notebook that is saved or shared would leave it there.

## References

<a id="ref-Map2026a"></a>Mapillary (2026). Mapillary API Documentation. [www.mapillary.com/developer/api-documentation](https://www.mapillary.com/developer/api-documentation)

## See Also
- [Overview](overview.md) · [Diagnostics](diagnostics.md) · [Coverage Tiles](coverage-tiles.md) · [Factsheet](factsheet.md)
