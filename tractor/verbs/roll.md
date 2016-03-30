#Roll By

##Definition

The **roll by** verb is used to build rolling windows of [Group packages](../../package.html) of a specified width. The result is a one or more [Group packages](../../package).


##Syntax
<script type="text/javascript">
Diagram(
OneOrMore(NonTerminal('GROUP PACKAGE')),

Terminal('~>'),

    Terminal('roll by'),

Choice(0,
  NonTerminal('DIGIT')
),


Terminal('~>'),
OneOrMore(NonTerminal('GROUP PACKAGE'))
).addTo();
</script>
```language-tractor
~> roll by OPTIONS ~>
```
Options: Digit

```language-tractor
~> roll by 3 ~>
```

##Examples

###Example 1: Roll By Windows After Grouping

Take the following data set:

```language-katsu
2013-01-01[Company:Apple][Product:MacBook Air]{Volume:1000}
2013-01-01[Company:Apple][Product:MacBook Pro]{Volume:1150}
2013-01-02[Company:Apple][Product:MacBook Air]{Volume:1030}
2013-01-04[Company:Apple][Product:MacBook Air]{Volume:1080}
2013-01-05[Company:Apple][Product:MacBook Air]{Volume:1230}
2013-01-07[Company:Apple][Product:MacBook Air]{Volume:950}
2013-01-08[Company:Apple][Product:MacBook Air]{Volume:1065}
2013-01-08[Company:Apple][Product:MacBook Pro]{Volume:1125}
2013-01-09[Company:Apple][Product:MacBook Air]{Volume:1035}
2013-01-10[Company:Apple][Product:MacBook Air]{Volume:1110}
```

This script creates rolling windows of 3 days:

```language-tractor
~> group by day ~> roll by 3  ~>
```
and returns

- Window 1

```language-katsu
2013-01-01[Company:Apple][Product:MacBook Air]{Volume:1000}
2013-01-01[Company:Apple][Product:MacBook Pro]{Volume:1150}
2013-01-02[Company:Apple][Product:MacBook Air]{Volume:1030}
2013-01-04[Company:Apple][Product:MacBook Air]{Volume:1080}
``` 
- Window 2

```language-katsu
2013-01-02[Company:Apple][Product:MacBook Air]{Volume:1030}
2013-01-04[Company:Apple][Product:MacBook Air]{Volume:1080}
2013-01-05[Company:Apple][Product:MacBook Air]{Volume:1230}
```
- Window 3

```language-katsu
2013-01-04[Company:Apple][Product:MacBook Air]{Volume:1080}
2013-01-05[Company:Apple][Product:MacBook Air]{Volume:1230}
2013-01-07[Company:Apple][Product:MacBook Air]{Volume:950}
```
- Window 4 

```language-katsu
2013-01-07[Company:Apple][Product:MacBook Air]{Volume:950}
2013-01-08[Company:Apple][Product:MacBook Air]{Volume:1065}
2013-01-08[Company:Apple][Product:MacBook Pro]{Volume:1125}
2013-01-09[Company:Apple][Product:MacBook Air]{Volume:1035}
```
- Window 5

```language-katsu
2013-01-08[Company:Apple][Product:MacBook Air]{Volume:1065}
2013-01-08[Company:Apple][Product:MacBook Pro]{Volume:1125}
2013-01-09[Company:Apple][Product:MacBook Air]{Volume:1035}
2013-01-10[Company:Apple][Product:MacBook Air]{Volume:1110}
```
- Window 6

```language-katsu
2013-01-09[Company:Apple][Product:MacBook Air]{Volume:1035}
2013-01-10[Company:Apple][Product:MacBook Air]{Volume:1110}
```
- Window 7

```language-katsu
2013-01-10[Company:Apple][Product:MacBook Air]{Volume:1110}
```

###Things To Note With Roll By

If you want to roll by a certain interval (e.g. weeks, months, years etc) you must use the **Group by** verb first to specify this. After that you can choose how many of those intervals you want to roll by by specifying your digit.

If there missing time points in a dataset, or more than one time point with the same date then this will have an impact on the rolling. For example Window 1 has two datapoints with one time point and has no data for 2013-01-03.

```language-katsu
2013-01-01[Company:Apple][Product:MacBook Air]{Volume:1000}
2013-01-01[Company:Apple][Product:MacBook Pro]{Volume:1150}
2013-01-02[Company:Apple][Product:MacBook Air]{Volume:1030}
2013-01-04[Company:Apple][Product:MacBook Air]{Volume:1080}
``` 

The **Pad** verb is useful here as it allows you to acknowledge that 2013-01-03 has no data and include it in the rolling interval, so that Window 1 look like this:

```language-katsu
2013-01-01[Company:Apple][Product:MacBook Air]{Volume:1000}
2013-01-01[Company:Apple][Product:MacBook Pro]{Volume:1150}
2013-01-02[Company:Apple][Product:MacBook Air]{Volume:1030}
``` 
and Window 2 like this:

```language-katsu
2013-01-04[Company:Apple][Product:MacBook Air]{Volume:1080}
2013-01-05[Company:Apple][Product:MacBook Air]{Volume:1230}
``` 
adn so on...
