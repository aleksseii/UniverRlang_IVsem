
set.seed(123)
numeric_vector <- round(runif(26, 0, 50))
list_1 <- list(numeric_vector, letters)
list_1

list_1[[1]]
list_1[[2]]

is.vector(list_1[[2]])
list_1[[2]][-c(2, 19)]

list_2 <- list(num_vector = numeric_vector,
               alphabet = numeric_vector,
               data = letters)
list_2$data

names(list_2) <- c("a", "b")
names(list_2)

unlist(list_1)
as.vector(list_1[[1]])
