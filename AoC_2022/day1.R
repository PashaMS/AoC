#=======================================================#
# Part 1 - pure BASE R solution
#=======================================================#
input <- readLines("~/AoC/AoC_2022/data/day1_input.txt", warn = F)
ind <- which(input == "")
# input_num <- as.numeric(input) |> na.omit()

splitAt <- function(x, pos) unname(split(x, cumsum(seq_along(x) %in% pos)))

lapply(splitAt(input, ind), function(x) sum(as.numeric(x), na.rm = T)) |> 
  unlist() |>
  max()

#=======================================================#
# Part 2 - pure BASE R solution
#=======================================================#
lapply(splitAt(input, ind), function(x) sum(as.numeric(x), na.rm = T)) |> 
  unlist() |> 
  sort() |>
  tail(3) |>
  sum()
