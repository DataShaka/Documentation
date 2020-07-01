# What Are Chopsticks?

A chopstick defines the data selected and is written in [Katsu](../glossary.md#katsu) syntax. A Chopstick allows the user to define very accurately the selection of data that is to be dealt with by the [Verbs](./verbs/readme.md). It consists of:

- zero or one time fragment
- zero, one or many context fragments
- zero, one or many signal/value fragments

Here are some examples of Chopsticks:

One time fragment, two context fragments and one signal/value fragment

```
2018[Country:Brazil][Country:France]{Played:6}
```

Zero time fragments, zero context fragments and three signal/value fragments

```
{Twitter Followers}{Facebook Likes}{Instagram Likes}
```

One time fragment, two context fragments and zero signal/value fragments

```
2020-01-01[Brand:Evian][Region:Europe][Country:UK]
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

So if you select 2020 as your date them your interval will start at midnight of the 1st of January and end on midnight on the 31st of December.

For example on the dataset:

```
2018[Sport:Football][Country:Brazil][Event:World Cup]{Played:1}
2014[Sport:Football][Country:Brazil][Event:World Cup]{Played:2}
2010[Sport:Football][Country:Brazil][Event:World Cup]{Played:6}
```

Below script selects all points in 2018 only:

`2018`

and returns

`2018[Sport:Football][Country:Brazil][Event:World Cup]{Played:1}`

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
    1958[Sport:Football][Country:Brazil][Event:World Cup]{Played:1}
    1962[Sport:Football][Country:Brazil][Event:World Cup]{Played:2}
    1998[Sport:Football][Country:France][Event:World Cup]{Played:1}
    2002[Sport:Football][Country:Brazil][Event:World Cup]{Played:6}
    ```

    This script selects all points where context type is Country and the context name matching regex ^F.* :

    `[Country:regex('^F.*')]`

    and returns

    `1998[Sport:Football][Country:France][Event:World Cup]{Played:1}`

2. Example 2

    Take the following data set:

    ```
    2020-01-01[Brand:X][Country:UK]{Net:12}{Tax:1}{Gross:13}
    2020-01-01[Brand:X][Country:France]{Net:25}{Tax:3}{Gross:28}
    2020-01-01[Brand:Y][Country:France]{Net:25}{Tax:3}{Gross:28}
    2020-01-01[Brand:Z][Country:France]{Net:25}{Tax:3}{Gross:28}
    ```

    This script selects all points where context type is Brand and context name matching regex ^Z$ :

    `[Brand:regex('^Z$')]`

    and returns

    `2020-01-01[Brand:Z][Country:France]{Net:25}{Tax:3}{Gross:28}`

3. Example 3

    Take the following data set:

    ```
    2019-01-01[Brand:X][Countery:UK]{Net:12}{Tax:1}{Gross:13}
    2019-01-01[Brand:X][County:France]{Net:25}{Tax:3}{Gross:28}
    2020-01-01[Brand:Y][Country:France]{Net:25}{Tax:3}{Gross:28}
    2020-01-01[Brand:Z][County:France]{Net:25}{Tax:3}{Gross:28}
    ```

    This script selects all points in 1-Jan-2020 and context type matching regex ^Cou.* :

    `2020-01-01[regex('^Cou.*'):]`

    and returns

    ```
    2020-01-01[Brand:Y][Country:France]{Net:25}{Tax:3}{Gross:28}
    2020-01-01[Brand:Z][County:France]{Net:25}{Tax:3}{Gross:28}
    ```

## <a id="signalvaluefragment">Signal/Value Fragment</a>

You can also use Chopstick's built-in functions to perform searches on Signals and Values. Here are the different ways in which a user can look for data:

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
    2018-01-01[Brand:X][Country:UK]{Net:12}{Tax:1}{Gross:13}
    2020-01-01[Brand:X][Country:France]{Net:25}{Gross:28}
    2020-01-01[Brand:Y][Country:France]{Net:25}{Tax:3}{Gross:28}
    2020-01-01[Brand:Z][Country:France]{Net:25}{Gross:28}
    ```
    
    This script selects all points in 2018 and signal name as Tax :

    `2018{Tax:}`
    
    and returns:

    `2018-01-01[Brand:X][Country:UK]{Net:12}{Tax:1}{Gross:13}`
    
    
    
# Being Accurate With Your Values

In addition to the syntax above, Chopsticks can be used to specify a range of values using operators:

- `>` for e.g. {Gross:>5} keeps all points for which Gross is strickly greater than 5
- `>=` for e.g. {Gross:>=5} keeps all points for which Gross is greater than 5
- `<` for e.g. {Gross:>5} keeps all points for which Gross is strickly less than 5
- `<=` for e.g. {Gross:>5} keeps all points for which Gross is less than 5
- `<>` for e.g. {Gross:>5} keeps all points for which Gross is different than 5
- `-` for e.g. {Gross:5-10} keeps all points for which Gross is between 5 and 10 ( non strictly)

For instance, let's take the following data set:

```
2018-01-01[Brand:X][Country:UK]{Net:12}{Tax:1}{Gross:13}
2020-01-01[Brand:X][Country:France]{Net:25}{Gross:28}
2020-01-01[Brand:Y][Country:France]{Net:25}{Tax:3}{Gross:28}
2020-01-01[Brand:Z][Country:France]{Net:25}{Gross:28}
```

Below script selects all points in 2018 and with signal name as Net with value less than 20

`2018{Net:<20}`

and returns

`2018-01-01[Brand:X][Country:UK]{Net:12}`



# Rules For Chopsticks

- Tractor doesn't support ranges definition such as 2018 to 2020
- Text comparisons are case sensitive, Brazil is not the same as brazil
- When a context type is mentioned more than once in a Chopstick, Tractor applies an implicit `or` :

  Take the following dataset:

  ```
  2018-01-01[Brand:X][Country:UK]{Net:12}{Tax:1}{Gross:13}
  2020-01-01[Brand:X][Country:France]{Net:25}{Gross:28}
  2020-01-01[Brand:Y][Country:France]{Net:25}{Tax:3}{Gross:28}
  2020-01-01[Brand:Z][Country:Germany]{Net:25}{Gross:28}
  ```

  Below script selects all points with context type Country and Name UK OR France

  `[Country:UK][Country:France]`

  and returns

  ```
  2018-01-01[Brand:X][Country:UK]{Net:12}{Tax:1}{Gross:13}
  2020-01-01[Brand:X][Country:France]{Net:25}{Gross:28}
  2020-01-01[Brand:Y][Country:France]{Net:25}{Tax:3}{Gross:28}
  ```
