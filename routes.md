#Routes

###Available routes

| Route | Description | Implementation |
|--------|--------|--------|
|  **Discovery**     | Discovery routes allow you to explore Katsu data        | [Documentation](routes/discovery.md) |
|  **Retrieval**     | Goal orientated queries for Katsu data        | [Documentation](routes/retrieve.md) |
|  **Exploration**     | Explore Katsu Data       | Out of scope |
|  **Orchestration**     | Orchestrate Katsu data       | Out of scope |


###Naming conventions

####Parameters
Parameters will be presented in a table in the following way :

| Name | Type |Connected |Description |Availability |
|--------|--------|--------|--------|--------|
| The parameter Name       |The Expected Data Type        |Returns limited to include elements only connected to Katsu points. This will show ‘true’ or ‘false’ This is not applicable for parameters that limit a return. ‘N/A’ will be used in this case |A more detailed description of the parameter |Notes on the availability of a parameter. This may be ‘deprecated’ meaning it is no longer available in any version or a list of versions that support this parameter. |


####Common terms

For a rest call all values will be passed as a string. Each type will specify how that string should be formed. Commonly used terms are explained below :

##### ISO8601
A string representation of a DateTime conforming to the ISO8601 specification.

**Availbility** : APIV0.2

#####Boolean
`True` or `False`

**Availbility** : APIV0.2

#####Context list
```language-katsu
[ContextType:Context][Ct2:C2]..[Ctn:Cn]
```

- Ct and C are regular expressions to match the Context Type and Context Name.
- Ct and C can be replaced with functions such as [soundex(string)] with the name of the function followed by () taking precedence to a context part match.
- Including duplicate Ct references will result in an OR match. For example [City:London][City:York] will return London OR York matches.

**Availbility** : APIV0.2

- RegEx not yet implemented
- Functions not yet implemented
- **Or** Match APIV0.2


#####Signal list
```language-katsu
{Signal A}{Signal B}{Signal Z}
```

- Given signal matches are regular expression to match signal names
- Matches can be replaced with functions such as {soundex(string)} with the name for the function followed by () taking precedence to a signal match

**Availbility** :
APIV0.2 uses CSV not TCSV2.0 Syntax
- RegEx not yet implemented
- Functions not yet implemented

#####Number
E.g. `0.0`, `10000`

**Not yet implemented**


