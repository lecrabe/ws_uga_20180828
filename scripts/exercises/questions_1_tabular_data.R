##########################################################################################
################## Read, manipulate and write tables: copy the file and save as "answers"
##########################################################################################

### Make sure you have initialized your working environment by running first the script "s0_parameters.R"

### Q1: Read the table called "ei_2016.csv", under the directory containing tables. Call the resulting dataframe "df"
### Q2: How many lines are in this file ? How many columns ?
### Q3: Store the headers of the table under a vector called "header"
### Q4: What are the different values of column "plot_date_year" ? How many observations per each year ?
### Q5: How many plot observations don't have biomass data ? (hint: check NA values)
### Q6: Make a subset (df1) of "df" by selecting only lines that have biomass data: use the "!is.na()" function
### Q7: What is the average biomass stocks over all the plots ?
### Q8: What is the maximum number of trees observed by year ?
### Q9: Plot the values of altitude records
### Q10: Make a subset df2 of df1 where altitude is reasonable and plot values
