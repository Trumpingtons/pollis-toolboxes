# Credits and Limits

## Daily Credits of the OpenSky API

Every request to the OpenSky API costs credits, except the state vectors of a user's own receivers, and the credits are counted in three separate buckets: one for state vectors, one for tracks and one for flights ([The OpenSky Network (2026)](#ref-OSN2026a)). Spending the credits of one bucket leaves the others as they were. Each tier of user has the same allowance in each bucket:

| Tier | Credits | Refill |
|---|---|---|
| Anonymous, counted by IP address | 400 | Daily |
| Standard user | 4,000 | Daily |
| Active feeder, a receiver up at least 30% of the month | 8,000 | Daily |
| Licensed user | 14,400 | Hourly |

The panel prints the credits left in the bucket it used, from the header `X-Rate-Limit-Remaining` of the answer.

## The Cost of Each Request

The credits a request of state vectors costs grow with the area of its box, in square degrees, the range of latitude times the range of longitude, and requests of flights and tracks cost by the calendar days their interval spans ([The OpenSky Network (2026)](#ref-OSN2026a)):

| Box of `states/all` | Credits |
|---|---|
| Up to 25 square degrees | 1 |
| 25 to 100 | 2 |
| 100 to 400 | 3 |
| Over 400, or the whole world | 4 |

| Days of `flights` and `tracks` | Credits |
|---|---|
| Live, or under 24 hours | 4 |
| 1 to 2 | 30 |
| 3 to 10 | 60 a day |
| 11 to 15 | 120 a day |
| 16 to 20 | 240 a day |
| 21 to 25 | 480 a day |
| Over 25 | 960 a day |

## Time Limits of Anonymous and Authenticated Users

The OpenSky API limits how far back each user can reach ([The OpenSky Network (2026)](#ref-OSN2026a)). An anonymous user receives only the most recent state vectors, and cannot ask for flights: the API refuses those requests. A user authenticated with an API client can ask for state vectors of any moment in the last hour, for flights of past days, and for tracks of the last 30 days. Flights by Airport therefore needs an API client, and so does Aircraft Track with a past Time; Live Aircraft and the live track of Aircraft Track work without one, and use the client when it is set, drawing on its larger allowance.

## When the Credits of the OpenSky API Run Out

When the credits of a bucket are spent, the OpenSky API answers with HTTP 429, Too Many Requests, and the header `X-Rate-Limit-Retry-After-Seconds` gives the seconds until it accepts requests again ([The OpenSky Network (2026)](#ref-OSN2026a)). The panel stops with a message naming the bucket, states, flights or tracks, and the hours until the refill. The other tabs, which draw on other buckets, still work. Flights by Airport keeps the days it downloaded in the folder opensky, so running it again on the same Airport and Day costs nothing.

## Credits the Next Steps of Air Traffic Use

Most Next Steps of Air Traffic work on the table the tab has read and make no request. Three make more. Snapshots over Time asks for the state vectors of the area four more times, a minute apart. A Week Before asks for the arrivals and the departures of the day a week earlier, unless they are already in the folder opensky. Aircraft Track with Aircraft set to nearest asks for the state vectors of the area once, then for the track of up to five aircraft, until one has a track. The cost of each follows the tables of the cost of each request ([The OpenSky Network (2026)](#ref-OSN2026a)).

## References

<a id="ref-OSN2026a"></a>The OpenSky Network (2026). The OpenSky REST API. [openskynetwork.github.io/opensky-api](https://openskynetwork.github.io/opensky-api/rest.html)

## See Also
- [Authentication](authentication.md) · [State Vectors](state-vectors.md) · [Flights by Airport](flights-by-airport.md) · [Aircraft Tracks](aircraft-tracks.md) · [Factsheet](factsheet.md)
