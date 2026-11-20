# Authentication

## An Account of the Copernicus Data Space Ecosystem

The download service of the Copernicus Data Space Ecosystem asks for an access token, which its identity service gives to a registered user ([Copernicus Data Space Ecosystem (2026)](#ref-CDSE2026b)). An account is free, made on the registration page of the Copernicus Data Space Ecosystem with an email address, which is the username. Find Scenes in the Copernicus Data Space panel needs no account, as the STAC catalogue is searched without one; Sentinel-2 Bands and Sentinel-1 Radar need it for every file they download.

## Where Pollis Keeps the Copernicus Data Space Credentials

The key on the Powered by line of the Copernicus Data Space panel asks for the username and the password and keeps them in Pollis's Secret Storage, encrypted by the operating system, never in a setting or a file. When the code runs in the Julia REPL, Pollis sets them for that session as the environment variables `CDSE_USERNAME` and `CDSE_PASSWORD`, which the code reads; the code itself holds neither. The panels of the Smart Regions Toolbox share the credentials, so they are set once. The same key removes them.

## The Access Token of the Copernicus Data Space Ecosystem

The code asks the token endpoint of the identity service for an access token, sending the grant type password, the public client cdse-public, the username and the password, and sends the token with each download as a bearer token in the Authorization header ([Copernicus Data Space Ecosystem (2026)](#ref-CDSE2026b)). A token lasts minutes, so the code asks for a new one for each file. An account with two-factor authentication also needs a one-time code with each request for a token, which the code does not send.

## Running the Copernicus Data Space Code Outside the Julia REPL

Code sent to an editor or a notebook does not receive the credentials, since it is saved to a file. Before running it there, set the two environment variables in the Julia session yourself, for example with `ENV["CDSE_USERNAME"] = "name@example.org"` typed in the REPL and the password the same way, or set them in the shell that starts Julia. Writing the password into a notebook that is saved or shared would leave it there.

## References

<a id="ref-CDSE2026b"></a>Copernicus Data Space Ecosystem (2026). Access Token. [documentation.dataspace.copernicus.eu/APIs/Token.html](https://documentation.dataspace.copernicus.eu/APIs/Token.html)

## See Also
- [Overview](overview.md) · [Diagnostics](diagnostics.md) · [Factsheet](factsheet.md)
