# Group By 

## Definition

The **group by** verb is used to group data from a [Data package](../datapackages.md) by one or several criteria. The result is a one or more [Data packages](../datapackages.md). Aggregate verbs such as sum amd average often need data to be grouped beforehand.

```
~> group by INTERVAL ~>
```

>Intervals: year, quarter, month, week, day, hour, minute, second, millisecond or digit

## Examples Using Group By

With Tractor, a user can split data into buckets or group data over specified time intervals.

### Example 1: Grouping By Digit

Take the following data set:

~~~language-katsu
2013-01-01[Brand:iPhone][Country:Germany]{Net:10}{Tax:2}{Gross:12}
2014-01-01[Brand:Samsung Galaxy][Country:Germany]{Net:10}{Tax:1}{Gross:11}
2013-01-02[Brand:iPhone][Country:UK]{Net:12}{Tax:2}{Gross:14}
2014-01-03[Brand:iPhone][Country:UK]{Net:12}{Tax:1}{Gross:13}
2014-01-03[Brand:Samsung Galaxy][Country:France]{Net:25}{Tax:3}{Gross:28}
2014-01-04[Brand:iPhone][Country:France][City:Paris]{Before Tax:10}{Tax:1}{After Tax:12}
2014-01-04[Brand:Samsung Galaxy][Country:France]{Net:25}{Tax:3}{Gross:28}
~~~

This script, splits the data in 2-points buckets, regarless of time, context or signal by using:

```language-tractor
	~> group by 2 ~>
```

Tractor will create 3 [Data packages](../datapackages.md) consisting of 2 points and 1 [Data package](../datapackages.md) consisting of 1 point, respecting their original order in the data :

- Group 1

```language-katsu
2013-01-01[Brand:iPhone][Country:Germany]{Net:10}{Tax:2}{Gross:12}
2014-01-01[Brand:Samsung Galaxy][Country:Germany]{Net:10}{Tax:1}{Gross:11}
```

- Group 2

```language-katsu
2013-01-02[Brand:iPhone][Country:UK]{Net:12}{Tax:2}{Gross:14}
2014-01-03[Brand:iPhone][Country:UK]{Net:12}{Tax:1}{Gross:13}
```

- Group 3

```language-katsu
2014-01-03[Brand:Samsung Galaxy][Country:France]{Net:25}{Tax:3}{Gross:28}
2014-01-04[Brand:iPhone][Country:France][City:Paris]{Before Tax:10}{Tax:1}{After Tax:12}
```

- Group 4

```language-katsu
2014-01-04[Brand:Samsung Galaxy][Country:France]{Net:25}{Tax:3}{Gross:28}
```

Note that because there is an odd number of datapoint, the last bucket only contains one datapoint. Groups do not have to be complete for a bucket to be created. 

### Example 2: Grouping By Time (Year)

Take the following data set:

~~~language-katsu
2013-01-01[Brand:iPhone][Country:Germany]{Net:10}{Tax:2}{Gross:12}
2014-01-01[Brand:Samsung Galaxy][Country:Germany]{Net:10}{Tax:1}{Gross:11}
2013-01-02[Brand:iPhone][Country:UK]{Net:12}{Tax:2}{Gross:14}
2014-01-03[Brand:iPhone][Country:UK]{Net:12}{Tax:1}{Gross:13}
2014-01-03[Brand:Samsung Galaxy][Country:France]{Net:25}{Tax:3}{Gross:28}
2014-03-04[Brand:iPhone][Country:France][City:Paris]{Before Tax:10}{Tax:1}{After Tax:12}
~~~

This data is easily grouped by [year (or other standard time intervals)](../../time.html) with:

~~~language-tractor
~> group by year ~>
~~~

- Group 2013

~~~language-katsu
2013-01-01[Brand:iPhone][Country:Germany]{Net:10}{Tax:2}{Gross:12}
2013-01-02[Brand:iPhone][Country:UK]{Net:12}{Tax:2}{Gross:14}
~~~

- Group 2014

~~~language-katsu
2014-01-01[Brand:Samsung Galaxy][Country:Germany]{Net:10}{Tax:1}{Gross:11}
2014-01-03[Brand:iPhone][Country:UK]{Net:12}{Tax:1}{Gross:13}
2014-01-03[Brand:Samsung Galaxy][Country:France]{Net:25}{Tax:3}{Gross:28}
2014-03-04[Brand:iPhone][Country:France][City:Paris]{Before Tax:10}{Tax:1}{After Tax:12}
~~~

### Example 2: Grouping By Time (Months)

Take the following data set:

~~~language-katsu
2013-01-01[Brand:iPhone][Country:Germany]{Net:10}{Tax:2}{Gross:12}
2014-01-01[Brand:Samsung Galaxy][Country:Germany]{Net:10}{Tax:1}{Gross:11}
2013-01-02[Brand:iPhone][Country:UK]{Net:12}{Tax:2}{Gross:14}
2014-01-03[Brand:iPhone][Country:UK]{Net:12}{Tax:1}{Gross:13}
2014-01-03[Brand:Samsung Galaxy][Country:France]{Net:25}{Tax:3}{Gross:28}
2014-03-04[Brand:iPhone][Country:France][City:Paris]{Before Tax:10}{Tax:1}{After Tax:12}
~~~

This script groups the data into three months

~~~language-tractor
~> group by 2 month ~>
~~~

And results in the following two groups:

- Group 1

~~~language-katsu
2013-01-01[Brand:iPhone][Country:Germany]{Net:10}{Tax:2}{Gross:12}
2013-01-02[Brand:iPhone][Country:UK]{Net:12}{Tax:2}{Gross:14}
2014-01-01[Brand:Samsung Galaxy][Country:Germany]{Net:10}{Tax:1}{Gross:11}
2014-01-03[Brand:iPhone][Country:UK]{Net:12}{Tax:1}{Gross:13}
2014-01-03[Brand:Samsung Galaxy][Country:France]{Net:25}{Tax:3}{Gross:28}
~~~

- Group 2

~~~language-katsu
2014-03-04[Brand:iPhone][Country:France][City:Paris]{Before Tax:10}{Tax:1}{After Tax:12}
~~~

The logic as to why there are two groups is becuase the data is first grouped into monthly groups (Jan 2013, Jan 2014 and Mar 2014). The first two months (Jan 2013 and Jan 2014) are grouped together and the third month is put into a second group.

If you want to include months with no data into the groupings then you can use the [**Pad**](pad.md) verb to achieve this.

<!--
###Example 3: Group By Context Type

Take the following data set:

~~~language-katsu
2013-01-01[Brand:iPhone][Country:Germany]{Net:10}{Tax:2}{Gross:12}
2014-01-01[Brand:Samsung Galaxy][Country:Germany]{Net:10}{Tax:1}{Gross:11}
2013-01-01[Brand:iPhone][Country:UK]{Net:12}{Tax:2}{Gross:14}
2014-01-01[Brand:iPhone][Country:UK]{Net:12}{Tax:1}{Gross:13}
2014-01-01[Brand:Samsung Galaxy][Country:France]{Net:25}{Tax:3}{Gross:28}
2014-03-01[Brand:iPhone][Country:France][City:Paris]{Before Tax:10}{Tax:1}{After Tax:12}
~~~

Grouping the data by brand is done with:

~~~language-tractor
	~> group by [Brand] ~>
~~~

- Bucket: Brand Samsung Galaxy
~~~language-katsu
2014-01-01[Brand:Samsung Galaxy][Country:Germany]{Net:10}{Tax:1}{Gross:11}
2014-01-01[Brand:Samsung Galaxy][Country:France]{Net:25}{Tax:3}{Gross:28}
~~~
- Bucket: Brand iPhone
~~~language-katsu
2013-01-01[Brand:iPhone][Country:Germany]{Net:10}{Tax:2}{Gross:12}
2013-01-01[Brand:iPhone][Country:UK]{Net:12}{Tax:2}{Gross:14}
2014-01-01[Brand:iPhone][Country:UK]{Net:12}{Tax:1}{Gross:13}
2014-03-01[Brand:iPhone][Country:France][City:Paris]{Before Tax:10}{Tax:1}{After Tax:12}
~~~

and grouping the data by Brand and Country is done with:

~~~language-tractor
	~> group by [Brand][Country] ~>
~~~

- Bucket: Brand Samsung Galaxy, Country Germany
~~~language-katsu
2014-01-01[Brand:Samsung Galaxy][Country:Germany]{Net:10}{Tax:1}{Gross:11}
2014-01-01[Brand:Samsung Galaxy][Country:France]{Net:25}{Tax:3}{Gross:28}
~~~
- Bucket: Brand iPhone, Country Germany
~~~language-katsu
2013-01-01[Brand:iPhone][Country:Germany]{Net:10}{Tax:2}{Gross:12}
~~~
- Bucket: Brand iPhone, Country UK
~~~language-katsu
2013-01-01[Brand:iPhone][Country:UK]{Net:12}{Tax:2}{Gross:14}
2014-01-01[Brand:iPhone][Country:UK]{Net:12}{Tax:1}{Gross:13}
~~~
- Bucket: Brand iPhone, Country France
~~~language-katsu
2014-03-01[Brand:iPhone][Country:France][City:Paris]{Before Tax:10}{Tax:1}{After Tax:12}
~~~
-->
