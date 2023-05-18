#-------------------------------------------------------------------------------------------------------------------------#
# Advent of Code
# Year: 2016
# Day: 1 
# Title: No Time for a Taxicab
# Programmer: Pasha Foroudi
# R Version: 4.1.1
#-------------------------------------------------------------------------------------------------------------------------#
library(tictoc)
folder <- "AoC_2016" 

#=======================================================#
# Part 1 
#=======================================================#
tic()
# call in input, make numeric vector
input <- readLines(file.path("~/AoC", folder, "data/day1_input.txt"), warn = F) |>
  strsplit(split = ", ") |>
  unlist()

# convenience functions for extracting turn made and numeric distance
turn_extract <- function(x) {
  gsub("\\d+", "", x)
}

num_extract <- function(x) {
  gsub("L|R", "", x) |> 
    as.numeric()
}

# initialize position & direction
position <- c(0, 0)
direction <- 1 # start with pointing north

# initialize final matrix
mat_fin <- matrix(data = c(0,0), ncol = 2)
list_fin <- list()

# run loop
for (i in input) {
  # extract turn and distance
  turn <- turn_extract(i)
  distance <- num_extract(i)
  
  # update position and direction using Modulo
  if (turn == "L") {
    direction <- (direction-1)%%4
  } else if (turn == "R") {
    direction <- (direction+1)%%4
  }
  
  # move current direction
  if (direction == 1) {
    position[1] <- position[1] + distance
  } else if (direction == 2) {
    position[2] <- position[2] + distance
  } else if (direction == 3) {
    position[1] <- position[1] - distance
  } else {
    position[2] <- position[2] - distance
  }
}

# answer :)
print(paste("The answer is", position |> abs() |> sum()))
toc()


#=======================================================#
# Part 2
#=======================================================#
tic()

# call in input, make numeric vector
input <- readLines(file.path("~/AoC", folder, "data/day1_input.txt"), warn = F) |>
  strsplit(split = ", ") |>
  unlist()

# convenience functions for extracting turn made and numeric distance
turn_extract <- function(x) {
  gsub("\\d+", "", x)
}

num_extract <- function(x) {
  gsub("L|R", "", x) |> 
    as.numeric()
}

# initialize position & direction
position <- c(0, 0)
direction <- 1 # start with pointing north

# initialize final matrix
mat_fin <- matrix(data = c(0,0), ncol = 2)

# run loop
for (i in input) {
  # extract turn and distance
  turn <- turn_extract(i)
  distance <- num_extract(i)
  
  # update position and direction using Modulo
  if (turn == "L") {
    direction <- (direction-1)%%4
  } else if (turn == "R") {
    direction <- (direction+1)%%4
  }
  for(add in seq_len(distance)) {
    # move current direction
    if (direction == 1) {
      position[1] <- position[1] + 1
    } else if (direction == 2) {
      position[2] <- position[2] + 1
    } else if (direction == 3) {
      position[1] <- position[1] - 1
    } else {
      position[2] <- position[2] - 1
    }
    mat_fin <- rbind(mat_fin, position) 
  }
}

# answer :)
print(paste("The answer is", 
            mat_fin[which(duplicated(mat_fin))[1],] |> 
              abs() |>
              sum()))
toc()
