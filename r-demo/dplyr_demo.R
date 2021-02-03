# 1. working with file base data - data import

#Set the working directory that contains the data file
<<<<<<< Updated upstream:r-demo/working with data demo.R
setwd(".../R-Data/r-demo")
=======
setwd(".../r-demo")
>>>>>>> Stashed changes:r-demo/dplyr_demo.R

#Import/Load  the data into R-Read a tab-delimited data file

cars <- read.table(
  file = "Cars.txt",
  header = TRUE,
  sep = "\t",
  quote = "\""
)
# Peek at the data
head(cars)

#2. Transform the data
#Load library from memory
library(dplyr)

#Select a subset of columns by column name and assign the results of this transformation to variable temp
temp <- select(
  .data = cars,
  Transmission,
  Cylinders,
  Fuel.Economy 
)
head(temp)

# Filter data to include only cars with Automatic tranbsimisions
# Filter a subset of rows(multiple condition )
temp <- filter(
  .data = temp,
  Transmission == "Automatic",
  Fuel.Economy > 20
)
head(temp)

#Compute a new column, overwrite existing values or create new column
temp <- mutate(
  #dataframe
  .data = temp,
  #Name of the new column
  Consumption = Fuel.Economy *0.425
)

head(temp)

#Group rows of data by number of engine(Group by a column) 

temp <- group_by(
  .data = temp,
  Cylinders
)
# return a group data frame
head(temp)
temp <- summarise(
  .data = temp,
  Avg.Consumption = mean(Consumption)
)
head(temp)

temp <- arrange(
  .data = temp,
  desc(Avg.Consumption)
)
head(temp)

#Covert result to data frame
efficiency <- as.data.frame(temp)
print(efficiency)

#Assigning the results of data %>% pipe operator
efficiency <- cars %>%
  select(Transmission,Cylinders,Fuel.Economy)  %>%
  filter(Transmission == "Automatic") %>%
  mutate(Consumption = Fuel.Economy *0.425) %>%
  group_by(Cylinders) %>%
  summarise(Avg.Consumption = mean(Consumption)) %>%
  arrange(desc(Avg.Consumption)) %>%
  as.data.frame()
  
  
print(efficiency) 
  
