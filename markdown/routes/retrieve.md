#Retrieve route

Data Retrieval routes provide access to ‘Blender’ the Katsu query tool. These

- Goal orientated queries for data.
- Basic operations on the queried set
- Streamed data (TBC)
- GET and POST. Post is used where the query goes over the GET length limit.

 a. ***Under Consideration***  When POST is used, the post body should be a ‘form’ and as such in the form key=value&key=value as with GET
	- For this kind of query a content type of ‘multipart/form-data‘ should be used when making the query.

 b.	***Under Consideration*** For complicated queries a JSON object may be used.
	- For this kind of query a content type of ‘text/json’ should be used when making the query.
	- This json object should be in the follow form
```language-javascript
    {
    “parameter_name”:”parameter value”,
    “parameter_name”: [“parameter value”,”parameter value”]
    }
```
	- If a parameter can have an object representation this will be given with the parameter specification in the main route description. But will conform to the following:
```language-javascript
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

##Retrieve

**URL**
(base)/retrieve

**Parameters**

#####Basic Query

| Name | Type |Connected |Description |Availability |
|--------|--------|--------|--------|--------|
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

##Manipulation
***Under consideration***


Manipulation uses an embodiment of the [Tractor orchestration framework](../../Tractor/Documentation/html/tractor.html) to define pipelines on points returned from the Basic Query (defined above)

| Name | Type |Connected |Description |Availability |
|--------|--------|--------|--------|--------|
|Tractor	|Tractor script definition	|N/A|	A Tractor script defining the manipulation of data|	Not yet implemented POST ONLY |

**Example**

Tractor post object : “Give me total (sum) sales and revenue totals by City for January, February and March”
```language-tractor
{
 “tractor”:”group by week ~>filter {N Weighted}{Weighted Base} ~> calculate “{N Weighted}/{Weighted Base}” returns {N Value} ~> sum”,
}
```



