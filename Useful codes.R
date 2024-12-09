#### ----- Codes for cleaning datasets ----- ####

# For testing these codes you can use a practise dataset from R
install.packages("palmerpenguins")      # package that contains example-datasets of penguins
library(palmerpenguins)             


# Codes for viewing your dataset
View(penguins_raw)                      # opens the dataset (example from the penguin-package) in a new window
head(penguins_raw)                      # shows you the first 6 rows of the dataset
tail(penguins_raw)                      # shows you the last 6 rows of the dataset
names(penguins_raw)                     # shows you the name of all the columns. This example raw-dataset has bad names for r-purposes (has spaces in them f.ex), we will clean these up in line 29
penguins_raw$Island                     # the $ symbol will specify a column within the dataset. In this example it will show all the entries of the "Island"-variable in the penguins_raw dataset

install.packages("dplyr")               # package with several useful codes for organising your data
library(dplyr)                           
glimpse(penguins_clean_data)            # gives you the number of columns, rows, and shows you which 'types' your variables are (chr = character, dbl = numerical, date = date, fct = factor)
levels(as.factor(penguins_raw$Species)) # shows you the different 'groups' you have in a column, but it needs to be made into a factor first (which I did here with the as.factor() code, although I did not save it)
summary(penguins_raw$`Body Mass (g)`)   # gives you a quick overview of a specified numerical variable. The '' in the column-name is because of the spaces, which we will fix in line 29

install.packages("naniar")              # package that helps you visualise missing observations (NA) in your dataset
library(naniar)
vis_miss(penguins_raw)                  # makes a visualisation of your dataset as a table, where missing observations are marked in black


# Codes for initial cleaning
install.packages("janitor")             # package with code for improving column-names
library(janitor)                    
penguins_clean_data <- clean_names(penguins_raw)  # saves a new dataset with clean column-names (try names() for each of the two datasets to see the difference)

penguins_clean_data$stage[1:50] <- "adult, 2 egg" # for practise, let's change the 1st to the 50th observation in the 'stage' column (the original observation was "Adult, 1 Egg Stage") 
penguins_clean_data$stage[100] <- "adlut, 2 egg"  # for practise, let's add a typo in the 100th observation
penguins_clean_data$stage <- as.factor(penguins_clean_data$stage) # converting the 'stage'-variable from a character into a factor for the next codes to work
levels(penguins_clean_data$stage)       # this code now shows that the 'stage'-variable has three levels: "adlut, 2 egg" , "Adult, 1 Egg Stage" and "adult, 2 egg"

penguins_clean_data$stage <- ifelse(penguins_clean_data$stage == "Adult, 1 Egg Stage",  # to edit the stage variable, we can use ifelse (good when we want only two groups)
                                    "adult one egg",                                    # if the statement above is true (stage = "Adult, 1 Egg Stage"), then it will be replaced with this text (or value)
                                    "adult two eggs")                                   # if the statement is false it will be replaced with this text (or value)
levels(as.factor(penguins_clean_data$stage))    # the levels in our cleaned column show that we now have the two categories we specified in the ifelse-statement above



#### ----- Codes for organising datasets ----- ####

# nothing here yet - come back later plz :)


#### ----- Codes for visualising your data ----- ####

# nothing here yet - come back later plz :)


#### ----- Codes for analysing your data ----- ####

# nothing here yet - come back later plz :)


#### ----- Codes for graphing your results ----- ####

# nothing here yet - come back later plz :)






