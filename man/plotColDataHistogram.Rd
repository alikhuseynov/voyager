% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/plot-non-spatial.R
\name{plotColDataHistogram}
\alias{plotColDataHistogram}
\alias{plotRowDataHistogram}
\title{Plot histograms for colData and rowData columns}
\usage{
plotColDataHistogram(
  sce,
  feature,
  fill_by = NULL,
  facet_by = NULL,
  subset = NULL,
  bins = 100,
  binwidth = NULL,
  scales = "free",
  ncol = 1,
  position = "stack",
  ...
)

plotRowDataHistogram(
  sce,
  feature,
  fill_by = NULL,
  facet_by = NULL,
  subset = NULL,
  bins = 100,
  binwidth = NULL,
  scales = "free",
  ncol = 1,
  position = "stack",
  ...
)
}
\arguments{
\item{sce}{A \code{SingleCellExperiment} object.}

\item{feature}{Names of columns in \code{colData} or \code{rowData} to plot.
When multiple features are specified, they will be plotted in separate
facets.}

\item{fill_by}{Name of a categorical column in \code{colData} or
\code{rowData} to fill the histogram.}

\item{facet_by}{Column in \code{colData} or \code{rowData} to facet with.
When multiple features are plotted, the features will be in different
facets. In this case, setting \code{facet_by} will call
\code{\link{facet_grid}} so the features are in rows and categories in
\code{facet_by} will be in columns.}

\item{subset}{Name of a logical column to only plot a subset of the data.}

\item{bins}{Numeric vector giving number of bins in both vertical and
horizontal directions. Set to 100 by default.}

\item{binwidth}{The width of the bins. Can be specified as a numeric value
or as a function that calculates width from unscaled x. Here, "unscaled x"
refers to the original x values in the data, before application of any
scale transformation. When specifying a function along with a grouping
structure, the function will be called once per group.
The default is to use the number of bins in \code{bins},
covering the range of the data. You should always override
this value, exploring multiple widths to find the best to illustrate the
stories in your data.

The bin width of a date variable is the number of days in each time; the
bin width of a time variable is the number of seconds.}

\item{scales}{Should scales be fixed (\code{"fixed"}, the default),
free (\code{"free"}), or free in one dimension (\code{"free_x"},
\code{"free_y"})?}

\item{ncol}{Number of columns in the facetting.}

\item{position}{A position adjustment to use on the data for this layer. This
can be used in various ways, including to prevent overplotting and
improving the display. The \code{position} argument accepts the following:
\itemize{
\item The result of calling a position function, such as \code{position_jitter()}.
This method allows for passing extra arguments to the position.
\item A string naming the position adjustment. To give the position as a
string, strip the function name of the \code{position_} prefix. For example,
to use \code{position_jitter()}, give the position as \code{"jitter"}.
\item For more information and other ways to specify the position, see the
\link[ggplot2:layer_positions]{layer position} documentation.
}}

\item{...}{Other arguments passed on to \code{\link[ggplot2:layer]{layer()}}'s \code{params} argument. These
arguments broadly fall into one of 4 categories below. Notably, further
arguments to the \code{position} argument, or aesthetics that are required
can \emph{not} be passed through \code{...}. Unknown arguments that are not part
of the 4 categories below are ignored.
\itemize{
\item Static aesthetics that are not mapped to a scale, but are at a fixed
value and apply to the layer as a whole. For example, \code{colour = "red"}
or \code{linewidth = 3}. The geom's documentation has an \strong{Aesthetics}
section that lists the available options. The 'required' aesthetics
cannot be passed on to the \code{params}. Please note that while passing
unmapped aesthetics as vectors is technically possible, the order and
required length is not guaranteed to be parallel to the input data.
\item When constructing a layer using
a \verb{stat_*()} function, the \code{...} argument can be used to pass on
parameters to the \code{geom} part of the layer. An example of this is
\code{stat_density(geom = "area", outline.type = "both")}. The geom's
documentation lists which parameters it can accept.
\item Inversely, when constructing a layer using a
\verb{geom_*()} function, the \code{...} argument can be used to pass on parameters
to the \code{stat} part of the layer. An example of this is
\code{geom_area(stat = "density", adjust = 0.5)}. The stat's documentation
lists which parameters it can accept.
\item The \code{key_glyph} argument of \code{\link[ggplot2:layer]{layer()}} may also be passed on through
\code{...}. This can be one of the functions described as
\link[ggplot2:draw_key]{key glyphs}, to change the display of the layer in the legend.
}}
}
\value{
A ggplot object
}
\description{
Plot histograms for colData and rowData columns
}
\examples{
library(SFEData)
sfe <- McKellarMuscleData()
plotColDataHistogram(sfe, c("nCounts", "nGenes"), fill_by = "in_tissue",
                     bins = 50, position = "stack")
plotColDataHistogram(sfe, "nCounts", subset = "in_tissue")
sfe2 <- sfe[, sfe$in_tissue]
plotColDataHistogram(sfe2, c("nCounts", "nGenes"), bins = 50)
}
\seealso{
plotColDataFreqpoly
}
