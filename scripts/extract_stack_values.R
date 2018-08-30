multi <- brick("/home/dannunzio/downloads/mosaic-2018-08-30-1205/mosaic-2018-08-30-1205.tif")
nbands(multi)

pts <- sampleRandom(multi,100,xy=T)
pts <- as.data.frame(pts)
pts <- pts[,1:2]
names(pts) <- c("lon","lat","red","nir","swir")
head(pts)

spdf <- SpatialPointsDataFrame(pts[,1:2],
                                      pts,
                                      proj4string = CRS('+init=epsg:4326'))
head(spdf)

spdf$red <- extract(multi,spdf)[,1]
spdf$nir <- extract(multi,spdf)[,2]
spdf$swir <- extract(multi,spdf)[,3]

head(spdf)
