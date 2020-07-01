# Average 

## Definition

The **average** verb averages up values of a [Data package](../datapackages.md) points. The result is also a [Data package](../datapackages.md).

The time point associated with the resulting package is the first point of the aggregated data. By default, non-existent values are ignored. The method used is the [arithmetic mean](http://en.wikipedia.org/wiki/Arithmetic_mean)


## Syntax

```language-tractor
average ~>
```

## Examples Using Average

### Example 1: Consistent Signals

Consider the data:

```language-katsu
2020-01-01[Brand:Lipton][Product:Red Berry Tea]{Net:10}{Tax:2}{Gross:12}
2020-02-01[Brand:Lipton][Product:Red Berry Tea]{Net:10}{Tax:2}{Gross:12}
2020-01-01[Brand:Lipton][Product:Green Tea]{Net:20}{Tax:2}{Gross:12}
2020-02-01[Brand:Lipton][Product:Green Tea]{Net:30}{Tax:2}{Gross:12}
2020-03-01[Brand:Lipton][Product:Red Berry Tea]{Net:10}{Tax:2}{Gross:24}
```

The following Tractor script:

```language-tractor
group by quarter ~> average
```

returns:

```language-katsu
2020-01-01[Brand:Lipton][Product:Red Berry Tea]{Net:10}
2020-01-01[Brand:Lipton][Product:Red Berry Tea]{Tax:2}
2020-01-01[Brand:Lipton][Product:Red Berry Tea]{Gross:16}
2020-01-01[Brand:Lipton][Product:Green Tea]{Net:25}
2020-01-01[Brand:Lipton][Product:Green Tea]{Tax:2}
2020-01-01[Brand:Lipton][Product:Green Tea]{Gross:12}
```

### Example 2: Inconsistent Signals

Consider the dataset with an inconsistent signals (there are signals missing for Net and Tax and Gross):

```language-katsu
2020-01-01[Brand:Lipton][Product:Red Berry Tea]{Net:10}{Tax:2}{Gross:12}
2020-02-01[Brand:Lipton][Product:Red Berry Tea]{Net:10}{Gross:12}
2020-01-01[Brand:Lipton][Product:Green Tea]{Net:20}{Tax:2}
2020-01-01[Brand:Lipton][Product:Green Tea]{Tax:2}{Gross:12}
2020-03-01[Brand:Lipton][Product:Red Berry Tea]{Net:10}{Tax:2}{Gross:24}
```

The following Tractor script:

```language-tractor
~> group by quarter ~> average
```

returns:

```language-katsu
2020-01-01[Brand:Lipton][Product:Red Berry Tea]{Net:10}
2020-01-01[Brand:Lipton][Product:Red Berry Tea]{Tax:2}
2020-01-01[Brand:Lipton][Product:Red Berry Tea]{Gross:16}
2020-01-01[Brand:Lipton][Product:Green Tea]{Net:20}
2020-01-01[Brand:Lipton][Product:Green Tea]{Tax:2}
2020-01-01[Brand:Lipton][Product:Green Tea]{Gross:12}
```

## Things To Note

When there are missing values in the data package, the average calculation ignores these instead of treating them as zeros. 
