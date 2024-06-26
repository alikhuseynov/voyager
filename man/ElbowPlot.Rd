% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/plot-non-spatial.R
\name{ElbowPlot}
\alias{ElbowPlot}
\title{Plot the elbow plot or scree plot for PCA}
\usage{
ElbowPlot(
  sce,
  ndims = 20,
  nfnega = 0,
  reduction = "PCA",
  sample_id = "all",
  facet = FALSE,
  ncol = NULL
)
}
\arguments{
\item{sce}{A \code{SingleCellExperiment} object, or anything that inherits
from \code{SingleCellExperiment}.}

\item{ndims}{Number of components with positive eigenvalues, such as PCs in
non-spatial PCA.}

\item{nfnega}{Number of nega eigenvalues and their eigenvectors to compute.
These indicate negative spatial autocorrelation.}

\item{reduction}{Name of the dimension reduction to use. It must have an
attribute called either "percentVar" or "eig" for eigenvalues. Defaults to
"PCA".}

\item{sample_id}{Sample(s) in the SFE object whose cells/spots to use. Can be
"all" to compute metric for all samples; the metric is computed separately
for each sample.}

\item{facet}{Logical, whether to facet by samples when multiple samples are
present. This is relevant when spatial PCA is run separately for each
sample, which gives different results from running jointly for all samples.}

\item{ncol}{Number of columns of facets if facetting.}
}
\value{
A ggplot object. The y axis is eigenvalues or percentage of variance
  explained if relevant.
}
\description{
Apparently, there is no apparent way to plot the PC elbow plot other than
extracting the variance explained attribute of the dimred slot, because even
the OSCA book makes the elbow plot this way, which I find kind of cumbersome
compared to Seurat. So I'm writing this function to make the elbow plot with
SCE less cumbersome.
}
\examples{
library(SFEData)
library(scater)
sfe <- McKellarMuscleData("small")
sfe <- runPCA(sfe, ncomponents = 10, exprs_values = "counts")
ElbowPlot(sfe, ndims = 10)
}
