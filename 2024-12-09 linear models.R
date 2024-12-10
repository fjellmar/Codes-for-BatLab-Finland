#### ----- STATS-CHAT AND R-WIZARD TRAINING 11/12-24: LINEAR MODELS IN R ----- ####


#### ----- Choose datasets to use for this session ----- ####
data()                                                        # code that shows you different internal datasets in R that are free to use
View(ChickWeight)                                             # opens your selected dataset - this dataset contains data on the weight of chicks on different diets across time
head(ChickWeight)                                             # shows you the first 6 rows of your dataset
names(ChickWeight)                                            # shows you names of variables in your dataset

install.packages("dplyr")                                     # installing the useful package "dplyr" (I use this package a lot for different purposes)
library(dplyr)
glimpse(ChickWeight)                                          # gives you the number of columns, rows, and shows you which 'types' your variables are (chr = character, dbl = numerical, date = date, fct = factor, ord = order)


#### ----- Visualise data prior to analyses ----- ####
install.packages("ggplot2")                                   # package for making nice plots 
library(ggplot2)


# Histogram of the weight-variable
ggplot(data = ChickWeight,                                    # specify dataset you want to visualise from
       aes(x = weight)) +                                     # specify variables you want to visualise
  geom_histogram(colour = "white", fill = "goldenrod") +      # specifying that you want a histogram with yellow filling and white lines around the bars
  theme_bw()                                                  # you can change the theme of the plot. Try typing theme_ and try a few of the options (I like theme_classic)


# Scatterplot of weight against time
ggplot(data = ChickWeight, 
       aes(x = Time, y = weight)) +                           
  geom_point() +                                              # code for making scatterplot with ggplot
  theme_bw()                                                  


# Boxplot of the different diets over time (x-variable need to be a factor)
ggplot(data = ChickWeight, 
       aes(x = as.factor(Time), y = weight, fill = Diet)) +   # the x-variable need to be a group 
  geom_boxplot(outlier.shape = NA) +                          # the code for making a boxplot with ggplot
  theme_bw() 


# Scatterplot of weight against time and diets
ggplot(data = ChickWeight, 
       aes(x = Time, y = weight, colour = Diet)) +
  facet_wrap(~ Diet) +                                        # plots separate windows for the different diet-groups 
  geom_point() +                                              # code for making scatterplot with ggplot
  theme_bw()                                                  



#### ----- Fit linear models ----- ####

# Simple linear regression
m1_simple <- lm(weight ~ Time, data = ChickWeight)          # constructing a linear model where we test the effect of time on chick-weight
summary(m1_simple)                                          # gives us the output of the study - check powerpoint-slides 21-28 for explanations

hist(resid(m1_simple))                                      # plots a histogram of the model residuals


# Multiple linear regression (additive)
m2_medium <- lm(weight ~ Time + Diet, data = ChickWeight)   # adding effect of diet to the linear regression
summary(m2_medium)                                          


# Multiple linear regression (interaction)
m3_hardcore <- lm(weight ~ Time*Diet, data = ChickWeight)   # testing interaction between time and diet (we suspect that chicks on different diets grow at different paces)
summary(m3_hardcore)                                          


#### ----- Which model is best? ----- ####

# Which model is the best of the three above??
AIC(m1_simple, m2_medium, m3_hardcore)                       # the model with the LOWEST (!) AIC-value is best (if two models are within 2 values of eachother, the model with lowest df is usually considered better)



#### ----- SUPER-DUPER-INSANELY-USEFUL-CODE for visualising your model results!!!!! ----- ####
install.packages("sjPlot")                                  # package needed
library(sjPlot)
install.packages("ggeffects")                               # package needed
library(ggeffects)


# Predicting and visualising effects from model 1
predicted_data_m1 <- ggpredict(m1_simple,                   # ggpredict gives you predicted values from your model for the variables and value-ranges you would wish to explore
                               terms = c("Time [all]")) 
predicted_data_m1                                           # your new dataset with predicted values and confidence intervals
plot(predicted_data_m1, add.data = TRUE)                    # quickly plots the results from the dataset you made above - if you want to remove datapoints, exchange TRUE with FALSE


# Predicting and visualising effects from model 2
predicted_data_m2 <- ggpredict(m2_medium,                   # ggpredict gives you predicted values from your model for the variables and value-ranges you would wish to explore
                               terms = c("Time [all]", "Diet"))     
plot(predicted_data_m2, add.data = TRUE)                    # quickly plots the results from the dataset you made above - if you want to remove datapoints, exchange TRUE with FALSE


# Predicting and visualising effects from model 3
predicted_data_m3 <- ggpredict(m3_hardcore,                 # ggpredict gives you predicted values from your model for the variables and value-ranges you would wish to explore
                               terms = c("Time [all]", "Diet")) 
plot(predicted_data_m3, add.data = TRUE)                    # quickly plots the results from the dataset you made above - if you want to remove datapoints, exchange TRUE with FALSE


# If you want to use ggplot for visualising your predicted data
m3_data_for_ggplot <- as.data.frame(predicted_data_m3)                      # this code transforms the dataset from model 3 into a more useful format for plotting in ggplot

ggplot(m3_data_for_ggplot, aes(x = x, y = predicted, colour = group)) +     
  geom_ribbon(aes(ymin = conf.low, ymax = conf.high, fill = group),         # includes the confidence intervals
              alpha=0.2, colour = NA) +                                     # alpha changes the transparency of the confidence interval, colour = NA just removes the outer lines added to the conf. interval shades
  geom_line() +                                                             # is is clever to add the line after the confidence intervals, because ggplot plots in the order you write the code-lines
  geom_point(data = ChickWeight, aes(x = Time, y = weight, colour = Diet),  # when adding datapoints you need to specify which dataset and which variables you want to add
             alpha = 0.3, size = 1) +                                       # changing the transparency and size of the datapoints
  theme_classic() +                                                         # my preferred theme when plotting (try to remove this one to see the difference)
  labs(x = "Time (days)", y = "Weight (g)", colour = "Diet", fill = "Diet") # here you can change the labels of the plot




