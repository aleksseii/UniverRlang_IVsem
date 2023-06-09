# part 6.1 -----------------------------------------------------------

path <- "https://raw.githubusercontent.com/qwerty29544/RpracticeBook/master/2Data/01FlatTables/ECG_yurchenkov.txt"
# download.file(path, destfile = "data6.txt")
df <- read.csv("practicals/practical_6/tasks/data6.txt", skip = 47, header = FALSE, sep = "\t", dec = ',')

summary(df)
height <- 200
weight <- 100

stages_amount <- length(which(df[1] == 0))

# analysys -----------------------------------------------------------

# col 1
y1 <- df[, 2]
min_ts <- min(df[, 2])
max_ts <- max(df[, 2])
n <- nrow(df)
hist(y1,
     prob = TRUE,
     main = "Hist v2",
     xlab = 'P',
     ylab = "D")
y1.pdf <- density(y1, bw = 'ucv')
lines(y1.pdf, col = 'red')
text(3.1, 0.5, 'EP')

# col 2
y2 <- df[, 3]
min_ts <- min(df[, 3])
max_ts <- max(df[, 3])
n <- nrow(df)
hist(y2,
     prob = TRUE,
     main = "Hist v3",
     xlab = 'P',
     ylab = "D")
y2.pdf <- density(y2, bw = 'ucv')
lines(y2.pdf, col = 'red')
text(3.1, 0.5, 'EP')

# col 3
y3 <- df[, 4]
min_ts <- min(df[, 4])
max_ts <- max(df[, 4])
n <- nrow(df)
hist(y3,
     prob = TRUE,
     main = "Hist v4",
     xlab = 'P',
     ylab = "D")
y3.pdf <- density(y3, bw = 'ucv')
lines(y3.pdf, col = 'red')
text(3.1, 0.5, 'EP')

# col 4
y4 <- df[, 5]
min_ts <- min(df[, 5])
max_ts <- max(df[, 5])
n <- nrow(df)
hist(y4,
     prob = TRUE,
     main = "Hist v5",
     xlab = 'P',
     ylab = "D")
y4.pdf <- density(y4, bw = 'ucv')
lines(y4.pdf, col = 'red')
text(3.1, 0.5, 'EP')

# col 5
y5 <- df[, 6]
min_ts <- min(df[, 6])
max_ts <- max(df[, 6])
n <- nrow(df)
hist(y5,
     prob = TRUE,
     main = "Hist v6",
     xlab = 'P',
     ylab = "D")
y5.pdf <- density(y5, bw = 'ucv')
lines(y5.pdf, col = 'red')
text(3.1, 0.5, 'EP')
