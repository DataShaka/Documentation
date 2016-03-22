#Parse route


- The Parse route allows you convert data from a known format into Katsu.
- An authentication token is needed to Parse data

##Version

```
V1.0
```

##Formatters

```
.json
```
```
.tcsv
```
```
.csv
```

- The formatters apply to the version of Katsu output by the parser. We recomend using .json or .tcsv if you wish to upsert the data after parsing.


##Authentication Parameters

```
token=<your token>
```

##Base

```language-http
https://api.datashaka.com/v1/
```

##HTTP Methods

###POST
- Provide your token (always required) in the URL
- Provide your data as the post document with the ```content-type``` appropriate to the content e.g. ```application/json``` or ```application/xml```

## Actions

###Quandl

```language-http
/parse/quandl.tcsv
```

####Input Format expected

Json. 
Content-Type: ```application/json```

####Parameters

Url: ```token=<your token>```

Post Body: `quandl document in json`

###Sysomos

```language-http
/parse/sysomos.tcsv
```

####Input Format expected

Xml. 
Content-Type: ```application/json```

####Parameters

Url: 
    ```token=<your token>```
    ```name=<required parser name>``` see following list.
    optional ```dateoverride=<yyyy-MM-ddTHH:mm:ss.mmm>``` overrides any default dates (0001-01-01T00:00:00.000) with the given date. This is used when the data given is for 'at the point of query' rather than with a specified date.

Post Body: `sysomos document in xml`

####Available names

    - `map analytics` (url encoded `map+analytics`). This parses a sysomos map analytics query response. A date override is often needed with this parser.

    - `map search` (url encoded `map+search`). This parses a sysomos map serach query response.
    
    - `twitter profiles` (url encoded `twitter+profiles`). This parses a sysomos list of twitter profiles. A date override is always needed with this parser as the data is given related to the time of the sysomos query and not held in the response.
    
    - `map analytics twitter reach` (url encoded `map+analytics+twitter+reach`). This parses a sysomos twitter reach query response.A date override is always needed with this parser as the data is given related to the time of the sysomos query and not held in the response.
    
    - `map analytics twitter profiles` (url encoded `map+analytics+twitter+profiles`). This parses a sysomos twitter profiles list. A date override is always needed with this parser as the data is given related to the time of the sysomos query and not held in the response.

