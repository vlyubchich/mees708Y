checkweather <- function(x, verbose = FALSE, y) {
    # x is temperature, degrees C
    # verbose is logical value, indicating to print results
    if (FALSE) {
        x = 5
    }
    #xf <- 32 + 1.8*x
    # print(paste0("In Farenheit it is ", xf, "."))
    if (verbose) {
        if (x < 0) {
            print("It's freezing!")
            if (x < 32) {
                print("And kids don't go to school.")
                print(x ^ y)
            }
        } else {
            print("It's not freezing.")
        }
    }
    # return(xf)
    32 + 1.8*x
}



print("finished sourcing")
