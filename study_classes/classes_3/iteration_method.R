simple_iteration_method <- function (
    A, f, u_0 = NULL, eps = 10e-5, max_iter = 10000
) {
    if (is.null(u_0)) {
        u_0 <- runif(nrow(A))
    }

    max_af <- max(A, f)
    A <- A / max_af
    f <- f / max_af

    B <- diag(rep(1, nrow(A))) - A
    u_1 <- u_0
    for (i in 1:max_iter) {
        u_1 <- B %*% u_0 + f
        if (max(abs(u_1 - u_0)) < eps) {
            break
        }
        u_0 <- u_1
    }
    return(u_1)
}

simple_iteration_method()