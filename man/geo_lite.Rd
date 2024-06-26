% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/geo_lite.R
\name{geo_lite}
\alias{geo_lite}
\title{Address search API for OSM elements}
\usage{
geo_lite(
  address,
  lat = "lat",
  long = "lon",
  limit = 1,
  full_results = FALSE,
  return_addresses = TRUE,
  verbose = FALSE,
  nominatim_server = "https://nominatim.openstreetmap.org/",
  progressbar = TRUE,
  custom_query = list()
)
}
\arguments{
\item{address}{character with single line address, e.g.
(\code{"1600 Pennsylvania Ave NW, Washington"}) or a vector of addresses
(\code{c("Madrid", "Barcelona")}).}

\item{lat}{latitude column name in the output data (default  \code{"lat"}).}

\item{long}{longitude column name in the output data (default  \code{"long"}).}

\item{limit}{maximum number of results to return per input address. Note
that each query returns a maximum of 50 results.}

\item{full_results}{returns all available data from the API service.
If \code{FALSE} (default) only latitude, longitude and address columns are
returned. See also \code{return_addresses}.}

\item{return_addresses}{return input addresses with results if \code{TRUE}.}

\item{verbose}{if \code{TRUE} then detailed logs are output to the console.}

\item{nominatim_server}{The URL of the Nominatim server to use. Defaults to https://nominatim.openstreetmap.org/}

\item{progressbar}{Logical. If \code{TRUE} displays a progress bar to indicate
the progress of the function.}

\item{custom_query}{A named list with API-specific parameters to be used
(i.e. \code{list(countrycodes = "US")}). See \strong{Details}.}
}
\value{
A \CRANpkg{tibble} with the results.
}
\description{
Geocodes addresses given as character values. This function returns the
\CRANpkg{tibble} associated with the query, see \code{\link[=geo_lite_sf]{geo_lite_sf()}} for
retrieving the data as a spatial object (\CRANpkg{sf} format).
}
\details{
See \url{https://nominatim.org/release-docs/latest/api/Search/} for additional
parameters to be passed to \code{custom_query}.
}
\examples{
\dontshow{if (nominatim_check_access()) (if (getRversion() >= "3.4") withAutoprint else force)(\{ # examplesIf}
\donttest{
geo_lite("Madrid, Spain")

# Several addresses
geo_lite(c("Madrid", "Barcelona"))

# With options: restrict search to USA
geo_lite(c("Madrid", "Barcelona"),
  custom_query = list(countrycodes = "US"),
  full_results = TRUE
)
}
\dontshow{\}) # examplesIf}
}
\seealso{
\code{\link[=geo_lite_sf]{geo_lite_sf()}}, \code{\link[tidygeocoder:geo]{tidygeocoder::geo()}}

Geocoding strings: 
\code{\link{geo_address_lookup}()},
\code{\link{geo_address_lookup_sf}()},
\code{\link{geo_lite_sf}()}
}
\concept{geocoding}
