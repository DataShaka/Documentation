
#Upsert route

- The Upsert route allows you to insert new data and/or update existing data in an given groupspace for a speficic authentication token.
- The data upserted is readily available for [query](retrieve.md) or [discovery](discovery.md)..
- The data can be either formatted as TCSV (i.e. .tcsv)  or JTCSV (i.e. .json)
- After the upsert is completed , a JSON formatted response is returned with 
  - ```IsSuccess``` : `true` or `false`
  - ```Warning``` : typically, when the data document is empty
  - ```Error``` : Upsert didnt complete and the data is not in live

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

##Authentication Parameters

```
token=<your token>
```

```
groupspace=<your groupspace>
```

##Base

```language-http
https://api.datashaka.com/v1/
```

##HTTP Methods

###POST
- Provide your groupspace (as required) and token (always required) in the URL
- Provide your data as the post document 
  - in JTCSV with the ```context-type``` ```application/json```
  - in TCSV with  the ```context-type``` ```text/plain```

**Example using JTCSV**

```https://api.datashaka.com/v1/upsert.json?token=<your token>&groupspace=<your groupspace>```

```language-json
[
  {
    "time": "2015-01-01T00:00:00.000",
    "context": {
      "Brand": "X",
      "Country": "UK"
    },
    "signal": "Sales",
    "value": 100
  },
  {
    "time": "2015-02-01T00:00:00.000",
    "context": {
     "Brand": "X",
      "Country": "UK"
    },
    "signal": "Sales",
    "value": 110
  }
]
```

**Example using TCSV**

```https://api.datashaka.com/v1/upsert.tcsv?token=<your token>&groupspace=<your groupspace>```

```language-katsu
2015-01-01T00:00:00.000[Brand:X][Country:UK]{Sales:100}
2015-02-01T00:00:00.000[Brand:X][Country:UK]{Sales:110}
```
