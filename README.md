# DataShaka Platform

## Overview

The DataShaka Core API is a REST API with a Query and Response model. The response is standard HTTP, so constitutes a stream of data. As a REST API the functionally is described in terms of routes (queries with parameters that will either be GET or POST) and responses that are in the form of streamed documents.

- All routes are available under the base sub-domain https://api.datashaka.com/
- All routes require HTTPS encryption.
- This API will be versioned explicitly within the URL. For example, the current API is https://api.datashaka.com/v1.0.
- Authentication is done through an API Token. The token has privileges to specified sets (Groupspaces) of data for a single account. Once this token has been obtained it must be included in every call to the API regardless of route. Regardless of REST method a parameter called token must exist with the value of the token provided. For example, in a GET call token=xyz123 The security of this token is the responsibility of the bearer.
- This API will be covered by fair use as opposed to an explicit rate limit. Fair use means that tokens/accounts will only be blocked from using the API if they are deemed to be calling the API in a manner which seeks to negatively impact the service provided, overall or for specific accounts.

## Elements

- [Katsu](katsu.md)
- [Tractor](tractor/README.md)
- [Tractor Verbs](tractor/verbs/readme.md)
- [Calendars](calendars/readme.md)
- [Default Calendar](calendars/defaultcalendar.md)
- [Custom Calendar](calendars/customcalendar.md)
- [Time Granularity](calendars/timegranularity.md)
- [Chopsticks](tractor/chopsticks.md)

# Routes

- [Discovery Route](/routes/discovery.md)
- [Retrieval Route](/routes/retrieve.md)
- [Upsert Route](/routes/upsert.md)
- Orchestration Route (***Planned***)
