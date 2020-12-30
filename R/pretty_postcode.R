#'Turn a string into the 'prettty' format of postcode 'XX(X)(X)YXXX' where Y is a specified seperator with a spacer as default in either upper or lower case
#'
#'@param Postcode string
#'@param sep string
#'@param uppercase logical
#'
#'@return A string
#'@export
#'@examples
#'pretty_postcode("SW1a2nP")
#'pretty_postcode("SW1a2nP", sep="")
#'pretty_postcode("SW1a2nP", sep=".")
#'pretty_postcode("SW1a2nP", sep=".", uppercase=FALSE)

pretty_postcode <- function(Postcode, sep = " ", uppercase = TRUE) {
  PC <- paste(stringr::str_sub(Postcode,
                               end = -4),
              stringr::str_sub(Postcode,
                               start = -3),
              sep = sep)
  postcode_characters<-nchar(gsub('[[:punct:] ]+','',Postcode))
  if(5 <= postcode_characters & postcode_characters <= 7){
    if (uppercase == TRUE) {
      return(toupper(PC))
    } else {
      return(tolower(PC))
    }
  } else {
    message(Postcode, " is not the correct length to be a postcode. Consider using is_postcode() to check this.")
    return(Postcode)
  }
}
