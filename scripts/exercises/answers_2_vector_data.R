##########################################################################################
################## Read, manipulate and write vectors: copy the file and save as "answers"
##########################################################################################

### Make sure you have initialized your working environment by running first the script "s0_parameters.R"

### Q1: Call GADM data at level 1 for Uganda, and store the resulting vector layer under "admin"
admin <- getData("GADM",path=gadm_dir,country="UGA",level=1)
?getData

### Q2: Find the extent, projection and DBF attribute names
extent(admin)
proj4string(admin)
names(admin@data)

### Q3: Export "admin" as a ESRI Shapefile
writeOGR(admin,
         paste0(gadm_dir,"my_export_of_the_day.shp"),
         "my_export_of_the_day",
         "ESRI Shapefile",
         overwrite_layer = T)

### Q4: Plot the admin boundaries
plot(admin)

### Q5: Add in blue the two Lake districts
sub_admin <- admin[admin$NAME_1 == "Lake Victoria" |
                   admin$NAME_1 == "Lake Albert",]

sub_admin <- admin[grep("Lake",admin$NAME_1),]

plot(sub_admin,
     add=T,
     col="blue")

### Q6: Add in green the Mbarara district and in red the Kampala district
plot(admin[admin$NAME_1 == "Mbarara",],
     add=T,
     col="green")

plot(admin[admin$NAME_1 == "Kampala",],
     add=T,
     col="red")

### Q7: Project the "admin" layer into UTM 36
admin <- spTransform(admin,CRS('+init=epsg:32636'))
admin_utm <- spTransform(admin,CRS('+init=epsg:32636'))

### Q8: Generate 5000 random points over the country boundaries (UTM) and Convert the points into a SpatialPointDataFrame, called spdf
pts_rand <- spsample(admin_utm,5000,type = "random")

spdf <- SpatialPointsDataFrame(pts_rand@coords,
                               as.data.frame(1:length(pts_rand)),
                               proj4string = CRS("+init=epsg:32636"))

plot(spdf,
     add=T)

### Q9: Extract the district value for each point and add it into the DBF file as a new column called "district"
### Extract polygon values by points
spdf@data$districts_units <- over(spdf,admin_utm)$NAME_1

### Q10: Count how many points fall in Kampala district
df <- data.frame(table(spdf$districts_units))
df[df$Var1 == "Kampala",]
