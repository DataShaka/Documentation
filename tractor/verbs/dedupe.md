# Dedupe 

## Definition

The **dedupe** verb removes duplicates pieces of context in a [Data package](../datapackages.md). The result is a [Data package](../datapackages.md). 

## Syntax

```language-tractor
~> dedupe ~>
```

## Examples

### Example 1: Remove Duplicates For Sum of Total Uniques

Take the following data set:

```language-katsu
2020-01-01[referrer:www.google.com]{count:1}
2020-01-01[referrer:www.yahoo.com]{count:1}
2020-01-01[referrer:www.google.com]{count:1}
2020-01-01[referrer:www.bing.com]{count:1}
2020-01-01[referrer:www.google.com]{count:1}
2020-01-01[referrer:www.google.com]{count:1}
2020-01-01[referrer:www.google.com]{count:1}
2020-01-01[referrer:www.yahoo.com]{count:1}
2020-01-01[referrer:www.google.com]{count:1}
```

This script removes all of the deplicate referrers and sums the total number of unique referrers:
```language-tractor
~> filter [referrer:]{count:} ~> dedupe [referrer:] ~> sum {count} includes {Unique Referrers}
```

and returns:

```
2020-01-01 {Unique Referrer:3}
```

The unique referrers being Google, Yahoo and Bing.
