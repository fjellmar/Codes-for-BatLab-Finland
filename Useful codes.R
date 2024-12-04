#### ----- Codes for cleaning datasets ----- ####

# For practising new codes without your own dataset you can use a practise dataset from R
library(palmerpenguins)             # package that contains an example-dataset of penguins
View(penguins_raw)                  # View raw-dataset from the penguin-package
head(penguins_raw)                  # Shows you the first 6 rows of the dataset
tail(penguins_raw)                  # Shows you the last 6 rows of the dataset
names(penguins_raw)                 # Shows you the name of all the columns - this dataset has bad names for r-purposes

library(janitor)


