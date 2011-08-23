\name{addResidualPlacemark}
\alias{addResidualPlacemark}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
adds a "ghost" placemark to a kml file
}
\description{
Meant to be called from gmovie.  Creates a permanent, alpha-blended placemark at the same coordinates as the addPlacemark function.
}
\usage{
addResidualPlacemark(longitude, latitude, observation_date, yrend, Folder, clear = FALSE, resid_icon, resid_icon_size)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{longitude}{
longitude component of the coordinate
}
  \item{latitude}{
latitude component of the coordinate
}
  \item{observation_date}{
date of the form yyyy-mm-dd when the placemark should be placed
}
  \item{yrend}{
date of the form yyyy-mm-dd when the movie should stop
}
  \item{Folder}{
name of the folder node to add the placemarks to
}
  \item{clear}{
should the placemarks be alpha blended? Always TRUE. Error if FALSE
}
  \item{resid_icon}{
icon for the "ghost" placemarks
}
  \item{resid_icon_size}{
size of the "ghost" placemarks
}
}
\details{
%%  ~~ If necessary, more details than the description above ~~
}
\value{
Returns a folder containing all the placemarks. The folder must be placed in a kml document
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
function(longitude, latitude, observation_date, yrend, Folder, clear=TRUE, resid_icon, resid_icon_size){
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
	TimeStamp <- newXMLNode("TimeStamp")
	when <- newXMLNode("when")
	
	#set values
	addChildren(coordinates, paste(longitude,",",latitude,",",0,sep=""))
	if(clear == TRUE){
		addChildren(begin, observation_date)
		addChildren(end, eval(parse(text=paste(yrend+1,sep=""))))
	}
	addChildren(href, resid_icon)
	addChildren(scale, as.character(resid_icon_size))
	if(clear == TRUE){
		addChildren(color, "29000000")
	}
	
	#build the node structure
	addChildren(Icon, href)
	addChildren(IconStyle, c(color, scale, Icon))
	addChildren(Style, IconStyle)
	if(clear == TRUE){
		addChildren(TimeSpan, c(begin, end))
	}
	addChildren(Point, coordinates)
	if(clear == TRUE){
		addChildren(Placemark, c(TimeSpan, Style, Point))
	}
	addChildren(Folder, Placemark)
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
