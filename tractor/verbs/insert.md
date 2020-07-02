# Insert

## Definition

The  **insert** verb is used to add [Katsu](../../glossary.md#katsu) elements to data.

## Syntax

```language-tractor
~> insert chopstick where chopstick~>
```

## Examples

### Insert Context

Take the following dataset:

```language-katsu
2020-01-01[Brand:Adidas][Country:UK]{Net:12}{Tax:1}{Gross:13}
2020-01-02[Brand:Adidas][Country:UK]{Net:12}{Tax:10}{Gross:22}
2020-01-01[Brand:Nike][Country:France]{Net:25}{Tax:3}{Gross:28}
2020-02-01[Brand:Adidas][Country:France][City:Paris]{Before Tax:10}{Tax:1}{After Tax:12}
```

The following script inserts a context type and context in your data. Think as if you were adding a new column heading "Department" to your CSV file and fill it up with "Clothing":

```language-tractor
~> insert [Department:Clothing] where [any()] ~>
```

results in

```language-katsu
2020-01-01[Brand:Adidas][Country:UK][Department:Clothing]{Net:12}{Tax:1}{Gross:13}
2020-01-02[Brand:Adidas][Country:UK][Department:Clothing]{Net:12}{Tax:10}{Gross:22}
2020-01-01[Brand:Nike][Country:France][Department:Clothing]{Net:25}{Tax:3}{Gross:28}
2020-02-01[Brand:Adidas][Country:France][Department:Clothing][City:Paris]{Before Tax:10}{Tax:1}{After Tax:12}
```

### Thing To Note With Insert

**insert** is particularly useful when categorizing data: 

For example

```language-tractor

# Brand performance category

~> insert [Category:High Performer] where {Gross:>25} ~> insert [Category:Normal] where {Gross:<=25} 

```

returns

```language-katsu
2020-01-01[Brand:Adidas][Category:Normal][Country:UK]{Net:12}{Tax:1}{Gross:13}
2020-01-02[Brand:Adidas][Category:Normal][Country:UK]{Net:12}{Tax:10}{Gross:22}
2020-01-01[Brand:Nike][Category:High Performer][Country:France]{Net:25}{Tax:3}{Gross:28}
2020-02-01[Brand:Adidas][Category:Normal][Country:France][City:Paris]{Before Tax:10}{Tax:1}{After Tax:12}
```
