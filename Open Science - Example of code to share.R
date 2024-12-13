library(lmerTest)
library(MuMIn)

#### ----- ANALYSES ----- #####

#### Body mass throughout reproductive period ####

mother_BM_df # Dataset used

BM_model <- lmer(MotherWeight ~ rep_period*(DaysOld + I(DaysOld^2)) + total_rain + (1 | Mother) + (1 | Year), data=mother_BM_df, REML=F) # Model used
summary(BM_model) # Output of model



#### Number of foraging trips ####

foraging_trips_df # Dataset used

trip_number_model <- lm(trips_per_bat ~ rep_period*(time_to_birth + I(time_to_birth^2) + night_Ta) + night_rain + night_wind, data=foraging_trips_df)
summary(trip_number_model)




#### Duration of foraging trips ####

foraging_durations_df # Dataset used

trip_duration_model_main <- lmer(duration_min ~ rep_period*(time_to_birth + I(time_to_birth^2) + night_Ta) + night_wind + night_rain + (1 | StartDate), data=subset(foraging_durations_df, Trip_type=="Main"), REML=F)
summary(trip_duration_model_main)



#### Timing of first emergences ####

activity_out_df # Dataset used

emergence_model <- lmer(time_since_sunset ~ rep_period*(sunset_Ta + time_to_birth + I(time_to_birth^2)) + sunset_wind + sunset_rain + (1 | StartDate), data=activity_out_df, REML=F)
summary(emergence_model)



#### Timing of last return ####

activity_in_df # dataset used

return_model <- lmer(time_until_sunrise ~ rep_period*(night_Ta + time_to_birth + I(time_to_birth^2)) + night_wind + night_rain + (1 | StartDate) , data=activity_in_df, REML=F)
summary(return_model)





#### ----- FIGURES ----- ####
