# Tractor Beams

A Tractor Beam is a set of actions that are performed by different verbs (and attached keywords) on a specified Chopstick / set of chopsticks. Here is an example of a Tractor beam using three verbs (filter, group by, calculate)and two keywords (year, includes):

```filter {High}{Low} ~> group by year ~> calculate "{High}/{Low}" includes {Ratio} ~> ```

A Tractor beam can have as many verbs and keywords as required. Here is an example of a Tractor Beam with many verbs and keywords:

```filter {High}{Low} ~> group by year ~> calculate "{High}/{Low}" includes {Yearly Ratio} ~> group by month ~> average includes {Monthly Average Ratio}```
