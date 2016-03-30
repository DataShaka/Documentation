#Group 

###### What is it ?

The **group** verb is used to aggregate data from a [Data package](../../package.html) by one or several criteria. The result is a one or more [Group packages](../../package).

######Ingredients (the things you need to know)
- [Data package](../../package.html)
- [Katsu](../../katsu.html)
- [Chopsticks](../../chopstick.html)
- [Time intervals](../../time.html)

##Syntax
<script type="text/javascript">
Diagram(
OneOrMore(NonTerminal('DATA PACKAGE')),

Terminal('~>'),

    Terminal('group by'),

Choice(0,
  NonTerminal('CHOPSTICK FRAGMENT'),
  NonTerminal('DIGIT'),
  NonTerminal('TIME INTERVAL')

),


Terminal('~>'),
OneOrMore(NonTerminal('GROUP PACKAGE'))
).addTo();
</script>
```language-tractor
~> group by OPTIONS ~>
```
###### OPTIONS

- [Time interval](../../time.html) : year, month, week, day, etc
```language-tractor
~> group by year ~>
~> group by 2 week ~>
```
- [Context type chopstick fragment](../../chopstick.html) : [Country:], [Brand:][Country:], etc
```language-tractor
~> group by [Country:] ~>
```
- Digit
```language-tractor
~> group by 2 ~>
```

##Examples

Below is a Katsu data sample :

```language-katsu
2013-01-01[Brand:X][Country:Germany]{Net:10}{Tax:2}{Gross:12}
2014-01-01[Brand:XY][Country:Germany]{Net:10}{Tax:1}{Gross:11}
2013-01-01[Brand:X][Country:UK]{Net:12}{Tax:2}{Gross:14}
2014-01-01[Brand:X][Country:UK]{Net:12}{Tax:1}{Gross:13}
2014-01-01[Brand:XY][Country:France]{Net:25}{Tax:3}{Gross:28}
2014-03-01[Brand:X][Country:France][City:Paris]{Before Tax:10}{Tax:1}{After Tax:12}
```

#### Creating groups

Split data in 2-points buckets , regarless of time, context or signal  by using : 

```language-tractor
~> group by 2 ~>
```

Tractor will create a [Group package](../../package.html) consisting of 3 buckets of 2 points, respecting their original order in the data :

- Group "1"
```language-katsu
2013-01-01[Brand:X][Country:Germany]{Net:10}{Tax:2}{Gross:12}
2014-01-01[Brand:XY][Country:Germany]{Net:10}{Tax:1}{Gross:11}
```
- Group "2"
```language-katsu
2013-01-01[Brand:X][Country:UK]{Net:12}{Tax:2}{Gross:14}
2014-01-01[Brand:X][Country:UK]{Net:12}{Tax:1}{Gross:13}
```
- Group "3" 
```language-katsu
2014-01-01[Brand:XY][Country:France]{Net:25}{Tax:3}{Gross:28}
2014-03-01[Brand:X][Country:France][City:Paris]{Before Tax:10}{Tax:1}{After Tax:12}
```


#### By time

This data is easily grouped by [year (or other standard time intervals)](../../calendars.html) with :

```language-tractor
~> group by year ~>
```
- Group "2013"
```language-katsu
2013-01-01[Brand:X][Country:Germany]{Net:10}{Tax:2}{Gross:12}
2013-01-01[Brand:X][Country:UK]{Net:12}{Tax:2}{Gross:14}
```
- Group "2014"
```language-katsu
2014-01-01[Brand:XY][Country:Germany]{Net:10}{Tax:1}{Gross:11}
2014-01-01[Brand:X][Country:UK]{Net:12}{Tax:1}{Gross:13}
2014-01-01[Brand:XY][Country:France]{Net:25}{Tax:3}{Gross:28}
2014-03-01[Brand:X][Country:France][City:Paris]{Before Tax:10}{Tax:1}{After Tax:12}
```

Combine these and group your data by interval of 3 months :
```language-tractor
~> group by 3 month ~>
```
- Group "2013, January to March"
```language-katsu
2013-01-01[Brand:X][Country:Germany]{Net:10}{Tax:2}{Gross:12}
2013-01-01[Brand:X][Country:UK]{Net:12}{Tax:2}{Gross:14}
```
- Group "2014, January to March"
```language-katsu
2014-01-01[Brand:XY][Country:Germany]{Net:10}{Tax:1}{Gross:11}
2014-01-01[Brand:X][Country:UK]{Net:12}{Tax:1}{Gross:13}
2014-01-01[Brand:XY][Country:France]{Net:25}{Tax:3}{Gross:28}
```
- Group "2014, March to June"
```language-katsu
2014-03-01[Brand:X][Country:France][City:Paris]{Before Tax:10}{Tax:1}{After Tax:12}
```

<!--

#### By context type

Grouping the data by brand is done with :
```language-tractor
~> group by [Brand:] ~>
```
- Group "Brand XY"
```language-katsu
2014-01-01[Brand:XY][Country:Germany]{Net:10}{Tax:1}{Gross:11}
2014-01-01[Brand:XY][Country:France]{Net:25}{Tax:3}{Gross:28}
```
- Group "Brand X"
```language-katsu
2013-01-01[Brand:X][Country:Germany]{Net:10}{Tax:2}{Gross:12}
2013-01-01[Brand:X][Country:UK]{Net:12}{Tax:2}{Gross:14}
2014-01-01[Brand:X][Country:UK]{Net:12}{Tax:1}{Gross:13}
2014-03-01[Brand:X][Country:France][City:Paris]{Before Tax:10}{Tax:1}{After Tax:12}
```

and grouping the data by Brand and Country :
```language-tractor
~> group by [Brand:][Country:] ~>
```
- Group "Brand XY, Country Germany"
```language-katsu
2014-01-01[Brand:XY][Country:Germany]{Net:10}{Tax:1}{Gross:11}
2014-01-01[Brand:XY][Country:France]{Net:25}{Tax:3}{Gross:28}
```
- Group "Brand X, Country Germany"
```language-katsu
2013-01-01[Brand:X][Country:Germany]{Net:10}{Tax:2}{Gross:12}
```
- Group "Brand X, Country UK"
```language-katsu
2013-01-01[Brand:X][Country:UK]{Net:12}{Tax:2}{Gross:14}
2014-01-01[Brand:X][Country:UK]{Net:12}{Tax:1}{Gross:13}
```
- Group "Brand X, Country France"
```language-katsu
2014-03-01[Brand:X][Country:France][City:Paris]{Before Tax:10}{Tax:1}{After Tax:12}
```

-->
