# Rank

## Definition

The **rank** verb returns the rank of a signal across the given context type within a [Data package](../datapackages.md) for each time point.

Two methods of ranking are currently available:

- **Standard**: The rank of a point is one plus the number of the rank that came before the point in question. Equal values are not taken into account, points are numbered as they came through (1st, 2nd, 3rd etc)
- **Olympic**: the rank of a point is one plus the number of the rank that came before the point in question. Points with equal values are given the same rank. For example you can have a rank of joint 2nd. Also known as 1223 ranking.
- **Competition**: the rank of a point is one plus the number of the rank that came before. Points with equal value are given the same rank and following points 'skip'. Also known as 1224 ranking.

The first point in the set is always ranked as 1.

The resulting signal is automatically named by concatenating "Rank" to the original signal name and adding the context type by which the data is ranked e.g. "Price" would generate a new signal named "Price Rank by Brand".


## Syntax

```language-tractor
~> rank METHOD [Context Type] ~>
```

Options:

- [Context Type] : the name of the context type on which the rank is performed.
- METHOD : 'standard' or 'olympic' or 'competition'. If not provided, the default is 'standard'.


## Examples

### Example 1: Ranking Data Across A Given Context Type

Take the following data set:

```language-katsu
2020-01-01[Brand:Barclays][Subgroup:Male][Metric:Awareness]{Signal:10}
2020-01-01[Brand:Halifax][Subgroup:Male][Metric:Awareness]{Signal:30}
2020-01-01[Brand:Santander][Subgroup:Male][Metric:Awareness]{Signal:20}
```

The following Tractor script:

```language-tractor
~> rank standard [Brand] ~>
```

or

```language-tractor
~> rank [Brand] ~>
```

returns:

```language-katsu
2020-01-01[Brand:Halifax][Subgroup:Male][Metric:Awareness]{Signal:30}{Signal Rank by Brand:1}
2020-01-01[Brand:Santander][Subgroup:Male][Metric:Awareness]{Signal:20}{Signal Rank by Brand:2}
2020-01-01[Brand:Barclays][Subgroup:Male][Metric:Awareness]{Signal:10}{Signal Rank by Brand:3}
```

### Example 2: Ranking Across A Given Context Type With Several Time Points

Take the following data set:

```language-katsu
2019-01-01[Brand:Barclays][Subgroup:Male][Metric:Awareness]{Signal:10}
2019-01-01[Brand:Halifax][Subgroup:Male][Metric:Awareness]{Signal:30}
2019-01-01[Brand:Santander][Subgroup:Male][Metric:Awareness]{Signal:20}
2020-01-01[Brand:Barclays][Subgroup:Male][Metric:Consideration]{Signal:100}
2020-01-01[Brand:Halifax][Subgroup:Male][Metric:Consideration]{Signal:200}
2020-01-01[Brand:Santander][Subgroup:Male][Metric:Consideration]{Signal:300}
```

The following Tractor script:

```language-tractor
~> rank standard [Brand] ~>
```

or

```language-tractor
~> rank [Brand] ~>
```

returns

```language-katsu
2019-01-01[Brand:Halifax][Subgroup:Male][Metric:Awareness]{Signal:30}{Signal Rank by Brand:1}
2019-01-01[Brand:Santander][Subgroup:Male][Metric:Awareness]{Signal:20}{Signal Rank by Brand:2}
2019-01-01[Brand:Barclays][Subgroup:Male][Metric:Awareness]{Signal:10}{Signal Rank by Brand:3}
2020-01-01[Brand:Santander][Subgroup:Male][Metric:Consideration]{Signal:300}{Signal Rank by Brand:1}
2020-01-01[Brand:Halifax][Subgroup:Male][Metric:Consideration]{Signal:200}{Signal Rank by Brand:2}
2020-01-01[Brand:Barclays][Subgroup:Male][Metric:Consideration]{Signal:100}{Signal Rank by Brand:3}
```

### Example 3: Olympic Ranking By Context Type

Take the following data set:

```language-katsu
2020-01-01[Brand:Barclays][Subgroup:Male][Metric:Awareness]{Signal:10}
2020-01-01[Brand:Halifax][Subgroup:Male][Metric:Awareness]{Signal:10}
2020-01-01[Brand:Santander][Subgroup:Male][Metric:Awareness]{Signal:20}
2020-01-01[Brand:Barclays][Subgroup:Male][Metric:Consideration]{Signal:100}
2020-01-01[Brand:Halifax][Subgroup:Male][Metric:Consideration]{Signal:200}
2020-01-01[Brand:Santander][Subgroup:Male][Metric:Consideration]{Signal:200}
2020-01-01[Brand:RBS][Subgroup:Male][Metric:Consideration]{Signal:50}
```

The following Tractor script:

```language-tractor
~> rank olympic [Brand] ~>
```

returns

```language-katsu
2020-01-01[Brand:Santander][Subgroup:Male][Metric:Awareness]{Signal:20}{Signal Rank by Brand:1}
2020-01-01[Brand:Barclays][Subgroup:Male][Metric:Awareness]{Signal:10}{Signal Rank by Brand:2}
2020-01-01[Brand:Halifax][Subgroup:Male][Metric:Awareness]{Signal:10}{Signal Rank by Brand:2}
2020-01-01[Brand:Halifax][Subgroup:Male][Metric:Consideration]{Signal:200}{Signal Rank by Brand:1}
2020-01-01[Brand:Santander][Subgroup:Male][Metric:Consideration]{Signal:200}{Signal Rank by Brand:1}
2020-01-01[Brand:Barclays][Subgroup:Male][Metric:Consideration]{Signal:100}{Signal Rank by Brand:2}
2020-01-01[Brand:RBS][Subgroup:Male][Metric:Consideration]{Signal:50}{Signal Rank by Brand:3}
```

### Example 3: Competition Ranking By Context Type

Take the following data set:

```language-katsu
2020-01-01[Brand:Barclays][Subgroup:Male][Metric:Awareness]{Signal:10}
2020-01-01[Brand:Halifax][Subgroup:Male][Metric:Awareness]{Signal:10}
2020-01-01[Brand:Santander][Subgroup:Male][Metric:Awareness]{Signal:20}
2020-01-01[Brand:HSBC][Subgroup:Male][Metric:Awareness]{Signal:5}
2020-01-01[Brand:Barclays][Subgroup:Male][Metric:Consideration]{Signal:100}
2020-01-01[Brand:Halifax][Subgroup:Male][Metric:Consideration]{Signal:200}
2020-01-01[Brand:Santander][Subgroup:Male][Metric:Consideration]{Signal:200}
2020-01-01[Brand:RBS][Subgroup:Male][Metric:Consideration]{Signal:50}
```

The following Tractor script:

```language-tractor
~> rank competition [Brand] ~>
```

returns

```language-katsu
2020-01-01[Brand:Santander][Subgroup:Male][Metric:Awareness]{Signal:20}{Signal Rank by Brand:1}
2020-01-01[Brand:Barclays][Subgroup:Male][Metric:Awareness]{Signal:10}{Signal Rank by Brand:2}
2020-01-01[Brand:Halifax][Subgroup:Male][Metric:Awareness]{Signal:10}{Signal Rank by Brand:2}
2020-01-01[Brand:HSBC][Subgroup:Male][Metric:Awareness]{Signal:10}{Signal Rank by Brand:4}
2020-01-01[Brand:Halifax][Subgroup:Male][Metric:Consideration]{Signal:200}{Signal Rank by Brand:1}
2020-01-01[Brand:Santander][Subgroup:Male][Metric:Consideration]{Signal:200}{Signal Rank by Brand:1}
2020-01-01[Brand:Barclays][Subgroup:Male][Metric:Consideration]{Signal:100}{Signal Rank by Brand:3}
2020-01-01[Brand:RBS][Subgroup:Male][Metric:Consideration]{Signal:50}{Signal Rank by Brand:4}
```

### Things To Note With Rank

You can only rank a dataset by **one** context type only.
