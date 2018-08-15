####################################################################################################
####################################################################################################
## Get GADM data
## Contact remi.dannunzio@fao.org 
## 2018/08/15
####################################################################################################
####################################################################################################

####################################################################################################
options(stringsAsFactors = FALSE)

### Load necessary packages
library(raster)
library(rgeos)
library(ggplot2)
library(rgdal)

## Set the working directory

## Get the list of countries and select one
(gadm_list  <- data.frame(getData('ISO3')))

## Get GADM data and export as shapefile
aoi         <- getData('GADM',path=gadm_dir , country= countrycode, level=1)
writeOGR(aoi,
         paste0(gadm_dir,"gadm_",countrycode,"_l1.shp"),
         paste0("gadm_",countrycode,"_l1"),
         "ESRI Shapefile",
         overwrite_layer = T)

## Display the shapefile
plot(aoi)

## Make a copy, subset the columns to 3 and export as KML
aoi_kml      <- aoi
aoi_kml@data <- aoi_kml@data[,c("OBJECTID","ISO","NAME_1")]

writeOGR(aoi_kml,
         paste0(gadm_dir,"gadm_",countrycode,".kml"),
         paste0("gadm_",countrycode),
         "KML",
         overwrite_layer = T)

## Make a copy, subset the columns to 3 and export as KML
levels(as.factor(aoi$NAME_1))


## Select one province and export as KML
sub_aoi <- aoi[aoi$NAME_1 == "Kampala",]

## Display the sub-shapefile on top of the previous one, in RED
plot(sub_aoi,
     add=T,
     col="red")

## Subset the columns to 2 and export as Shapefile
sub_aoi@data <- sub_aoi@data[,c("OBJECTID","ISO")]

writeOGR(sub_aoi,paste0(gadm_dir,"work_aoi_sub.kml"),"work_aoi_sub","KML",overwrite_layer = T)
writeOGR(sub_aoi,paste0(gadm_dir,"work_aoi_sub.shp"),"work_aoi_sub","ESRI Shapefile",overwrite_layer = T)

