\name{gmovie}
\alias{gmovie-package}
%\alias{gmovie package}
\docType{package}
\title{
Create a .kml movie file for Google Earth
}
\description{
Presents location data over time in Google Earth through KML.
}
\details{
\tabular{ll}{
Package: \tab gmovie\cr
Type: \tab Package\cr
Version: \tab 1.0\cr
Date: \tab 2011-06-02\cr
License: \tab GNU General Public License\cr
LazyLoad: \tab yes\cr
}

The main tool is the gmovie function. It will create a kml document in R which must then be saved as a .kml extension using saveXML. The resulting document can then be opened in Google Earth and will play a movie, which presents coordinate data over time.
}
\author{
Benjamin Godlove

<bgodlove88@gmail.com>
}
\references{
http://code.google.com/apis/kml/documentation/kml_tut.html
}

\keyword{ package }
\seealso{
%~~ Optional links to other man pages, e.g. ~~
%~~ \code{\link[<pkg>:<pkg>-package]{<pkg>}} ~~
}
\examples{

}
