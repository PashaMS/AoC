#-------------------------------------------------------------------------------------------------------------------------#
# Programmer: Pasha Foroudi
# R Version: 4.1.1
#-------------------------------------------------------------------------------------------------------------------------#
folder <- "AoC_2021" 

#=======================================================#
# Part 1 - pure BASE R solution
#=======================================================#
input <- readLines(file.path("~/AoC", folder, "data/day1_input.txt"), warn = F) |>
  as.numeric()
input_offset <- input[-1]
input_offset_mod <- append(x = input_offset, values = input[length(input)]) 

df1 <- data.frame(input, input_offset_mod)

df1$diff <-ifelse(
  test = df1$input_offset_mod - df1$input > 0,
  yes = "increased",
  no = ifelse(df1$input_offset_mod - df1$input < 0, "decreased", "neither")
)

table(df1$diff) 

table(df1$diff)["increased"]

#=======================================================#
# Part 2 - pure BASE R solution
#=======================================================#
input <- readLines(file.path("~/AoC", folder, "data/day1_input.txt"), warn = F) |>
  as.numeric()

mat1 <- matrix(data = input, nrow = floor(length(input)/3), ncol = 3, byrow = TRUE) 

mat2 <- matrix(data = input[-1], nrow = floor(length(input)/3), ncol = 3, byrow = TRUE)

mat3 <- matrix(data = input[-c(1:2)], nrow = floor(length(input)/3), ncol = 3, byrow = TRUE)

rs_all <- cbind(rowSums(mat1), rowSums(mat2), rowSums(mat3))

x1 <- c(t(rs_all))
x1_offset <- x1[-1]
x2 <- append(x = x1_offset, values = x1[length(x1)]) 

df2 <- data.frame(x1, x2)

df2$diff <-ifelse(
  test = df2$x2 - df2$x1 > 0,
  yes = "increased",
  no = ifelse(df2$x2 - df2$x1 < 0, "decreased", "neither")
)

table(df2$diff) 

table(df2$diff)["increased"]
