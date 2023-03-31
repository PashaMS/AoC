#=======================================================#
# Part 1 - pure BASE R solution
#=======================================================#
input <- readLines("~/AoC/AoC_2020/data/day1_input.txt", warn = F) |>
  as.numeric()
j <- 0
sapply(input, function(x) {
  j <- j + 1
  first_num <- x
  sapply(input[-1 * j], function(y) {
    second_num <- y
    total <- first_num + second_num
    if (total == 2020) {
      return(
        list(
          paste(first_num, "+", second_num, "=", total),
          paste("And their product is:", first_num * second_num)
        )
        )
    }
  })
}, simplify = T) |> unlist()

#=======================================================#
# Part 2 - pure BASE R solution
#=======================================================#
input <- readLines("~/AoC/AoC_2020/data/day1_input.txt", warn = F) |>
  as.numeric()
j <- 0
sapply(input, function(x) {
  j <- j + 1
  first_num <- x
  sapply(input[-1 * j], function(y) {
    second_num <- y
    sapply(input[-1 * j], function(z) {
      third_num <- z
      total <- first_num + second_num + third_num
      if (total == 2020) {
        return(
          list(
            paste(first_num, "+", second_num, "+", third_num, "=", total),
            paste("And their product is:", first_num * second_num * third_num)
          )
        )
      }
    })
  })
}, simplify = T) |> unlist()
