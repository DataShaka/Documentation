# Count 

## Definition

The **count** verb counts the number of data points in a list [Data packages](../datapackages.md) or a single [Data package](../datapackages.md). The result is a [Data package](../datapackages.md).


## Syntax

```language-tractor
~> count unique chopstick ~>
```

> `unique` keyword and chopstick are optional.
> If unique keyword is present, the system will return the distinct count
> If chopstick is present, the system will first filter out the data points according to the chopstick and then return the count.

Refer to the [Chopsticks](../chopsticks.md) page to learn how to build them.

## Examples

### Example 1: Get count of 

Take the following data set:

```language-katsu
2019-01-01[Company:Microsoft][Country:Germany]{Net:10}{Tax:2}{Gross:12}
2019-02-01[Company:Microsoft][Country:Germany]{Net:10}{Tax:2}{Gross:12}
2019-03-01[Company:Microsoft][Country:Germany]{Net:10}{Tax:2}{Gross:12}
2020-01-01[Company:Microsoft][Country:Germany]{Net:10}{Tax:2}{Gross:12}
2020-02-01[Company:Microsoft][Country:Germany]{Net:10}{Tax:2}{Gross:12}
```

This script get the number of data points:

```language-tractor
~> count ~>
```

and returns:

```language-katsu
2019-01-01[Company:Microsoft][Country:Germany]{Net:30}{Tax:6}{Gross:36}
2020-01-01[Company:Microsoft][Country:Germany]{Net:20}{Tax:4}{Gross:24}
```


### Example 2: Get unique count of

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

### Example 3: get unique count of specified chopstick

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
