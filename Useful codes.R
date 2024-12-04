#### ----- Codes for cleaning datasets ----- ####

# For testing these codes you can use a practise dataset from R
install.packages("palmerpenguins")      # package that contains an example-dataset of penguins
library(palmerpenguins)             

# Codes for viewing your dataset
View(penguins_raw)                      # opens the dataset (example from the penguin-package) in a new window
head(penguins_raw)                      # shows you the first 6 rows of the dataset
tail(penguins_raw)                      # shows you the last 6 rows of the dataset
names(penguins_raw)                     # shows you the name of all the columns - this example raw-dataset has bad names for r-purposes, so we will clean these up in line 19 (see below)
penguins_raw$Island                     # the $ symbol will specify a column within the dataset - in this example it will show all the entries of the "Island"-variable in the penguins_raw dataset
levels(as.factor(penguins_raw$Species)) # shows you the different 'groups' you have in a column - but it needs to be made into a factor first (which I did here with the as.factor() code)
summary(penguins_raw$`Body Mass (g)`)   # gives you a quick overview of a specified numerical variable - the '' in the column-name is because of the spaces, which we will fix in line 19

# Codes for initial cleaning
install.packages("janitor")             # package with code for improving column-names
library(janitor)                    
penguins_clean_data <- clean_names(penguins_raw)  # saves a new dataset with clean column-names (try names() for each of the two datasets to see the difference)


