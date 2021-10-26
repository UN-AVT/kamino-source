

Replace missing values with:

- mean
- median
- mode

impute_outliers <- function(x,removeNA = TRUE){
    quantiles <- quantile( x, c(.05, .95 ),na.rm = removeNA )
    x[ x < quantiles[1] ] <- mean(x,na.rm = removeNA )
    x[ x > quantiles[2] ] <- median(x,na.rm = removeNA )
    x
}

imputed_data <- impute_outliers(ozoneData$pressure_height)

Handling extreme values with capping

To handle extreme values that lie outside the 1.5 * IQR(Inter Quartile Range) limits, we could cap them by replacing those observations that lie below the lower limit, with the value of 5th percentile and those that lie above the upper limit, with the value of 95th percentile.

replace_outliers <- function(x, removeNA = TRUE) {
     pressure_height <- x
     qnt <- quantile(pressure_height, probs=c(.25, .75), na.rm = removeNA)
     caps <- quantile(pressure_height, probs=c(.05, .95), na.rm = removeNA)
     H <- 1.5 * IQR(pressure_height, na.rm = removeNA)
     pressure_height[pressure_height < (qnt[1] - H)] <- caps[1]
     pressure_height[pressure_height > (qnt[2] + H)] <- caps[2]
     pressure_height
 }

capped_pressure_height <- replace_outliers(ozoneData$pressure_height)