#Filter

##Definition

The  **filter** verb is used to filter data from a [Data package](../../package.html). The result is stored in a [Data package](../../package.html) containing all the points fulfulling a specified criterion.

In contrast to the [select](../select/select.html) verb, the data filtered out by **filter** is being 'thrown out' of the undercurrent data flow and cannot be part of the pipeline afterwards.


##Syntax
<script type="text/javascript">
Diagram(
OneOrMore(NonTerminal('DATA PACKAGE')),  Terminal('~>'),
Terminal('filter'),
NonTerminal('CHOPSTICK')
,
Terminal('~>'),
OneOrMore(NonTerminal('DATA PACKAGE'))
).addTo();
</script>

```language-tractor
	~> filter chopstick ~>  
```

##Examples Using Filter

### Example 1: Filter Points By Specified Year

Take the following US ecomonic data set from the IMF:

```language-katsu
2011-01-01[Country: US][Source:IMF][Real GDP Per Capita:48282.0]
2010-01-01[Country: US][Source:IMF][Real GDP Per Capita:47772.0]
2009-01-01[Country: US][Source:IMF][Real GDP Per Capita:47041.0]
2008-01-01[Country: US][Source:IMF][Real GDP Per Capita:48951.0]
2007-01-01[Country: US][Source:IMF][Real GDP Per Capita:49571.0]
2006-01-01[Country: US][Source:IMF][Real GDP Per Capita:49130.0]
2005-01-01[Country: US][Source:IMF][Real GDP Per Capita:48312.0]
2004-01-01[Country: US][Source:IMF][Real GDP Per Capita:47307.0]
2003-01-01[Country: US][Source:IMF][Real GDP Per Capita:46137.0]
2002-01-01[Country: US][Source:IMF][Real GDP Per Capita:45418.0]
2001-01-01[Country: US][Source:IMF][Real GDP Per Capita:45046.0]
2000-01-01[Country: US][Source:IMF][Real GDP Per Capita:45026.0]
2011-12-01[Country: US][Source:IMF][CPI Level:227.145]
2011-11-01[Country: US][Source:IMF][CPI Level:227.157]
2011-10-01[Country: US][Source:IMF][CPI Level:226.811]
2011-09-01[Country: US][Source:IMF][CPI Level:226.676]
2011-08-01[Country: US][Source:IMF][CPI Level:226.082]
2011-07-01[Country: US][Source:IMF][CPI Level:225.419]
2011-06-01[Country: US][Source:IMF][CPI Level:224.841]
2011-05-01[Country: US][Source:IMF][CPI Level:224.869]
2011-04-01[Country: US][Source:IMF][CPI Level:224.06]
2011-03-01[Country: US][Source:IMF][CPI Level:223.044]
2011-02-01[Country: US][Source:IMF][CPI Level:221.904]
2011-01-01[Country: US][Source:IMF][CPI Level:221.148]
2010-12-01[Country: US][Source:IMF][CPI Level:220.472]
2010-11-01[Country: US][Source:IMF][CPI Level:219.59]
2010-10-01[Country: US][Source:IMF][CPI Level:219.035]
2010-09-01[Country: US][Source:IMF][CPI Level:218.275]
2010-08-01[Country: US][Source:IMF][CPI Level:217.923]
2010-07-01[Country: US][Source:IMF][CPI Level:217.605]
2010-06-01[Country: US][Source:IMF][CPI Level:17.199]
2010-05-01[Country: US][Source:IMF][CPI Level:217.29]
2010-04-01]Country: US][Source:IMF][CPI Level:217.403]
2010-03-01[Country: US][Source:IMF][CPI Level:217.353]
2010-02-01[Country: US][Source:IMF][CPI Level:217.281]
2010-01-01[Country: US][Source:IMF][CPI Level:217.488]
```
This script will get all the points in year 2014:
```language-tractor
~> filter 2010 ~>
```
and return:
```language-katsu
2010-01-01[Country: US][Source:IMF][Real GDP Per Capita:47772.0]
2010-12-01[Country: US][Source:IMF][CPI Level:220.472]
2010-11-01[Country: US][Source:IMF][CPI Level:219.59]
2010-10-01[Country: US][Source:IMF][CPI Level:219.035]
2010-09-01[Country: US][Source:IMF][CPI Level:218.275]
2010-08-01[Country: US][Source:IMF][CPI Level:217.923]
2010-07-01[Country: US][Source:IMF][CPI Level:217.605]
2010-06-01[Country: US][Source:IMF][CPI Level:17.199]
2010-05-01[Country: US][Source:IMF][CPI Level:217.29]
2010-04-01]Country: US][Source:IMF][CPI Level:217.403]
2010-03-01[Country: US][Source:IMF][CPI Level:217.353]
2010-02-01[Country: US][Source:IMF][CPI Level:217.281]
2010-01-01[Country: US][Source:IMF][CPI Level:217.488]
```
Note that even though the Tractor script is filtering by year, the data returned still includes month and day just as in the original Katsu dataset.

### Example 2: Filter Points By Specified Year And Month

Take the following data set:

```language-katsu
2011-01-01[Country: US][Source:IMF][Real GDP Per Capita:48282.0]
2010-01-01[Country: US][Source:IMF][Real GDP Per Capita:47772.0]
2009-01-01[Country: US][Source:IMF][Real GDP Per Capita:47041.0]
2008-01-01[Country: US][Source:IMF][Real GDP Per Capita:48951.0]
2007-01-01[Country: US][Source:IMF][Real GDP Per Capita:49571.0]
2006-01-01[Country: US][Source:IMF][Real GDP Per Capita:49130.0]
2005-01-01[Country: US][Source:IMF][Real GDP Per Capita:48312.0]
2004-01-01[Country: US][Source:IMF][Real GDP Per Capita:47307.0]
2003-01-01[Country: US][Source:IMF][Real GDP Per Capita:46137.0]
2002-01-01[Country: US][Source:IMF][Real GDP Per Capita:45418.0]
2001-01-01[Country: US][Source:IMF][Real GDP Per Capita:45046.0]
2000-01-01[Country: US][Source:IMF][Real GDP Per Capita:45026.0]
2011-12-01[Country: US][Source:IMF][CPI Level:227.145]
2011-11-01[Country: US][Source:IMF][CPI Level:227.157]
2011-10-01[Country: US][Source:IMF][CPI Level:226.811]
2011-09-01[Country: US][Source:IMF][CPI Level:226.676]
2011-08-01[Country: US][Source:IMF][CPI Level:226.082]
2011-07-01[Country: US][Source:IMF][CPI Level:225.419]
2011-06-01[Country: US][Source:IMF][CPI Level:224.841]
2011-05-01[Country: US][Source:IMF][CPI Level:224.869]
2011-04-01[Country: US][Source:IMF][CPI Level:224.06]
2011-03-01[Country: US][Source:IMF][CPI Level:223.044]
2011-02-01[Country: US][Source:IMF][CPI Level:221.904]
2011-01-01[Country: US][Source:IMF][CPI Level:221.148]
2010-12-01[Country: US][Source:IMF][CPI Level:220.472]
2010-11-01[Country: US][Source:IMF][CPI Level:219.59]
2010-10-01[Country: US][Source:IMF][CPI Level:219.035]
2010-09-01[Country: US][Source:IMF][CPI Level:218.275]
2010-08-01[Country: US][Source:IMF][CPI Level:217.923]
2010-07-01[Country: US][Source:IMF][CPI Level:217.605]
2010-06-01[Country: US][Source:IMF][CPI Level:17.199]
2010-05-01[Country: US][Source:IMF][CPI Level:217.29]
2010-04-01]Country: US][Source:IMF][CPI Level:217.403]
2010-03-01[Country: US][Source:IMF][CPI Level:217.353]
2010-02-01[Country: US][Source:IMF][CPI Level:217.281]
2010-01-01[Country: US][Source:IMF][CPI Level:217.488]
```
This script will only select points in January 2014 :
```language-tractor
~> filter 2010-01 ~>
```
and return:
```language-katsu
2010-01-01[Country: US][Source:IMF][Real GDP Per Capita:47772.0]
2010-01-01[Country: US][Source:IMF][CPI Level:217.488]
```

Note that as the filter was set for `2010-01` this mean 'the month of January'. Even if the date for the original datapoint is `2014-01-15` the date returned will be `2014-01-01`.


### Example 3: Filter Points By Specified Context

Take the following data set:

```language-katsu
2013-06-01[Handle:Coca-Cola]{Tweets:95201}{Retweets:56}{Mentions:23}
2013-06-02[Handle:Coca-Cola]{Tweets:95206}{Retweets:48}{Mentions:36}
2013-06-03[Handle:Coca-Cola]{Tweets:95213}{Retweets:53}{Mentions:28}
2013-06-04[Handle:Coca-Cola]{Tweets:95216}{Retweets:36}{Mentions:23}
2013-06-01[Handle:Pepsi]{Tweets:101231}{Retweets:22}{Mentions:17}
2013-06-02[Handle:Pepsi]{Tweets:101242}{Retweets:16}{Mentions:23}
2013-06-03[Handle:Pepsi]{Tweets:101250}{Retweets:21}{Mentions:36}
2013-06-04[Handle:Pepsi]{Tweets:101257}{Retweets:35}{Mentions:49}
```

This script will only select all the points from the country France:
```language-tractor
~> filter [Handle:Pepsi] ~>
```
and returns:
```language-katsu
2013-06-01[Handle:Pepsi]{Tweets:101231}
2013-06-01[Handle:Pepsi]{Retweets:22}
2013-06-01[Handle:Pepsi]{Mentions:17}
2013-06-02[Handle:Pepsi]{Tweets:101242}
2013-06-02[Handle:Pepsi]{Retweets:16}
2013-06-02[Handle:Pepsi]{Mentions:23}
2013-06-03[Handle:Pepsi]{Tweets:101250}
2013-06-03[Handle:Pepsi]{Retweets:21}
2013-06-03[Handle:Pepsi]{Mentions:36}
2013-06-04[Handle:Pepsi]{Tweets:101257}
2013-06-04[Handle:Pepsi]{Retweets:35}
2013-06-04[Handle:Pepsi]{Mentions:49}
```

### Example 4: Filter Points By Specified Context Using Regex

Take the following data set:

```language-katsu
2014-01-01[Company:Vodafone][Country:UK]{Net:12}{Tax:1}{Gross:13}
2014-01-01[Company:Orange][Country:France]{Net:25}{Tax:3}{Gross:28}
2014-02-01[Company:Vodafone][Country:France][City:Paris]{Before Tax:10}{Tax:1}{After Tax:12}
```

This script using Regex can be used to filter all of the data points with a brand containing Vodafone:
```language-tractor
~> filter [Country:regex('^V.*')] ~>
```
and returns:
```language-katsu
2014-01-01[Company:Vodafone][Country:UK]{Net:12}{Tax:1}{Gross:13}
2014-02-01[Company:Vodafone][Country:France][City:Paris]{Before Tax:10}{Tax:1}{After Tax:12}
```
### Example 5: Filter Points By Specified Signal And Value

Take the following data set:

```language-katsu
2013-01-01T00:00:00.000[Brand:DISH][Country:US][Metric:Ad Salience][Subgroup:Female][Subgroup Category:Gender][Subgroup Type:Demographics]{Weighted Base:131}
2013-01-01T00:00:00.000[Brand:DISH][Country:US][Metric:Ad Salience][Subgroup:Nat Rep][Subgroup Category:Nat Rep][Subgroup Type:Demographics]{Weighted Base:298}
2013-02-01T00:00:00.000[Brand:DISH][Country:US][Metric:Ad Salience][Subgroup:Female][Subgroup Category:Gender][Subgroup Type:Demographics]{Weighted Base:23}
2013-02-01T00:00:00.000[Brand:DISH][Country:US][Metric:Ad Salience][Subgroup:Nat Rep][Subgroup Category:Nat Rep][Subgroup Type:Demographics]{Weighted Base:43}
2013-02-01T00:00:00.000[Brand:DISH][Country:US][Metric:Purchase Intent][Subgroup:Female][Subgroup Category:Gender][Subgroup Type:Demographics]{Weighted Base:36}
```

This script selects all the points with signal Net:
```language-tractor
~> filter {Weighted Base:36} ~>
```
and returns
```language-katsu
2013-02-01T00:00:00.000[Brand:DISH][Country:US][Metric:Purchase Intent][Subgroup:Female][Subgroup Category:Gender][Subgroup Type:Demographics]{Weighted Base:36}
```

### Example 6: Filter Points By Specified Signal And Value Range

Take the following data set:

```language-katsu
2014-01-01[Company:Vodafone][Country:UK]{Net:12}{Tax:1}{Gross:13}
2014-01-01[Company:Orange][Country:France]{Net:25}{Tax:3}{Gross:28}
2014-02-01[Company:Vodafone][Country:France][City:Paris]{Before Tax:10}{Tax:1}{After Tax:12}
```

his script filters all the points with Net values greater than 20:
```language-tractor
~> filter {Net:>20} ~>
```
and returns
```language-katsu
2014-01-01[Brand:Orange][Country:France]{Net:25}{Tax:3}{Gross:28}
```

##Things To Note On The Filter Verb

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

