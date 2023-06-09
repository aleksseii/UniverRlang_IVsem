# part 5.1 -----------------------------------------------------------

# task 1
count_types <- function(db) {
    types <- sapply(db[1,], class)
    numeric_count <- sum(as.integer(types == "numeric" | types == "integer"))
    factor_count <- sum(as.integer(types == "factor"))
    char_count <- sum(as.integer(types == "character"))
    res <- c("numeric" = numeric_count, "factor" = factor_count, "character" = char_count)
}

# task 2
only_numeric <- function(db) {
    types <- sapply(df[1,], class)
    new_df <- df[, which((types == "numeric" | types == "integer"))]
}

# task 3
my_median <- function(vec) {
    if (is.numeric(vec))
        med <- median(vec)
    else
        print("Vector is not numeric, cannot compute the median")
}

id <- 1:3
country <- c("Flatland", "Wonderland", "Sphereland")
craziness <- c(20, 15, 18)
region_type <- c("A", "B", "A")
author <- c("Abbot", "Carroll", "Burger")
size <- c(10, 100, 30)
df <- data.frame(id, country, craziness, region_type, author, size)
df
print(count_types(df))
print(only_numeric(df))


# part 5.2 -----------------------------------------------------------

if ("quantmod" %in% rownames(installed.packages()) == FALSE) {
    install.packages("quantmod")
}
library(quantmod)

if ("stringr" %in% rownames(installed.packages()) == FALSE) {
    install.packages("stringr")
}
library(stringr)

downloadable_stocks <- c("ATVI", "^IXIC")

arifm <- function(x, dt) {
    y <- c()
    for (t in seq(dt + 1, length(x) - dt)) {
        yt <- log((x[t - dt] + x[t + dt]) / (2 * x[t]))
        y <- c(y, yt)
    }
    return(y)
}

geom <- function(x, dt) {
    y <- c()
    for (t in seq(dt + 1, length(x) - dt)) {
        yt <- log((x[t - dt] * x[t + dt]) / (x[t] * x[t]))
        y <- c(y, yt)
    }
    return(y)
}

garm <- function(x, dt) {
    y <- c()
    for (t in seq(dt + 1, length(x) - dt)) {
        yt <- log((2 * x[t - dt] * x[t + dt]) / (x[t] * (x[t - dt] + x[t + dt])))
        y <- c(y, yt)
    }
    return(y)
}

funcs <- c("Arifm" = arifm, "Geom" <- geom, "Garm" = garm)

out_of_trend <- function(x, dt, method = "Arifm") {
    x <- x + min(x) + 1

    if (!(is.numeric(x)) || !(is.numeric(dt))) {
        res <- 'not numeric x or dt'
        return(res)
    }
    if (length(x) < 3 || dt > (ceiling(length(x) / 2) - 1))
        return("wrong lenght")
    res <- 'wrong method'
    for (thing in names(func_dict)) {
        if (method == thing)
            return(res <- (func_dict[[thing]])(x, dt))
    }
    return(res)
}

result <- out_of_trend(y_df$YNDX.Close, 1000)

t <- seq(0, 10, 0.1)
x <- 2 * t + 3 + sin(2 * t)
plot(t, x)

print(sum(x) / length(x))
xn <- out_of_trend(x, 5, "Garm")
plot(t[6:(101 - 5)], xn)
print(sum(xn) / length(xn))

alter_johns <- function(y) {
    a <- c()
    n <- length(y)
    for (t in seq(1, (n))) {
        k <- 1 / (n - t)
        s <- 0
        for (i in seq(1, (n - t))) {
            s <- s + abs(y[i + t] - y[i])
        }
        at <- s * k
        a <- c(a, at)
    }
    return(a)
}

result_aj <- alter_johns(xn)
plot(t[6:(101 - 6)], result_aj)

ind_t <- which(min(result_AJ[20:50]) == result_AJ) # индекс элемента с лок мин
t[ind_t] # период

out_trend <- out_of_trend(y_df$YNDX.Adjusted, 250)
aj_2 <- alter_johns(out_trend)
plot(aj_2)


# part 5.3 -----------------------------------------------------------

# A * X = B
SIM <- function(A, u0, f, n_iter = 10e5, eps = 10e-7) {
    u <- u0
    for (k in 1:n_iter) {
        u_new <- u + A(u) %*% (f - A(u0) %*% u)
        if (norm(u_new - u) < eps) {
            return(u_new)
        }
        u <- u_new
    }
    stop("end of iterations")
}
