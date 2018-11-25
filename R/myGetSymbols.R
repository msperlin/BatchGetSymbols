#' An improved version of function \code{\link[quantmod]{getSymbols}} from quantmod
#'
#' This is a helper function to \code{\link{BatchGetSymbols}} and it should normaly not be called directly. The purpose of this function is to download financial data based on a ticker and a time period.
#' The main difference from \code{\link[quantmod]{getSymbols}} is that it imports the data as a dataframe with proper named columns and saves data locally with the caching system.
#'
#' @param ticker A single ticker to download data
#' @param src The source of the data ('google' or'yahoo')
#' @inheritParams BatchGetSymbols
#'
#' @return A dataframe with the financial data
#'
#' @export
#' @seealso \link[quantmod]{getSymbols} for the base function
#'
#' @examples
#' ticker <- 'FB'
#'
#' first.date <- Sys.Date()-30
#' last.date <- Sys.Date()
#'
#' \dontrun{
#' df.ticker <- myGetSymbols(ticker,
#'                           first.date = first.date,
#'                           last.date = last.date)
#' }
myGetSymbols <- function(ticker,
                         src = 'yahoo',
                         first.date,
                         last.date,
                         do.cache = TRUE,
                         cache.folder = file.path(tempdir(),'BGS_Cache')){


  # do cache
  if ( (do.cache)) {

    # check if data is in cache files
    my.cache.files <- list.files(cache.folder, full.names = TRUE)

    if (length(my.cache.files) > 0)  {
      l.out <- stringr::str_split(tools::file_path_sans_ext(basename(my.cache.files)),
                                  '_')

      df.cache.files <- dplyr::data_frame(f.name = my.cache.files,
                                          ticker = sapply(l.out, function(x) x[1]),
                                          src =  sapply(l.out, function(x) x[2]),
                                          first.date =  as.Date(sapply(l.out, function(x) x[3])),
                                          last.date =  as.Date(sapply(l.out, function(x) x[4])))

    } else {
      # empty df
      df.cache.files <-  dplyr::data_frame(f.name = '',
                                           ticker = '',
                                           src =  '',
                                           first.date =  first.date,
                                           last.date =  last.date)

    }

    # check dates
    fixed.ticker <-fix.ticker.name(ticker)

    temp.cache <- dplyr::filter(df.cache.files,
                                ticker == fixed.ticker,
                                src == src)

    if (nrow(temp.cache) > 1) {
      stop(paste0('Found more than one file in cache for ', ticker,
                  '\nYou must manually remove one of \n\n', paste0(temp.cache$f.name, collapse = '\n')))
    }

    if (nrow(temp.cache) != 0) {

      df.cache <- data.frame()
      flag.dates <- TRUE


      cat(' | Found cache file')
      df.cache <- readRDS(temp.cache$f.name)

      # check if data matches

      max.diff.dates <- 0
      flag.dates <- ((first.date -  temp.cache$first.date) < - max.diff.dates )|
        ((last.date -  temp.cache$last.date) > max.diff.dates)

      df.out <- data.frame()
      if (flag.dates) {

        cat(' | Need new data')

        flag.date.bef <- ((first.date -  temp.cache$first.date) < - max.diff.dates )
        df.out.bef <- data.frame()
        if (flag.date.bef) {
          df.out.bef <- get.clean.data(ticker,
                                       src,
                                       first.date,
                                       temp.cache$first.date)
        }

        flag.date.aft <- ((last.date -  temp.cache$last.date) > max.diff.dates)
        df.out.aft <- data.frame()
        if (flag.date.aft) {
          df.out.aft <- get.clean.data(ticker,
                                       src,
                                       temp.cache$last.date,
                                       last.date)
        }

        df.out <- rbind(df.out.bef, df.out.aft)
      }

      # merge with cache
      df.out <- unique(rbind(df.cache, df.out))

      # sort it
      if (nrow(df.out) > 0 ) {
        idx <- order(df.out$ticker, df.out$ref.date)
        df.out <- df.out[idx, ]
      }


      # remove old file
      file.remove(temp.cache$f.name)

      my.f.out <- paste0(fixed.ticker, '_',
                         src, '_',
                         min(c(temp.cache$first.date, first.date)), '_',
                         max(c(temp.cache$last.date, last.date)), '.rds')

      saveRDS(df.out, file = file.path(cache.folder, my.f.out))

      # filter for dates
      ref.date <- NULL
      df.out <- dplyr::filter(df.out, ref.date >= first.date,
                              ref.date <= last.date)

    } else {
      cat(' | Not Cached')

      my.f.out <- paste0(fixed.ticker, '_',
                         src, '_',
                         first.date, '_',
                         last.date, '.rds')

      df.out <- get.clean.data(ticker,
                               src,
                               first.date,
                               last.date)

      # only saves if there is data
      if (nrow(df.out) > 1) {
        saveRDS(df.out, file = file.path(cache.folder, my.f.out))
      }
    }

  } else {
    df.out <- get.clean.data(ticker,
                             src,
                             first.date,
                             last.date)
  }

  return(df.out)


}
