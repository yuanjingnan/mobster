% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/plot_boostrap_coclustering.R
\name{plot_bootstrap_coclustering}
\alias{plot_bootstrap_coclustering}
\title{Plot the boostrapped co-clustering probability.}
\usage{
plot_bootstrap_coclustering(
  x,
  bootstrap_results,
  bootstrap_statistics,
  colors = c(Tail = "gainsboro")
)
}
\arguments{
\item{x}{A MOBSTER fit.}

\item{bootstrap_results}{Results of a call to \code{mobster_boostrap}.}

\item{colors}{If provided, these colours will be used for each cluster.
If a subset of colours is provided, palette Set1 from \code{RColorBrewer} is used.
By default the tail colour is provided as 'gainsboro'.}

\item{bootstrap_statisticsResults}{of a call to \code{bootstrapped_statistics}.}
}
\value{
A \code{cowplot} figure of the bootstrapped co-clustering probability.
}
\description{
From the results of a call to \code{mobster_boostrap}, and
the results of a call to \code{bootstrapped_statistics}, a figure (heatmap-style)
for the boostrapped co-clustering probability is produced assembling plots 
with \code{cowplot::plot_grid}.
}
\examples{
# Random small dataset
dataset = random_dataset(N = 200, seed = 123, Beta_variance_scaling = 100)
x = mobster_fit(dataset$data, auto_setup = 'FAST')

# Just 5 resamples of a nonparametric bootstrap run, disabling the parallel engine
options(easypar.parallel = FALSE)
boot_results = mobster_bootstrap(x$best, n.resamples = 5, auto_setup = 'FAST')

boot_stats = bootstrapped_statistics(x$best, boot_results)
plot_bootstrap_coclustering(x$best, boot_results, boot_stats)
}
