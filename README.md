## Motivation

One of the great things of working in finance is that financial datasets from capital markets are freely available from sources such as Yahoo Finance. This is an excelent feature for building up to date content for classes and conducting academic research. 

In the past I have used function GetSymbols from the CRAN package [quantmod](https://cran.r-project.org/package=quantmod) in order to download end of day trade data for several stocks in the financial market. The problem in using GetSymbols is that it does not aggregate or clean the financial data for several tickers. In the usage of GetSymbols, each stock will have its own `xts` object with different column names and this makes it harder to store data from several tickers in a single dataframe. 

Package BatchGetSymbols is my solution to this problem. Based on a list of tickers and a time period, BatchGetSymbols will download price data from yahoo finance and organize it so that you don't need to worry about cleaning it yourself. 

## Main features:

- Organizes data in a tabular format, returning prices and returns
- A cache system was implemented in version 2.0, meaning that the data is saved locally and only missings portions of the data are downloaded, if needed. 
- All dates are compared to a benchmark ticker such as SP500. You can choose to ignore ticker with a high number of missing dates.
- User can choose a complete/balanced dataset output. The package uses a benchmark ticker for date comparison (e.g. SP500 - ^GSPC). Days with missing prices and traded volume equal to zero are found and prices are either set to NA or replaced by closest available value.
- Allows the choice for the wide format, with tickers as columns
- Users can choose the frequency of the resulting dataset (daily, weekly, monthly, yearly)


## Installation

```
# CRAN (official release)
install.packages('BatchGetSymbols')

# Github (dev version)
devtools::install_github('msperlin/BatchGetSymbols')
```

## A simple example

See [vignette](https://cran.r-project.org/package=BatchGetSymbols)
