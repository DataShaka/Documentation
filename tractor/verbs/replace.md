# Replace

The  **replace** verb is used to replace elements in data from a [Data package](../datapackages.md). The result is stored in a [Data package](../datapackages.md). 

## Syntax

```language-tractor
~> replace chopstick with chopstick ~>
```

Refer to the [Chopsticks](../chopsticks.md) page to learn how to build them.

## Examples

Below is a [Katsu](../../glossary.md#katsu) data sample :

```language-katsu
2020-01-01[Brand:X][Country:UK]{Net:12}{Tax:1}{Gross:13}
2020-01-01[Brand:XY][Country:France]{Net:25}{Tax:3}{Gross:28}
2020-02-01[Brand:X][Country:France][City:Paris]{Before Tax:10}{Tax:1}{After Tax:12}
```

<!--
#### Rename context types

```language-tractor
~> replace [Brand:] with [Label:] ~>
```
results in 

```language-katsu
2020-01-01[Label:X][Country:UK]{Net:12}{Tax:1}{Gross:13}
2020-01-01[Label:XY][Country:France]{Net:25}{Tax:3}{Gross:28}
2020-02-01[Label:X][Country:France][City:Paris]{Before Tax:10}{Tax:1}{After Tax:12}
```

#### Rename contexts
```language-tractor
~> replace [Country:UK] with [Country:Great Britain] ~>
```
results in 
```language-katsu
2020-01-01[Brand:X][Country:Great Britain]{Net:12}{Tax:1}{Gross:13}
2020-01-01[Brand:XY][Country:France]{Net:25}{Tax:3}{Gross:28}
2020-02-01[Brand:X][Country:France][City:Paris]{Before Tax:10}{Tax:1}{After Tax:12}
```

-->

#### Rename signals

```language-tractor
~> replace {Net:} with {Before Tax:} ~>
```

results in 

```language-katsu
2020-01-01[Brand:X][Country:UK]{Before Tax:12}{Tax:1}{Gross:13}
2020-01-01[Brand:XY][Country:France]{Before Tax:25}{Tax:3}{Gross:28}
2020-02-01[Brand:X][Country:France][City:Paris]{Before Tax:10}{Tax:1}{After Tax:12}
```

<!--
#### Real life examples

Use parenthesis to tell Tractor where to replace in the flow :

```language-tractor
~> select [Brand][Country]{Net}
~> ( select [Brand:XY] ~> replace {Net:} with {BT:} ) 
~> ( select [Brand:X][Country:UK] ~> replace {Net} with {BT} ) 
~> ( select [Brand:X][Country:France] ~> replace {Net} with {Avant les taxes} )
~> 
```
 results in 
```language-katsu
2020-01-01[Brand:X][Country:UK]{BT:12}
2020-01-01[Brand:XY][Country:France]{BT:25}
2020-02-01[Brand:X][Country:France]{Avant les taxes:10}
```
-->
