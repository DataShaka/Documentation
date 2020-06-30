# <a id="custom-cal">Custom Calendars</a>
These are calendars that you can specify yourself! They are made up of intervals and definitions. Intervals are alternative definitions of chunks of time (month, quarter, campaign, etc.) and definitions are fundamental alterations to the default calendar (for example, on what day a week starts. Sunday, Monday, etc.). Custom calendar *can* be provided in the query, but if it is not provided [Default Calendar](calendars/defaultcalendar.md) comes in to play automatically.

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
 - b. is the origin of a the given range. For example, `2020-01` specifies the origin of 'January 2020'.
 - c. is the from date of the given range. For example, `2020-W2` speficies that the range starts in 'Week 2 2020'. This assumes that either Week 2 is given as part of the custom week interval or that the default Gregorian weeks structure is to be used.
 - d. is the to date of the given range. For example, `2020-W4` specicies that the range ends in 'Week 4 2020'. As with c. this assumes that Week 2 will be specified or the default should be used.

You can specify c. d. with an [ISO8601](#iso8601) date time. There are various conditions that would lead to an invalid calendar. For example, specifying `2020-Q1` as ranging from `2020-Q1` to `2020-Q1` would create a recursive calendar definition. Similarly specifying `2020-W1` as ranging from `2019` to `2021` doesn't make any sense.

    {
    	"intervals":[
    		{
    			"name":"quarter"
    			"ranges":[
    				"origin":"2020-Q1",
    				"from":"2020-04",
    				"to":2020-06,
    			]
    		}
    	]
    }

**Standard Expansion to full granularity**

| ISO8601 Date        | Start                   | End                     |
| ------------------- | ----------------------- | ----------------------- |
| 2020                | 2020-01-01T00:00:00.000 | 2020-12-31T23:59:59.999 |
| 2020-Q1             | 2020-01-01T00:00:00.000 | 2020-03-31T23:59:59.999 |
| 2020-01             | 2020-01-01T00:00:00.000 | 2020-01-31T23:59:59.999 |
| 2020-W1             | 2020-12-30T00:00:00.000 | 2020-01-05T23:59:59.999 |
| 2020-W3             | 2020-01-13T00:00:00.000 | 2020-01-19T23:59:59.999 |
| 2020-01-01          | 2020-01-01T00:00:00.000 | 2020-01-01T23:59:59.999 |
| 2020-12-30          | 2020-12-30T00:00:00.000 | 2020-12-30T23:59:59.999 |
| 2020-01-01T12       | 2020-01-01T12:00:00.000 | 2020-01-01T12:59:59.999 |
| 2020-01-01T12:00    | 2020-01-01T12:00:00.000 | 2020-01-01T12:00:59.999 |
| 2020-12-30T13:45    | 2020-12-30T12:00:00.000 | 2020-12-30T13:45:59.999 |
| 2020-01-01T12:00:00 | 2020-01-01T12:00:00.000 | 2020-01-01T12:00:00.999 |
