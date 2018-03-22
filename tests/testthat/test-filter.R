################################################################################

context("test-filter.R")

################################################################################

test_that("filter2 works for character vectors", {
  for (vars in list("1", c("1", "2"), rownames(iris), character(0))) {
    iris_sub <- filter2(iris, vars)
    expect_is(iris_sub, "data.frame")
    expect_equal(dim(iris_sub), c(length(vars), ncol(iris)))
    expect_equal(rownames(iris_sub), vars)
  }
})

################################################################################

test_that("filter2 works for integer vectors", {
  for (vars in list(1, 1:2, 1:5, integer(0))) {
    iris_sub <- filter2(iris, vars)
    expect_is(iris_sub, "data.frame")
    expect_equal(dim(iris_sub), c(length(vars), ncol(iris)))
    expect_equal(rownames(iris_sub), rownames(iris)[vars])
  }
})

################################################################################

test_that("filter2 works for logical vectors", {
  for (vars in list(rep_len(c(TRUE, FALSE), nrow(iris)), 
                    c(TRUE, rep(FALSE, nrow(iris) - 1)),
                    rep(TRUE, nrow(iris)), 
                    rep(FALSE, nrow(iris)))) {
    iris_sub <- filter2(iris, vars)
    expect_is(iris_sub, "data.frame")
    expect_equal(dim(iris_sub), c(sum(vars), ncol(iris)))
    expect_equal(rownames(iris_sub), rownames(iris)[vars])
  }
})

################################################################################
