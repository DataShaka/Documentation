# Principles

### <a id="type-api">Type of API</a>
The DataShaka Core API will be a REST API with a Query and Response model. The response will be standard HTTP, so will constitute a stream of data. However a dedicated long-life stream API for *listening* is on our roadmap but not presented within this document.
As a REST API the functionally will be described in terms of routes (queries with parameters that will either be GET or POST) and responses that will be in the form of streamed *documents*.


### <a id="katsu">Katsu</a>
**Katsu** is the data fabric around which all DataShaka is based.

**Katsu** is a Content Agnostic Master Ontology (CAMO) with the elements Time, Context, Signal and Value. One **Katsu** point describes a contextualized numerical value at a point in time. *Time* is an ISO8601 datetime, *Context* is a set of key value pairs, *Signal* is a single string and *Value* is a numerical *value*. A set of Katsu contains multiple points. 

Within any set individual Context pairs as well as sets of pairs and Signals should be considered unique. Find out about the [history of Katsu](http://www.datashaka.com/blog/techie/2013/11/what-is-tcsv) on our blog.


### <a id="calendars">Calendars</a>
[DataShaka](http://datashaka.com) technology is all based around the ingest, manipulation and storage of [time-series](http://en.wikipedia.org/wiki/Time_series) data. Our Katsu data fabric is based on a time-series master ontology made up of elements of [Time, Context, Signal and Value (TCSV for short)](http://www.datashaka.com/blog/techie/2013/11/what-is-tcsv).

Time is therefore a key element of any data set we handle. When we aquire data and parse it into Katsu we faithfully maintain the source data date-time in [ISO8601](#iso8601) at whatever granularity it is given.

##### <a id="iso8601">ISO8601</a>
A simple explanation can be found [on Wikipedia](http://www.iso.org/iso/iso8601 "ISO8601 Wikipedia Articles")
The standard can be found [at ISO.org](http://www.iso.org/iso/iso8601 "Purchase the standard here")
A more light hearted explanation can be found [on XKCD.com](http://xkcd.com/1179/ "To be honest, this sealed the deal on why we use ISO8601")

We chose ISO8601 (as opposed to [Excel date time numbers](http://excelribbon.tips.net/T011337_How_Excel_Stores_Dates_and_Times.html) or [Unix time](http://en.wikipedia.org/wiki/Unix_time)) for the simple reasons that it is a standard, it covers the range of time from `0000-00-00T00:00:00.000` to `9999-12-31T23:59:59.999` should those ever be needed, it allows for simple week and quarter specification (`yyyy-Qn` and `yyyy-Wn`) and because, most importantly, it is internationally human readable!

##### <a id="where-cal">Where Calendars are used</a>

##### <a id="coreapi-cal">Core API</a>
In the Core API calendars are used to 'expand' the dates given in [ISO8601](#iso8601) to fully granular 'time bounds' used to find the data required. Calendars for this purpose can only be specified in `POST` requests as part of the request body JSON document.

##### <a id="tractor-cal">Tractor</a>
Tractor uses calendars to help it deal with time based operations. For example `group by "month"` uses a calendar to decide what `month` groupings look like. When Tractor is used in the CoreAPI the same calendar is used as is used for the query itself.


### <a id="routes">Key Routes</a>
The key routes discussed in the document fall under two broad categories :

1. **[Discovery](routes/discovery.md)**


2. **[Data Retrieval](routes/retrieve.md)**
   

### <a id="basics">Basics</a>
All routes are available under the base sub-domain https://api.datashaka.com/


### <a id="https">HTTPS</a>
All routes require HTTPS encryption.


### <a id="versionning">Versions</a>
This API will be versioned explicitly within the URL. The versions will be sunset when their functionality is either entirely replaced by a new version or the functionality is deprecated. In the development of this API there will sometimes be *Alpha* and *Beta* versions available. We ask that these are not used in production as their functionality will not be finalized.
In any route the version is directly after the domain and **always preceded by a v**.

For example, the current API is `https://api.datashaka.com/v1.0`.


### <a id="authentication">Authentication</a>
Authentication is done through an API Token. This Token is the equivalent of a user on the DataShaka platform. The token has privileges to specified sets (Groupspaces) of data for a single account.
Once this token has been obtained it must be included in every call to the API regardless of route. Regardless of REST method a parameter called **token** must exist with the value of the token provided. For example, in a GET call token=xyz123
**The security of this token is the responsibility of the bearer.**


### <a id="convention">Convention</a>
In all following route examples the base subdomain and version are replaced with (base) and the token parameter is left out.


### <a id="rate-limits">Rate Limits</a>
This API will be covered by *fair use* as opposed to an explicit rate limit. Fair use means that tokens/accounts will only be blocked from using the API if they are deemed to be calling the API in a manner which seeks to negatively impact the service provided, overall or for specific accounts.
