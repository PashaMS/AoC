#-------------------------------------------------------------------------------------------------------------------------#
# Advent of Code
# Year: 2018
# Day: 1 
# Title: Chronal Calibration 
# Programmer: Pasha Foroudi
# R Version: 4.1.1
#-------------------------------------------------------------------------------------------------------------------------#
folder <- "AoC_2018" 

#=======================================================#
# Part 1 - pure BASE R solution
#=======================================================#
input <- readLines(file.path("~/AoC", folder, "data/day1_input.txt"), warn = F) |>
  as.numeric()
print(paste("The answer is", sum(input)))

#=======================================================#
# Part 2 - pure BASE R solution
#=======================================================#
input <- readLines(file.path("~/AoC", folder, "data/day1_input.txt"), warn = F) |>
  as.numeric()
input2 <- rep(input, 140)

res_cumsum <- cumsum(input2)

res2 <- as.data.frame(table(res_cumsum))
res3 <- res2[res2$Freq > 1,]

res4 <- data.frame(repeats = res3$res,
                   index = numeric(length = length(res3$res)))

res4$index <- sapply(1:length(res3$res), function(i){
  which(res == res3$res[i])[2]
})

res4[order(res4$index),] |> head(1)
