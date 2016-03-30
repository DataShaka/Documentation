#Pad 

##Definition

The **pad** verb inserts [default values](../../default.html) in a list of [Group Packages](../../package.html) by looking for missing points on the specified data set. The defualy values will only be inserted between the range of the existing datapoints.

Using the pad verb is one way to make your data completely uniform in terms of shape. 


##Syntax
<script type="text/javascript">
Diagram(
OneOrMore(NonTerminal('GROUP PACKAGE')),  

Terminal('~>'),

    Terminal('pad'),

Choice(0,
  Terminal('time')
),
    

Terminal('~>'),
OneOrMore(NonTerminal('GROUP PACKAGE'))
).addTo();
</script>

```language-tractor
~> pad OPTIONS ~>
```

Options: time

##Examples

###Padding Along Time (Year)

Take the following data set with the missing date for the year 2012:

```language-katsu
2010-01-01[Brand:Adidas][Country:Germany]{Total:100}
2011-01-01[Brand:Adidas][Country:Germany]{Total:90}
2011-02-01[Brand:Adidas][Country:Germany]{Total:115}
2013-01-01[Brand:Adidas][Country:Germany]{Total:85}
2013-02-01[Brand:Adidas][Country:Germany]{Total:95}
2013-03-01[Brand:Adidas][Country:Germany]{Total:100}
```
Using the following tractor script you can pad the missing date, **after** the data has been grouped by year:

```language-tractor
~> group by year ~> pad time ~>
```
The data does not show any differently though, as the pad verb does not actually create a new datapoint:
```language-katsu
2010-01-01[Brand:Adidas][Country:Germany]{Total:100}
2011-01-01[Brand:Adidas][Country:Germany]{Total:90}
2011-02-01[Brand:Adidas][Country:Germany]{Total:115}
2013-01-01[Brand:Adidas][Country:Germany]{Total:85}
2013-02-01[Brand:Adidas][Country:Germany]{Total:95}
2013-03-01[Brand:Adidas][Country:Germany]{Total:100}
```
What will happen is there will be a recognition that for:

- Group 2010 there is 1 datapoint
- Group 2011 there are 2 datapoints
- Group 2012 there are 0 datapoints
- Group 2013 there are 3 datapoints

Previous to applying the pad verb, there was no recognition that the year 2012 had no data.


###Things To Note With Pad

Before using the Pad verb in a Tractor script, the data **must** be grouped first. This is so it is clear what exactly needs to be padded. If the datapoints are yearly then the data needs to be 'grouped by year' before padding. If the datapoints are weekly intervals, then the data needs to be 'grouped by week'. If the data is not grouped before using the pad verb, it will result in an error.

It is only possible to pad data by time. The feature to pad data by context or signal/value does not currently exist.
