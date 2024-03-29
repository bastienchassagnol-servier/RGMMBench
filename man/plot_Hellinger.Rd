% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/visualisation.R
\name{plot_Hellinger}
\alias{plot_Hellinger}
\title{Plot boxplot of the Hellinger distances per component}
\usage{
plot_Hellinger(
  distribution_parameters,
  true_theta,
  num_col = length(true_theta$p)
)
}
\arguments{
\item{distribution_parameters}{the estimated bootstrap distributions}

\item{true_theta}{the true values of the parameters (with p, mu and sigma)}

\item{num_col}{How to organise the facets? by default according to the number of components}
}
\value{
a ggplot object representing for each configuration of parameter, in each panel the
Hellinger distance for each package and initialisation method, respectively to each component
}
\description{
Plot boxplot of the Hellinger distances per component
}
\author{
Bastien CHASSAGNOL
}
