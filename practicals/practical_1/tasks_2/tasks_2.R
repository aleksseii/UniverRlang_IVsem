# part 2.1 ------------------------------------------------------------------

# task 1
m <- matrix(3, nrow = 3, ncol = 4)
m[1, 3] <- 4
m[2, 1] <- 1
m[3, 2] <- NA
m[3, 4] <- 1
m

# task 2
a <- c(1, 3, 4, 9, NA)
b <- c(5, 6, 7, 0, 2)
c <- c(9, 10, 13, 1, 20)
m_rows <- rbind(a, b, c)
rownames(m_rows) <- paste0("row", 1:nrow(m_rows))
colnames(m_rows) <- paste0("col", 1:ncol(m_rows))
m_rows

m_cols <- cbind(a, b, c)
rownames(m_cols) <- paste0("row", 1:nrow(m_cols))
colnames(m_cols) <- paste0("col", 1:ncol(m_cols))
m_cols

# task 3
names <- c("Jane", "Michael", "Mary", "George")
ages <- c(8, 6, 28, 45)
age_sq <- ages ^ 2
gender <- c(0, 1, 0, 1)
human_matrix <- cbind(names, ages, age_sq, gender)
human_matrix

# task 4
info <- list(names, ages, gender)
info[[1]][2]
info[[3]]
names(info) <- c("name", "age", "gender")
info$name

drinks <- c("juice", "tea", "rum", "coffee")
info[[length(info) + 1]] <- drinks

new_person <- list("John", 2, 1, "milk")
for (i in 1:length(info)) {
  info[[i]][length(info[[i]]) + 1] <- new_person[[i]]
}
info

# task 5
s <- "a,b,c,d"
chars <- strsplit(s, ",")
chars
class(chars)
unlist(chars)


index <- "0,72;0,38;0,99;0,81;0,15;0,22;0,16;0,4;0,24"
I <- as.numeric(unlist(strsplit(gsub(",", ".", index), ";")))
I


# part 2.2 ------------------------------------------------------------------

# task 1

A <- diag(x = c(4, 9), nrow = 2, ncol = 2)
rownames(A) <- c("eq1", "eq2")
colnames(A) <- c("x1", "x2")
A

# task 2
eigen <- eigen(A, only.values = TRUE)
eigen$values

# task 3
I <- diag(1, nrow = 2, ncol = 2)
B <- I - A
B

# task 4
f <- c(4, 2)
u <- c(0.2, -0.3)

# task 5
# A * u = f
# u = A^(-1) * f
u_result <- solve(A) %*% f
u_result

# task 6
u_1 <- B %*% u + f
u_2 <- B %*% u_1 + f
u_3 <- B %*% u_2 + f
u_4 <- B %*% u_3 + f
u_5 <- B %*% u_4 + f
u_6 <- B %*% u_5 + f
u_7 <- B %*% u_6 + f

# task 7
u_7
u_result

# task 8
f_div <- f / max(A)
f_div


# part 2.3 ------------------------------------------------------------------

# task 1
step <- 1 # Шаг сетки
dekart_begin <- -5 # Начало сетки
dekart_end <- 5 # Конец сетки

# Задание сеточной поверхности
x <- seq(from = dekart_begin, to = dekart_end, by = step)
y <- x

# Задание двумерной функции на координатной сетке
surface_matrix <- outer(X = x,
                        Y = y,
                        FUN = function(x, y) Re(exp(-1i * 0.5 * x * y)))
dimnames(surface_matrix) <- list(x, y)

summary_path <- "practicals/practical_1/tasks_2/summary.txt"

write(paste("number of matrix elements:", nrow(surface_matrix) * ncol(surface_matrix)), summary_path, append = TRUE, )
write(paste("number of rows:", nrow(surface_matrix)), summary_path, append = TRUE)
write(paste("number of cols:", ncol(surface_matrix)), summary_path, append = TRUE)
write(paste("sum of main diag elements:", sum(diag(surface_matrix))), summary_path, append = TRUE)
write(paste("sum of middle row elements:", sum(surface_matrix["0", ])), summary_path, append = TRUE)
write(paste("sum of middle column elements:", sum(surface_matrix[, "0"])), summary_path, append = TRUE)
write(paste("row sums:", rowSums(surface_matrix)), summary_path, append = TRUE)
write(paste("col sums:", colSums(surface_matrix)), summary_path, append = TRUE)


# task 2
dekart_begin <- as.numeric(readline(prompt = "Enter start: ")) # Начало сетки
dekart_end <- as.numeric(readline(prompt = "Enter end: ")) # Конец сетки
step <- as.numeric(readline(prompt = "Enter step: ")) # Шаг сетки

x <- seq(from = dekart_begin, to = dekart_end, by = step)
y <- x
custom_matrix <- outer(X = x,
                       Y = y,
                       FUN = function(x, y) Re(exp(-1i * 0.5 * x * y)))
dimnames(custom_matrix) <- list(x, y)

summary_2_path <- "practicals/practical_1/tasks_2/summary2.txt"

write(paste("number of matrix elements:", nrow(custom_matrix) * ncol(custom_matrix)), summary_2_path, append = TRUE)
write(paste("number of rows:", nrow(custom_matrix)), summary_2_path, append = TRUE)
write(paste("number of cols:", ncol(custom_matrix)), summary_2_path, append = TRUE)
write(paste("sum of main diag elements:", sum(diag(custom_matrix))), summary_2_path, append = TRUE)
write(paste("row sums:", rowSums(custom_matrix)), summary_2_path, append = TRUE)
write(paste("col sums:", colSums(custom_matrix)), summary_2_path, append = TRUE)

# task 3
sizes <- as.numeric(unlist(read.table("practicals/practical_1/tasks_2/inputs.txt")))

n_begin <- sizes[1]
n_end<- sizes[2]
n_step <- sizes[3]

m_begin <- sizes[4]
m_end<- sizes[5]
m_step <- sizes[6]

x <- seq(from = n_begin, to = n_end, by = n_step)
y <- seq(from = m_begin, to = m_end, by = m_step)

non_squared_matrix <- outer(X = x,
                            Y = y,
                            FUN = function(x, y) Re(exp(-1i * 0.5 * x * y)))

summary_3_path <- "practicals/practical_1/tasks_2/summary3.txt"
dimnames(non_squared_matrix) <- list(x, y)

write(paste("number of matrix elements:", nrow(non_squared_matrix) * ncol(non_squared_matrix)), summary_3_path, append = TRUE)
write(paste("number of rows:", nrow(non_squared_matrix)), summary_3_path, append = TRUE)
write(paste("number of cols:", ncol(non_squared_matrix)), summary_3_path, append = TRUE)
write(paste("sum of main diag elements:", sum(diag(non_squared_matrix))), summary_3_path, append = TRUE)
write(paste("row sums:", rowSums(non_squared_matrix)), summary_3_path, append = TRUE)
write(paste("col sums:", colSums(non_squared_matrix)), summary_3_path, append = TRUE)


# part 2.4 ------------------------------------------------------------------
# Cars

cars_matrix <- as.matrix(cars)
cars_speed <- cbind(c(1), cars_matrix[, 1])
cars_dist <- cars_matrix[, 2]

alpha <- solve(t(cars_speed) %*% cars_speed) %*% t(cars_speed) %*% cars_dist
class(alpha)
alpha <- as.vector(alpha)
class(alpha)

alpha_c <- alpha[1]
alpha_x <- alpha[2]

print(paste("alpha_c =", alpha_c))
print(paste("alpha_x =", alpha_x))

cars_speed_lm <- cars_matrix[, 1]
cars_dist_lm <- alpha_c + cars_speed_lm * alpha_x

dist_residuals <- cars_dist_lm - cars_dist

avg <- sum(dist_residuals) / length(dist_residuals)
avg

std <- (sum((dist_residuals - avg) ^ 2) / length(dist_residuals)) ^ 0.5
std
