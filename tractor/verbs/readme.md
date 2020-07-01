# Tractor Verbs

Tractor is a language that uses verbs to define actions to be peformed on the data. For example:

```
filter {High}{Low} ~> group by year ~> calculate "{High}/{Low}" 
```

> filter, group by and calculate are all examples of verbs with different features.


Verbs that are currently available for manipulating data in Tractor are:

- Average
- Calculate
- Crop
- Filter
- Group by
- Pad
- Rank
- Roll by
- Sort by
- Sum


# Keywords

A keyword is an attachment to a verb to indicate 'what to do' with the data from the last step only. 
For example:

`filter {High}{Low} ~> group by year ~> calculate "{High}/{Low}" includes {Ratio}`

In this example, one keyword is `includes` and the indication is to use the result from the calculation `"{High}/{Low}"` to create and include another signal named `{Ratio}` in the dataset.

Another keyword is `year` and is the indication for how to group the data. Data can be grouped by year, quarter, month, week, day, hour, second and millisecond. All of these are *keywords*.

Keywords that are currently available for manipulating data in [Tractor](../../glossary.md#tractor) are:

- includes
- returns
- with (to be used in conjunction with replace)

>Note that there is no Hitch `~>` between a verb and its attached keyword, as they are essentially part of the same action.
