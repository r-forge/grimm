addPlacemark <-
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
	addChildren(color, "ffffffff")

	#build the node structure
	addChildren(Icon, href)
	addChildren(IconStyle, c(color, scale, Icon))
	addChildren(Style, IconStyle)
	addChildren(TimeSpan, c(begin, end))
	addChildren(Point, coordinates)
	addChildren(Placemark, c(TimeSpan, Style, Point))
	addChildren(Folder, Placemark)
}

