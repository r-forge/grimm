\name{addPlacemark}
\alias{addPlacemark}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
add a placemark to a kml file
}
\description{
Puts a placemark on a specific coordinate in Google Earth at a specific time.  Mean to be called from gmovie.
}
\usage{
addPlacemark(longitude, latitude, observation_date, date_end, Folder, icon, icon_size)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{longitude}{
the longitude of the coordinate for the placemark
}
  \item{latitude}{
the latitude of the coordinate for the placemark
}
  \item{observation_date}{
date of the form yyyy-mm-dd when the placemark should appear
}
  \item{date_end}{
date of the form yyyy-mm-dd when the placemark should disappear
}
  \item{Folder}{
Google Earth folder in which to put the placemark
}
  \item{icon}{
placemark icon .png file
}
  \item{icon_size}{
size of icon
}
}
\details{
%%  ~~ If necessary, more details than the description above ~~
}
\value{
Returns the folder containing all placemarks.  The folder should be placed in a kml document.
}
\references{
http://code.google.com/apis/kml/documentation/kml_tut.html
}
\author{
Benjamin Godlove
}
\note{
%%  ~~further notes~~
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
%% ~~objects to See Also as \code{\link{help}}, ~~~
}
\examples{

## The function is currently defined as
function(longitude, latitude, observation_date, date_end, Folder, icon, icon_size){
	Icon <- newXMLNode("Icon")
	IconStyle <- newXMLNode("IconStyle")
	Style <- newXMLNode("Style")
	begin <- newXMLNode("begin")
	end <- newXMLNode("end")
	TimeSpan <- newXMLNode("TimeSpan")
	coordinates <- newXMLNode("coordinates")
	Point <- newXMLNode("Point")
	Placemark <- newXMLNode("Placemark")
	name <- newXMLNode("name")
	href <- newXMLNode("href")
	scale <- newXMLNode("scale")
	color <- newXMLNode("color")
	
	#set values
	addChildren(coordinates, paste(longitude,",",latitude,",",0,sep=""))
	addChildren(begin, observation_date)
	addChildren(end, date_end)
	addChildren(href, icon)
	addChildren(scale, as.character(icon_size))
	addChildren(color, "ff000000")
	
	#build the node structure
	addChildren(Icon, href)
	addChildren(IconStyle, c(color, scale, Icon))
	addChildren(Style, IconStyle)
	addChildren(TimeSpan, c(begin, end))
	addChildren(Point, coordinates)
	addChildren(Placemark, c(TimeSpan, Style, Point))
	addChildren(Folder, Placemark)
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ Google Earth }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
