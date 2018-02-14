library(dplyr)
library(tidyr)
library(readr)

df <- read_csv('fitbit_data_getting_clean.csv')

colnames(df)<- c("date","calories_burned","steps", "distance", "minutes_sedentary", "minutes_lightly_active", "minutes_fairly_active", "minutes_very_active", "activity calories", "sleep_start_time", "sleep_end_time", "minutes_asleep", "minutes_awake", "number_of_awakenings", "time_in_bed")

write_csv(df, 'capstone_data_clean.csv')
