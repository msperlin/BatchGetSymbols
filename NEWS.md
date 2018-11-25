## Version 2.3  (2018-11-25)

- User can now choose to return a full balanced price dataset by filling NA values or volume == 0 for their closest prices.
- Fixed small bug in cache system when an empty dataframe is returned
- Fixed bug in function that downloadd ibovespa's composition

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
