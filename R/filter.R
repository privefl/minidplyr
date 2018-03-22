#' Select observations
#' 
#' Select observations from a data frame.
#'
#' @inheritParams select2
#'
#' @return A data frame with selected observations only.
#' @export
#'
#' @examples
#' filter2(iris, 1)
#' filter2(iris, 1:5)
#' filter2(iris, rep_len(c(FALSE, TRUE), nrow(iris)))
filter2 <- function(x, ind) {
  x[ind, ]
}