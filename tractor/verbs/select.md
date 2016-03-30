#Select

###### What is it ?

The  **select** verb is used to filter data from a [Data package](../../package.html). The result is stored in a [Data package](../../package.html) containing all points fulfulling a specified criterion.

######Ingredients (the things you need to know)
- [Data package](../../package.html)
- [Katsu](../../katsu.html)
- [Chopstick](../../chopstick.html)

##Syntax
<script type="text/javascript">
Diagram(
OneOrMore(NonTerminal('DATA PACKAGE')),  Terminal('~>'),
Terminal('select'),
NonTerminal('CHOPSTICK')
,
Terminal('~>'),
OneOrMore(NonTerminal('DATA PACKAGE'))
).addTo();
</script>

```language-tractor
	~> select chopstick ~>  
```
Refers to the [Chopstick](../../chopstick.html) page to understand how to build them.

##Examples

Below is a Katsu data sample :

```language-katsu
2014-01-01[Brand:X][Country:UK]{Net:12}{Tax:1}{Gross:13}
2014-01-01[Brand:XY][Country:France]{Net:25}{Tax:3}{Gross:28}
2014-02-01[Brand:X][Country:France][City:Paris]{Before Tax:10}{Tax:1}{After Tax:12}
```

#### On time
This will get all the points in year 2014
```language-tractor
~> select 2014 ~>
```
but this will only select points in January 2014 :
```language-tractor
~> select 2014-01 ~>
```

#### On context
The following statement selects all the points from the country France :
```language-tractor
~> select [Country:France] ~>
```
returns

```language-katsu
2014-01-01[Brand:X][Country:France]{Net:25}{Tax:3}{Gross:28}
2014-01-01[Brand:X][Country:France][City:Paris]{Before Tax:10}{Tax:1}{After Tax:12}
```

Regex syntax can be used too , for instance, this gets all the points with a brand containing X :
```language-tractor
~> select [Brand:regex('.*X.*')] ~>
```

Read the [Chopstick](../../chopstick.html) to understand how to build them.

#### On signal
- The following statement selects all the points with signal Net
```language-tractor
~> select {Net:} ~>
```
returns

```language-katsu
2014-01-01[Brand:X][Country:UK]{Net:12}
2014-01-01[Brand:X][Country:France]{Net:25}
```

- And to select multiple signals : Net and Tax 
```language-tractor
~> select {Net:}{Tax:} ~>
```
returns
```language-katsu
2014-01-01[Brand:X][Country:UK]{Net:12}{Tax:1}
2014-01-01[Brand:X][Country:France]{Net:25}{Tax:3}
```

#### On value

Get all the points with Net values greater than 20 with :
```language-tractor
~> select {Net>20} ~>
```
returns
```language-katsu
2014-01-01[Brand:X][Country:France]{Net:25}{Tax:3}{Gross:28}
```

