# Katsu

**Katsu** is the data fabric around which all DataShaka is based.

**Katsu** is a Content Agnostic Master Ontology (CAMO) with the elements Time, Context, Signal and Value. One **Katsu** point describes a contextualized numerical value at a point in time. *Time* is an ISO8601 datetime, *Context* is a set of key value pairs, *Signal* is a single string and *Value* is a numerical *value*. A set of Katsu contains multiple points. 

Within any set individual Context pairs as well as sets of pairs and Signals should be considered unique.

### Katsu point
One data point with an element of Time, Context, Signal and Value

### Time
A single point in time specified by an ISO8601 DateTime. This is ISO8601 down to the millisecond or any partial date to just year (yyyy e.g. 2015).

### Context
A single Context Type & Context pair or list of pairs. Context in Katsu is written using the syntax
```language-katsu
[Ct1:C1]....[Ctn:Cn]
```
Context is the descriptive elements of a Katsu point that give meaning to a Signal Value. Context Types without Context names are specified using `[Ct1]...[Ctn]` and Context names without Context Types are specified using `[:C1]...[:Cn]`

**Example**

```language-katsu
[Source:Survey][Brand:Nutrigum][Category:Gum]
```
### Signal
A single element describing a Value. Signals in Katsu are written with the
```language-katsu
{S1:V1}...{Sn:Vn}
```
syntax when paired with a Value and `{S1}...{Sn}` syntax when not paired with a Value.

**Example**
```language-katsu
{Sales:100}{Revenue:20.50}
```

### Value
A numeric value. Values in Katsu is written with the syntax
```language-katsu
{S1:V1}...{Sn:Vn}
```
when paired with a Signal and `{:V1}...{Vn}` when not paired with a Signal.

**Example**

```language-katsu
{Sales:100}{Revenue:20.50}
```

### Point

A Katsu point is *one* Time element, *one or more* Context elements, *one* Signal element and *one* Value element.
