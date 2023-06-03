for (iter in c("cow1", "cow2", "cow3", "cow3")) {
    print(iter)
}

for (iter_num in -5:20) {
    print(iter_num)
}

iter <- 9
step <- 2
while (iter > 0) {
    iter <- iter - step
    print(iter)
}

repeat { # same as while (true)
    break
#     continue
}

flag <- 3
if (flag == 3) {
    print("state 3")
} else if (flag == 2) {
    print("state 2")
} else {
    print("state 1")
}

iter <- 9
repeat {
    iter <- iter + 3
    if (iter > 21) {
        break
    }
}

set.seed(123)
vec_numeric <- round(runif(20, -3, 10))
ifelse(test = vec_numeric > 0, yes = vec_numeric * 5, no = vec_numeric / 2)

ifelse(vec_numeric > 5, vec_numeric * 5,
       ifelse(vec_numeric < 0, abs(vec_numeric), vec_numeric))

elements_to_check <- c(0, 2)

if (prod(elements_to_check %in% vec_numeric)) {
    print("yep prod")
}

if(all(elements_to_check %in% vec_numeric)) {
    print("yep all")
}

# matrix
mat1 <- matrix(data = 1:9, nrow = 3, byrow = TRUE)
mat1

# append colon
mat2 <- cbind(mat1, c(7 ,0, 9))
mat2

# append row
mat3 <- rbind(mat2, c(-1, 5, 18, 9.1))
mat3

rownames(mat3) <- paste0("row", 1:nrow(mat3))
colnames(mat3) <- paste0("col", 1:ncol(mat3))

mat3[-3, c(2, 4)]

# mat3[c("row1", "row2"), ]
# mat3[, c("col2", "col3")]

nrow(mat3)
ncol(mat3)
length(mat3)

t(mat3)     # транспонировать
det(mat3)   # определитель
eigen(mat3) # собственные значения и вектора

solve(mat3) # рещенние СЛАУ (в частном случае -- обратная матрица)
solve(mat3) %*% mat3
?solve

mat3 > 3 | mat3 < 0

mat_sim <- matrix(seq(-27, 18, length.out = 16), nrow = 4)
mat3 + mat_sim
mat3 * mat_sim
mat3 %% mat_sim
mat3 %/% mat_sim

exp(mat3)
sin(mat3)

sigma <- function (x) {
    return( 1 / (1 + exp(-x)))
}
sigma(mat3)


matrix_diag1 <- diag(nrow = 5, ncol = 8)
matrix_diag1

matrix_diag2 <- diag(c(1, 4, 2, 1))
matrix_diag2

diag(matrix_diag2)

rowSums(mat3)
colSums(mat3)


apply(X = mat3, MARGIN = 1, FUN = sum)
apply(X = mat3, MARGIN = 1, FUN = mean)
apply(X = mat3, MARGIN = 1, FUN = median)
apply(X = mat3, MARGIN = 1, FUN = diff)


apply(X = mat3, MARGIN = 1, FUN = function(x) x[2])
apply(X = mat3, MARGIN = 1, FUN = function(x) x + 1 / x)

upper.tri(mat3)
lower.tri(mat3)

mat3[upper.tri(mat3)] <- 19:24
mat3

mat3 %*% mat_sim
