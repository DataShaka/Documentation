# Count 

## Definition

The **count** verb counts the number of data points in a list [Data packages](../datapackages.md) or a single [Data package](../datapackages.md). The result is a [Data package](../datapackages.md).

The resulting signal is automatically named by concatenating below words to the original signal name, depending on the case:

- "count of " for e.g. "count of Gross"
- "count of chopstick" for e.g. "count of [Company:Microsoft]"
- "count of unique chopstick" for e.g. "count of unique [Company:Microsoft]"

## Syntax

```language-tractor
~> count unique chopstick ~>
```

> `unique` keyword and chopstick are optional.
> If unique keyword is present, the system expects the chopstick as well, otherwise an error is thrown. If the unique keyword and chopstick are present, the system will return the distinct count according to the chopstick.
> If only chopstick is present, the system will return the count according to the chopstick

Refer to the [Chopsticks](../chopsticks.md) page to learn how to build them.

## Examples

### Example 1: Get count of 

Take the following data set:

```language-katsu
2019-01-01[Company:Microsoft][Country:Germany]{Net:10}{Tax:2}{Gross:12}
2019-01-01[Company:Microsoft][Country:UK]{Net:11}{Tax:1}{Gross:11}
2019-03-01[Company:Microsoft][Country:US]{Net:12}{Tax:3}{Gross:14}
2020-01-01[Company:Microsoft][Country:Germany]{Net:10}{Tax:2}{Gross:12}
2020-02-01[Company:Microsoft][Country:UK]{Net:10}{Tax:2}{Gross:12}
```

This script get the number of data points:

```language-tractor
~> count ~>
```

and returns:

```language-katsu
2019-01-01T00:00:00.000[Company:Microsoft][Country:Germany]{count of Gross:1}{count of Net:1}{count of Tax:1}
2019-01-01T00:00:00.000[Company:Microsoft][Country:UK]{count of Gross:1}{count of Net:1}{count of Tax:1}
2019-03-01T00:00:00.000[Company:Microsoft][Country:US]{count of Gross:1}{count of Net:1}{count of Tax:1}
2020-01-01T00:00:00.000[Company:Microsoft][Country:Germany]{count of Gross:1}{count of Net:1}{count of Tax:1}
2020-02-01T00:00:00.000[Company:Microsoft][Country:UK]{count of Gross:1}{count of Net:1}{count of Tax:1}
```


### Example 2: Get unique count of context type and context name

Take the following data set:

```language-katsu
2019-01-01[Company:Microsoft][Country:Germany]{Net:10}{Tax:2}{Gross:12}
2019-01-01[Company:Microsoft][Country:UK]{Net:11}{Tax:1}{Gross:11}
2019-03-01[Company:Microsoft][Country:US]{Net:12}{Tax:3}{Gross:14}
2020-01-01[Company:Microsoft][Country:Germany]{Net:10}{Tax:2}{Gross:12}
2020-02-01[Company:Microsoft][Country:UK]{Net:10}{Tax:2}{Gross:12}
```

The following script, groups the data points by company and then sums the values for each group:

```language-tractor
~> count unique [Company:Microsoft] ~>
```

and returns:

```language-katsu
2019-01-01T00:00:00.000[Company:Microsoft][Country:Germany]{count of unique \\[Company\\:Microsoft\\]:1}{count of unique \\[Company\\:Microsoft\\]:1}{count of unique \\[Company\\:Microsoft\\]:1}
2019-01-01T00:00:00.000[Company:Microsoft][Country:UK]{count of unique \\[Company\\:Microsoft\\]:1}{count of unique \\[Company\\:Microsoft\\]:1}{count of unique \\[Company\\:Microsoft\\]:1}
2019-03-01T00:00:00.000[Company:Microsoft][Country:US]{count of unique \\[Company\\:Microsoft\\]:1}{count of unique \\[Company\\:Microsoft\\]:1}{count of unique \\[Company\\:Microsoft\\]:1}
2020-01-01T00:00:00.000[Company:Microsoft][Country:Germany]{count of unique \\[Company\\:Microsoft\\]:1}{count of unique \\[Company\\:Microsoft\\]:1}{count of unique \\[Company\\:Microsoft\\]:1}
2020-02-01T00:00:00.000[Company:Microsoft][Country:UK]{count of unique \\[Company\\:Microsoft\\]:1}{count of unique \\[Company\\:Microsoft\\]:1}{count of unique \\[Company\\:Microsoft\\]:1}
```

### Example 3: Get count of context type and context name

Take the following data set:

```language-katsu
2019-01-01[Company:Microsoft][Country:Germany]{Net:10}{Tax:2}{Gross:12}
2019-01-01[Company:Microsoft][Country:UK]{Net:11}{Tax:1}{Gross:11}
2019-03-01[Company:Microsoft][Country:US]{Net:12}{Tax:3}{Gross:14}
2020-01-01[Company:Microsoft][Country:Germany]{Net:10}{Tax:2}{Gross:12}
2020-02-01[Company:Microsoft][Country:UK]{Net:10}{Tax:2}{Gross:12}
```

The following script, groups the data points by company and then sums the values for each group:

```language-tractor
~> count [Company:Microsoft] ~>
```

and returns:

```language-katsu
2019-01-01T00:00:00.000[Company:Microsoft][Country:Germany]{count of \\[Company\\:Microsoft\\]:1}{count of \\[Company\\:Microsoft\\]:1}{count of \\[Company\\:Microsoft\\]:1}
2019-01-01T00:00:00.000[Company:Microsoft][Country:UK]{count of \\[Company\\:Microsoft\\]:1}{count of \\[Company\\:Microsoft\\]:1}{count of \\[Company\\:Microsoft\\]:1}
2019-03-01T00:00:00.000[Company:Microsoft][Country:US]{count of \\[Company\\:Microsoft\\]:1}{count of \\[Company\\:Microsoft\\]:1}{count of \\[Company\\:Microsoft\\]:1}
2020-01-01T00:00:00.000[Company:Microsoft][Country:Germany]{count of \\[Company\\:Microsoft\\]:1}{count of \\[Company\\:Microsoft\\]:1}{count of \\[Company\\:Microsoft\\]:1}
2020-02-01T00:00:00.000[Company:Microsoft][Country:UK]{count of \\[Company\\:Microsoft\\]:1}{count of \\[Company\\:Microsoft\\]:1}{count of \\[Company\\:Microsoft\\]:1}
```
