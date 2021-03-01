#' Return true or false if the object is integer64 type
#' @param x is an object
#'
#' @return boolean
#' @export
#' @examples
#' is_integer64(100)

is_integer64 <- function(x){
  class(x)=="integer64"
}
