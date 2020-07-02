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

### Example 1: Get absolute difference

Take the following data set:

```language-katsu
2019-01-01[Company:Microsoft][Country:Germany]{Net:10}{Tax:2}{Gross:12}
2019-01-01[Company:Microsoft][Country:UK]{Net:11}{Tax:1}{Gross:11}
2019-03-01[Company:Microsoft][Country:US]{Net:12}{Tax:3}{Gross:14}
2020-01-01[Company:Microsoft][Country:Germany]{Net:12}{Tax:3}{Gross:15}
2020-02-01[Company:Microsoft][Country:UK]{Net:10}{Tax:2}{Gross:12}
```

This script get the number of data points:

```language-tractor
~> difference absolute ~>
```

and returns:

```language-katsu
2020-01-01T00:00:00.000[Company:Microsoft][Country:Germany]{absolute difference of Gross:3}{absolute difference of Net:2}{absolute difference of Tax:1}
2020-02-01T00:00:00.000[Company:Microsoft][Country:UK]{absolute difference of Gross:1}{absolute difference of Net:-1}{absolute difference of Tax:1}
```


### Example 2: Get percentage difference

Take the following data set:

```language-katsu
2019-01-01[Company:Microsoft][Country:Germany]{Net:10}{Tax:2}{Gross:12}
2019-01-01[Company:Microsoft][Country:UK]{Net:11}{Tax:1}{Gross:11}
2019-03-01[Company:Microsoft][Country:US]{Net:12}{Tax:3}{Gross:14}
2020-01-01[Company:Microsoft][Country:Germany]{Net:12}{Tax:3}{Gross:15}
2020-02-01[Company:Microsoft][Country:UK]{Net:10}{Tax:2}{Gross:12}
```

The following script, groups the data points by company and then sums the values for each group:

```language-tractor
~> difference percentage ~>
```

and returns:

```language-katsu
2020-01-01T00:00:00.000[Company:Microsoft][Country:Germany]{percentage difference of Gross:0.25}{percentage difference of Net:0.2}{percentage difference of Tax:0.5}
2020-02-01T00:00:00.000[Company:Microsoft][Country:UK]{percentage difference of Gross:0.09090909090909091}{percentage difference of Net:-0.09090909090909091}{percentage difference of Tax:1}
```
