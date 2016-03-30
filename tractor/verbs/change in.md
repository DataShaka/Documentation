#Change In 

##Definition

The **change in** verb calculates the change in value in an interval. The change can be in 1 year, quarter, month, week, day, minute etc.

The calculated change can be an absolute figure or a percentage figure.

##Syntax

```language-tractor
~> change in INTERVAL as absolute ~>
```
OR

```language-tractor
~> change in INTERVAL as percentage ~>
```

##Examples

###Example 1: Change In Day As Absolute

Take the followng data set:

```language-katsu
2013-06-01[Handle:Coca-Cola]{Tweets:95201}{Retweets:56}{Mentions:23}
2013-06-02[Handle:Coca-Cola]{Tweets:95206}{Retweets:48}{Mentions:36}
2013-06-03[Handle:Coca-Cola]{Tweets:95213}{Retweets:53}{Mentions:28}
2013-06-04[Handle:Coca-Cola]{Tweets:95216}{Retweets:36}{Mentions:23}
2013-06-05[Handle:Coca-Cola]{Tweets:95221}{Retweets:43}{Mentions:49}
2013-06-06[Handle:Coca-Cola]{Tweets:95228}{Retweets:62}{Mentions:12}
2013-06-07[Handle:Coca-Cola]{Tweets:95232}{Retweets:51}{Mentions:26}
2013-06-08[Handle:Coca-Cola]{Tweets:95237}{Retweets:44}{Mentions:47}
2013-06-09[Handle:Coca-Cola]{Tweets:95243}{Retweets:51}{Mentions:33}
2013-06-10[Handle:Coca-Cola]{Tweets:95250}{Retweets:28}{Mentions:29}
2013-06-01[Handle:Pepsi]{Tweets:101231}{Retweets:22}{Mentions:17}
2013-06-02[Handle:Pepsi]{Tweets:101242}{Retweets:16}{Mentions:23}
2013-06-03[Handle:Pepsi]{Tweets:101250}{Retweets:21}{Mentions:36}
2013-06-04[Handle:Pepsi]{Tweets:101257}{Retweets:35}{Mentions:49}
2013-06-05[Handle:Pepsi]{Tweets 101266}{Retweets:29}{Mentions:26}
2013-06-06[Handle:Pepsi]{Tweets:101276}{Retweets:28}{Mentions:33}
2013-06-07[Handle:Pepsi]{Tweets:101284}{Retweets:30}{Mentions:42}
2013-06-08[Handle:Pepsi]{Tweets:101296}{Retweets:19}{Mentions:25}
2013-06-09[Handle:Pepsi]{Tweets:101305}{Retweets:25}{Mentions:22}
2013-06-10[Handle:Pepsi]{Tweets:101213}{Retweets:20}{Mentions:36}
```

This script calculates the absolute change in retweets each day:

```language-tractor
~> filter [Handle:Pepsi]{Retweets} change in day as absolute includes {Growth In Retweets} ~>
```

And returns:

```language-katsu
2013-06-02[Handle:Pepsi]{Growth In Retweets:-6}
2013-06-03[Handle:Pepsi]{Growth In Retweets:5}
2013-06-04[Handle:Pepsi]{Growth In Retweets:14}
2013-06-05[Handle:Pepsi]{Growth In Retweets -6}
2013-06-06[Handle:Pepsi]{Growth In Retweets:-1}
2013-06-07[Handle:Pepsi]{Growth In Retweets:2}
2013-06-08[Handle:Pepsi]{Growth In Retweets:-11}
2013-06-09[Handle:Pepsi]{Growth In Retweets:6}
2013-06-10[Handle:Pepsi]{Growth In Retweets:-5}
```

###Example 2: Change In Year As Percentage

Take the followng data set:

```language-katsu
2008[Company:Amazon.co.uk]{UK turnover:5}{Profit Before Tax:-2}{Tax Paid:1}
2008[Company:Apple]{UK turnover:30}{Profit Before Tax:20}{Tax Paid:4}
2008[Company:Coca Cola]{UK turnover:100}{Profit Before Tax:50}{Tax Paid:2}
2008[Company:Facebook]{UK turnover:20}{Profit Before Tax:-10}{Tax Paid:2}
2008[Company:Goldman Sachs]{UK turnover:50}{Profit Before Tax:40}{Tax Paid:1}
2008[Company:Google]{UK turnover:10}{Profit Before Tax:-2}{Tax Paid:0}
2008[Company:IBM]{UK turnover:30}{Profit Before Tax:20}{Tax Paid:6}
2008[Company:Starbucks]{UK turnover:30}{Profit Before Tax:-20}{Tax Paid:0}
2009[Company:Amazon.co.uk]{UK turnover:10}{Profit Before Tax:2}{Tax Paid:0}
2009[Company:Apple]{UK turnover:50}{Profit Before Tax:10}{Tax Paid:2}
2009[Company:Coca Cola]{UK turnover:60}{Profit Before Tax:50}{Tax Paid:4}
2009[Company:Facebook]{UK turnover:10}{Profit Before Tax:10}{Tax Paid:2}
2009[Company:Goldman Sachs]{UK turnover:50}{Profit Before Tax:20}{Tax Paid:2}
2009[Company:Google]{UK turnover:60}{Profit Before Tax:-10}{Tax Paid:0}
2009[Company:IBM]{UK turnover:30}{Profit Before Tax:10}{Tax Paid:5}
2009[Company:Starbucks]{UK turnover:30}{Profit Before Tax:-50}{Tax Paid:0}
```

This script calculate the percentage year on year change in tax paid by each company:
```language-tractor
~> crop [Company:]{Tax Paid} ~> change in year as percentage includes {Change In Tax Paid Yearly} ~>
```
and returns:
```language-katsu
2009[Company:Amazon.co.uk]{Tax Paid:0}{Change In Tax Paid Yearly:-100%}
2009[Company:Apple]{Tax Paid:2}{Change In Tax Paid Yearly:-50%}
2009[Company:Coca Cola]{Tax Paid:4}{Change In Tax Paid Yearly:100}
2009[Company:Facebook]{Tax Paid:2}{Change In Tax Paid Yearly:0%}
2009[Company:Goldman Sachs]{Tax Paid:2}{Change In Tax Paid Yearly:100%}
2009[Company:Google]{Tax Paid:0}{Change In Tax Paid Yearly:0%}
2009[Company:IBM]{Tax Paid:5}{Change In Tax Paid Yearly:-16.7%}
2009[Company:Starbucks]{Tax Paid:0}{Change In Tax Paid Yearly:0%}
```
Note that the time point for each change change in signal is taken from the latest timepoint in each calculation.

###Example 3: Change In Week As Absolute With Daily Data

Take the followng data set:

```language-katsu
2014-03-31[Source:Sysomos][source_type:blog_results][call:map/analytics][search_term:"social media"]{mention_count:2032}
2014-04-01[Source:Sysomos][source_type:blog_results][call:map/analytics][search_term:"social media"]{mention_count:5801}
2014-04-02[Source:Sysomos][source_type:blog_results][call:map/analytics][search_term:"social media"]{mention_count:5534}
2014-04-03[Source:Sysomos][source_type:blog_results][call:map/analytics][search_term:"social media"]{mention_count:5343}
2014-04-04[Source:Sysomos][source_type:blog_results][call:map/analytics][search_term:"social media"]{mention_count:5042}
2014-04-05[Source:Sysomos][source_type:blog_results][call:map/analytics][search_term:"social media"]{mention_count:2942}
2014-04-06[Source:Sysomos][source_type:blog_results][call:map/analytics][search_term:"social media"]{mention_count:3499}
2014-04-07[Source:Sysomos][source_type:blog_results][call:map/analytics][search_term:"social media"]{mention_count:5754}
2014-04-08[Source:Sysomos][source_type:blog_results][call:map/analytics][search_term:"social media"]{mention_count:5544}
2014-04-09[Source:Sysomos][source_type:blog_results][call:map/analytics][search_term:"social media"]{mention_count:5406}
2014-04-10[Source:Sysomos][source_type:blog_results][call:map/analytics][search_term:"social media"]{mention_count:5229}
2014-04-11[Source:Sysomos][source_type:blog_results][call:map/analytics][search_term:"social media"]{mention_count:4731}
2014-04-12[Source:Sysomos][source_type:blog_results][call:map/analytics][search_term:"social media"]{mention_count:3013}
2014-04-13[Source:Sysomos][source_type:blog_results][call:map/analytics][search_term:"social media"]{mention_count:3203}
2014-04-14[Source:Sysomos][source_type:blog_results][call:map/analytics][search_term:"social media"]{mention_count:4917}
2014-04-15[Source:Sysomos][source_type:blog_results][call:map/analytics][search_term:"social media"]{mention_count:4197}
2014-04-16[Source:Sysomos][source_type:blog_results][call:map/analytics][search_term:"social media"]{mention_count:5168}
2014-04-17[Source:Sysomos][source_type:blog_results][call:map/analytics][search_term:"social media"]{mention_count:4887}
2014-04-18[Source:Sysomos][source_type:blog_results][call:map/analytics][search_term:"social media"]{mention_count:4124}
2014-04-19[Source:Sysomos][source_type:blog_results][call:map/analytics][search_term:"social media"]{mention_count:2839}
2014-04-20[Source:Sysomos][source_type:blog_results][call:map/analytics][search_term:"social media"]{mention_count:2808}
2014-04-21[Source:Sysomos][source_type:blog_results][call:map/analytics][search_term:"social media"]{mention_count:4802}
2014-04-22[Source:Sysomos][source_type:blog_results][call:map/analytics][search_term:"social media"]{mention_count:5263}
2014-04-23[Source:Sysomos][source_type:blog_results][call:map/analytics][search_term:"social media"]{mention_count:5436}
2014-04-24[Source:Sysomos][source_type:blog_results][call:map/analytics][search_term:"social media"]{mention_count:4985}
2014-04-25[Source:Sysomos][source_type:blog_results][call:map/analytics][search_term:"social media"]{mention_count:4307}
2014-04-26[Source:Sysomos][source_type:blog_results][call:map/analytics][search_term:"social media"]{mention_count:2824}
2014-04-27[Source:Sysomos][source_type:blog_results][call:map/analytics][search_term:"social media"]{mention_count:3136}
2014-04-28[Source:Sysomos][source_type:blog_results][call:map/analytics][search_term:"social media"]{mention_count:5444}
2014-04-29[Source:Sysomos][source_type:blog_results][call:map/analytics][search_term:"social media"]{mention_count:5356}
2014-04-30[Source:Sysomos][source_type:blog_results][call:map/analytics][search_term:"social media"]{mention_count:5486}
```

This script calculates the absolute week on week change in mentions of the term "social media":

```language-tractor
crop [search_term:"social media"]{mention_count} ~> group by week ~> sum {mention_count} includes {"Social Media" Weekly Mentions} ~> change in week as absolute includes {Weekly Growth in Mentions "Social Media"}
```

and returns:

```language-katsu
2014-W15[search_term:"social media"]{"Social Media" Weekly Mentions:32880}{Weekly Growth in Mentions "Social Media":2867}
2014-W16[search_term:"social media"]{"Social Media" Weekly Mentions:28940}{Weekly Growth in Mentions "Social Media":-3940}
2014-W17[search_term:"social media"]{"Social Media" Weekly Mentions:30753}{Weekly Growth in Mentions "Social Media":1813}
```

Note that when there is not a complete week - in this case W18, then the change in cannot be calculated. If there are missing data points in a data package, then the pad verb should be used if a **change in** signal is still required. 
