# Calendars

### <a id="why-cal">Why do we need calendars?</a>
[DataShaka](http://datashaka.com) technology is all based around the ingest, manipulation and storage of [time-series](http://en.wikipedia.org/wiki/Time_series) data. Our Katsu data fabric is based on a time-series master ontology made up of elements of [Time, Context, Signal and Value (TCSV for short)](http://www.datashaka.com/blog/techie/2013/11/what-is-tcsv).

Time is therefore a key element of any data set we handle. When we aquire data and parse it into Katsu we faithfully maintain the source data date-time in [ISO8601](#iso8601) at whatever granularity it is given.

### <a id="iso8601">ISO8601</a>
A simple explanation can be found [on Wikipedia](http://www.iso.org/iso/iso8601 "ISO8601 Wikipedia Articles")
The standard can be found [at ISO.org](http://www.iso.org/iso/iso8601 "Purchase the standard here")
A more light hearted explanation can be found [on XKCD.com](http://xkcd.com/1179/ "To be honest, this sealed the deal on why we use ISO8601")

We chose ISO8601 (as opposed to [Excel date time numbers](http://excelribbon.tips.net/T011337_How_Excel_Stores_Dates_and_Times.html) or [Unix time](http://en.wikipedia.org/wiki/Unix_time)) for the simple reasons that it is a standard, it covers the range of time from `0000-00-00T00:00:00.000` to `9999-12-31T23:59:59.999` should those ever be needed, it allows for simple week and quarter specification (`yyyy-Qn` and `yyyy-Wn`) and because, most importantly, it is internationally human readable!

## <a id="type-cal">Types of Calendars</a>
Within DataShaka technology there are currently two kinds of calendars you can use. The default calendar or a custom calendar.

### <a id="default-cal">The Default Calendar</a>
This is basically the [ISO8601](#iso8601) [Gregorian](http://en.wikipedia.org/wiki/Gregorian_calendar) calendar. I say 'basically' because we have had to make some decisions up front on the way this calendar is implemented because computers and 'planetary motion' works in different ways.

### <a id="custom-cal">Custom Calendars</a>
These are calendars that you can specify yourself! They are made up of intervals and definitions. Intervals are alternative definitions of chunks of time (month, quarter, campaign, etc.) and definitions are fundamental alterations to the default calendar (for example, on what day a week starts. Sunday, Monday, etc.)

#### <a id="customjson-cal">JSON</a>

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


## <a id="where-cal">Where Calendars are used</a>

### <a id="coreapi-cal">Core API</a>
In the Core API calendars are used to 'expand' the dates given in [ISO8601](#iso8601) to fully granular 'time bounds' used to find the data required. Calendars for this purpose can only be specified in `POST` requests as part of the request body JSON document.

### <a id="tractor-cal">Tractor</a>
Tractor uses calendars to help it deal with time based operations. For example `group by "month"` uses a calendar to decide what `month` groupings look like. When Tractor is used in the CoreAPI the same calendar is used as is used for the query itself.

## <a id="examples-cal">Examples</a>

### Default Calendar

**Standard Expansion to full granularity**

| ISO8601 Date        | Start                   | End                     |
| ------------------- | ----------------------- | ----------------------- |
| 2014                | 2014-01-01T00:00:00.000 | 2014-12-31T23:59:59.999 |
| 2014-Q1             | 2014-01-01T00:00:00.000 | 2014-03-31T23:59:59.999 |
| 2014-01             | 2014-01-01T00:00:00.000 | 2014-01-31T23:59:59.999 |
| 2014-W1             | 2013-12-30T00:00:00.000 | 2014-01-05T23:59:59.999 |
| 2014-W3             | 2014-01-13T00:00:00.000 | 2014-01-05T23:59:59.999 |
| 2014-01-01          | 2014-01-01T00:00:00.000 | 2014-01-01T23:59:59.999 |
| 2014-12-30          | 2014-12-30T00:00:00.000 | 2014-12-30T23:59:59.999 |
| 2014-01-01T12       | 2014-01-01T12:00:00.000 | 2014-01-01T12:59:59.999 |
| 2014-01-01T12:00    | 2014-01-01T12:00:00.000 | 2014-01-01T12:00:59.999 |
| 2014-12-30T13:45    | 2014-12-30T12:00:00.000 | 2014-12-30T13:45:59.999 |
| 2014-01-01T12:00:00 | 2014-01-01T12:00:00.000 | 2014-01-01T12:00:00.999 |

**Standard Expansion to full granularity buckets**

| ISO8601 Specifications | for month          | Start                   | End                     |
| ---------------------- | ------------------ | ----------------------- | ----------------------- |
| from 2014 to 2014-Q3   | 2014-01            | 2014-01-01T00:00:00.000 | 2014-01-01T23:59:59.999 |
| 		                 | 2014-02            | 2014-02-28T00:00:00.000 | 2014-02-28T23:59:59.999 |
| 		                 | 2014-03            | 2014-03-31T00:00:00.000 | 2014-03-31T23:59:59.999 |
| 		                 | 2014-04            | 2014-04-30T00:00:00.000 | 2014-04-30T23:59:59.999 |
| 		                 | 2014-05            | 2014-05-31T00:00:00.000 | 2014-05-31T23:59:59.999 |
| 		                 | 2014-06            | 2014-06-30T00:00:00.000 | 2014-06-30T23:59:59.999 |
| 		                 | 2014-07            | 2014-07-31T00:00:00.000 | 2014-07-31T23:59:59.999 |
| 		                 | 2014-08            | 2014-08-31T00:00:00.000 | 2014-08-31T23:59:59.999 |
| 		                 | 2014-09            | 2014-09-30T00:00:00.000 | 2014-09-30T23:59:59.999 |
