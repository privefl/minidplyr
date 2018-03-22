################################################################################

context("test-select.R")

################################################################################

test_that("select2 works for character vectors", {
  for (vars in list("Species", c("Sepal.Length", "Species"), 
                    names(iris), character(0))) {
    iris_sub <- select2(iris, vars)
    expect_is(iris_sub, "data.frame")
    expect_equal(dim(iris_sub), c(nrow(iris), length(vars)))
    expect_equal(names(iris_sub), vars)
    expect_equal(iris_sub, dplyr::select(iris, vars))
  }
})

################################################################################

test_that("select2 works for integer vectors", {
  for (vars in list(1, 1:2, 1:5, integer(0))) {
    iris_sub <- select2(iris, vars)
    expect_is(iris_sub, "data.frame")
    expect_equal(dim(iris_sub), c(nrow(iris), length(vars)))
    expect_equal(names(iris_sub), names(iris)[vars])
    expect_equal(iris_sub, dplyr::select(iris, vars))
  }
})

################################################################################

test_that("select2 works for logical vectors", {
  for (vars in list(c(TRUE, FALSE, TRUE, FALSE, TRUE), 
                    c(TRUE, FALSE, FALSE, FALSE, FALSE),
                    rep(TRUE, 5), rep(FALSE, 5))) {
    iris_sub <- select2(iris, vars)
    expect_is(iris_sub, "data.frame")
    expect_equal(dim(iris_sub), c(nrow(iris), sum(vars)))
    expect_equal(names(iris_sub), names(iris)[vars])
    expect_equal(iris_sub, dplyr::select_if(iris, vars))
  }
})

################################################################################
