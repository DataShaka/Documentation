#Principles

###<a id="type-api">Type of API</a>
The DataShaka Core API will be a REST API with a Query and Response model. The response will be standard HTTP, so will constitute a stream of data. However a dedicated long-life stream API for *listening* is on our roadmap but not presented within this document.
As a REST API the functionally will be described in terms of routes (queries with parameters that will either be GET or POST) and responses that will be in the form of streamed *documents*.

###<a id="katsu">Katsu</a>
**Katsu** is the data fabric around which all DataShaka is based.

**Katsu** is a Content Agnostic Master Ontology (CAMO) with the elements Time, Context, Signal and Value. One **Katsu** point describes a contextualized numerical value at a point in time. *Time* is an ISO8601 datetime, *Context* is a set of key value pairs, *Signal* is a single string and *Value* is a numerical *value*. A set of Katsu contains multiple points. 

Within any set individual Context pairs as well as sets of pairs and Signals should be considered unique. Find out about the [history of Katsu](http://www.datashaka.com/blog/techie/2013/11/what-is-tcsv) on our blog.

###<a id="routes">Key Routes</a>
The key routes discussed in the document fall under two broad categories :

1. **[Discovery](routes/discovery.html)**
    a. What possible values of T, C, S and V exist within stored data.
    b. What values of T, C, S and V are connected and create *sets*.


2. **[Data Retrieval](routes/retrieve.html)**
    a. Goal orientated queries for data.
    b. Basic operations on the queried set
        (i) These operations only affect the queried data not the stored set.
    c.	Streamed data (TBC)


###<a id="basics">Basics</a>
All routes are available under the base sub-domain https://api.datashaka.com/

###<a id="https">HTTPS</a>
All routes require HTTPS encryption.

###<a id="versionning">Versions</a>
This API will be versioned explicitly within the URL. The versions will be sunset when their functionality is either entirely replaced by a new version or the functionality is deprecated. In the development of this API there will sometimes be *Alpha* and *Beta* versions available. We ask that these are not used in production as their functionality will not be finalized.
In any route the version is directly after the domain and **always preceded by a v**.

For example, the current API at time of writing is `https://api.datashaka.com/v0.2`.

###<a id="authentication">Authentication</a>
Through ***under consideration*** mechanism an API Token will be provided. This Token is the equivalent of a user on the DataShaka platform. The token has privileges to specified sets (Groupspaces) of data for a single account.
Once this token has been obtained it must be included in every call to the API regardless of route. Regardless of REST method a parameter called **token** must exist with the value of the token provided. For example, in a GET call token=xyz123
**The security of this token is the responsibility of the bearer.**

###<a id="convention">Convention</a>
In all following route examples the base subdomain and version are replaced with (base) and the token parameter is left out.

###<a id="rate-limits">Rate Limits</a>
This API will be covered by *fair use* as opposed to an explicit rate limit. Fair use means that tokens/accounts will only be blocked from using the API if they are deemed to be calling the API in a manner which seeks to negatively impact the service provided, overall or for specific accounts.
