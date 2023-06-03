print("Hello World!")

x <- 1:100
print(x)

?print
help(print)

a <- "my_string"
b <- 5 > 5

x <- 010
print(x)

3 + 4 * exp(1.7892) + 5i -> right_var
right_var

!0

complex_var <- 5 + 8i
is.complex(complex_var)

var_vec <- 10.42
is.vector(var_vec)

var_1_10 <- 1:10
print(var_1_10)

var_1_10 <- var_1_10 + 1:3
var_1_10

vec1 <- numeric(12)
vec1

vec2 <- character(12)
vec2

vec3 <- 28:3
vec3

vec4 <- seq(from = -6.123, to = 131.14, by = 1.5)
vec4

vec5 <- c(47, "cow", TRUE)

vec5 <- c(vec5, vec4, vec2)
vec5
rep(5, 10)

arr_vec1 <- seq(-5, 5, length.out = 25)
arr_vec1

arr_vec2 <- 1:21
arr_vec2

arr_vec1 + arr_vec2
arr_vec1 - arr_vec2
arr_vec1 * arr_vec2
arr_vec1 / arr_vec2

arr_vec1 %*% t(arr_vec2)

sin(arr_vec1)

paste(1:21, c("var", "non-var"), sep = "\\")

set.seed(123)
test_vector <- round(runif(20, -5, 6), 2)

test_vector[1]
test_vector[2:12]
test_vector[seq(1, 20, 3)]
test_vector[-5] # do not choose 5-th element
test_vector[-c(1, 3, 2)]
test_vector[test_vector > 0]

names(test_vector) <- paste("var", 1:20)
names(test_vector)
test_vector["var 12"]
