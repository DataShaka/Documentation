# The Hitch

The Hitch `~>` is used to indicate the next step or actions. It basically means "then do this". 
For example - filter, then group by, then calculate is written in [Tractor](readme.md) like this:

`filter {High}{Low} ~> group by year ~> calculate "{High}/{Low}" include {Ratio}`

### When The Hitch Is *Not* Used

There are two instances where the Hitch `~>` is *not* used.

- In between a [Verb](verbs/readme.md) and a [Keyword](verbs/readme.md#keywords)
- At the end of a [Tractor Beam](tractorbeams.md)

For example:

`filter {High}{Low} ~> group by year ~> calculate "{High}/{Low}" includes {Ratio}`

> Note how the Hitch `~>` is not used in between calculate and includes. It is also not used at the end of the Beam.
