myplot <- function(df, main = my_title, xlab = xlabel, ylab = ylabel,
                   col = "black", plotmean = TRUE, ...){
    df <- as.matrix(df, na.omit(df))
    if (is.data.frame(df)) { all(dim(df) == c(1,1))}
    if (is.matrix(df) == TRUE) {
        print("successful check")
    } else {
        stop("Not correct data format")}
    plotmean <- apply(df, 1, mean, na.rm = TRUE)
    q1 <- apply(df, 1, quantile, na.rm = TRUE, probs = 0.25)
    q3 <- apply(df, 1, quantile, na.rm = TRUE, probs = 0.75)
    df2 <- return(data.frame(Mean = plotmean, Q1 = q1, Q3 = q3))
    df3 <- as.numeric(df2)
    tmp = as.numeric(time(df))
    plot(df3, main = "my_title", xlab = "xlabel", ylab = "ylabel",
         las = 1,
         pch = 18,
         col = "black",
         cex = 2,
         type = "b",
         lines(x = tmp, y = plotmean, col = "blue", lty = 2),
         lines(x = tmp, y = q1, col = "green"),
         lines(x = tmp, y = q3, col = "red"),
         legend("topleft", legend = c("Mean", "Average", "Q1 & Q3"),
                col = c("blue", "green", "red")))
}
