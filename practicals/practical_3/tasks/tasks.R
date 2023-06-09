# part 3.1 -----------------------------------------------------------

Sys.setlocale("LC_ALL","ru_RU")

gas_data_path <- 'https://raw.githubusercontent.com/qwerty29544/RpracticeBook/master/2Data/01FlatTables/GAZ.csv'
df <- read.csv(gas_data_path, header = T, sep = '\t', dec = ',', encoding = "UTF-8")

df$ID <- as.integer(df$ID)
df$дата.замера <- as.Date(df$дата.замера, format = "%d/%m/%Y")

df <- na.omit(df)
df <- df[-c(which(df$газ.м3.сут == 0 | df$конд.т.м3.сут == 0 | df$вода.м3.сут == 0)), ]

df$ТустК <- df$Туст..С - 273.15
df$Туст..С <- NULL
library(dplyr)
df <- select(df, 6, 1, 2, 9, 3, 4, 5, 7, 8)

df$ID <- ordered(df$ID)
df$Куст <- ordered(df$Куст)
df$Группа <- ordered(df$Группа)

df$газ.к.конд <- (df$газ.м3.сут/df$конд.т.м3.сут)
df$газ.к.вода <- (df$газ.м3.сут/df$вода.м3.сут)
df$вода.к.конд <- (df$вода.м3.сут/df$конд.т.м3.сут)

df_2018 <- filter(df, format(df$дата.замера, "%Y") == "2018")

df_ID111 <- filter(df, df$ID == 111)

id1 <- unique(subset(df, df$вода.м3.сут > 2)$ID)
id1 <- setdiff(df$ID, id1)

id2 <- unique(subset(df, df$газ.м3.сут + df$конд.т.м3.сут
                     + df$вода.м3.сут < 1000)$ID)
id2 <- setdiff(df$ID, id2)

mvp1 <- df_2018[which(df_2018$газ.м3.сут == max(df_2018$газ.м3.сут)), ]
mvp1['Группа']

mvp2 <- df_2018[which(df_2018$вода.м3.сут == max(df_2018$вода.м3.сут)), ]
mvp2['Куст']

mvp3 <- df[which(df$газ.к.вода == max(df$газ.к.вода)), ]
mvp3['Куст']
