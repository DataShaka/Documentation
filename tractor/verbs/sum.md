# Sum 

## Definition

The **sum** verb adds up values of a list [Data packages](../datapackages.md) or a single [Data package](../datapackages.md). The result is a [Data package](../datapackages.md).

Default behaviour: 
- The time point associated with the resulting package is the first point of the aggregated data.
- By default, non-existent values are zeros.


## Syntax

```language-tractor
~> sum ~>
```

## Examples

### Example 1: Sum Values In The Same Time Interval

Take the following data set:

```language-katsu
2019-01-01[Company:Microsoft][Country:Germany]{Net:10}{Tax:2}{Gross:12}
2019-02-01[Company:Microsoft][Country:Germany]{Net:10}{Tax:2}{Gross:12}
2019-03-01[Company:Microsoft][Country:Germany]{Net:10}{Tax:2}{Gross:12}
2020-01-01[Company:Microsoft][Country:Germany]{Net:10}{Tax:2}{Gross:12}
2020-02-01[Company:Microsoft][Country:Germany]{Net:10}{Tax:2}{Gross:12}
```

This script groups the data by year and then sums the values for each group:

```language-tractor
~> group by year ~> sum ~>
```

and returns:

```language-katsu
2019-01-01[Company:Microsoft][Country:Germany]{Net:30}{Tax:6}{Gross:36}
2020-01-01[Company:Microsoft][Country:Germany]{Net:20}{Tax:4}{Gross:24}
```

>Note that the time point for each group is taken from the earliest data point in each group.

### Example 2: Summing Over A Consistent Context and Signal Sets

Take the following data set:

```language-katsu
2019-01-01[Company:Microsoft][Country:Germany]{Net:10}{Tax:2}{Gross:12}
2020-01-01[Company:Google][Country:Germany]{Net:10}{Tax:2}{Gross:12}
2019-01-01[Company:Microsoft][Country:UK]{Net:10}{Tax:2}{Gross:12}
2020-01-01[Company:Microsoft][Country:UK]{Net:10}{Tax:2}{Gross:12}
2020-01-01[Company:Google][Country:France]{Net:10}{Tax:2}{Gross:12}
```

The following script, groups the data points by company and then sums the values for each group:

```language-tractor
~> group by [Comapny:] ~> sum ~>
```

and returns:

```language-katsu
2019-01-01[Company:Microsoft]{Net:30}{Tax:6}{Gross:36}
2020-01-01[Company:Google]{Net:20}{Tax:4}{Gross:24}
```

### Example 3: Summing Over An Inconsistent Context and Signal Sets

Take the following data set:

```language-katsu
2019-01-01[Company:Microsoft][Country:Germany]{Net:10}{Tax:2}{Gross:12}
2020-01-01[Company:Google][Country:Germany]{Net:10}{Gross:12}
2019-01-01[Company:Microsoft][Country:UK]{Net:10}{Tax:2}
2020-01-01[Company:Microsoft][Country:UK]{Tax:2}{Gross:12}
2020-01-01[Company:Google][Country:France]{Net:10}{Tax:2}{Gross:12}
```

The following script, groups the datapoints by company and then sums the values for each group:

```language-tractor
~> group by [Company:] ~> sum ~>
```

and returns:

```language-katsu
2019-01-01[Company:Microsoft]{Net:20}{Tax:6}{Gross:24}
2020-01-01[Company:Google]{Net:20}{Tax:2}{Gross:24}
```

>Where there is no value to sum, Tractor moves on to the next data point.
