#' Function to check is either a numeric or character variable is in the format of a valid UPRN, and not not contain any letters or punctuation. This function will faill if a numeric with a decimal followed by solely zeros is entered.
#'
#' @param string to be checked.
#' @return TRUE or FALSE.
#' @export
#' @examples
#' is_uprn(1)
#' is_uprn(999999999999)
#' is_uprn("1")
#' is_uprn("999999999999")

is_uprn <- function(uprns) {
  options(scipen = 999)
  results<-c()
  n_zeros<-0
  for(uprn in uprns){
    UPRN_num <- suppressWarnings(as.numeric(uprn))
    if (!is.na(UPRN_num)) {
      if (stringr::str_sub(UPRN_num, start = -4) == "0000") {
        n_zeros<-n_zeros+1
      }
      results<-c(results,
                 is.numeric(UPRN_num) &
                 nchar(UPRN_num) <= 12 &
                 nchar(UPRN_num) > 0 &
                 !grepl('[^[:alnum:]]', UPRN_num))
    } else { results<-c(results,FALSE) }
  }
  if(n_zeros==1){
    message("UPRN ends in '0000'. This may be caused by a conversion error involving excel and scientific notation.")
  }
  if(n_zeros>1){
    message(n_zeros, " UPRNs end in '0000'. This may be caused by a conversion error involving excel and scientific notation.")
  }
  return(results)
}

