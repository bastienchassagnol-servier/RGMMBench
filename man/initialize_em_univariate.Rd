% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/mixture.R
\name{initialize_em_univariate}
\alias{initialize_em_univariate}
\alias{initialize_em_multivariate}
\title{Return initial estimates to the EM algorithm for GMM estimation}
\usage{
initialize_em_univariate(
  x = NULL,
  k = 2,
  nstart = 10L,
  short_iter = 200,
  short_eps = 10^-2,
  prior_prob = 0.05,
  initialisation_algorithm = c("kmeans", "quantiles", "random", "hc", "small em",
    "rebmix"),
  ...
)

initialize_em_multivariate(
  x,
  k = 2,
  nstart = 10L,
  short_iter = 200,
  short_eps = 10^-2,
  prior_prob = 0.05,
  initialisation_algorithm = c("kmeans", "random", "hc", "small em", "rebmix"),
  ...
)
}
\arguments{
\item{x}{the vector of the observations}

\item{k}{the number of components}

\item{nstart}{the number of random restarts with kmeans, random and small EM method}

\item{short_iter, short_eps}{hyperparameters of the small EM method}

\item{prior_prob}{minimal uncertainty added to the minor components of each observation assigned by hierarchical clustering}

\item{initialisation_algorithm}{the choice of the initialisation method, between kmeans, quantiles, random, hc, small em and rebmix method}

\item{...}{additional hyperparameters supplied with some of the initialisation methods}
}
\value{
a list of the estimated parameters, ordered by increasing mean for identifiability issues
}
\description{
One of the main drawback of the EM algorithm is that it requires initial guess as starting point.
And so, careful initialisation, depending on the properties of the mixture, is required:
\itemize{
\item \code{initialize_em_univariate} returns the initial estimates in the univariate dimension.
\item \code{initialize_em_multivariate}returns the initial estimates in a multivariate context. It's worth noting
that \emph{quantiles} initialisation method is not available in the multivariate context, as
no unique set of parametrisation could be returned.
}
}
\author{
Bastien CHASSAGNOL
}
