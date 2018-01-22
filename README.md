## Motivation

One of the great things of working in finance is that financial datasets from capital markets are freely available from sources such as Google and Yahoo Finance. This is an excelent feature for building up to date content for classes and conducting academic research. 

In the past I have used function GetSymbols from the CRAN package [quantmod](https://cran.r-project.org/package=quantmod) in order to download end of day trade data for several stocks in the financial market. The problem in using GetSymbols is that it does not aggregate or clean the financial data for several tickers. In the usage of GetSymbols, each stock will have its own `xts` object with different column names and this makes it harder to store data from several tickers in a single dataframe. 

Package BatchGetSymbols is my solution to this problem. Based on a list of tickers and a time period, the function will download the data by automatically choosing the correct source, yahoo or google, and output two dataframes: a single dataframe with all the information for the stocks in the list and a dataframe with a report of the download process. User can also set a benchmark ticker in order to compare dates and eliminate assets with a low number of observations from the resulting dataframe.

## Main features:


- Organizes price data in a tabular format
- Also returns the vector of returns from prices
- A clever cache system was implemented in version 2.0, meaning that the data is saved locally and only missings portion of the data are downloaded, when needed. 
- Includes function for changing long format to wide


## Installation

```
# CRAN
install.packages('BatchGetSymbols')

# Github
devtools::install_github('msperlin/BatchGetSymbols')
```

## A simple example

See [vignette](https://cran.r-project.org/package=BatchGetSymbols)
