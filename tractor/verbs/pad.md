# Pad 

## Definition

The **pad** verb inserts empty [Data package](../datapackages.md) in a list of [Data packages](../datapackages.md) by looking for missing points on the specified data set. The defualy values will only be inserted between the range of the existing data points.

Using the pad verb is one way to make your data completely uniform. 


## Syntax

```language-tractor
~> pad OPTIONS ~>
```

Options: time

## Examples

### Padding Along Time (Year)

Take the following data set with the missing date for the year 2019:

```language-katsu
2017-01-01[Brand:Adidas][Country:Germany]{Total:100}
2018-01-01[Brand:Adidas][Country:Germany]{Total:90}
2018-02-01[Brand:Adidas][Country:Germany]{Total:115}
2020-01-01[Brand:Adidas][Country:Germany]{Total:85}
2020-02-01[Brand:Adidas][Country:Germany]{Total:95}
2020-03-01[Brand:Adidas][Country:Germany]{Total:100}
```

Using the following tractor script you can pad the missing date, **after** the data has been grouped by year:

```language-tractor
~> group by year ~> pad time ~>
```

The data does not show any differently though, as the pad verb does not actually create a new datapoint:

```language-katsu
2017-01-01[Brand:Adidas][Country:Germany]{Total:100}
2018-01-01[Brand:Adidas][Country:Germany]{Total:90}
2018-02-01[Brand:Adidas][Country:Germany]{Total:115}
2020-01-01[Brand:Adidas][Country:Germany]{Total:85}
2020-02-01[Brand:Adidas][Country:Germany]{Total:95}
2020-03-01[Brand:Adidas][Country:Germany]{Total:100}
```

What will happen if there will be a recognition for that:

- Group 2017 there is 1 datapoint
- Group 2018 there are 2 datapoints
- Group 2019 there are 0 datapoints
- Group 2020 there are 3 datapoints

Previous to applying the pad verb, there was no recognition that the year 2019 had no data.


### Things To Note With Pad

Before using the Pad verb in a Tractor script, the data **must** be grouped first. This is so since it needs to be clear what exactly needs to be padded. If the data points are yearly then the data needs to be 'grouped by year' before padding. If the data points are weekly intervals, then the data needs to be 'grouped by week'. If the data is not grouped before using the pad verb, it will result in an error.

>It is only possible to pad data by time. The feature to pad data by context or signal/value does not currently exist.
