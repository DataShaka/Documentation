#Average 

##Definition

The **average** verb averages up values of a [Group package](../../package.html) points with a matching [shape](../../shape.html). The result is a  [Data package](../../package).

The time point associated with the resulting package is the first point of the aggregated data. By default, non-existent values are ignored. By default, the method used is the [arithmetic mean](http://en.wikipedia.org/wiki/Arithmetic_mean)


##Syntax
<script type="text/javascript">
Diagram(
OneOrMore(NonTerminal('GROUP PACKAGE')),  

Terminal('~>'),

    Terminal('average'),


Terminal('~>'),
OneOrMore(NonTerminal('DATA PACKAGE'))
).addTo();
</script>

```language-tractor
average ~>
```

##Examples Using Average

###Examplw 1: Consistent Shape

Consider the data:
```language-katsu
2013-01-01[Brand:Lipton][Product:Red Berry Tea]{Net:10}{Tax:2}{Gross:12}
2013-02-01[Brand:Lipton][Product:Red Berry Tea]{Net:10}{Tax:2}{Gross:12}
2013-01-01[Brand:Lipton][Product:Green Tea]{Net:20}{Tax:2}{Gross:12}
2013-02-01[Brand:Lipton][Product:Green Tea]{Net:30}{Tax:2}{Gross:12}
2013-03-01[Brand:Lipton][Product:Red Berry Tea]{Net:10}{Tax:2}{Gross:24}
```
The following Tractor script:
```language-tractor
group by quarter ~> average
```
returns:
```language-katsu
2013-01-01[Brand:Lipton][Product:Red Berry Tea]{Net:10}
2013-01-01[Brand:Lipton][Product:Red Berry Tea]{Tax:2}
2013-01-01[Brand:Lipton][Product:Red Berry Tea]{Gross:16}
2013-01-01[Brand:Lipton][Product:Green Tea]{Net:25}
2013-01-01[Brand:Lipton][Product:Green Tea]{Tax:2}
2013-01-01[Brand:Lipton][Product:Green Tea]{Gross:12}
```

###Example 2: Inconsistent Shape

Consider the dataset with an inconsistent shape (there are signals missing for Net and Tax and Gross):
```language-katsu
2013-01-01[Brand:Lipton][Product:Red Berry Tea]{Net:10}{Tax:2}{Gross:12}
2013-02-01[Brand:Lipton][Product:Red Berry Tea]{Net:10}{Gross:12}
2013-01-01[Brand:Lipton][Product:Green Tea]{Net:20}{Tax:2}
2013-01-01[Brand:Lipton][Product:Green Tea]{Tax:2}{Gross:12}
2013-03-01[Brand:Lipton][Product:Red Berry Tea]{Net:10}{Tax:2}{Gross:24}
```

The following Tractor script:
```language-tractor
~> group by quarter ~> average
```
returns:
```language-katsu
2013-01-01[Brand:Lipton][Product:Red Berry Tea]{Net:10}
2013-01-01[Brand:Lipton][Product:Red Berry Tea]{Tax:2}
2013-01-01[Brand:Lipton][Product:Red Berry Tea]{Gross:16}
2013-01-01[Brand:Lipton][Product:Green Tea]{Net:20}
2013-01-01[Brand:Lipton][Product:Green Tea]{Tax:2}
2013-01-01[Brand:Lipton][Product:Green Tea]{Gross:12}
```
##Things To Note

When there are missing values in the group package, the average calculation ignores these instead of treating them as zeros. 
