#' Select variables
#' 
#' Select variables from a data frame
#'
#' @param x A data frame.
#' @param vars Either
#' - a character vector of variable names
#' - an integer vector of variable positions
#' - a boolean vector of variables to keep
#'
#' @return A data frame with only the selected variables.
#' @export
#'
#' @examples
#' select2(iris, c("Sepal.Length", "Sepal.Width"))
#' select2(iris, 1:4)
#' select2(iris, c(TRUE, FALSE, TRUE, FALSE, TRUE))
select2 <- function(x, vars) {
  x[vars]
}