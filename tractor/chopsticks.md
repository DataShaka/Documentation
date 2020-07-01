# What Are Chopsticks?

A chopstick defines the data selected and is written in [Katsu](../glossary.md#katsu) syntax. A Chopstick allows the user to define very accurately the selection of data that is to be dealt with by the [Verbs](./verbs/readme.md). It consists of:

- zero or one time fragment
- zero, one or many context fragments
- zero, one or many signal/value fragments

Here are some examples of Chopsticks:

One time fragment, two context fragments and one signal/value fragment

```
2013[Country:Brazil][Country:France]{Won:6}
```

Zero time fragments, zero context fragments and three signal/value fragments

```
{Twitter Followers}{Facebook Likes}{Instagram Likes}
```

One time fragment, two context fragments and zero signal/value fragments

```
2014-01-01[Brand:Evian][Region:Europe][Country:UK]
```

# Fragments

To understand chopsticks better we can divide them into three different types of fragments

- [Time Fragment](#timefragment)
- [Context Fragment](#contextfragment)
- [Signal/Value Fragment](#signalvaluefragment)

## <a id="timefragment">Time Fragment</a>

Chopstick supports [ISO8601](../principles.md#iso8601) notation to specify date and time ranges up to the millisecond. The table below shows what time ranges you get if you select different time ranges:

|Time Selected	| Start Date | End Date|
|---------------|------------|---------|
|2020 | 2020-01-01T00:00:00.000	| 2020-12-31T23:59:59.999|
|2020-01	| 2020-01-01T00:00:00.000	| 2020-01-31T23:59:59.999|
|2020-01-01T12:34:52	| 2020-01-01T12:34:52.000	| 2020-01-01T12:34:52.999|

So if you select 2020 as your date them your interval will start at midnight of the 1st of January and end on mignight on the 31st of December.

For example on the dataset:

```
2020[Sport:Football][Country:Brazil][Even:World Cup]{Won:1}
2019[Sport:Football][Country:Brazil][Even:World Cup]{Won:2}
2018[Sport:Football][Country:Brazil][Even:World Cup]{Won:6}
```

Below script selects all points in 2020 only:

`select 2020`

and returns

`2020[Sport:Football][Country:Brazil][Even:World Cup]{Won:1}`

## <a id="contextfragment">Context Fragment</a>

Chopstick uses built-in functions to perform searches on alphanumerical content in the data. Here are the different ways in which a user can look for data:

To look for context type 'Country' and context name 'Brazil' you use:

`[Country:Brazil]`

To look for context type 'Country' with any context name you use either:

`[Country:any()] or [Country:]`

To look for context name 'Brazil' with any context you use:

`[:Brazil]`

To look for context name 'Brazil' with any context you use eitehr:

`[:Brazil]` or [any():Brazil]`

To look for any context type and any context names you use either:

`[any():any()] or [:]`

You can also use Regex to define your context chopstick.

To look for context type 'Country' with any context name starting with an 'F' you use:

`[Country:regex('^F.*')]`

To look for context name 'Brazil' with any context type starting by a 'C' you use:

`[regex('^C.*'):Brazil]`

To look for context type starting by a 'C' with any contex type you use either:

`[regex('^C.*'):any()] or [regex('^C.*'):]`

To look for context name starting by 'B' with any context type you use either:

`[any():regex('^B.*')] or [:regex('^B.*')]`

To look for context types starting by 'C' associated with context name starting by 'B' you use:

`[regex('^C.*'):regex('^B.*')]`

#### Examples Using Context Fragments

1. Example 1

    Take the following data set:

    ```
    1958[Sport:Football][Country:Brazil][Event:World Cup]{Won:1}
    1962[Sport:Football][Country:Brazil][Event:World Cup]{Won:2}
    1998[Sport:Football][Country:France][Event:World Cup]{Won:1}
    2002[Sport:Football][Country:Brazil][Event:World Cup]{Won:6}
    ```

    This script selects all points in January 2015 and groups them by day:

    `select [Country:regex('^F.*')]`

    and returns

    `1998[Sport:Football][Country:France][Event:World Cup]{Won:1}`

1. Example 2

    Take the following data set:

    ```
    2014-01-01[Brand:X][Country:UK]{Net:12}{Tax:1}{Gross:13}
    2014-01-01[Brand:X][Country:France]{Net:25}{Tax:3}{Gross:28}
    2014-01-01[Brand:Y][Country:France]{Net:25}{Tax:3}{Gross:28}
    2014-01-01[Brand:Z][Country:France]{Net:25}{Tax:3}{Gross:28}
    ```

    This script selects all points in January 2015 and group them by day

    `select [Brand:regex('^Z$')]`

    and returns

    `2014-01-01[Brand:Z][Country:France]{Net:25}{Tax:3}{Gross:28}`

1. Example 3

    Take the following data set:

    ```
    2013-01-01[Brand:X][Countery:UK]{Net:12}{Tax:1}{Gross:13}
    2013-01-01[Brand:X][County:France]{Net:25}{Tax:3}{Gross:28}
    2014-01-01[Brand:Y][Country:France]{Net:25}{Tax:3}{Gross:28}
    2014-01-01[Brand:Z][County:France]{Net:25}{Tax:3}{Gross:28}
    ```

    This script selects all points in January 2015 and group them by day

    `select 2014-01-01[regex('^Cou.*'):]`

    and returns

    ```
    2014-01-01[Brand:Y][Country:France]{Net:25}{Tax:3}{Gross:28}
    2014-01-01[Brand:Z][County:France]{Net:25}{Tax:3}{Gross:28}
    ```

## <a id="signalvaluefragment">Signal/Value Fragment</a>

Use can also use Chopstick's built-in functions to perform searches on Signals and Values. Here are the different ways in which a user can look for data:

To look for all points with signal 'Net' associated with a value of 25 you use:

`{Net:25}`

To look for all points with signal 'Net' associated with any value you use either:

`{Net:} or {Net:any()}`

To look for all points with signal starting by 'Ne' associated with a value of 25 you use:

`{regex('^Ne.*'):25}`

To look for all points with signal starting by 'Ne' associated with any value you use either:

`{regex('^Ne.*'):} or {regex('^Ne.*'):any()}`

To look for all points with a value of 25, regardless of signal you use either:

`{:25} or {any():25}`

To look for all points you use either:

`{:} or {any():any()}`


Examples Using Signal/Value Fragments

1. Example 1

    Take the following data set:

    ```
    2012-01-01[Brand:X][Country:UK]{Net:12}{Tax:1}{Gross:13}
    2014-01-01[Brand:X][Country:France]{Net:25}{Gross:28}
    2014-01-01[Brand:Y][Country:France]{Net:25}{Tax:3}{Gross:28}
    2014-01-01[Brand:Z][Country:France]{Net:25}{Gross:28}
    ```
    
    This script selects all points in January 2015 and group them by day

    `select 2012{Tax:}`
    
    and returns:

    `2012-01-01[Brand:X][Country:UK]{Net:12}{Tax:1}{Gross:13}`
    
