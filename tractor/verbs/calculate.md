# Calculate

## Definition

The  **calculate** verb performs a mathematical operation on the data contained in a [Data package](../datapackages.md) 

With the **calculate** verb,  a user can easily compute a variety of calculations (e.g. ratios, products, correlation factor, etc) by just typing a formula. 

### What Is A Formula?

Tractor uses the [NCalc library](https://ncalc.codeplex.com/) as a mathematical expressions evaluator. Common signs such as
- `+`, `-`, `/`, `*`
- `sin`, `cos`, `tan`, `exp`,`log`
are supported along with all of [these](https://ncalc.codeplex.com/wikipage?title=functions&referringTitle=Home)

For instance, to calculate the ratio between Tax and Gross in a given dataset, simply write:

```language-tractor
	~> calculate '{Tax:}/{Gross:}' returns {Tax Ratio}
```

### Using Keywords

[**Keywords**](readme.md#keywords) are most useful right after a calculation, as you probably want to do something with the new signal that you have calculated. For example 

- `returns {Tax Ratio}` will give you a new signal entitled Tax Ratio, will all of the calculated values across the group package. Note that `returns` causes Tractor to **only** return the calculated result.
- `includes {Tax Ratio}` goes even further and includes a new signal in the group package called Tax Ratio. This is then saved for future use


## Syntax
```language-tractor
	~> calculate 'FORMULA' includes chopstick ~>
    ~> calculate 'FORMULA' returns chopstick ~>
```
Refers to the [Chopstick](../chopsticks.md) page to understand how to build them.

## Examples Using Calculate

### Example 1: Using Returns With No Missing Data

Take the following data set:

```language-katsu
2014-01-01[Company:Google][Country:UK]{Net:19}{Tax:1}{Gross:20}
2014-01-01[Company:Microsoft][Country:France]{Net:6}{Tax:3}{Gross:9}
2014-02-01[Company:Google][Country:France][City:Paris]{Before Tax:10}{Tax:1}{After Tax:12}{Gross:2}
```

This script calculates the ratio between Tax and Gross and returns data for a new signal called Tax Ratio:
```language-tractor
	~> calculate '{Tax:}/{Gross:}' returns {Tax Ratio}
```

resulting in

```language-katsu
2014-01-01[Brand:Google][Country:UK]{Tax Ratio:0.05}
2014-01-01[Brand:Microsoft][Country:France]{Tax Ratio:0.333333333}
2014-02-01[Company:Google][Country:France][City:Paris]{Tax Ratio:0.5}
```

`returns` causes Tractor to only return the calculated result.

### Example 2: Using Returns With Missing Data

Take the following data set:

```language-katsu
2014-01-01[Company:Google][Country:UK]{Net:19}{Tax:1}{Gross:20}
2014-01-01[Company:Microsoft][Country:France]{Net:6}{Tax:3}{Gross:9}
2014-02-01[Company:Google][Country:France][City:Paris]{Before Tax:10}{Tax:1}{After Tax:12}
```

This script calculates the ratio between Tax and Gross and returns data for a new signal called Tax Ratio:

```language-tractor
	~> calculate '{Tax:}/{Gross:}' returns {Tax Ratio}
```

This will return an **error** as it is not possible to complete the calculation if there is missing data (No Gross Signal/Value in the third Katsu datapoint).

### Example 3: Using Includes With No Missing Data

Take the following data set:

```language-katsu
2014-01-01[Company:Google][Country:UK]{Net:19}{Tax:1}{Gross:20}
2014-01-01[Company:Microsoft][Country:France]{Net:6}{Tax:3}{Gross:9}
2014-02-01[Company:Google][Country:France][City:Paris]{Before Tax:10}{Tax:1}{After Tax:12}{Gross:2}
```

This script calculates the ratio between Tax and Gross and includes data for a new signal called Tax Ratio within the dataset:

```language-tractor
	~> calculate '{Tax:}/{Gross:}' includes {Tax Ratio}
```

resulting in

```language-katsu
2014-01-01[Brand:Google][Country:UK]{Net:19}{Tax:1}{Gross:20}{Tax Ratio:0.05}
2014-01-01[Brand:Microsoft][Country:France]{Net:6}{Tax:3}{Gross:9}{Tax Ratio:0.333333333}
2014-02-01[Company:Google][Country:France][City:Paris]{Before Tax:10}{Tax:1}{After Tax:12}{Gross:2}{Tax Ratio:0.5}
```

>Note that the different here between `returns` and `includes` is that all of the original signals are kept for `includes` and not for `returns`.

### Example 4: Using Includes With Missing Data

Take the following data set:

```language-katsu
2014-01-01[Company:Google][Country:UK]{Net:19}{Tax:1}{Gross:20}
2014-01-01[Company:Microsoft][Country:France]{Net:6}{Tax:3}{Gross:9}
2014-02-01[Company:Google][Country:France][City:Paris]{Before Tax:10}{Tax:1}{After Tax:12}
```

This script calculates the ratio between Tax and Gross and returns data for a new signal called Tax Ratio:

```language-tractor
	~> calculate '{Tax:}/{Gross:}' inlcudes {Tax Ratio}
```

resulting in

```language-katsu
2014-01-01[Brand:Google][Country:UK]{Tax Ratio:0.05}
2014-01-01[Brand:Microsoft][Country:France]{Tax Ratio:0.333333333}
2014-02-01[Company:Google][Country:France][City:Paris]{Before Tax:10}{Tax:1}{After Tax:12}
```

`includes` causes Tractor to only return the calculated result for when there is data. When there is not sufficient data to complete the calculation, Tractor just returns the original data. In this case, the third Katsu datapoint is missing the signal/value for Gross so it has been impossible to complete the calculation.
