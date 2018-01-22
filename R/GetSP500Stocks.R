#' Function to download the current components of the SP500 index from Wikipedia
#'
#' This function scrapes the stocks that constitute the SP500 index from the wikipedia page at https://en.wikipedia.org/wiki/List_of_S%26P_500_companies.
#'
#' @return A dataframe that includes a column with the list of tickers of companies that belong to the SP500 index
#' @export
#' @import rvest
#' @examples
#' \dontrun{
#' df.SP500 <- GetSP500Stocks()
#' print(df.SP500$tickers)
#' }
GetSP500Stocks <- function(){


  my.url <- 'https://en.wikipedia.org/wiki/List_of_S%26P_500_companies'

  read_html <- 0 # fix for global variable nagging from BUILD

  df.SP500Stocks <- my.url %>%
    read_html() %>%
    html_nodes(xpath='//*[@id="mw-content-text"]/div/table[1]') %>%
    html_table()

  df.SP500Stocks <- df.SP500Stocks[[1]]

  colnames(df.SP500Stocks) <- c('tickers','company','SEC.filings','GICS.Sector','GICS.Sub.Industry','Address','Date.first.added','CIK')

  return(df.SP500Stocks)
}
