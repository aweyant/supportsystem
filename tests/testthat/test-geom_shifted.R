test_that("Manually-created shifted geometric distribution gives expected values; test1", {
  prob = 0.3
  expect_equal(dgeom_shifted(x = 1, prob = prob), dgeom(x = 0, prob = prob))
})

test_that("Manually-created shifted geometric distribution gives expected values; test1", {
  prob = 0.7
  expect_equal(dgeom_shifted(x = 2, prob = prob), dgeom(x = 1, prob = prob))
})
