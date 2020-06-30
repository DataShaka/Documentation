# Retrieve route


- The Retrieve route allows you to query and/or manipulate stored data from a given groupspace
- An authentication token is needed to make any query.


## Formatters

```
.json
```
```
.tcsv
```
```
.csv
```

## Authentication Parameters

```
token=<your token>
```
```
groupspace=<your groupspace>
```

## Base

```language-http
https://api.datashaka.com/v1.0/
```

## HTTP Methods

### GET
- Provide your groupspace (as required) and token (always required) in the URL
- Provide parameters in the name=value&name2=value2 form in the url
- Tractor is not available in GET requiest

  
### POST
- Provide your groupspace (as required) and token (always required) in the URL
- Provide your parameters as the post document in JSON with the ```context-type``` ```application/json```
- Tractor and Tractors can also be included in the POST document


## Parameters

All parameters are optional.
When no query parameter is filled in , the API will simply return all the data stored.

| Name | Type |Connected |Description |Availability|
|----|----|----|----|----|
|time_from  |ISO8601| True  |Optional. The first Time from which all Points must match (inclusive)  |v1.0|
|time_to  |ISO8601| True  |Optional. The last Time to which all Points must match (inclusive) |v1.0|
|signal |Signal list| True  |Optional. A list of Signals that Points must match e.g. {Signal 1}{Signal 2}{Signal 3}|v1.0|
|context  |Context list|  True  |Optional. A list of Context that Points must match e.g. [Type1:Name1][Type2:Name2][Type3:Name3] |v1.0|
|tractors| List of Tractor scripts| N/A| Optional. An array of Tractor script to be executed post-query in parallel | v1.0 POST Only|
|tractor| A Tractor scripts| N/A| Optional. A Tractor script to be executed post-query and after `tractors`  have returned data | v1.0 POST Only|


## Examples

Examples below use token `YM36SWub5UysJBaY5tC8Xg-odBXcRBjRkKLAKP9xSrSKA` for the *Demo* account.

### GET Examples

Query to retrieve data of year 2013 in groupspace "Community" in JSON format

```language-http
https://api.datashaka.com/v1.0/retrieve.json?token=YM36SWub5UysJBaY5tC8Xg-odBXcRBjRkKLAKP9xSrSKA&groupspace=Community&time_from=2013&time_to=2013
```  

Query to retrieve data of *from* year 2013 in groupspace "Community" in JSON format

```language-http
https://api.datashaka.com/v1.0/retrieve.json?token=YM36SWub5UysJBaY5tC8Xg-odBXcRBjRkKLAKP9xSrSKA&groupspace=Community&time_from=2013
```  

Query to retrieve data of *up to* year 2013 in groupspace "Community" in JSON format

```language-http
https://api.datashaka.com/v1.0/retrieve.json?token=YM36SWub5UysJBaY5tC8Xg-odBXcRBjRkKLAKP9xSrSKA&groupspace=Community&time_to=2013
``` 

Query to retrieve {Low}{High} and {Close} values of year 2013 in groupspace "Community" in JSON format

```language-http
https://api.datashaka.com/v1.0/retrieve.json?token=YM36SWub5UysJBaY5tC8Xg-odBXcRBjRkKLAKP9xSrSKA&groupspace=Community&time_to=2013&signal={Low}{High}{Close}
```  

Query to retrieve {Low}{High} and {Close} values of year 2013 for Source YahooFinance only in groupspace "Community" in JSON format 

```language-http
https://api.datashaka.com/v1.0/retrieve.json?token=YM36SWub5UysJBaY5tC8Xg-odBXcRBjRkKLAKP9xSrSKA&groupspace=Community&time_to=2013&signal={Low}{High}{Close}&context=[Source:YahooFinance]
```  

Query to retrieve {Low}{High} and {Close} values of year 2013 for Source YahooFinance & Company Microsoft only in groupspace "Community" in JSON format 

```language-http
https://api.datashaka.com/v1.0/retrieve.json?token=YM36SWub5UysJBaY5tC8Xg-odBXcRBjRkKLAKP9xSrSKA&groupspace=Community&time_to=2013&signal={Low}{High}{Close}&context=[Source:YahooFinance][Company:Microsoft]
```  

### POST Examples

Query to retrieve data of year 2013 in groupspace "Community" in TCSV format

```language-http
https://api.datashaka.com/v1.0/retrieve.tcsv?token=YM36SWub5UysJBaY5tC8Xg-odBXcRBjRkKLAKP9xSrSKA&groupspace=Community
```  

```language-json
{
    "time_from":  "2013",
    "time_to":  "2013"
}
```

Query to retrieve {Low}{High} and {Close} values of year 2013 for Source YahooFinance & Company Microsoft only in groupspace "Community" in TCSV format 


```language-http
https://api.datashaka.com/v1.0/retrieve.tcsv?token=YM36SWub5UysJBaY5tC8Xg-odBXcRBjRkKLAKP9xSrSKA&groupspace=Community
```  

```language-json
{
    "time_from":  "2013",
    "time_to":  "2013",
    "signal":"{Low}{High}{Close}",
    "context":"[Source:YahooFinance][Company:Microsoft]"
}
```

Query to retrieve {Low}{High} and {Close} values of year 2013 for Source YahooFinance & Company Microsoft only in groupspace "Community" in TCSV format. 
Monthly average per signal, ordered by time


```language-http
https://api.datashaka.com/v1.0/retrieve.tcsv?token=YM36SWub5UysJBaY5tC8Xg-odBXcRBjRkKLAKP9xSrSKA&groupspace=Community
```  

```language-json
{
    "time_from":  "2013",
    "time_to":  "2013",
    "signal":"{Low}{High}{Close}",
    "context":"[Source:YahooFinance][Company:Microsoft]",
    "tractor":" sort by time ~> group by month ~> average"
}
```

Query to retrieve {Low}{High} and {Close} values of year 2013 for Source YahooFinance & Company Microsoft only in groupspace "Community" in TCSV format. 
Monthly average per signal, ordered by time


```language-http
https://api.datashaka.com/v1.0/retrieve.tcsv?token=YM36SWub5UysJBaY5tC8Xg-odBXcRBjRkKLAKP9xSrSKA&groupspace=Community
```  

```language-json
{
    "time_from":  "2013",
    "time_to":  "2013",
    "signal":"{Low}{High}{Close}",
    "context":"[Source:YahooFinance][Company:Microsoft]",
    "tractor":" sort by time ~> group by month ~> average"
}
```

Query to retrieve {Low}{High} and {Close} values of year 2013 for Source YahooFinance & Company Microsoft only in groupspace "Community" in TCSV format. 
Separate values under and above 30 for the {Low} signal

```language-http
https://api.datashaka.com/v1.0/retrieve.tcsv?token=YM36SWub5UysJBaY5tC8Xg-odBXcRBjRkKLAKP9xSrSKA&groupspace=Community
```  

```language-json
{
    "time_from":  "2013",
    "time_to":  "2013",
    "signal":"{Low}",
    "context":"[Source:YahooFinance][Company:Microsoft]",
    "tractors":[
        "filter {Low:<30} ~> replace {Low} with {Low Under 30}",
        "filter {Low:>30} ~> replace {Low} with {Low Above 30}"
        ]
}

```


Query to retrieve {Low}{High} and {Close} values of year 2013 for Source YahooFinance & Company Microsoft only in groupspace "Community" in CSV format. 
Applies sum/average aggregation to Google/Microsoft then , order by time.

```language-http
https://api.datashaka.com/v1.0/retrieve.csv?token=YM36SWub5UysJBaY5tC8Xg-odBXcRBjRkKLAKP9xSrSKA&groupspace=Community
```  

```language-json
{
    "time_from":  "2013",
    "time_to":  "2013",
    "signal":"{Low}{High}",
    "context":"[Source:YahooFinance]",
    "tractors":[
        "filter [Company:Google]{Low} ~> group by month ~> sum",
        "filter [Company:Microsoft]{High} ~> group by month ~> sum"
        ],
        "tractor":"sort by time"
}
```

**The full list of Tractor verbs is documented [here](https://htmlpreview.github.io/?https://raw.githubusercontent.com/DataShaka/tractor/master/Documentation/html/verbs.html)**

