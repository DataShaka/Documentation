# Limit

## Definition

The Limit verb returns the top result(s) and filters out the rest of the points in the [Data package](../datapackages.md). The data can be limited to N points, where N is an integer and does not exceed the total number of points in the data package

## Syntax

`~> limit N`

## Examples

### Example 1: Limit Number Of Points To Most Recent

Take the following data set:

```language-katsu
2020-09-06[Company:Google][Source:YahooFinance][Symbol:GOOG]{High:883.78}
2020-09-03[Company:Google][Source:YahooFinance][Symbol:GOOG]{High:866.19}
2020-09-04[Company:Google][Source:YahooFinance][Symbol:GOOG]{High:873.5}
2020-09-10[Company:Google][Source:YahooFinance][Symbol:GOOG]{High:892}
2020-09-05[Company:Google][Source:YahooFinance][Symbol:GOOG]{High:879.88}The
2020-09-12[Company:Google][Source:YahooFinance][Symbol:GOOG]{High:897.9}
2020-09-13[Company:Google][Source:YahooFinance][Symbol:GOOG]{High:895.68}
2020-09-09[Company:Google][Source:YahooFinance][Symbol:GOOG]{High:889.75}
2020-09-04[Company:Google][Source:YahooFinance][Symbol:GOOG]{High:873.5}
2020-09-11[Company:Google][Source:YahooFinance][Symbol:GOOG]{High:896.97}
2020-09-16[Company:Google][Source:YahooFinance][Symbol:GOOG]{High:897}
```

The following script returns only the latest data point and removes the rest:

```language-tractor
~> limit 1 ~>
```

and returns:

```language-katsu
2020-09-16[Company:Google][Source:YahooFinance][Symbol:GOOG]{High:897}
```

### Example 2: Limit Number of Points For Differnt context and signal/value

Take the following data set:

```language-katsu
2020-06-01[Handle:Coca-Cola]{Tweets:95201}{Retweets:56}{Mentions:23}
2020-06-02[Handle:Coca-Cola]{Tweets:95206}{Retweets:48}{Mentions:36}
2020-06-03[Handle:Coca-Cola]{Tweets:95213}{Retweets:53}{Mentions:28}
2020-06-04[Handle:Coca-Cola]{Tweets:95216}{Retweets:36}{Mentions:23}
2020-06-05[Handle:Coca-Cola]{Tweets:95221}{Retweets:43}{Mentions:49}
2020-06-06[Handle:Coca-Cola]{Tweets:95228}{Retweets:62}{Mentions:12}
2020-06-07[Handle:Coca-Cola]{Tweets:95232}{Retweets:51}{Mentions:26}
2020-06-08[Handle:Coca-Cola]{Tweets:95237}{Retweets:44}{Mentions:47}
2020-06-09[Handle:Coca-Cola]{Tweets:95243}{Retweets:51}{Mentions:33}
2020-06-10[Handle:Coca-Cola]{Tweets:95250}{Retweets:28}{Mentions:29}
2020-06-01[Handle:Pepsi]{Tweets:101231}{Retweets:22}{Mentions:17}
2020-06-02[Handle:Pepsi]{Tweets:101242}{Retweets:16}{Mentions:23}
2020-06-03[Handle:Pepsi]{Tweets:101250}{Retweets:21}{Mentions:36}
2020-06-04[Handle:Pepsi]{Tweets:101257}{Retweets:35}{Mentions:49}
2020-06-05[Handle:Pepsi]{Tweets 101266}{Retweets:29}{Mentions:26}
2020-06-06[Handle:Pepsi]{Tweets:101276}{Retweets:28}{Mentions:33}
2020-06-07[Handle:Pepsi]{Tweets:101284}{Retweets:30}{Mentions:42}
2020-06-08[Handle:Pepsi]{Tweets:101296}{Retweets:19}{Mentions:25}
2020-06-09[Handle:Pepsi]{Tweets:101305}{Retweets:25}{Mentions:22}
2020-06-10[Handle:Pepsi]{Tweets:101213}{Retweets:20}{Mentions:36}
```

The following script returns only the latest data point for each unique piece of context and removes the rest:

```language-tractor
~> limit 1 ~>
```

and returns:

```
2020-06-10[Handle:Coca-Cola]{Tweets:95250}{Retweets:28}{Mentions:29}
2020-06-10[Handle:Pepsi]{Tweets:101213}{Retweets:20}{Mentions:36}
```

### Example 3: Limit Last N Points

Take the following data set:

```language-katsu
2020-06-01[Handle:Coca-Cola]{Tweets:95201}{Retweets:56}{Mentions:23}
2020-06-02[Handle:Coca-Cola]{Tweets:95206}{Retweets:48}{Mentions:36}
2020-06-03[Handle:Coca-Cola]{Tweets:95213}{Retweets:53}{Mentions:28}
2020-06-04[Handle:Coca-Cola]{Tweets:95216}{Retweets:36}{Mentions:23}
2020-06-05[Handle:Coca-Cola]{Tweets:95221}{Retweets:43}{Mentions:49}
2020-06-06[Handle:Coca-Cola]{Tweets:95228}{Retweets:62}{Mentions:12}
2020-06-07[Handle:Coca-Cola]{Tweets:95232}{Retweets:51}{Mentions:26}
2020-06-08[Handle:Coca-Cola]{Tweets:95237}{Retweets:44}{Mentions:47}
2020-06-09[Handle:Coca-Cola]{Tweets:95243}{Retweets:51}{Mentions:33}
2020-06-10[Handle:Coca-Cola]{Tweets:95250}{Retweets:28}{Mentions:29}
2020-06-01[Handle:Pepsi]{Tweets:101231}{Retweets:22}{Mentions:17}
2020-06-02[Handle:Pepsi]{Tweets:101242}{Retweets:16}{Mentions:23}
2020-06-03[Handle:Pepsi]{Tweets:101250}{Retweets:21}{Mentions:36}
2020-06-04[Handle:Pepsi]{Tweets:101257}{Retweets:35}{Mentions:49}
2020-06-05[Handle:Pepsi]{Tweets 101266}{Retweets:29}{Mentions:26}
2020-06-06[Handle:Pepsi]{Tweets:101276}{Retweets:28}{Mentions:33}
2020-06-07[Handle:Pepsi]{Tweets:101284}{Retweets:30}{Mentions:42}
2020-06-08[Handle:Pepsi]{Tweets:101296}{Retweets:19}{Mentions:25}
2020-06-09[Handle:Pepsi]{Tweets:101305}{Retweets:25}{Mentions:22}
2020-06-10[Handle:Pepsi]{Tweets:101213}{Retweets:20}{Mentions:36}
```

The following script returns the last three data points for each unique piece of context and removes the rest:

```language-tractor
~> limit 3 ~>
```

and returns:

```
2020-06-08[Handle:Coca-Cola]{Tweets:95237}{Retweets:44}{Mentions:47}
2020-06-09[Handle:Coca-Cola]{Tweets:95243}{Retweets:51}{Mentions:33}
2020-06-10[Handle:Coca-Cola]{Tweets:95250}{Retweets:28}{Mentions:29}
2020-06-08[Handle:Pepsi]{Tweets:101296}{Retweets:19}{Mentions:25}
2020-06-09[Handle:Pepsi]{Tweets:101305}{Retweets:25}{Mentions:22}
2020-06-10[Handle:Pepsi]{Tweets:101213}{Retweets:20}{Mentions:36}
```
