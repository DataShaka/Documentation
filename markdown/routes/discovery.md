#Discovery routes

- Discovery routes allow you to discover what is available for query in your Katsu data. You could also describe them as **meta data** routes. 
- Discovery routes work off the stored data and so relate to points of data you have available.
- Discovery routes take the same base parameters as retrieve routes and so can be filtered in the same way.
- Where applicable a 'mode' parameter can be specified to give a variation on what kind of data is returned.

##Version

```
V1.0
```

##Formatters

```
.json
```

##Authentication Parameters

```
token=<your token>
```

##Base

```language-http
https://api.datashaka.com/v1/
```

##HTTP Methods

###GET
- Provide your groupspace (as required) and token (always required) in the URL
- Provide parameters in the name=value&name2=value2 form in the url
- Tractor is not available in GET requiest

###POST
- Provide your groupspace (as required) and token (always required) in the URL
- Provide your parameters as the post document in JSON with the ```context-type``` ```application/json```
- Tractor and Tractors can also be included in the POST document

**Example**

```language-json
{
    "time_from":"2015-01-01",
    "time_to":"2016-Q1",
    "signal":"{example}",
    "context":"[Other:Example]",
}
```

##Groupspace

**Route**

```language-http
(base)/discover/groupspace
```

**Parameters**

None


**Example**

“Give me the list of groupspaces in my account”

```language-http
https://api.datashaka.com/v1/discover/groupspace.json&token=<your token>
```    

**Returns**

```language-json
    {
        "groupspaces": [
            "Main"
        ]
    }
```

##Time

**Route** 

```language-http
(base)/discover/time
```

**Parameters**

_groupspace_ (required)

```
groupspace=Demo
```

_time from_ (required)

```
time_from=ISO8601
```
use ```time_from=1901``` for 'earliest possible date'

_time to_ (required)

```
time_to=ISO8601
```
use ```time_to=2099``` for 'latest possible date'

_mode_ (optional)

```
mode=bounds
```

Possible modes:
- None: (default) equivalent to not providing mode
- Bounds: returns only the **first** and **last** date in the requested range

_signal_ (optional)

```
signal={Sales}
```

Filters the results to times for data that has the signal 'Sales'.

_context_ (optional)

```
context=[Brand:X]
```

Filters the results to times for data that has the context 'Brand:Martini'.

**Retun Object(s)**

```language-json
{"times": []}
```

**Example**

“Give the bounds of date times available values of test”

```language-http
(base)/discover/time?token=<your token>&groupspace=Demo&time_from=1901&time_to=2099&mode=bounds&signal={test}
```

**Returns**

```language-json
{
  "times": [
    "2014-10-01T00:00:00",
    "2014-12-31T00:00:00"
  ]
}
```

##Context

**Route** 

```language-http
(base)/discover/context
```

**Parameters**

_groupspace_ (required)

```
groupspace=Demo
```

_time from_ (required)

```
time_from=ISO8601
```
use ```time_from=1901``` for 'earliest possible date'

_time to_ (required)

```
time_to=ISO8601
```
use ```time_to=2099``` for 'latest possible date'

_mode_ (optional)

```
mode=context
```

Possible modes:
- None: equivalent to not providing mode Causes the same result as (default).
- Context: (default) all Context pairs
- Type: Only the 'Keys' (Context Type) of the Context pairs
- Name: Only the 'Values' (Context Name) of the Context pairs
- Sets: The sets of Context pairs that exist against points
- Shape: The Context type shapes of points

_signal_ (optional)

```
signal={Sales}
```

Filters the results to times for data that has the signal 'Sales'.

_context_ (optional)

```
context=[Brand:X]
```

Filters the results to times for data that has the context 'Brand:X'.

**Retun Object(s)**

```language-json
{"context": []}
{"types": []}
{"names": []}
{"sets": []}
{"shapes": []}
```

**Example**

“Give the unique sets of context for all time”

```language-http
(base)/discover/context.json?token=<your token>&groupspace=Demo&time_from=1901&time_to=2099&mode=Sets
```

**Returns**

```language-json
{
  "sets": [
    {
      "Brand": "X",
      "Source": "Internal",
      "Market": "UK"
    },
    {
      "Brand": "Y",
      "Source": "Internal",
      "Market": "UK"
    },
  ]
}
```

##Signal

**Route** 

```language-http
(base)/discover/signal
```

**Parameters**

_groupspace_ (required)

```
groupspace=Demo
```

_time from_ (required)

```
time_from=ISO8601
```
use ```time_from=1901``` for 'earliest possible date'

_time to_ (required)

```
time_to=ISO8601
```
use ```time_to=2099``` for 'latest possible date'

_signal_ (optional)

```
signal={Sales}
```

Filters the results to times for data that has the signal 'Sales'.

_context_ (optional)

```
context=[Brand:X]
```

Filters the results to times for data that has the context 'Brand:X'.

**Retun Object(s)**

```language-json
{"signals": []}
```

**Example**

“Give the unique signals for all time”

```language-http
(base)/discover/signal.json?token=<your token>&groupspace=Demo&time_from=1901&time_to=2099&mode=Sets
```

**Returns**

```language-json
{
  "signals": [
    "test"
  ]
}
```
