library(readr)
library(ggplot2)
library(corrplot)
library(corrgram)
library(Hmisc)
library(dplyr)

df <- read_csv('fitbit_data_clean.csv')

summary(df)

which(grepl(2018, df$steps))
df[60,]

which(grepl(60681, df$steps))
df[33,]

which(grepl(5134, df$calories_burned))
df[33,]

which(grepl(1538, df$calories_burned))
df[33,]

which(grepl(294, df$minutes_asleep))
df[37,]

which(grepl(656, df$minutes_asleep))
df[88,]

df %>% 
  group_by(day_of_week) %>% 
  summarise(mean_steps = mean(steps)) %>%
  arrange(mean_steps)

df %>% 
  group_by(day_of_week) %>% 
  summarise(median_steps = median(steps)) %>%
  arrange(median_steps)

df %>% 
  group_by(day_of_week) %>% 
  summarise(minutes_very_active = median(minutes_very_active)) %>%
  arrange(minutes_very_active)

df %>% 
  group_by(day_of_week) %>% 
  summarise(minutes_sedentary = median(minutes_sedentary)) %>%
  arrange(minutes_sedentary)

mean(df$calories_burned)

ggplot(df, aes(date, steps)) +
  geom_smooth(fill=NA) + 
  labs(title = "Steps Over Time", x = "Date", y = "Steps")

ggplot(df, aes(date, calories_burned)) +
  geom_smooth(fill=NA) + 
  labs(title = "Calories Burned Over Time", x = "Date", y = "Calories Burned")

ggplot(df, aes(steps, calories_burned)) +
  geom_jitter() + 
  labs(title = "Steps and Calories Burned", x = "Steps", y = "Calories Burned")

corr.df <- df[, c(2,3,4,5,6,7,8,9,10,11,12,13,14,15)]
head(corr.df)

x <- corr.df[1:14]
y <- corr.df[1:14]
cor(x, y)

res2 <- cor(as.matrix(corr.df))
res2
corrplot(res2)

corrplot(res2, type = "upper", 
         sig.level = 0.01, insig = "blank")

ggplot(df, aes(date, minutes_asleep)) +
  geom_smooth(fill=NA) + 
  labs(title = "Minutes Asleep Over Time", x = "Date", y = "Minutes Asleep")

ggplot(df, aes(date, number_of_awakenings)) +
  geom_smooth(fill=NA) + 
  labs(title = "Number of Awakenings Over Time", x = "Date", y = "Number of Awakenings")

df %>% 
  group_by(day_of_week) %>% 
  summarise(minutes_asleep = mean(minutes_asleep)) %>%
  arrange(minutes_asleep)

df %>% 
  group_by(day_of_week) %>% 
  summarise(sleep_start_hour = mean(sleep_start_hour)) %>%
  arrange(sleep_start_hour)

df %>% 
  group_by(day_of_week) %>% 
  summarise(sleep_end_hour = mean(sleep_end_hour)) %>%
  arrange(sleep_end_hour)

df %>% 
  group_by(day_of_week) %>% 
  summarise(number_of_awakenings = mean(number_of_awakenings)) %>%
  arrange(number_of_awakenings)

ggplot(df, aes(x = sleep_end_hour)) +
  geom_histogram() + 
  labs(title = "Sleep End Hour Frequency", x = "Sleep End Hour", y = "Count")

ggplot(df, aes(x = sleep_start_hour)) +
  geom_histogram() + 
  labs(title = "Sleep Start Hour Frequency", x = "Sleep Start Hour", y = "Count")

ggplot(df, aes(x = number_of_awakenings)) +
  geom_histogram() + 
  labs(title = "Number of Awakenings Frequency", x = "Number of Awakenings", y = "Count")

ggplot(df, aes(x = minutes_asleep)) +
  geom_histogram() + 
  labs(title = "Minutes Asleep Frequency", x = "Minutes Asleep")

ggplot(df, aes(x = steps)) +
  geom_histogram() + 
  labs(title = "Step Volume Frequency", x = "Steps", y = "Count")

df %>% 
  group_by(day_of_week) %>% 
  summarise(mean_minutes_asleep = mean(minutes_asleep)) %>%
  arrange(mean_minutes_asleep)