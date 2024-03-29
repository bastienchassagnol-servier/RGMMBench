% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/mixture.R
\name{check_parameters_validity_univariate}
\alias{check_parameters_validity_univariate}
\alias{check_parameters_validity_multivariate}
\title{Check whether the estimation has been trapped in the boundary space}
\usage{
check_parameters_validity_univariate(theta, k = length(theta$p))

check_parameters_validity_multivariate(theta, k = length(theta$p))
}
\arguments{
\item{theta}{the set of parameters defining GMMs, with three inputs, namely p, mu and sigma}

\item{k}{the number of components, by default the number of proportions indicated in vector p}
}
\description{
\itemize{
\item Function \code{check_parameters_validity_univariate} asserts at each step of the EM algorithm that
it doesn't fall in a degenerate case (either the package performing the EM computation has failed, and returns an
error message, or the algorithm is trapped in the boundary space, leading to inconsistent division by zero).
\item Function \code{check_parameters_validity_multivariate} has the same functionality, but
is adjusted to multivariate parametrisation, and includes additionally a checking whether
the covariance matrix is positive definite or not
}
}
\seealso{
\code{\link[=logsumexp]{logsumexp()}}
}
