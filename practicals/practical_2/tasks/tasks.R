# part 2.1 -----------------------------------------------------------

# task 1
names <- c("Jane", "Michael", "Mary", "George")
ages <- c(8, 6, 28, 45)
gender <- c(0, 1, 0, 1)

info <- list(names, ages, gender)
info[[1]][2]
info[[3]]
names(info) <- c("name", "age", "gender")
info$name

drinks <- c("juice", "tea", "rum", "coffee")
info[[4]] <- drinks
names(info)[4] <- "drinks"

info$name[5] <- "John"
info$age[5] <- 2
info$gender[5] <- 1
info$drinks[5] <- "milk"
info

# task 2
s <- "a,b,c,d"
chars <- strsplit(s, ",")
chars
class(chars)
unlist(chars)


index <- "0,72;0,38;0,99;0,81;0,15;0,22;0,16;0,4;0,24"
I <- as.numeric(unlist(strsplit(gsub(",", ".", index), ";")))
I


# part 2.2 -----------------------------------------------------------
library(randomNames)

set.seed(1234)
names <- randomNames(100, which.names = "first", ethnicity = 4)
ages <- sample(16:75, 100, replace = TRUE)
views <- c("right", "left", "moderate", "indifferent")
polit <- sample(views, 100, replace = TRUE)

df <- data.frame(names, ages, polit)
df$id <- seq(1:100)

library("dplyr")
nrow_1 <- nrow(filter(df, ages >= 25 & ages <= 30))
nrow_all <- nrow(df)
cat(sprintf("Доля опрошенных в возрасте от 25 до 30 лет, %s процентов", (nrow_1 / nrow_all) * 100))
fact <- as.factor(df$polit)
df$polit_views <- fact


# part 2.3.1 -----------------------------------------------------------

library(car)
data("Ornstein")
df <- Ornstein

nrow(df)
ncol(df)
names(df)

which(is.na(df))


filter(df, assets >= 20000 & assets <= 30000)
filter(df, interlocks <= 30)
filter(df, sector == 'BNK' & nation == 'CAN')

df$log_assets <- log(df$assets)


library(haven)
write_dta(df, 'Firms.dta')


# part 2.3.2 -----------------------------------------------------------

library(dplyr)
library(readr)
library(stringr)

covid_data_path <- "https://raw.githubusercontent.com/CSSEGISandData/COVID-19/master/csse_covid_19_data/csse_covid_19_time_series/time_series_covid19_confirmed_global.csv"
df <- read.csv(covid_data_path)

dim(df)
names(df)
str(df)


df <- unite(df, Province.State, Country.Region)
dim(df)
row_sum <-  rowSums(df[4:1146])
avrg <- row_sum/(1146-4+1)

digr <- apply(X = df[,-c(1:3)], MARGIN = 1, sd) #применение sd к X

ndf1 <- data.frame(country_region = df$Province.State, lat = df$Lat, long = df$Long,
                   ills_sum = row_sum, ills_avrg = avrg, ill_digr = digr)


Country <- df$Province.State
dates_vec <- names(df[4:length(df)])
dates_vec <- as.character(as.Date(x = dates_vec, format = "X%m.%d.%y"))
ndf2 <- df %>% dplyr::select(-Long, -Lat, -Province.State) %>% t()
colnames(ndf2) <- Country
rownames(ndf2) <- dates_vec

#сохранение
library(xlsx)

dir.create('output')
write.csv(ndf1, "output/out.cvs")
write.table(ndf1, "output/out.txt")
write.xlsx(ndf1, "output/out.xlsx")
