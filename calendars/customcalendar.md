# <a id="custom-cal">Custom Calendars</a>
These are calendars that you can specify yourself! They are made up of intervals and definitions. Intervals are alternative definitions of chunks of time (month, quarter, campaign, etc.) and definitions are fundamental alterations to the default calendar (for example, on what day a week starts. Sunday, Monday, etc.).

Here is an example of a custom calendar:

```
{
    "intervals":[
        {
            "name":"quarter",
            "ranges":[
                {"origin":"2019-Q1","from":"2019-04-01","to":"2019-06-30"},
                {"origin":"2019-Q2","from":"2019-07-01","to":"2019-09-30"},
                {"origin":"2019-Q3","from":"2019-10-01","to":"2019-12-31"},
                {"origin":"2019-Q4","from":"2020-01-01","to":"2020-03-31"},
                {"origin":"2020-Q1","from":"2020-04-01","to":"2020-06-30"},
                {"origin":"2020-Q2","from":"2020-07-01","to":"2020-09-30"},
                {"origin":"2020-Q3","from":"2020-10-01","to":"2020-12-31"},
                {"origin":"2020-Q4","from":"2021-01-01","to":"2021-03-31"}
            ]
        }
    ]
}
```

In this example quarter is the name for the interval. In most cases this will be one of year, quarter, month, week, day, hour or minute, but in the custom calnedar you can name the interval whatever you like (e.g. Campaign)

Just as it is important for a query to remain within the time-range for which there is data, it is also important to apply the custom calendar over the whole time-range for which data exists.

The ranges array contains the specifications for the chunks that make up the interval. Each chunk contains the "origin" of a given range, the date "from" and the date "to". In the example above, 2019-Q1 starts from 2019-04-01 and ends on 2019-06-30. Essentially this custom calendar has shifted the quarter forward by 1.

You can also create more complex calendars with two or more levels of intervals. For example:

```
{
    "intervals":[
        {
            "name":"quarter",
            "ranges":[
                {"origin":"2019-Q1","from":"2019-04","to":"2019-06"},
                {"origin":"2019-Q2","from":"2019-07","to":"2019-09"},
                {"origin":"2019-Q3","from":"2019-10","to":"2019-12"},
                {"origin":"2019-Q4","from":"2020-01","to":"2020-03"},
                {"origin":"2020-Q1","from":"2020-04","to":"2020-06"},
                {"origin":"2020-Q2","from":"2020-07","to":"2020-09"},
                {"origin":"2020-Q3","from":"2020-10","to":"2020-12"},
                {"origin":"2020-Q4","from":"2021-01","to":"2021-03"}
            ]
        },
        {
            "name":"month",
            "ranges":[
                {"origin":"2019-04","from":"2019-04-05","to":"2019-05-04"},
                {"origin":"2019-05","from":"2019-05-05","to":"2019-06-04"},
                {"origin":"2019-06","from":"2019-06-05","to":"2019-07-04"},
                {"origin":"2019-07","from":"2019-07-05","to":"2019-08-04"},
                {"origin":"2019-08","from":"2019-08-05","to":"2019-09-04"},
                {"origin":"2019-09","from":"2019-09-05","to":"2019-10-04"},
                {"origin":"2019-10","from":"2019-10-05","to":"2019-11-04"},
                {"origin":"2019-11","from":"2019-11-05","to":"2019-12-04"},
                {"origin":"2019-12","from":"2019-12-05","to":"2019-01-04"},
                {"origin":"2020-01","from":"2020-01-05","to":"2020-02-04"},
                {"origin":"2020-02","from":"2020-02-05","to":"2020-03-04"},
                {"origin":"2020-03","from":"2020-03-05","to":"2020-04-04"},
                {"origin":"2020-04","from":"2020-04-05","to":"2020-05-04"},
                {"origin":"2020-05","from":"2020-05-05","to":"2020-06-04"},
                {"origin":"2020-06","from":"2020-06-05","to":"2020-07-04"},
                {"origin":"2020-07","from":"2020-07-05","to":"2020-08-04"},
                {"origin":"2020-08","from":"2020-08-05","to":"2020-09-04"},
                {"origin":"2020-09","from":"2020-09-05","to":"2020-10-04"},
                {"origin":"2020-10","from":"2020-10-05","to":"2020-11-04"},
                {"origin":"2020-11","from":"2020-11-05","to":"2020-12-04"},
                {"origin":"2020-12","from":"2020-12-05","to":"2020-01-04"},
                {"origin":"2021-01","from":"2021-01-05","to":"2021-02-04"},
                {"origin":"2021-02","from":"2021-02-05","to":"2021-03-04"},
                {"origin":"2021-03","from":"2021-03-05","to":"2021-04-04"},
                {"origin":"2021-04","from":"2021-04-05","to":"2021-05-04"}
           ]
        }
    ]
    }
}
```

In this example quarters are defined by months that are custom (e.g. 2019-Q1 is from 2019-04 to 2019-06). The months defining the quarters are also custom since the month starts on the 5th and ends the following month on the 4th (e.g. 2019-04 is from 2019-04-05 to 2019-05-04).

A common custom calendar used in business to manage accounting periods is the 4-4-5 calendar. You can easily define this calendar using custom calendars:

```
{
    "intervals":[
        {
            "name":"445Calendar",
            "ranges":[
                {"origin":"2020-01","from":"2020-W1","to":"2020-W4"},
                {"origin":"2020-02","from":"2020-W5","to":"2020-W8"},
                {"origin":"2020-03","from":"2020-W9","to":"2020-W13"},
                {"origin":"2020-04","from":"2020-W14","to":"2020-W17"},
                {"origin":"2020-05","from":"2020-W18","to":"2020-W21"},
                {"origin":"2020-06","from":"2020-W22","to":"2020-W26"},
                {"origin":"2020-07","from":"2020-W27","to":"2020-W30"},
                {"origin":"2020-08","from":"2020-W31","to":"2020-W34"},
                {"origin":"2020-09","from":"2020-W35","to":"2020-W39"},
                {"origin":"2020-10","from":"2020-W40","to":"2020-W43"},
                {"origin":"2020-11","from":"2020-W44","to":"2020-W47"},
                {"origin":"2020-12","from":"2020-W48","to":"2020-W52"}
           ]
        }
    ]
    }
}
```

## Things to Note On The Custom Calendar

There are various conditions that would lead to an invalid calendar. For example, specifying 2020-Q1 as ranging from 2020-Q1 to 2020-Q1 would create a recursive calendar definition. Similarly specifying 2020-W1 as ranging from 2019 to 2021 doesn't make any sense.

By convention the interval names should not be pluralised in the case where they redefine the equivalent interval in a Gregorian calendar. For example, if you are re-defining what a month is, then the convention is to name the inveral month rather than months or anything else. This then avoids complications with your [Tractor Beam](tractor/tractorbeams.md) to that if you use group by month then you do not have to amend the beam to and not group by months etc.
