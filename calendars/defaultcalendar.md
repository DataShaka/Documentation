# <a id="default-cal">The Default Calendar</a>
This is basically the [ISO8601](#iso8601) [Gregorian](http://en.wikipedia.org/wiki/Gregorian_calendar) calendar. I say 'basically' because we have had to make some decisions up front on the way this calendar is implemented because computers and 'planetary motion' works in different ways. This is the default calendar and need *not* to be provided.

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
