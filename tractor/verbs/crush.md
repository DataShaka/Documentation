
#Crush 

##Definition

The **crush** verb is used to smoothen data after it has been groupped.
Typically, the crush verb will assign a given date to all points in the group with regards to the groupping method.

##Syntax
<script type="text/javascript">
Diagram(
OneOrMore(NonTerminal('GROUP PACKAGE')),  Terminal('~>'),
Sequence(NonTerminal('crush ')
),
Terminal('~>'),
OneOrMore(NonTerminal('GROUP PACKAGE'))
).addTo();
</script>

	~> crush ~>

##Examples 

Take the following data set:

~~~language-katsu
2013-01-01[Brand:iPhone][Country:Germany]{Sales:10}
2013-01-02[Brand:iPhone][Country:Germany]{Sales:10}
2013-01-03[Brand:iPhone][Country:Germany]{Sales:10}
2013-02-10[Brand:iPhone][Country:Germany]{Sales:10}
2013-02-11[Brand:iPhone][Country:Germany]{Sales:10}
~~~

Using the following Tractor script to sum by month will return data that is not 'aligned' correctly against the 1st of the month : 
```language-tractor
	~> group by month ~> sum
```

returns 

~~~language-katsu
2013-01-01[Brand:iPhone][Country:Germany]{Sales:30}
2013-02-10[Brand:iPhone][Country:Germany]{Sales:20}
~~~

To align these points to the 1st of the month , use `crush` : 

```language-tractor
	~> group by month ~> crush ~> sum
```

returns 

~~~language-katsu
2013-01-01[Brand:iPhone][Country:Germany]{Sales:30}
2013-02-01[Brand:iPhone][Country:Germany]{Sales:20}
~~~




