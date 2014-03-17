#DataShaka API V0.2

##Authentication
All calls must have a `token=[guid]` parameter.
This parameter is not listed against each route in turn.

##Formats
Unless otherwise stated, all routes support the `.json` and `.xml` format. Data routes support `.json`,`.xml`,`.csv` and `.html`. 

`.html` is provided for viewing in browser or Excel 'Web Query'.

##Url Demo Page
All of the routes below are runable in the [API Demo Page](https://api.datashaka.com/demo)

##Metadata Routes

###Groupspace

####URL
`https://api.datashaka.com/v0.2/groupspace`

####Parameters
- none

####Returns

```JSON
{
	"groupspaces": [
    		{
        		"name":"groupspace"
    		},
    		{
        		"name":"other grouspace"
    		}
	]
}
```
    
###Context

####URL
`https://api.datashaka.com/v0.2/context`

####Parameters
- one of
	- `oftype` (optional)
		- one context type with which to filter the list
		- _could do a list here?_
	- `contextmatching` (optional)
		- url escaped regular expression to use to match context name
	- `contexttypematching` (optional)
		- url escaped regular expression to use to match context type

####Returns

```JSON
{
	"contexts": [
    		{
        		"type":"context type",
        		"name":"context"
    		},
    		{
        		"type":"other context type",
        		"name":"other context"
    		},
	]
}
```

###Signal

####URL
`https://api.datashaka.com/v0.2/signal`

####Parameters
- `signalsmatching` (optional)
	- url escaped regular expression to use to match signal name

####Returns

```JSON
{
	"signals":[
    		{
         		"name":"signal"
    		},
    		{
         		"name":"other signal"
    		}
	]
}
```

###Time

####URL
`https://api.datashaka.com/v0.2/time`

####Parameters
- `bounds` (optional)
	- true/false. Defaults to false. If true only gives start and end time

####Returns

```JSON
{
	"times":[
		{
			"value":"2014-01-01T12:37:22"
		},
		{
			"value":"2014-01-02"
		}
    ]
}
```    
    
##Data Routes

###Retrieve

####URL
`https://api.datashaka.com/v0.2/retrieve`

####Parameters
- **Groupspace:**
	- `groupspace` (required)
		- the name of the groupspace you want to retrieve data from.
- **Time**: (required)
	- One of
		- `time` 
			- a single [ISO8601](http://en.wikipedia.org/wiki/ISO8601) date time specification. Retures only the points that match this date time.
		- `timefrom` and `timeto`
			- each are an [ISO8601](http://en.wikipedia.org/wiki/ISO8601) date time specification. Defines a range (inclusive) in which desired points fall. 
- **Signal**: (required)
	- `signal`
		- a comma seperated list of url encoded signal names. Returns only the points that match the given signals.
- **Context**: (required)
	- `context`
		- a comma seperated list of url escaped context pairs. Returns points that match all context given. All other context is returned.
		- A context pair looks like this `[context type;context]~[other context type;other context]` and when URL escaped the example would look like this `%5bcontext+type%3bcontext%5d%7e%5bother+context+type%3bother+context%5d`

####Returns
 
```JSON
[
	{
		"time": {
   			"value": "2013-01-01T00:00:00"
   		},
	  	"context": [
		   {
		   	"type": "type",
		   	"name": "context"
		   },
		   {
		   	"type": "other type",
		   	"name": "other context"
		   },
		   {
		   	"type": "third type",
		   	"name": "third context"
		   }
	 	],
	  	"signal": {
	  		"name": "signal"
	  	},
  		"value": 1.0
 	},
]   
```
