#=======================================================#
# Part 1 - pure BASE R solution
#=======================================================#
readLines("~/AoC/AoC_2015/data/day1_part1", warn = F) |> 
  gsub(pattern = "\\(", replacement = "1,") |> 
  gsub(pattern = "\\)", replacement = "-1,") |>
  gsub(pattern = "1,$", replacement = "1") |>
  strsplit(split = ",") |>
  unlist() |>
  as.numeric() |>
  sum()
  
#=======================================================#
# Part 2 - use while loop - still all BASE R :)
#=======================================================#
x <- readLines("~/AoC/AoC_2015/data/day1_part1", warn = F) |> 
  gsub(pattern = "\\(", replacement = "1,") |> 
  gsub(pattern = "\\)", replacement = "-1,") |>
  gsub(pattern = "1,$", replacement = "1") |>
  strsplit(split = ",") |>
  unlist() |>
  as.numeric()

i <- 0
y <- 0

while(y >= 0){
  i <- i + 1
  y <- sum(x[1:i])
}
print(i)
