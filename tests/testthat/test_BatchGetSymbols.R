library(testthat)
library(BatchGetSymbols)

test_that(desc = 'Test of read function',{

  first.date <- Sys.Date() - 30
  last.date <- Sys.Date()

  my.tickers <- c('MMM')

  l.out <- BatchGetSymbols(tickers = my.tickers,
                           first.date = first.date,
                           last.date = last.date)

  expect_true(nrow(l.out$df.tickers) > 0)
} )


