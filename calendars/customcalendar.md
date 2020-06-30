# <a id="custom-cal">Custom Calendars</a>
These are calendars that you can specify yourself! They are made up of intervals and definitions. Intervals are alternative definitions of chunks of time (month, quarter, campaign, etc.) and definitions are fundamental alterations to the default calendar (for example, on what day a week starts. Sunday, Monday, etc.)

## <a id="customjson-cal">JSON</a>

    {
    	"intervals":[
    		{
    			"name":"a."
    			"ranges":[
    				"origin":"b.",
    				"from":"c.",
    				"to":"d.",
    			]
    		}
    	]
    }

In the above example:
 - a. is the name for the interval. In most cases this will be one of `year`, `quarter`, `month`, `week`, `day`, `hour`, `minute`. The `ranges` array contains the specifications of the buckets that make up that range. By convention the interval names should not be pluralised in the case where they redefine the equivalent interval in a Gregorian calendar.
 - b. is the origin of a the given range. For example, `2014-01` specifies the origin of 'January 2014'.
 - c. is the from date of the given range. For example, `2014-W2` speficies that the range starts in 'Week 2 2014'. This assumes that either Week 2 is given as part of the custom week interval or that the default Gregorian weeks structure is to be used.
 - d. is the to date of the given range. For example, `2014-W4` specicies that the range ends in 'Week 4 2014'. As with c. this assumes that Week 2 will be specified or the default should be used.

You can specify c. d. with an [ISO8601](#iso8601) date time. There are various conditions that would lead to an invalid calendar. For example, specifying `2014-Q1` as ranging from `2014-Q1` to `2014-Q1` would create a recursive calendar definition. Similarly specifying `2014-W1` as ranging from `2013` to `2015` doesn't make any sense.

    {
    	"intervals":[
    		{
    			"name":"quarter"
    			"ranges":[
    				"origin":"2014-Q1",
    				"from":"2014-04",
    				"to":2014-06,
    			]
    		}
    	]
    }
