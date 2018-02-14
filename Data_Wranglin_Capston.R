library(dplyr)
library(tidyr)
library(readr)

df_oct <- read_csv('fitbit_activities_october_2017.csv')
df_nov <- read_csv('fitbit_activities_november_2017.csv')
df_dec <- read_csv('fitbit_activities_december_2017.csv')
df_jan <- read_csv('fitbit_activities_january_2018.csv')

df_act <- rbind(df_oct, df_nov, df_dec, df_jan)

print(df)

dfsleep_oct <- read_csv('fitbit_sleep_october_2017.csv')
dfsleep_nov <- read_csv('fitbit_sleep_november_2017.csv')
dfsleep_dec <- read_csv('fitbit_sleep_december_2017.csv')
dfsleep_jan <- read_csv('fitbit_sleep_january_2018.csv')

df_sleep <- rbind(dfsleep_oct, dfsleep_nov, dfsleep_dec, dfsleep_jan)

write_csv(df_act, 'act_data_clean.csv')
write_csv(df_sleep, 'sleep_data_clean.csv')


df <- cbind(df_act, df_sleep)
