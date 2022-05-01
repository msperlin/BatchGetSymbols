## Version 2.6.4 (2022-05-01)

- improved deprecation message using lifecycle
- added message for do_paralell = TRUE (YF added api calls limits) (see issue [27](https://github.com/msperlin/BatchGetSymbols/issues/27))
- improved tests

## Version 2.6.3 (2022-03-30)

- Added deprecation message

## Version 2.6.2 (2022-03-08)

- Added message for ibov composition

## Version 2.6.1 (2020-11-27)

- Fixed issue [issue 21](https://github.com/msperlin/BatchGetSymbols/issues/21), which only happened in Windows. 
- changed default cache dir for ticker grabbing function

## Version 2.6 (2020-11-22)

- The cache system is now session-persistent with `cache.dir = file.path(tempdir(), 'BGS_Cache')`. This solves the problem with mismatching price series from cached data between splits or dividends. A new warning is set whenever the user uses cache.dir different from temp.dir()
- removed dplyr grouping message

## Version 2.5.9 (2020-11-17)

- removed rownames from output ([issue 18](https://github.com/msperlin/BatchGetSymbols/issues/18))
- Made sure that, on "weekly" mode, the first day of week is a monday ([issue 19](https://github.com/msperlin/BatchGetSymbols/issues/19))
- Added input how.to.aggregate that will allow the user to aggregate de data by the last or first prices of intervals ([issue 19](https://github.com/msperlin/BatchGetSymbols/issues/19))

## Version 2.5.8 (2020-05-08)

- Fixed bug in NA price

## Version 2.5.7 (2020-04-21)

- Fixed bug in sp500 fct
- Fixed bug with repeated rows of data ([git issue 16](https://github.com/msperlin/BatchGetSymbols/issues/16))

## Version 2.5.6 (2020-02-25)

- Improved startup message for 2020 book (link to online version)

## Version 2.5.5 (2019-02-17)

- Fixed bug in cleaning function
- Added startup message for 2020 book

## Version 2.5.4  (2019-10-12)

- Fixed small bug in vignette

## Version 2.5.3  (2019-07-05)

- Added option for keeping function quiet (be.quiet)
- Once again fixed function for grabbing stocks from the SP500 index

## Version 2.5.2  (2019-04-24)

- Fixed bug in stock index grabbing functions       

## Version 2.5.1  (2019-04-13)

- New function for FTSE100 Stocks (thanks samprohaska)

## Version 2.5  (2019-04-13)

- Implemented option for parallel computations with BatchGetSymbols
- Added caching system for index grabing functions (SP500 and IBOV)

## Version 2.4  (2019-03-23)

- Fixed bug in function that downloads SP500 data. 

## Version 2.3  (2018-11-25)

- User can now choose to return a full balanced price dataset by filling NA values or volume == 0 for their closest prices.
- Fixed small bug in cache system when an empty dataframe is returned
- Fixed bug in function that downloads ibovespa's composition

## Version 2.2  (2018-10-10)

- Users can now set frequency of data (daily, weekly, monthly or yearly)

## Version 2.1  (2018-05-08)

Small update:

- added startup message with book link

## Version 2.0  (2018-01-22)

Major update:

- New fct GetIBovStocks for downloading current composition of Ibovespa
- New fct for changing to wide format
- Now the output includes returns and not only prices
- removed annoying startup message
- implemented clever caching system for financial data
- simplified input dates (no need for Date class any more)


## Version 1.2  (2017-06-26)

- Fixed issue with GetSP500(). The wikipedia page changed its code.. 

## Version 1.1  (2016-12-05)

- Fixed CRAN NOTE (stats not used in imports)
- Fixed typos and improved vignette
- Couple of fixes in documentation
- Added citation message on startup

## Version 1.0  (2016-11-06)

- First commit
