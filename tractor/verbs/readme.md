# Tractor Verbs

Tractor is a language that uses verbs to define actions to be peformed on the data. For example:

```
filter {High}{Low} ~> group by year ~> calculate "{High}/{Low}" 

filter, group by and calculate are all examples of verbs with different features.


Verbs that are currently available for manipulating data in Tractor are:

- Average
- Calculate
- Crop
- Filter
- Group by
- Pad
- Rank
- Roll by
- Sort by
- Sum
