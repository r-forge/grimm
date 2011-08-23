gmovie <-
function(data, yrstart, yrend, longitude=data$longitude,
				   latitude=data$latitude, observation_date=data$observation_date,
				   date_end=data$date_end, resid=FALSE, icon="/Users/Ben/Documents/redDot.png",
				   resid_icon="/Users/Ben/Documents/redDotnoBorder.png", icon_size=.4, resid_icon_size=.4){
#	library(RKML)
	
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
	
#	Folder4 <- newXMLNode("Folder")
#	name <- newXMLNode("name")
#	addChildren(name, "Folder4")
#	addChildren(Folder4, name)

	#Add the Placemarks
	for(i in 1:nrow(data)){
		addPlacemark(longitude[i], latitude[i], observation_date[i], date_end[i], Folder1, icon, icon_size)
		if(resid==TRUE){
			addResidualPlacemark(longitude[i], latitude[i], observation_date[i], yrend, Folder3, TRUE, resid_icon, resid_icon_size)
#			addResidualPlacemark(longitude[i], latitude[i], observation_date[i], yrend, Folder4, resid_icon, icon_size, resid_icon_size)
		}
	}

	#Add the Residual Placemarks
	

	#make the month clock
	Folder2 <- newXMLNode("Folder")
	name <- newXMLNode("name")
	addChildren(name, "Folder1")
	addChildren(Folder2, name)

	#finish the node structure
	if(resid == TRUE){
		addChildren(Document, c( Folder1, Folder3))#, Folder4))
	}
	else{
		addChildren(Document, c( Folder1))
	}
	addChildren(kml, Document)
	addChildren(doc, kml)
	
	return(doc)
}

