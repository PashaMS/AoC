#-------------------------------------------------------------------------------------------------------------------------#
# Advent of Code
# Year: 2019
# Day: 1 
# Title: The Tyranny of the Rocket Equation
# Programmer: Pasha Foroudi
# R Version: 4.1.1
#-------------------------------------------------------------------------------------------------------------------------#
library(tictoc)
folder <- "AoC_2019" 

#=======================================================#
# Part 1 - pure BASE R solution
#=======================================================#

#create *fuel required* function
fuel_req <- function(mass) {
  floor(mass/3)-2
}
  
# call in input, make numeric vector
input <- readLines(file.path("~/AoC", folder, "data/day1_input.txt"), warn = F) |>
  as.numeric()

# apply *fuel required* function to all elements of input
sum_these <- sapply(input, fuel_req)

# answer :)
print(paste("The answer is", sum(sum_these)))

#=======================================================#
# Part 2 - pure BASE R solution
#=======================================================#
tic()
#create *fuel required* function, this time with zero-ing
fuel_req2 <- function(mass) {
  res <- floor(mass/3)-2
  if(res <= 0){
    res <- 0
  }
  return(res)
}

# call in input, make numeric vector
input <- readLines(file.path("~/AoC", folder, "data/day1_input.txt"), warn = F) |>
  as.numeric()

# create matrix to affix future vectors of fuel data
v <- sapply(input, fuel_req2)
m <- matrix(data = v, ncol = length(input))

while (all(v != 0)) {
  v <- sapply(v, fuel_req2)
  m <- rbind(m, v)
}

print(paste("The answer is", sum(m)))
toc()
