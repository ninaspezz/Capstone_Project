library(dplyr)
library(tidyr)
library(readr)
library(lubridate)

df_oct <- read_csv('fitbit_activities_october_2017.csv')
df_nov <- read_csv('fitbit_activities_november_2017.csv')
df_dec <- read_csv('fitbit_activities_december_2017.csv')
df_jan <- read_csv('fitbit_activities_january_2018.csv')

df_act <- rbind(df_oct, df_nov, df_dec, df_jan)

dfsleep_oct <- read_csv('fitbit_sleep_october_2017.csv')
dfsleep_nov <- read_csv('fitbit_sleep_november_2017.csv')
dfsleep_dec <- read_csv('fitbit_sleep_december_2017.csv')
dfsleep_jan <- read_csv('fitbit_sleep_january_2018.csv')

df_sleep <- rbind(dfsleep_oct, dfsleep_nov, dfsleep_dec, dfsleep_jan)

colnames(df_act) <- c("date",
                     "calories_burned",
                     "steps", 
                     "distance", 
                     "floors",
                     "minutes_sedentary", 
                     "minutes_lightly_active", 
                     "minutes_fairly_active", 
                     "minutes_very_active", 
                     "activity_calories")

colnames(df_sleep) <- c("sleep_start_time", 
                        "sleep_end_time", 
                        "minutes_asleep", 
                        "minutes_awake", 
                        "number_of_awakenings", 
                        "time_in_bed",
                        "minutes_rem_sleep", 
                        "minutes_light_sleep", 
                        "minutes_deep_sleep")

df_act <- df_act[order(df_act$date),]
df_sleep <- df_sleep[order(df_sleep$sleep_start_time),]

df_sleep$minutes_rem_sleep <- NULL
df_sleep$minutes_light_sleep <- NULL
df_sleep$minutes_deep_sleep <- NULL
df_act$floors <- NULL

df_sleep <- df_sleep[!(df_sleep$minutes_asleep <  240),]

nrow(df_sleep)
nrow(df_act)

df_sleep[1,]
df_act[1,]

df <- cbind(df_act, df_sleep)

summary(df)

df$day_of_week <- weekdays(as.Date(df$date))

summary(df)

df[1,]

start_time <- mdy_hms
end_time <- mdy_hms

write_csv(df, 'fitbit_data_clean.csv')

mondays <- subset(df, day_of_week = Monday)
tuesdays <- subset(df, day_of_week = Tuesday)
wednesdays <- subset(df, day_of_week = Wednesday)
thursdays <- subset(df, day_of_week = Thursday)
fridays <- subset(df, day_of_week = Friday)
saturdays <- subset(df, day_of_week = Saturday)
sundays <- subset(df, day_of_week = Sunday)

mean(mondays$minutes_asleep)
mean(tuesdays$minutes_asleep)
mean(wednesdays$minutes_asleep)
mean(thursdays$minutes_asleep)
mean(fridays$minutes_asleep)
mean(saturdays$minutes_asleep)
mean(sundays$minutes_asleep)