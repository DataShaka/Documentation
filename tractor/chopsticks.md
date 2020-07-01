# What Are Chopsticks?

A chopstick defines the data selected and is written in [Katsu](../glossary.md#katsu) syntax. A Chopstick allows the user to define very accurately the selection of data that is to be dealt with by the [Verbs](./verbs/readme.md). It consists of:

- zero or one time fragment
- zero, one or many context fragments
- zero, one or many signal/value fragments

Here are some examples of Chopsticks:

One time fragment, two context fragments and one signal/value fragment

```
2013[Country:Brazil][Country:France]{Won:6}
```

Zero time fragments, zero context fragments and three signal/value fragments

```
{Twitter Followers}{Facebook Likes}{Instagram Likes}
```

One time fragment, two context fragments and zero signal/value fragments

```
2014-01-01[Brand:Evian][Region:Europe][Country:UK]
```
