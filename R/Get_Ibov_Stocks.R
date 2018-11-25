#' Function to download the current components of the Ibovespa index from Bovespa website
#'
#' This function scrapes the stocks that constitute tSP500 index from the wikipedia page at http://bvmf.bmfbovespa.com.br/indices/ResumoCarteiraTeorica.aspx?Indice=IBOV&idioma=pt-br.
#'
#' @param max.tries Maximum number of attempts to download the data
#' @return A dataframe that includes a column with the list of tickers of companies that belong to the Ibovespa index
#' @export
#' @examples
#' \dontrun{
#' df.ibov <- GetIbovStocks()
#' print(df.ibov$tickers)
#' }
GetIbovStocks <- function(max.tries  = 10){

  # get list of ibovespa's tickers from wbsite

  for (i.try in seq(max.tries)) {
    myUrl <- 'http://bvmf.bmfbovespa.com.br/indices/ResumoCarteiraTeorica.aspx?Indice=IBOV&idioma=pt-br'
    #df.ibov.comp <- XML::readHTMLTable(myUrl)[[1]]
    df.ibov.comp <- as.data.frame(XML::readHTMLTable(myUrl))

    Sys.sleep(0.5)

    if (nrow(df.ibov.comp) > 0) break()

  }

  names(df.ibov.comp) <- c('tickers', 'ticker.desc', 'type.stock', 'quantity', 'percentage.participation')

  df.ibov.comp$quantity <- as.numeric(stringr::str_replace_all(df.ibov.comp$quantity,
                                                               stringr::fixed('.'), ''))
  df.ibov.comp$percentage.participation <- as.numeric(stringr::str_replace_all(df.ibov.comp$percentage.participation,
                                                                               stringr::fixed(','), '.'))

  df.ibov.comp$ref.date <- Sys.Date()
  df.ibov.comp$tickers <- as.character(df.ibov.comp$tickers)

  return(df.ibov.comp)
}

