myplot <- function(x, plotmean = FALSE, color = "red"){
    if ((is.null(dim(x))) == TRUE){
        stop("Quantiles per time point cannot be calculated with only a numeric vector.")
    }
    x = as.data.frame(x) #need to convert to matrix/dataframe
    if (ncol(x) != 5){
        x <- tibble::rownames_to_column(x, "Year")
    }
    x[,1] <- as.numeric(x[,1])
    x <- subset(x,!is.na(x[,2]))
    mean <- (sum(x[,2])/nrow(x[,2]))
    median = apply(x,1,median,na.rm = TRUE)
    q1 = apply(x, 1, quantile, na.rm = TRUE, probs = 0.25)
    if (plotmean){
        ggplot() + aes(x[,1],x[,2]) +
            geom_point() +
            geom_line(aes(x[,1],x[,2]),color = "black") +
            ggtitle("Cluster 3") +
            xlab("Year") +
            ylab("Attainment Deficit (%)") +
            theme(plot.title.position = "plot") +
            geom_quantile(aes(quantiles = q1, color = "red"), method = "rqss") +
            geom_hline(aes(yintercept = mean(x[,2], na.rm=TRUE), color = "blue")) +
            geom_hline(aes(yintercept = median(x[,2], na.rm=TRUE), color = "green")) +
            scale_color_hue(labels = c("mean","median","quantiles")) + theme_classic()
    } else {
        x %>%
            ggplot() + aes(x[,1],x[,2]) +
            geom_point() +
            geom_line(aes(x[,1],x[,2]),color = "black") +
            ggtitle("Cluster 3") +
            xlab("Year") +
            ylab("Attainment Deficit (%)") +
            geom_quantile(aes(quantiles = q1, color = "blue"), method = "rqss") +
            geom_hline(aes(yintercept = median(x[,2], na.rm=TRUE), color = "gray")) +
            scale_color_hue(labels = c("quantiles", "median")) +
            theme(plot.title.position = "plot") + theme_classic()
    }
}
