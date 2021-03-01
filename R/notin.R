#' Shorthand for the opposite of in written in a more intuitive format. Returns true if the item is not in what it is being compared to, and false if it is in it.
#'
#' @param data any data type
#' @return logical
#' @export
#' @examples
#'2 %notin% c(1,3)
#'"b" %notin% c("a","c")

'%notin%' <-Negate(`%in%`)
