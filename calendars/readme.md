# Calendars
[DataShaka](http://datashaka.com) technology is all based around the ingest, manipulation and storage of [time-series](http://en.wikipedia.org/wiki/Time_series) data. Our Katsu data fabric is based on a time-series master ontology made up of elements of [Time, Context, Signal and Value (TCSV for short)](http://www.datashaka.com/blog/techie/2013/11/what-is-tcsv).

Time is therefore a key element of any data set we handle. When we aquire data and parse it into Katsu we faithfully maintain the source data date-time in [ISO8601](#iso8601) at whatever granularity it is given.

#### <a id="iso8601">ISO8601</a>
A simple explanation can be found [on Wikipedia](http://www.iso.org/iso/iso8601 "ISO8601 Wikipedia Articles")
The standard can be found [at ISO.org](http://www.iso.org/iso/iso8601 "Purchase the standard here")
A more light hearted explanation can be found [on XKCD.com](http://xkcd.com/1179/ "To be honest, this sealed the deal on why we use ISO8601")

We chose ISO8601 (as opposed to [Excel date time numbers](http://excelribbon.tips.net/T011337_How_Excel_Stores_Dates_and_Times.html) or [Unix time](http://en.wikipedia.org/wiki/Unix_time)) for the simple reasons that it is a standard, it covers the range of time from `0000-00-00T00:00:00.000` to `9999-12-31T23:59:59.999` should those ever be needed, it allows for simple week and quarter specification (`yyyy-Qn` and `yyyy-Wn`) and because, most importantly, it is internationally human readable!

#### Where Calendars are used

- Core API : In the Core API calendars are used to 'expand' the dates given in [ISO8601](#iso8601) to fully granular 'time bounds' used to find the data required. Calendars for this purpose can only be specified in `POST` requests as part of the request body JSON document.
- Tractor : Tractor uses calendars to help it deal with time based operations. For example `group by "month"` uses a calendar to decide what `month` groupings look like. When Tractor is used in the CoreAPI the same calendar is used as is used for the query itself.
