# part 1.1 -----------------------------------------------------------

# task 1
x <- 2
y <- 4
print(c(x, y), quotes = FALSE)

tmp <- x
x <- y
y <- tmp
print(c(x, y), quotes = FALSE)


# task 2
x <- 3.5
y <- "2,6"
z <- 1.78
h <- TRUE

class(x)
class(y)
class(z)
class(h)

h <- as.numeric(h)
y <- as.numeric(gsub(",", ".", y))
x <- as.character(x)


# task 3
dohod <- 1573
dohod <- log(dohod)
dohod

# task 4
file_path <- "practicals/practical_1/tasks_1/variant.txt"
write.table(31, file_path)
variant <- read.table(file_path)
print(2 * variant - 1)


# part 1.2 -----------------------------------------------------------

# task 1
g <- c(1, 0, 2, 3, 6, 8, 12, 15, 0, NA, NA, 9, 4, 16, 2, 0)

g[1]
g[length(g)]
g[3:5]
g[g == 2 & !is.na(g)]
g[g > 4 & !is.na(g)]
g[g %% 3 == 0 & !is.na(g)]
g[g > 4 & g %% 3 == 0 & !is.na(g)]
g[(g < 1 | g %% 5 == 0) & !is.na(g)]
which(g == 0)
which(g >= 2 & g <= 8)
sort(g[-which(g %% 10 == 2 | is.na(g))])

# task 2
vec <- c(1, 2, 3, 1243123, 12)
vec[length(vec)] <- NA
vec

# task 3
which(is.na(g))

# task 4
length(g[is.na(g)])

# task 5
responder_ids <- 1:100
responder_ids

# task 6
countries <- rep(c("France", "Italy", "Spain"), each = 5)
years <- rep(c(2017, 2018, 2019, 2020, 2021), each = 3)
countries
years

# task 7
income <- c(10000, 32000, 28000, 150000, 65000, 1573)
mean_income <- sum(income) / length(income)
income_class <- as.integer(income >= mean_income)
income_class

# task 8
variant <- 31 %% 30
coords_path <- "practicals/practical_1/tasks_1/coords.txt"
result_path <- "practicals/practical_1/tasks_1/result.txt"

N <- 5
P <- 6.21

write.table(round(runif(N, -100, 100)), coords_path)
coords <- read.table(coords_path)
result <- (sum(abs(coords) ^ P)) ^ (1 / P)
write.table(result, result_path)


# task 9
diff_vectors_path <- "practicals/practical_1/tasks_1/diff_vectors.txt"

N <- 5
coords <- read.table(coords_path)
coords_unlisted <- unlist(coords)
first_diff <- coords_unlisted[-1] - coords_unlisted[-length(coords_unlisted)]
second_diff <- first_diff[-1] - first_diff[-length(first_diff)]

write.table("First Diff", diff_vectors_path)
write.table(first_diff, diff_vectors_path, append = TRUE)

write.table("Second Diff", diff_vectors_path, append = TRUE)
write.table(second_diff, diff_vectors_path, append = TRUE)
