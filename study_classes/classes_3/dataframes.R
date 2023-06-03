# dataframes

data_frame_1 <- data.frame(col1 = c(13, 42, 12), col2 = c(56, 12, 12))
data_frame_1
data_frame_1$col3 <- c("frank", "paul", "mick")
data_frame_1

data_frame_1[1:2, ]
data_frame_1[, 2:3]
data_frame_1[, c("col2", "col3")]

rownames(data_frame_1)
colnames(data_frame_1)

# datasets

data()
Titanic[2, , , ]

View(mtcars)

summary(mtcars)
write.csv(mtcars, "mtcars.csv")

dim(mtcars)

# values filtering

subset(mtcars, am == 1 & vs == 1)

# how to download dataframe

df_2 <- read.csv(file = "insert url here")

mtcars$disp
plot(mtcars$disp)
