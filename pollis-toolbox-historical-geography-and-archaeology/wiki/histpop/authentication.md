# Historical Populations — Authentication

The World Cities tab of the Historical Populations panel downloads its spreadsheet from NASA's Earthdata, which asks for an account of Earthdata Login ([Reba, Reitsma and Seto (2018)](#ref-RRS2018a)). European Cities and HYDE 3.5 need no account.

## An Account of NASA Earthdata Login

Earthdata Login is the account with which NASA's Earthdata serves its files, the data of SEDAC among them. An account is made free of charge at urs.earthdata.nasa.gov. The World Cities tab of the Historical Populations panel needs it once, to download Historical Urban Population: 3700 BC - AD 2000 into the Folder; once the spreadsheet is there, the tab reads it without logging in. Two Sources, run from the European Cities tab, reads World Cities too and needs the same account.

## How Does World Cities Log In to Earthdata?

The World Cities tab sends the username and password of Earthdata Login, in an HTTP Basic header, to the method `find_or_create_token` of the User Tokens API, which returns a valid user token of the account or creates one ([National Aeronautics and Space Administration (2026)](#ref-NASA2026a)). The download then carries the token as a Bearer token. A user token is valid for 60 days, and an account holds at most two valid tokens at a time; tokens are listed and revoked in the Earthdata Login profile. The function `earthdata_token` of HistoricalGeography.jl keeps the token for the Julia session, and takes a token set as `EARTHDATA_TOKEN` in place of the password.

## Where Pollis Keeps the Earthdata Credentials

The key on the Powered by line of the Historical Populations panel asks for the username and password of Earthdata Login and keeps them in Pollis's Secret Storage, encrypted by the operating system, never in a setting or a file. When the code runs in the Julia REPL, Pollis sets them for that session as the environment variables `EARTHDATA_USERNAME` and `EARTHDATA_PASSWORD`, which the code reads; the code itself holds neither. The same key removes them.

## Running the World Cities Code Outside the Julia REPL

Code sent to an editor or a notebook does not receive the Earthdata credentials, since it is saved to a file. Before running it there, set the environment variables in the Julia session yourself, for example with `ENV["EARTHDATA_USERNAME"] = "name"` typed in the REPL and the password the same way, or set them in the shell that starts Julia. A user token made in the Earthdata Login profile can be set as `EARTHDATA_TOKEN` instead of the password, and revoked there. Writing the password or a token into a notebook that is saved or shared would leave it there ([National Aeronautics and Space Administration (2026)](#ref-NASA2026a)).

## References

<a id="ref-NASA2026a"></a>National Aeronautics and Space Administration (2026). Earthdata Login: User Token Management. [urs.earthdata.nasa.gov/documentation/for_users/user_token](https://urs.earthdata.nasa.gov/documentation/for_users/user_token)

<a id="ref-RRS2018a"></a>Reba, M., Reitsma, F. and Seto, K. C. (2018). Historical Urban Population: 3700 BC - AD 2000. NASA Socioeconomic Data and Applications Center (SEDAC). [doi:10.7927/H4ZG6QBX](https://doi.org/10.7927/H4ZG6QBX)

## See Also
- [Factsheet](factsheet.md) · [Overview](overview.md) · [World Cities](world-cities.md) · [Diagnostics](diagnostics.md)
