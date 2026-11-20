# Authentication

## The LTA DataMall Account Key

The bus trips and bus stops of Singapore come from LTA DataMall, the open data portal of the Land Transport Authority, whose API answers only requests that carry an account key ([Land Transport Authority (2026)](#ref-LTA2026a)). The key is free: it is requested on the DataMall site and sent by email. Only Singapore needs it, on Trips and Spatial Interaction; every other city of Mobility and Flows, and Air Traffic, reads open files that need no account. The planning areas of Singapore come from data.gov.sg, which needs no key either ([Urban Redevelopment Authority (2026)](#ref-URA2026a)).

## Where Pollis Keeps the LTA DataMall Account Key

The key on the Powered by line of Mobility and Flows asks for the LTA DataMall account key and keeps it in Pollis's Secret Storage, encrypted by the operating system, never in a setting or a file. When the code of the panel runs in the Julia REPL, Pollis sets the key for that session as the environment variable `LTA_ACCOUNT_KEY`, which the code reads. Without it, the code stops at its first line for Singapore with a message that names the variable. The same key on the Powered by line removes the account key.

## How Mobility and Flows Sends the LTA DataMall Account Key

Mobility and Flows sends the account key in the header `AccountKey` of each request to LTA DataMall, as the API expects ([Land Transport Authority (2026)](#ref-LTA2026a)): the pages of bus stops, five hundred at a time, and the request for the month's passenger volume. That request returns a link to a zip file, valid for a short time, which the panel downloads without the key and keeps in the folder mobility. The pages of bus stops are kept there too, so later runs of the same month ask DataMall only for the link.

## Running the Singapore Code Outside the Julia REPL

Code sent to an editor or a notebook does not receive the account key, since it is saved to a file. Before running it there, set the environment variable in the Julia session yourself, for example with `ENV["LTA_ACCOUNT_KEY"] = "..."` typed in the REPL, or set it in the shell that starts Julia. Writing the key into a notebook that is saved or shared would leave it there for anyone who opens the file.

## References

<a id="ref-LTA2026a"></a>Land Transport Authority (2026). LTA DataMall. [datamall.lta.gov.sg](https://datamall.lta.gov.sg/content/datamall/en.html)

<a id="ref-URA2026a"></a>Urban Redevelopment Authority (2026). Master Plan 2025 Planning Area Boundary (No Sea). [data.gov.sg](https://data.gov.sg/datasets/d_2cc750190544007400b2cfd5d7f53209/view)

## See Also
- [Trip Data](trips-data.md) · [Diagnostics](diagnostics.md) · [Overview](overview.md) · [Factsheet](factsheet.md)
