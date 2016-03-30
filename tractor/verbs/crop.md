
#Crop

##Definition

The **crop** verb extracts a specified [shape](../../shape.html) of data from [Data package](../../package.html). For each point, it keeps only the context and/or signals specified, removing the rest of the datapoints contexts and signals. The result is a [Data package](../../package).


##Syntax
<script type="text/javascript">
Diagram(
OneOrMore(NonTerminal('DATA PACKAGE')),

Terminal('~>'),

    Terminal('crop'),

Sequence(
  NonTerminal('CHOPSTICK')
),

Terminal('~>'),
OneOrMore(NonTerminal('DATA PACKAGE'))
).addTo();
</script>

```language-tractor
~> crop chopstick ~>
```

##Examples Using Crop

###Example 1: Crop by Context Type

Take the following data set:
```language-katsu
2013-01-01[Label:Ralph Lauren][Country:Germany]{Net:10}{Tax:2}{Gross:12}
2014-01-01[Brand:Lacoste][Country:Germany][City:Berlin]{Net:10}{Tax:1}{Gross:11}
2013-01-01[Brand:Ralph Lauren][Country:UK][City:London]{Net:12}{Tax:2}{Gross:14}
2014-01-01[Brand:Ralph Lauren][Nation:UK][City:London]{Net:12}{Tax:1}{Gross:13}
2014-01-01[Brand:Lacoste][Country:France][City:Paris]{Net:25}{Tax:3}{Gross:28}
2014-03-01[Brand:Ralph Lauren][Country:France][City:Paris]{Before Tax:10}{Tax:1}{After Tax:12}
```

You can use `crop` to keep only the points with a specific context shape. This script throws away any points that do not contain context type `Brand:`

```language-tractor
~> crop [Brand:] ~>
```
and returns
```language-katsu
2014-01-01[Brand:Lacoste]{Net:10}{Tax:1}{Gross:11}
2013-01-01[Brand:Ralph Lauren]{Net:12}{Tax:2}{Gross:14}
2014-01-01[Brand:Ralph Lauren]{Net:12}{Tax:1}{Gross:13}
2014-01-01[Brand:Lacoste]{Net:25}{Tax:3}{Gross:28}
2014-03-01[Brand:Ralph Lauren]{Before Tax:10}{Tax:1}{After Tax:12}
```
###Example 2: Crop By Exact Context Types And Names

You can be even more specific by giving the exact context types & names to retain:

Take the following data set:
```language-katsu
2013-01-01[Label:Ralph Lauren][Country:Germany]{Net:10}{Tax:2}{Gross:12}
2014-01-01[Brand:Lacoste][Country:Germany][City:Berlin]{Net:10}{Tax:1}{Gross:11}
2013-01-01[Brand:Ralph Lauren][Country:UK][City:London]{Net:12}{Tax:2}{Gross:14}
2014-01-01[Brand:Ralph Lauren][Nation:UK][City:London]{Net:12}{Tax:1}{Gross:13}
2014-01-01[Brand:Lacoste][Country:France][City:Paris]{Net:25}{Tax:3}{Gross:28}
2014-03-01[Brand:Ralph Lauren][Country:France][City:Paris]{Before Tax:10}{Tax:1}{After Tax:12}
```
This script crops data by `[Brand:]` and the `[Country:France]`
```language-tractor
~> crop [Brand:][Country:France] ~>
```
and returns
```language-katsu
2014-01-01[Brand:Lacoste][Country:France]{Net:25}{Tax:3}{Gross:28}
2014-03-01[Brand:Ralph Lauren][Country:France]{Before Tax:10}{Tax:1}{After Tax:12}
```

###Example 3: Crop Time To A Specified Year Only

`Crop` can be used to reduce all points to a single time point.

Take the following data set:
```language-katsu
2013-01-01[Label:Ralph Lauren][Country:Germany]{Net:10}{Tax:2}{Gross:12}
2014-01-01[Brand:Lacoste][Country:Germany][City:Berlin]{Net:10}{Tax:1}{Gross:11}
2013-01-01[Brand:Ralph Lauren][Country:UK][City:London]{Net:12}{Tax:2}{Gross:14}
2014-01-01[Brand:Ralph Lauren][Nation:UK][City:London]{Net:12}{Tax:1}{Gross:13}
2014-01-01[Brand:Lacoste][Country:France][City:Paris]{Net:25}{Tax:3}{Gross:28}
2014-03-01[Brand:Ralph Lauren][Country:France][City:Paris]{Before Tax:10}{Tax:1}{After Tax:12}
```
This script crops the time down to the year 2014 only:
```language-tractor
~> crop 2014 ~>
```
and returns
```language-katsu
2014-01-01[Brand:Lacoste][Country:Germany][City:Berlin]{Net:10}{Tax:1}{Gross:11}
2014-01-01[Brand:Ralph Lauren][Nation:UK][City:London]{Net:12}{Tax:1}{Gross:13}
2014-01-01[Brand:Lacoste][Country:France][City:Paris]{Net:25}{Tax:3}{Gross:28}
2014-01-01[Brand:Ralph Lauren][Country:France][City:Paris]{Before Tax:10}{Tax:1}{After Tax:12}
```

###Example 4: Crop Time To A Specified Year And Month

Take the following data set:
```language-katsu
2013-01-01[Label:Ralph Lauren][Country:Germany]{Net:10}{Tax:2}{Gross:12}
2014-01-01[Brand:Lacoste][Country:Germany][City:Berlin]{Net:10}{Tax:1}{Gross:11}
2013-01-15[Brand:Ralph Lauren][Country:UK][City:London]{Net:12}{Tax:2}{Gross:14}
2014-01-01[Brand:Ralph Lauren][Nation:UK][City:London]{Net:12}{Tax:1}{Gross:13}
2014-01-01[Brand:Lacoste][Country:France][City:Paris]{Net:25}{Tax:3}{Gross:28}
2014-03-01[Brand:Ralph Lauren][Country:France][City:Paris]{Before Tax:10}{Tax:1}{After Tax:12}
```
This script crops the time down to January 2013 only:

```language-tractor
~> crop 2013-01 ~>
```
and returns
```language-katsu
2013-01-01[Label:Ralph Lauren][Country:Germany]{Net:10}{Tax:2}{Gross:12}
2013-01-01[Brand:Ralph Lauren][Country:UK][City:London]{Net:12}{Tax:2}{Gross:14}
```
Note that even though the data was cropped by year and month only (`2013-01`) the complete date was still returned.


##Things To Note When Using Crop

###Data Duplication

Use of the **crop** verb can lead to duplication in the data.

For example, if you have the following data set:
```language-katsu
2013-01-15[Brand:Ralph Lauren][Country:Germany]{Net:10}{Tax:2}{Gross:12}
2013-01-15[Brand:Ralph Lauren][Country:UK][City:London]{Net:10}{Tax:2}{Gross:12}
```
And you `crop` by brand using the following Tractor script:
```language-tractor
~> crop [Brand:Ralph Lauren] ~>
```
it will return two data points that are exactly the same:
```language-katsu
2013-01-15[Brand:Ralph Lauren]{Net:10}{Tax:2}{Gross:12}
2013-01-15[Brand:Ralph Lauren]{Net:10}{Tax:2}{Gross:12}
```
Care needs to be taken when cropping data, not to lose too much context.

###Difference Between Crop And Filter

There is a key difference between Crop and Filter. Depending on if you are cropping by Context or Signal, Crop will only return the specified context or sigal and remove everyhting else.

Filter will return everything that matches your chopstick. So if you filter by context, it will still include other pieces of context in a datapoint.

For example, taking the following data set:

```language-katsu
2013-01-01[Label:Ralph Lauren][Country:Germany]{Net:10}{Tax:2}{Gross:12}
2014-01-01[Brand:Lacoste][Country:Germany][City:Berlin]{Net:10}{Tax:1}{Gross:11}
2013-01-15[Brand:Ralph Lauren][Country:UK][City:London]{Net:12}{Tax:2}{Gross:14}
2014-01-01[Brand:Ralph Lauren][Nation:UK][City:London]{Net:12}{Tax:1}{Gross:13}
2014-01-01[Brand:Lacoste][Country:France][City:Paris]{Net:25}{Tax:3}{Gross:28}
2014-03-01[Brand:Ralph Lauren][Country:France][City:Paris]{Before Tax:10}{Tax:1}{After Tax:12}
```

If you use the script:

```language-tractor
~> crop [Brand:Lacoste] ~>
```
it will return:

```language-katsu
2014-01-01[Brand:Lacoste][City:Berlin]{Net:10}{Tax:1}{Gross:11}
2014-01-01[Brand:Lacoste]{Net:25}{Tax:3}{Gross:28}
```

If you use the script:

```language-tractor
~> filter [Brand:Lacoste] ~>
```
it will return:

```language-katsu
2014-01-01[Brand:Lacoste][Country:Germany][City:Berlin]{Net:10}{Tax:1}{Gross:11}
2014-01-01[Brand:Lacoste][Country:France][City:Paris]{Net:25}{Tax:3}{Gross:28}
```
