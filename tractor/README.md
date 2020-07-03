# Tractor

Tractor is a modern data orchestration scripting language designed to make data easier.

# The Tractor Mission

Tractor embodies a new way of looking at data because it is designed to give a user the ability to 'do work' on data very easily. When doing work on data in the [Katsu](../katsu.md) format specifically, it offers control over the all the flexibility that [Katsu](../katsu.md) offers.

The work that a user would want to do on a dataset can be grouped into three areas: manipulation, acquisition, delivery or MAD.

- M = a user manipulating data using specifically designed DataShaka tools
- A = a user putting data into the DataShaka store
- D = a user exporting manipulated data into charts, spreadsheets, reports or third party visualisation tools

Currently, only the tooling around the manipulation of data is available, so acquiring data and transforming it into [Katsu](../glossary.md#katsu) cannot be done using Tractor. Delivering data is also not possible at this point.

# How Tractor Works

Because Tractor is 'data first' it has a different mental model from other programming languages. The fundamental assumption is that there is 'data to work on'. Whether that data is harvested from an API or is the result from a query from an internal store.

The Tractor DSL is made up of: 
- [Tractor Beams](tractorbeams.md)
- [Data Packages](datapackages.md)
- [Verbs](verbs/readme.md)
- [Chopsticks](chopsticks.md)
- [The Hitch](hitch.md)
