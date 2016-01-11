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

##Groupspace

**Route**

```language-http
(base)/discover/groupspace.json
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
(base)/discover/time.json
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
- none: equivalent to not providing mode
- nounds: returns only the **first** and **last** date in the requested range

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

**Example**

“Give the bounds of date times available values of test”

```language-http
(base)/discover/time?token=<your token>&groupspace=Demo&time_from=1901&time_to=2099&mode=bounds&signal={test}
```

##Context

**Route**
```language-http
(base)/context
```

**Parameters**

| Name | Type |Connected |Description |Availability |
|--------|--------|--------|--------|--------|
|time_from	|ISO8601	|True	|A limit on the first Time for a connected Context (inclusive)	|Not yet implemented|
|time_to	|ISO8601	|True	|A limit on the last Time for a connected Context (inclusive)|	Not yet implemented|
|context|	Context list|	False	|The list of Context filters for which Context should be returned|	Not yet implemented APIV0.2 implements ‘oftype’, ‘contextmatching’ and ‘contexttypematching’|
|signal	|Signal list|	True	|The list of Signal names for which Context should be returned|	Not yet implemented|
|connected	|Boolean	|N/A|	Enforces that only Context values connected to Katsu points should be returned|	Not yet implemented|
|sets	|Boolean	|True	|Returns unique context sets as attached to data that match other parameters given	|Not yet implemented|

**Example**

“Give the list of context connected to sales and revenue that contains a ‘City’ in the (Country) ‘UK’ in 2014”
```language-http
(base)/context?time_from=2014-01-01&time_to=2014-12-31 &context=[Country:UK][City]&signal={sales}{revenue}
```


##Signal

**Route**
```language-http
(base)/signal
```

**Parameters**

| Name | Type |Connected |Description |Availability |
|--------|--------|--------|--------|--------|
|time_from	|ISO8601	|True	|A limit on the first time for a connected Signal (inclusive)	|Not yet implemented|
|time_to|	ISO8601	|True	|A limit on the last time for a connected Signal (inclusive)	|Not yet implemented|
|context	|Context list	|False	|The list of context filters for which Signals should be returned|	Not yet implemented|
|signal	|Signal list|	True	|The list of Signal names for which Signal should be returned	|Not yet implemented APIV0.2 Implements ‘signalsmatching’|
|connected|	Boolean	|N/A|	Enforces that only Signal values connected to Katsu points should be returned|	Not yet implemented|

**Example**

“Give the signals that match ‘[Ss].*’ in 2014 that has the context of a City in the UK.”

```language-http
(base)/signal?time_from=2014-01-01&time_to=2014-12-31 &context=[Country:UK][City]&signal={[Ss].*}
```
