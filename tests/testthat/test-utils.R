test_that("entropy function", {
  expect_equal(compute_shannon_entropy(c(0.5, 0.5)), 1)
})

test_that("average_overlap", {
  # univariate multi component
  true_theta <- list(p = c(0.1, 0.7, 0.1, 0.1), mu = c(0, 4, 8, 12), sigma = rep(2, 4))
  expect_equal(compute_average_overlap(true_theta), 0.0148, tolerance = 10^-2)

  # bivariate two components
  true_theta <- list(
    p = c(0.9, 0.1), mu = matrix(c(0, 2, 2, 0), nrow = 2, ncol = 2),
    sigma = array(c(1, -0.8, -0.8, 1, 1, 0.8, 0.8, 1), dim = c(2, 2, 2))
  )
  expect_equal(compute_average_overlap(true_theta), 0.0165, tolerance = 10^-2)

  true_theta <- list(
    p = c(0.9, 0.1), mu = matrix(c(0, 2, 2, 0), nrow = 2, ncol = 2),
    sigma = array(c(1, 0.8, 0.8, 1, 1, -0.8, -0.8, 1), dim = c(2, 2, 2))
  )
  expect_equal(compute_average_overlap(true_theta), 0.0497, tolerance = 10^-2)
})


test_that("positive definitess", {
  cov_matrix <- matrix(c(1, 0.2, 0.2, 1), nrow = 2)
  expect_true(is_positive_definite(cov_matrix))
})


test_that("conversion from one format of covariance matrix to another", {
  array_matrix <- array(c(1, 0.2, 0.2, 1, 1, -0.2, -0.2, 1), dim = c(2, 2, 2))
  expect_equal(
    array_matrix %>% array_to_trig_mat() %>% trig_mat_to_array(),
    array_matrix
  )
})


test_that("Control output of the EM algorithm", {
  # multivariate context
  bad_format_multivariate_theta <- list(
    p = c(a = 0.4, b = 0.4),
    mu = matrix(c(40, 20, 20, 40), nrow = 2, dimnames = list(c("comp_1", "comp_2"))),
    sigma = array(c(1, -0.8, -0.8, 1, 1, 0.2, 0.2, 1),
      dim = c(2, 2, 2),
      dimnames = list("comp_1" = c("a", "b"), "comp_2" = c("a", "b"), "cluster" = c("k_1", "k_2"))
    )
  )

  good_format_multivariate_theta <- list(
    p = c(0.5, 0.5),
    mu = matrix(c(20, 40, 40, 20), nrow = 2),
    sigma = array(c(1, 0.2, 0.2, 1, 1, -0.8, -0.8, 1), dim = c(2, 2, 2))
  )
  expect_equal(
    good_format_multivariate_theta,
    bad_format_multivariate_theta %>% enforce_identifiability()
  )
  # univariate context

  bad_format_univariate_theta <- list(
    p = c(a = 0.4, b = 0.4),
    mu = c(50, 40), sigma = c(sigma_1 = 1, sigma_2 = 2)
  )

  good_format_univariate_data <- list(p = c(0.5, 0.5), mu = c(40, 50), sigma = c(2, 1))

  expect_equal(
    good_format_univariate_data,
    bad_format_univariate_theta %>% enforce_identifiability()
  )
})

test_that("Simplify theta output", {
  list_theta <- list(
    p = c(0.5, 0.5),
    mu = matrix(c(20, 40, 30, 40, 20, 50), nrow = 3),
    sigma = array(c(1, 0.2, 0.5, 0.2, 1, 0.8, 0.5, 0.8, 1, 1, -0.2, -0.5, -0.2, 3, -0.8, -0.5, -0.8, 5), dim = c(3, 3, 2))
  )
  expect_equal(format_theta_output(list_theta) %>% unformat_theta_output(), list_theta)
})
