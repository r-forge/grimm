addResidualPlacemark <-
function(longitude, latitude, observation_date, yrend, Folder, clear=FALSE, resid_icon, resid_icon_size){
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
#	else{
#		addChildren(when, eval(parse(text=paste(yrend+1,sep=""))))
#	}
	addChildren(href, resid_icon)
	addChildren(scale, as.character(resid_icon_size))
	if(clear == TRUE){
		addChildren(color, "29ffffff")
	}
	
	#build the node structure
	addChildren(Icon, href)
	addChildren(IconStyle, c(color, scale, Icon))
	addChildren(Style, IconStyle)
	if(clear == TRUE){
		addChildren(TimeSpan, c(begin, end))
	}
#	else{
#		addChildren(TimeStamp, when)
#	}
	addChildren(Point, coordinates)
	if(clear == TRUE){
		addChildren(Placemark, c(TimeSpan, Style, Point))
	}
#	else{
#		addChildren(Placemark, c(TimeStamp, Style, Point))
#	}
	addChildren(Folder, Placemark)
}

