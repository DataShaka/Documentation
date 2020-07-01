# Glossary of Terms

## <a id="katsu">Katsu</a>

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

A Katsu point is 1 T, 1 or more C, 1 S and 1 V..

### Points

A set of individual Point

### Connected

Within a unified set of Katsu data, an element (T,C,S or V) can be *Connected* which means it is part of a Katsu set representing actual data. Elements can be *Disconnected* which means they are considered in the overall unified set and not in their relationships to Points.


## <a id="queries">Queries</a>


### Discovery
Discovery is the process of query to determine what data is available. Discovery queries are used to examine the **meta data** of a unified set of Katsu.

Check out the [Discovery API Route](routes/discovery.md) page to learn more.

### Retrieve
Retrieve queries are used to get a portion of the overall unified set. For example, one month of data for two particular signals.

Check out the [Retrieval API Route](routes/retrieve.md) page to learn more.


## <a id="calendars">Calendars</a>

### <a id="type-cal">Types of Calendars</a>
Within DataShaka technology there are currently two kinds of calendars you can use. The default calendar or a custom calendar.

#### <a id="default-cal">The Default Calendar</a>
This is basically the [ISO8601](#iso8601) [Gregorian](http://en.wikipedia.org/wiki/Gregorian_calendar) calendar. I say 'basically' because we have had to make some decisions up front on the way this calendar is implemented because computers and 'planetary motion' works in different ways.

Check out the [Default Calendar](calendars/defaultcalendar.md) page to learn more.

#### <a id="custom-cal">Custom Calendars</a>
These are calendars that you can specify yourself! They are made up of intervals and definitions. Intervals are alternative definitions of chunks of time (month, quarter, campaign, etc.) and definitions are fundamental alterations to the default calendar (for example, on what day a week starts. Sunday, Monday, etc.)

Check out the [Custom Calendar](calendars/customcalendar.md) page to learn more.

## <a id="tractor">Tractor</a>

Tractor is a modern **data orchestration** scripting language designed to make **data easier**.

Check out the [Tractor](tractor/README.md) page to learn more.


## <a id="implementation">Implementation</a>

### APIVx.x

Specification of a version of the API. For Example V1.0.

### Planned

This feature has been entered on to the backlog and prioritized.

### Not yet implemented
This feature is not yet implemented and thus not available in any version of the API. This feature has been accepted as desirable for prioritization in the backlog. This feature is likely to be implemented but has not been confirmed.

### Under consideration
This feature has been suggested and is being considered for entry into the backlog for prioritization. This feature may never be implemented.

### Rejected
This feature has been rejected and will not be implemented.

### Deprecated
This feature will be removed when its supporting versions are sunset.

### Sunset date
The date when a version will no longer be made available.

