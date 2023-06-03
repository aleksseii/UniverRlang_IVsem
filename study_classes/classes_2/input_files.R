terminal_line <- readline("Input here:")
terminal_line

input_num <- as.numeric(readline("Number: "))
input_num

input_vec <- readline("vector elements:")
as.numeric(strsplit(input_vec, split = "[[:punct:] ]")[[1]])

input_from_file <- readLines("study_classes/classes_2/input_nums.txt")
input_from_file

list1 <- list(numerics = c(1, 2, 3, 4),
              characters = c("blue", "red", "FF0AB"))
list1$numerics
list1[[2]][2]

list1$characters[3]
