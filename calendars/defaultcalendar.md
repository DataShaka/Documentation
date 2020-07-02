# <a id="default-cal">The Default Calendar</a>
This is basically the [ISO8601](#iso8601) [Gregorian](http://en.wikipedia.org/wiki/Gregorian_calendar) calendar. I say 'basically' because we have had to make some decisions up front on the way this calendar is implemented because computers and 'planetary motion' works in different ways. This is the default calendar and need *not* to be provided.

Here are specifications for how standard intervals in the default calendar are defined:

|ISO8601 Date|	Tractor Interval|	Start|	End|
|------------|------------------|------|-----|
|2020|	year|	2020-01-01T00:00:00.000|	2020-12-31T23:59:59.999|
|2020-Q1|	quarter|	2020-01-01T00:00:00.000|	2020-03-31T23:59:59.999|
|2020-01|	month|	2020-01-01T00:00:00.000| 2020-01-31T23:59:59.999|
|2020-W1|	week|	2019-12-30T00:00:00.000|	2020-01-05T23:59:59.999|
|2020-W3|	week|	2020-01-13T00:00:00.000|	2020-01-05T23:59:59.999|
|2020-01-01|	day|	2020-01-01T00:00:00.000|	2020-01-01T23:59:59.999|
|2020-12-30|	day|	2020-12-30T00:00:00.000|	2020-12-30T23:59:59.999|
|2020-01-01T12|	hour|	2020-01-01T12:00:00.000|	2020-01-01T12:59:59.999|
|2020-01-01T12:00|	minute|	2020-01-01T12:00:00.000|	2020-01-01T12:00:59.999|
|2020-12-30T13:45|	minute|	2020-12-30T12:00:00.000|	2020-12-30T13:45:59.999|
|2020-01-01T12:00:00|	second|	2020-01-01T12:00:00.000|	2020-01-01T12:00:00.999|

Here is how monthly intervals would look if you defined your start date from 2020 and your end date as 2020-Q3:

|ISO8601 Specifications|	for month	|Start	|End|
|----------------------|------------|-------|---|
|from 2020 to 2020-Q3|	2020-01|	2020-01-01T00:00:00.000|	2020-01-01T23:59:59.999|
||2020-02|	2020-02-28T00:00:00.000|	2020-02-28T23:59:59.999|
||2020-03|	2020-03-31T00:00:00.000|	2020-03-31T23:59:59.999|
||2020-04|	2020-04-30T00:00:00.000|	2020-04-30T23:59:59.999|
||2020-05|	2020-05-31T00:00:00.000|	2020-05-31T23:59:59.999|
||2020-06|	2020-06-30T00:00:00.000|	2020-06-30T23:59:59.999|
||2020-07|	2020-07-31T00:00:00.000|	2020-07-31T23:59:59.999|
||2020-08|	2020-08-31T00:00:00.000|	2020-08-31T23:59:59.999|
||2020-09|	2020-09-30T00:00:00.000|	2020-09-30T23:59:59.999|


## Things to Note On The Default Calendar

- In the default calendar, a week always begins on a Monday.

  Often W1 in any given year will start in December. In the example above, 2020-W1 begins on 2020-12-30. This is because the majority of the days in W1 are in 2020 and because you want to be consistent in having 52 weeks in every year.

- Quarter are defined as Qn (so Q1, Q2, Q3 and Q4) and weeks are defined as Wn (so W1 to W52). Meanwhile months are defined as nn (so 01 to 12). If you define your month as M1 or 1, an error will occur.
