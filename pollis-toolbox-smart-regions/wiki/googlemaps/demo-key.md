# The Demo Key

## Getting a Maps Demo Key

A Maps Demo Key comes from the Maps Demo Key page of Google Maps Platform, with the button Get a Demo Key, once the user is signed in with a Google Account and has accepted the key's terms ([Google (2026c)](#ref-Goo2026c)). The key is shown at once, and Google also sends an email saying how to find it again in the Google Cloud console. Only a personal Google Account, such as a gmail.com address, is eligible: Google Workspace accounts of companies and universities are not. The key is not available in the territories Google prohibits, which Google judges from the user's IP address and the location of the Google Account. Google AI Studio can also create a Maps Demo Key for its prototypes ([Google (2026d)](#ref-Goo2026d)).

## What the Maps Demo Key Is Meant For

Google describes the Maps Demo Key as technically an API key that supports a limited set of features, intended for testing and prototyping, not for production use ([Google (2026c)](#ref-Goo2026c)). The Maps Demo Project Terms of Service say that the project is intended solely for evaluation and testing, and that production use is strictly prohibited ([Google (2026f)](#ref-Goo2026f)). The same terms let Google adjust the usage limits or end access to the project at any time, and make the user who created the project responsible for everything done with it. A map in a published report, a public website or a service for others therefore needs a standard API key on a project with billing, not the Demo Key.

## The Daily Limit of the Maps Demo Key

Google's page on Google Maps Platform in AI Studio gives the daily limit of a Maps Demo Key as 100 calls per day per API, against the production quotas of a key on a billed project ([Google (2026d)](#ref-Goo2026d)). The Maps Demo Key page adds that the limits may change, and that when the daily limit is reached, usage is paused until the following day, with no risk of charges ([Google (2026c)](#ref-Goo2026c)). The Maps JavaScript API counts its use in map loads, the same way for 2D and 3D maps ([Google (2026g)](#ref-Goo2026g)). Each tab of the Google Maps panel opens one map; Every Map Type opens four, and Two Map Types Side by Side two.

## Where Pollis Keeps the Maps Demo Key

The key on the Powered by line of the Google Maps panel asks for the Maps Demo Key and keeps it in Pollis's Secret Storage, and the Julia REPL receives it as the variable `GOOGLE_MAPS_API_KEY`. The Example Code stops with a message when the variable is missing. A page of the panel loads the Maps JavaScript API with the key in the address of its script, as the documentation of the API loads it ([Google (2026a)](#ref-Goo2026a)), so the key is written into every page. The pages go to a temporary folder that Julia removes when it exits, and should not be copied elsewhere or shared. Code run in an editor or a notebook needs `ENV["GOOGLE_MAPS_API_KEY"]` set in that Julia session first.

## Moving from the Maps Demo Key to a Standard Key

When a project needs more than the Demo Key allows, Google gives two ways: adding a billing account to the Maps Demo Key, or creating a new API key on a project with billing ([Google (2026c)](#ref-Goo2026c)). According to Google's page on AI Studio, an existing Demo Key keeps working after billing is added, so code that uses it needs no change ([Google (2026d)](#ref-Goo2026d)). With billing, the use of the Maps JavaScript API is charged by map loads under the Dynamic Maps SKU ([Google (2026g)](#ref-Goo2026g)), and the Google Maps Platform Terms of Service apply in full ([Google (2026e)](#ref-Goo2026e)). The Google Maps panel works the same with either key, read from `GOOGLE_MAPS_API_KEY`.

## References

<a id="ref-Goo2026a"></a>Google (2026a). Maps JavaScript API Documentation. [developers.google.com/maps/documentation/javascript](https://developers.google.com/maps/documentation/javascript)

<a id="ref-Goo2026c"></a>Google (2026c). Get a Maps Demo Key and Use It with Google Maps Platform. [developers.google.com/maps/demo-key](https://developers.google.com/maps/demo-key)

<a id="ref-Goo2026d"></a>Google (2026d). Google Maps Platform in AI Studio. [developers.google.com/maps/ai/ai-studio](https://developers.google.com/maps/ai/ai-studio)

<a id="ref-Goo2026e"></a>Google (2026e). Google Maps Platform Terms of Service. [cloud.google.com/maps-platform/terms](https://cloud.google.com/maps-platform/terms)

<a id="ref-Goo2026f"></a>Google (2026f). Maps Demo Project Terms of Service. [cloud.google.com/terms/maps-platform/demo-project-terms](https://cloud.google.com/terms/maps-platform/demo-project-terms)

<a id="ref-Goo2026g"></a>Google (2026g). Maps JavaScript API Usage and Billing. [developers.google.com/maps/documentation/javascript/usage-and-billing](https://developers.google.com/maps/documentation/javascript/usage-and-billing)

## See Also
- [Factsheet](factsheet.md) · [Terms of Use](terms.md) · [Diagnostics](diagnostics.md) · [Overview](overview.md)
