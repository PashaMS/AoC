#-------------------------------------------------------------------------------------------------------------------------#
# Advent of Code
# Year: 2017
# Day: 1 
# Title: Inverse Captcha
# Programmer: Pasha Foroudi
# R Version: 4.1.1
#-------------------------------------------------------------------------------------------------------------------------#
folder <- "AoC_2017" 

#=======================================================#
# Part 1 - pure BASE R solution
#=======================================================#

# call in input, make numeric vector
input <- readLines(file.path("~/AoC", folder, "data/day1_input.txt"), warn = F) |>
  strsplit(split = "") |> 
  unlist() |>
  as.numeric()

# to create "loop" append first element of vector to end
input_mod <- append(input, input[1])

sum_these <- vector(mode = "numeric")

for (i in 1:(length(input_mod)-1)) {
  if (input_mod[i] == input_mod[i+1]) {
    sum_these <- append(sum_these, input_mod[i])
  }
}

print(paste("The answer is", sum(sum_these)))

#=======================================================#
# Part 2 - pure BASE R solution
#=======================================================#
# call in input, make numeric vector
input <- readLines(file.path("~/AoC", folder, "data/day1_input.txt"), warn = F) |>
  strsplit(split = "") |> 
  unlist() |>
  as.numeric()

# to create "loop" append input to itself -- giving twice the length
input_mod <- append(input, input)

sum_these <- vector(mode = "numeric")

for (i in 1:(length(input))) {
  if (input_mod[i] == input_mod[i+(length(input)/2)]) {
    sum_these <- append(sum_these, input_mod[i])
  }
}

print(paste("The answer is", sum(sum_these)))
