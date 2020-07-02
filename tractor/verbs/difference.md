# Difference 

## Definition

The **difference** verb gets the difference between the two data points with same context and signal signature in a list of [Data packages](../datapackages.md) or a single [Data package](../datapackages.md). The result is a [Data package](../datapackages.md).

Two methods of getting difference are currently available:

- **Absolute**: An absolute difference is calculated in this method.
- **Percentage**: Difference in percentage is calculated in thi method.

The resulting signal is automatically named by concatenating method name and the " difference of " word to the original signal name for e.g. "Price" would generate a new signal named "absolute difference of Price" OR "percentage difference of Price".


## Syntax

```language-tractor
~> difference METHOD ~>
```

Options:

- METHOD : 'absolute' or 'percentage'.


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
