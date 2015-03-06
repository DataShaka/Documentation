#Core API Roadmap 
##Document Scope
In scope for this document:
- Principles
	- Type of API
	- Key Routes
	- Versioning
	- Authentication
	- Rate Limits
- Glossary
- Route Descriptions
	- Discovery Routes
	- Retrieval Routes
		- Manipulation

Out of scope for this document:
- Route Descriptions
	- Exploration Routes
	- Orchestration Routes
- Full description of Tractor orchestration language

#Principles

###Type of API
The DataShaka Core API will be a REST API with a Query and Response model. The response will be standard HTTP, so will constitute a stream of data. However a dedicated long-life stream API for ‘listening’ is on our roadmap but not presented within this document.
As a REST API the functionally will be described in terms of routes (queries with parameters that will either be GET or POST) and responses that will be in the form of streamed ‘documents’.
###Katsu
**Katsu** is the data fabric around which all DataShaka is based.

**Katsu** is a Content Agnostic Master Ontology (CAMO) with the elements Time, Context, Signal and Value. One **Katsu** point describes a contextualized numerical value at a point in time. *Time* is an ISO8601 datetime, *Context* is a set of key value pairs, *Signal* is a single string and *Value* is a numerical *value*. A set of Katsu contains multiple points. 

Within any set individual Context pairs as well as sets of pairs and Signals should be considered unique. Find out more here: http://www.datashaka.com/blog/techie/2013/11/what-is-tcsv 

###Key Routes
The key routes discussed in the document fall under three broad categories :

1. **Discovery**
	a. What possible values of T, C, S and V exist within stored data. 
	b. What values of T, C, S and V are connected and create ‘sets’.

2. **Data Retrieval (Blender)**
    a. Goal orientated queries for data.
    b. Basic operations on the queried set
  These operations only affect the queried data not the stored set.
    c.	Streamed data (TBC)


###Basics
All routes are available under the base sub-domain https://api.datashaka.com/

###HTTPS
All routes require HTTPS encryption.

###Versions
This API will be versioned explicitly within the URL. The versions will be sunset when their functionality is either entirely replaced by a new version or the functionality is deprecated. In the development of this API there will sometimes be ‘Alpha’ and ‘Beta’ versions available. We ask that these are not used in production as their functionality will not be finalized.
In any route the version is directly after the domain and always preceded by a ‘v’.

For example, the current API at time of writing is https://api.datashaka.com/v0.2 

###Authentication
Through ***under consideration*** mechanism an API Token will be provided. This Token is the equivalent of a user on the DataShaka platform. The token has privileges to specified sets (Groupspaces) of data for a single account. 
Once this token has been obtained it must be included in every call to the API regardless of route. Regardless of REST method a parameter called ‘token’ must exist with the value of the token provided. For example, in a GET call token=xyz123
**The security of this token is the responsibility of the bearer.**

###Convention
In all following route examples the base subdomain and version are replaced with (base) and the token parameter is left out.

###Rate Limits
This API will be covered by ‘fair use’ as opposed to an explicit rate limit. ‘Fair use’ means that tokens/accounts will only be blocked from using the API if they are deemed to be calling the API in a manner which seeks to negatively impact the service provided, overall or for specific accounts.
 
##Glossary of Terms

###TCSV point	
One data point with an element of Time, Context, Signal and Value
####Time	
A single point in time specified by an ISO8601 DateTime. This is ISO8601 down to the millisecond or any partial date to just year (yyyy e.g. 2015). 

####Context	
A single Context Type & Context pair or list of pairs. Context in TCSV is written using the [Ct1:C1](…[Ctn:Cn]) syntax. Context is the descriptive elements of a TCSV point that give meaning to a Signal Value. Context Types without Context names are specified using [Ct1](…[Ctn]) and Context names without Context Types are specified using [:C1](…[:Cn])
E.G. [Source:Survey][Brand:Nutrigum][Category:Gum]

####Signal	
A single element describing a Value. Signals in TCSV are written with the {S1:V1}(…{Sn:Vn}) syntax when paired with a Value and {S1}(…{Sn}) syntax when not paired with a Value.
E.G. {Sales:100}{Revenue:20.50}

####Value	
A numeric value. Values in TCSV is written with the {S1:V1}(…{Sn:Vn}) syntax when paired with a Signal and {:V1}(…{Vn}) when not paired with a Signal.
E.G. {Sales:100}{Revenue:20.50}

####Connected	
Within a unified set of TCSV data, an element (T,C,S or V) can be ‘Connected’ which means it is part of a TCSV set representing actual data. Elements can be Disconnected which means they are considered in the overall unified set and not in their relationships to Points.

####Point	
A TCSV point is 1 T, 1 or more C, 1 S and 1 V.. 

####Points	
A set of individual Point

####Discovery	
Discovery is the process of query to determine what data is available. Discovery queries are used to examine the ‘meta data’ of a unified set of TCSV.
<example needed>

####Exploration	
Exploration queries are used to move through a unified data set to establish connections between elements of the set. For example: secondary or tertiary connections between Signals and Context where they are not directly connected to a Value.

####Retrieve	
Retrieve queries are used to get a portion of the overall unified set. For example, one month of data for two particular signals.

####Orchestration	
The process of managing the movement, lineage, storage and quality control of data
APIVx.x	Specification of a version of the API. For Example APIV0.2. If used in ‘Availability’ refers to a version of the API where a feature has been implemented and is currently available.
Planned	This feature has been entered on to the backlog and prioritized.

####Not yet implemented	
This feature is not yet implemented and thus not available in any version of the API. This feature has been accepted as desirable for prioritization in the backlog. This feature is likely to be implemented but has not been confirmed.

####Under consideration	
This feature has been suggested and is being considered for entry into the backlog for prioritization. This feature may never be implemented.

####Rejected	
This feature has been rejected and will not be implemented.

####Deprecated	
This feature will be removed when its supporting versions are sunset.

####Sunset date	
The date when a version will no longer be made available.

####Tractor	
The DataShaka data orchestration language

####Enrich	
Alter data in some way

##Route Descriptions

###Convention
Parameters will be presented in a table in the following form :

| Name | Type |Connected |Description |Availability |
|--------|--------|
| The parameter Name       |The Expected Data Type        |Returns limited to include elements onlyconnected to TCSV points. This will show ‘true’ or ‘false’ This is not applicable for parameters that limit a return. ‘N/A’ will be used in this case |A more detailed description of the parameter |Notes on the availability of a parameter. This may be ‘deprecated’ meaning it is no longer available in any version or a list of versions that support this parameter. |

_ _ _

**Type**: for a rest call all values will be passed as a string. Each type will specify how that string should be formed. Commonly used terms are explained below :

#### ISO8601
A string representation of a DateTime conforming to the ISO8601 specification.
**Availbility** : APIV0.2

####Boolean	
“True” or “False”
**Availbility** : APIV0.2

####Context list	
“[ContextType:Context][Ct2:C2]..[Ctn:Cn]”

- Ct and C are regular expressions to match the Context Type and Context Name.
- Ct and C can be replaced with ‘functions’ such as [soundex(string)] with the name of the function followed by () taking precedence to a context part match.
- Including duplicate Ct references will result in an OR match. For example [City:London][City:York] will return London OR York matches.

**Availbility** : APIV0.2
- RegEx not yet implemented
- Functions not yet implemented
- ‘Or Match’ APIV0.2


####Signal list	
“{SignalName}{S2}…{Sn}”

- Given signal matches are regular expression to match signal names
- Matches can be replaced with ‘functions’ such as {soundex(string)} with the name for the function followed by () taking precedence to a signal match

**Availbility** : 
APIV0.2 uses CSV not TCSV2.0 Syntax
- RegEx not yet implemented
- Functions not yet implemented

####Number	
E.g. “0.0”, “10000”

**Not yet implemented**

###Discovery
Discovery routes allow you to explore TCSV data in two main ways:
- Which elements of T, C, S are available within a stored set
- What connected sets of data are available within a unified set.
- All GET routes
 
 
 
#####Groupspace
**Route**
(base)/groupspace
**Parameters**
•	None
**Example**
“Give me the list of groupspaces in my account”
```
    (base)/groupspace
```    

#####Time
**Route** 
(base)/time
**Parameters**

| Name | Type |Connected |Description |Availability |
|--------|--------|
|time_from|ISO8601| N/A	|	A limit on the first time returned (inclusive) |Not yet implemented |
|time_to|ISO8601|N/A|A limit on the last time returned (inclusive)|Not yet implemented|
|bounds|	Boolean 	|N/A|	Only the first and last time will be returned	|APIV0.2|
|context|	Context list|	True	|The list of context filters for which Time should be returned|	Not yet implemented|
|signal	|Signal list	|True	|The list of signal names for which Time should be returned|	Not yet implemented|
|connected	|Boolean|	N/A|	Enforces that only Time values connected to TCSV points should be returned	|Not yet implemented|

**Example** 
“Give the bounds of date times available in 2014 for sales and revenue where they relate to cities in the UK”
```
(base)/time?time_from=2014-01-01&time_to=2014-12-31&bounds=true&context=[Country:UK][City]&signal={sales}{revenue}
```

 
#####Context
**Route**
(base)/context

**Parameters**

| Name | Type |Connected |Description |Availability |
|--------|--------|
|time_from	|ISO8601	|True	|A limit on the first Time for a connected Context (inclusive)	|Not yet implemented|
|time_to	|ISO8601	|True	|A limit on the last Time for a connected Context (inclusive)|	Not yet implemented|
|context|	Context list|	False	|The list of Context filters for which Context should be returned|	Not yet implemented APIV0.2 implements ‘oftype’, ‘contextmatching’ and ‘contexttypematching’|
|signal	|Signal list|	True	|The list of Signal names for which Context should be returned|	Not yet implemented|
|connected	|Boolean	|N/A|	Enforces that only Context values connected to TCSV points should be returned|	Not yet implemented|
|sets	|Boolean	|True	|Returns unique context sets as attached to data that match other parameters given	|Not yet implemented|

**Example**
“Give the list of context connected to sales and revenue that contains a ‘City’ in the (Country) ‘UK’ in 2014”
```
(base)/context?time_from=2014-01-01&time_to=2014-12-31 &context=[Country:UK][City]&signal={sales}{revenue}
```

 
#####Signal
**Route**
(base)/signal

**Parameters**

| Name | Type |Connected |Description |Availability |
|--------|--------|
|time_from	|ISO8601	|True	|A limit on the first time for a connected Signal (inclusive)	|Not yet implemented|
|time_to|	ISO8601	|True	|A limit on the last time for a connected Signal (inclusive)	|Not yet implemented|
|context	|Context list	|False	|The list of context filters for which Signals should be returned|	Not yet implemented|
|signal	|Signal list|	True	|The list of Signal names for which Signal should be returned	|Not yet implemented APIV0.2 Implements ‘signalsmatching’|
|connected|	Boolean	|N/A|	Enforces that only Signal values connected to TCSV points should be returned|	Not yet implemented|

**Example**
“Give the signals that match ‘[Ss].*’ in 2014 that has the context of a City in the UK.”
```
(base)/signal?time_from=2014-01-01&time_to=2014-12-31 &context=[Country:UK][City]&signal={[Ss].*}
```

###Data Retrieval
Data Retrieval routes provide access to ‘Blender’ the TCSV query tool. These
- Goal orientated queries for data.
- Basic operations on the queried set
- Streamed data (TBC)
- GET and POST. Post is used where the query goes over the GET length limit.

	a.	***[Under Consideration]***  When POST is used, the post body should be a ‘form’ and as such in the form key=value&key=value as with GET
	- For this kind of query a content type of ‘multipart/form-data‘ should be used when making the query.
        
 b.	***[Under Consideration]*** For complicated queries a JSON object may be used.
	- For this kind of query a content type of ‘text/json’ should be used when making the query.
	- This json object should be in the follow form
	```
        {
        “parameter_name”:”parameter value”,
        “parameter_name”: [“parameter value”,”parameter value”]
        }
    ```
	- If a parameter can have an object representation this will be given with the parameter specification in the main route description. But will conform to the following:
```
{
“parameter_name”:{
	“field_name”:”field value”,
	“field_name”:[“field value”,”field value”]
	“field_name”:{
		“field_object_field”:”field object field value”
}
}
}
```

####Retrieve

**URL**
(base)/retrieve

**Parameters**

#####Basic Query

| Name | Type |Connected |Description |Availability |
|--------|--------|
|**Time is specified by a single point**	||||APIV0.2|
|time	|ISO8601|	True	|A single Time specification which all Points must match. E.g. yyyy-mm matches all points for the given month.|	APIV0.2|
|*OR a set of ranges*	||||Under consideration|
|time_inrange	|Comma separated list of ISO8601 pipe separated pairs	|True	|A set of Time ranges that Points must fall into.	|Under consideration|
|*OR a start and/or end time. Both is optional.*	||||APIV0.2|
|time_from	|ISO8601|	True	|The first Time from which all Points must match (inclusive)	|APIV0.2|
|time_to	|ISO8601|	True	|The last Time to which all Points must match (inclusive)	|APIV0.2|
|**Signal and Context are both optional**	||||Not yet implemented|
|signal	|Signal list|	True	|A list of Signals that Points must match|	Not yet implemented APIV0.2 provides a ‘comma separated list’ approach|
|context	|Context list|	True	|A list of Context that Points must match	|APIV0.2|
|**Value is specified by a single numeric valu**e	||||Not yet implemented|
|value|	Value list	|True	|A list of Values that Points must match	|Not yet implemented|
|*OR a range. Both is optional*	||||Not yet implemented|
|value_greaterthan	|Value	|True	|A single Value that Points must be greater than (Inclusive)|	Not yet implemented|
|value_lessthan	|Value	|True	|A single Value that Points must be less than (Inclusive)	N|ot yet implemented|
|*Or a set of ranges*	||||Under consideration|
|value_inrange	|Comma separated list of pipe separated Value bounds|	True|	A list of Value ranges that Points must fall within (Inclusive)	|Under consideration|

#####Manipulation
***[Under consideration]***


Manipulation uses an embodiment of the [Tractor orchestration framework](../../Tractor/Documentation/html/tractor.html) to define pipelines on points returned from the Basic Query (defined above)

| Name | Type |Connected |Description |Availability |
|--------|--------|
|Tractor	|Tractor script definition	|N/A|	A Tractor script defining the manipulation of data|	Not yet implemented POST ONLY |

**Example**
Tractor post object : “Give me total (sum) sales and revenue totals by City for January, February and March”
```
{
 “tractor”:”group by week ~>filter {N Weighted}{Weighted Base} ~> calculate “{N Weighted}/{Weighted Base}” returns {N Value} ~> sum”,
}
```



