#Discovery route

Discovery routes allow you to explore Katsu data in two main ways:

- Which elements of T, C, S are available within a stored set
- What connected sets of data are available within a unified set.
- All GET routes
 
 
 
##Groupspace

**Route**

```language-http
(base)/groupspace
```

**Parameters**

None

**Example**

“Give me the list of groupspaces in my account”

```language-http
(base)/groupspace
```    

##Time

**Route** 

```language-http
(base)/time
```

**Parameters**

| Name | Type |Connected |Description |Availability |
|--------|--------|--------|--------|--------|
|time_from|ISO8601| N/A	|	A limit on the first time returned (inclusive) |Not yet implemented |
|time_to|ISO8601|N/A|A limit on the last time returned (inclusive)|Not yet implemented|
|bounds|	Boolean 	|N/A|	Only the first and last time will be returned	|APIV0.2|
|context|	Context list|	True	|The list of context filters for which Time should be returned|	Not yet implemented|
|signal	|Signal list	|True	|The list of signal names for which Time should be returned|	Not yet implemented|
|connected	|Boolean|	N/A|	Enforces that only Time values connected to Katsu points should be returned	|Not yet implemented|

**Example**

“Give the bounds of date times available in 2014 for sales and revenue where they relate to cities in the UK”

```language-http
(base)/time?time_from=2014-01-01&time_to=2014-12-31&bounds=true&context=[Country:UK][City]&signal={sales}{revenue}
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