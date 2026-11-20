# Authentication

## An Account of the USGS EROS Registration System

Every request of the Machine-to-Machine (M2M) API of USGS EarthExplorer, a search as much as a download, is made with an API key that the API gives to a registered user ([U.S. Geological Survey (2026)](#ref-USGS2026a)). The USGS EarthExplorer panel therefore needs three things: an account of the EROS Registration System, made free of charge on its registration page; access to the M2M API, requested from the profile of that account and granted by the U.S. Geological Survey; and an application token, made in the same profile. All three tabs, Find Scenes included, log in before they search.

## The Application Token of the M2M API

An application token is made in the profile of the EROS Registration System, and is sent with the username to the endpoint login-token of the M2M API, which answers with the API key of the session; the login with a password was deprecated in February 2025 ([U.S. Geological Survey (2025)](#ref-USGS2025a)). A token can be revoked in the profile without changing the password of the account. The USGS EarthExplorer panel sends the API key in the header X-Auth-Token of each request, and ends the session with the endpoint logout once its downloads are done ([U.S. Geological Survey (2026)](#ref-USGS2026a)).

## Where Pollis Keeps the USGS EarthExplorer Credentials

The key on the Powered by line of the USGS EarthExplorer panel asks for the username and the application token and keeps them in Pollis's Secret Storage, encrypted by the operating system, never in a setting or a file. When the code runs in the Julia REPL, Pollis sets them for that session as the environment variables `USGS_USERNAME` and `USGS_TOKEN`, which the code reads; the code itself holds neither. The same key removes them. The password of the account is never asked for.

## Running the USGS EarthExplorer Code Outside the Julia REPL

Code sent to an editor or a notebook does not receive the credentials, since it is saved to a file. Before running it there, set the two environment variables in the Julia session yourself, for example with `ENV["USGS_USERNAME"] = "name"` typed in the REPL and the token the same way, or set them in the shell that starts Julia. Writing the token into a notebook that is saved or shared would leave it there; a token that has been shared can be revoked in the profile of the EROS Registration System ([U.S. Geological Survey (2025)](#ref-USGS2025a)).

## References

<a id="ref-USGS2025a"></a>U.S. Geological Survey (2025). M2M Application Token Documentation. [www.usgs.gov/media/files/m2m-application-token-documentation](https://www.usgs.gov/media/files/m2m-application-token-documentation)

<a id="ref-USGS2026a"></a>U.S. Geological Survey (2026). Machine-to-Machine (M2M) API. [m2m.cr.usgs.gov](https://m2m.cr.usgs.gov/)

## See Also
- [Overview](overview.md) · [The M2M API](m2m-api.md) · [Diagnostics](diagnostics.md) · [Factsheet](factsheet.md)
