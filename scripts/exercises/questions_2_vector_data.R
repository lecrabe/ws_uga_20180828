##########################################################################################
################## Read, manipulate and write vectors: copy the file and save as "answers"
##########################################################################################

### Make sure you have initialized your working environment by running first the script "s0_parameters.R"

### Q1: Call GADM data at level 1 for Uganda, and store the resulting vector layer under "admin"
### Q2: Find the extent, projection and DBF attribute names
### Q3: Export "admin" as a ESRI Shapefile
### Q4: Plot the admin boundaries
### Q5: Add in blue the two Lake districts
### Q6: Add in green the Mbarara district and in red the Kampala district
### Q7: Project the "admin" layer into UTM 36
### Q8: Generate 5000 random points over the country boundaries (UTM) and Convert the points into a SpatialPointDataFrame, called spdf
### Q9: Extract the district value for each point and add it into the DBF file as a new column called "district"
### Q10: Count how many points fall in Kampala district