\name{gmovie}
\alias{gmovie}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Create a .kml doc for video Google Earth
}
\description{
Presents location data over time in Google Earth. Makes use of the time slider in GE. A date range is supplied over which the data will appear.
}
\usage{
gmovie(data, yrstart, yrend, longitude = data$longitude, latitude = data$latitude, observation_date = data$observation_date, date_end = data$date_end, resid = FALSE, icon = "/Users/Ben/Documents/redDot.png", resid_icon = "/Users/Ben/Documents/redDotnoBorder.png", icon_size = 0.4, resid_icon_size = 0.4)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{data}{
contains location and time information
}
  \item{yrstart}{
the earliest year in which the data exists
}
  \item{yrend}{
the latest year in which the data exists
}
  \item{longitude}{
list of longitude element of coordinates
}
  \item{latitude}{
list of latitude element of coordinates
}
  \item{observation_date}{
date (of the form yyyy-mm-dd) at which the data point should appear
}
  \item{date_end}{
date (of the form yyyy-mm-dd) at which the data point should disappear
}
  \item{resid}{
if TRUE, data points will leave behind a "ghost" point, or alpha blended replica when they disappear
}
  \item{icon}{
.png file that will represent a data point in Google Earth
}
  \item{resid_icon}{
.png file that will represent a "ghost" point in Goodlove Earth
}
  \item{icon_size}{
how large the icon will be
}
  \item{resid_icon_size}{
how large the "ghost" icon will be
}
}
\details{
%%  ~~ If necessary, more details than the description above ~~
}
\value{
  \item{doc}{
a kml document to be opened from Google Earth  
}
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
function(data, yrstart, yrend, longitude=data$longitude,
				   latitude=data$latitude, observation_date=data$observation_date,
				   date_end=data$date_end, resid=FALSE, icon="/Users/Ben/Documents/redDot.png",
				   resid_icon="/Users/Ben/Documents/redDotnoBorder.png", icon_size=.4, resid_icon_size=.4){
	library(RKML)
	
	Document <- newXMLNode("Document")
	kml <- newXMLNode("kml")
	Folder1 <- newXMLNode("Folder")
	doc <- newXMLDoc()
	name <- newXMLNode("name")

	addChildren(name, "Folder1")
	addChildren(Folder1, name)
	
	Folder3 <- newXMLNode("Folder")
	name <- newXMLNode("name")
	addChildren(name, "Folder2")
	addChildren(Folder3, name)

	#Add the Placemarks
	for(i in 1:nrow(data)){
		addPlacemark(longitude[i], latitude[i], observation_date[i], date_end[i], Folder1, icon, icon_size)
		if(resid==TRUE){
			addResidualPlacemark(longitude[i], latitude[i], observation_date[i], yrend, Folder3, TRUE, resid_icon, resid_icon_size)
		}
	}

	Folder2 <- newXMLNode("Folder")
	name <- newXMLNode("name")
	addChildren(name, "Folder1")
	addChildren(Folder2, name)

	#finish the node structure
	if(resid == TRUE){
		addChildren(Document, c( Folder1, Folder3))
	}
	else{
		addChildren(Document, c( Folder1))
	}
	addChildren(kml, Document)
	addChildren(doc, kml)
	
	return(doc)
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ Google Earth }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
