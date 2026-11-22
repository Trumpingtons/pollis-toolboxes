# Authentication

## The OpenSky API Client

The OpenSky API authenticates users with the OAuth2 client credentials flow, and no longer accepts a username and password ([The OpenSky Network (2026)](#ref-OSN2026a)). An API client is created on the Account page of an OpenSky Network account, which gives its client id and client secret. Flights by Airport needs one, and so does Aircraft Track for a past flight; Live Aircraft and live tracks work without one, as an anonymous user, with smaller daily credits. The airports file of OurAirports, which Flights by Airport also reads, needs no account ([OurAirports (2026)](#ref-Our2026a)).

## Where Pollis Keeps the OpenSky API Client

The key on the Powered by line of Air Traffic asks for the client id and the client secret of the API client and keeps them in Pollis's Secret Storage, encrypted by the operating system, never in a setting or a file. When the code of the panel runs in the Julia REPL, Pollis sets them for that session as the environment variables `OPENSKY_CLIENT_ID` and `OPENSKY_CLIENT_SECRET`, which the code reads. Without them, a request that needs the client stops before it is sent, with a message that names the variables. The same key on the Powered by line removes the client.

## The Access Token of the OpenSky Network

The OpenSky API does not take the client id and secret with each request: they are exchanged at the token address of the OpenSky Network for an access token, which is sent in the header `Authorization` of every request as a bearer token, and which expires after 30 minutes ([The OpenSky Network (2026)](#ref-OSN2026a)). OpenSky Network asks for a token at the first request that uses the client and keeps it for 25 minutes, then asks for a new one, so a long series of requests, such as Snapshots over Time, does not run past its expiry.

## Running the OpenSky Code Outside the Julia REPL

Code sent to an editor or a notebook does not receive the API client, since it is saved to a file. Before running it there, set the two environment variables in the Julia session yourself, for example with `ENV["OPENSKY_CLIENT_ID"] = "..."` and `ENV["OPENSKY_CLIENT_SECRET"] = "..."` typed in the REPL, or set them in the shell that starts Julia. Writing the client secret into a notebook that is saved or shared would leave it there for anyone who opens the file.

## References

<a id="ref-OSN2026a"></a>The OpenSky Network (2026). The OpenSky REST API. [openskynetwork.github.io/opensky-api](https://openskynetwork.github.io/opensky-api/rest.html)

<a id="ref-Our2026a"></a>OurAirports (2026). OurAirports open data. [ourairports.com/data](https://ourairports.com/data/)

## See Also
- [Credits and Limits](credits-limits.md) · [Flights by Airport](flights-by-airport.md) · [Overview](overview.md) · [Factsheet](factsheet.md)
