##########################################################################################
################## Read, manipulate and write tables
##########################################################################################

########################################################################################### 
# Contact: remi.dannunzio@fao.org
# Last update: 2018-08-28
##########################################################################################

### Make sure you have initialized your working environment by running first the script "s0_parameters.R"

### Q1: Read the table called "ei_2016.csv", under the directory containing tables. Call the resulting dataframe "df"
df <- read.csv(paste0(tab_dir,"ei_2016.csv"))

### Q2: How many lines are in this file ? How many columns ?
nrow(df)
ncol(df)

### Q3: Store the headers of the table under a vector called "header"
header <- names(df)

### Q4: What are the different values of column "plot_date_year" ? How many observations per each year ?
table(df$plot_date_year)

### Q5: How many plot observations don't have biomass data ? (hint: check NA values)
nrow(df[is.na(df$total_biomass_ha),])

### Q6: Make a subset (df1) of "df" by selecting only lines that have biomass data: use the "!is.na()" function
df1 <- df[!is.na(df$total_biomass_ha),]

### Q7: What is the average biomass stocks over all the plots ?
mean(df1$total_biomass_ha)

### Q8: What is the maximum number of trees observed by year ?
tapply(df1$trees_ha,df1$plot_date_year,max)

### Q9: Plot the values of altitude records
plot(df$altitude)

### Q10: Make a subset df2 of df1 where altitude is reasonable and plot values
df2 <- df1[df1$altitude < 6000,]
plot(df2$altitude)
