#' Function to check if a string is a valid postcode regardless of it's formatting. With or without a space is permitted.
#'
#' @param Postcode string
#' @return Logical
#' @export
#' @examples
#'is_postcode("SW1a2nP")
#'is_postcode("SW1a 2nP")


is_postcode<-function(Postcode){
  return(grepl("^[Gg][Ii][Rr] 0[Aa]{2})|((([A-Za-z][0-9]{1,2})|(([A-Za-z][A-Ha-hJ-Yj-y][0-9]{1,2})|(([A-Za-z][0-9][A-Za-z])|([A-Za-z][A-Ha-hJ-Yj-y][0-9]?[A-Za-z])))) {0,1}[0-9][A-Za-z]{2})$", Postcode))
}
