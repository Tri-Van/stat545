#' Square a number or vector/list of numbers
#'
#' @param x a number of a numeric vector/list to be squared
#'
#' @return the square of x
#' @export
#'
#' @examples
#' square(10) # should be 100
#' square(c(2,4)) # should be c(4,16)
#' square(as.list(c(2,4))) # should be c(4,16)
square <-function(x) {
  purrr::map_dbl(x, function(y) y^2)
}

