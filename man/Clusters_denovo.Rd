% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/Clusters_denovo.R
\name{Clusters_denovo}
\alias{Clusters_denovo}
\title{Assign new observations to the clusters inside a MOBSTER fit.}
\usage{
Clusters_denovo(x, y)
}
\arguments{
\item{x}{A MOBSTER fit.}

\item{y}{A MOBSTER input dataset, which has to have a VAF numeric column without NAs.}
}
\value{
The data in \code{y} is augmented with a colum per mixture component reporting
the corresponding density value. A final colum `cluster` is also added reporting the
component name for the hard clustering assignment of the point.
}
\description{
For a new set of observations in the MOBSTER input format,
the parameters and clusters of a MOBSTER fit are used to determine the
assignments of the new points. MOBSTER density function is used to determine
which cluster has the highest density for each observation, and the cluster
label is computed accordingly.
}
\examples{
library(ggplot2)
data('fit_example', package = 'mobster')

# Generate some randome numbers and assign them to the most likely mixture component
new_assignments = Clusters_denovo(fit_example$best, data.frame(VAF = runif(1000))) 
print(new_assignments)

# Plot a histogram coloured according to the clusters
ggplot(new_assignments, aes(VAF, fill = cluster)) + geom_histogram(binwidth = 0.01)
}
