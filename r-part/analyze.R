args <- commandArgs(trailingOnly = TRUE)
df <- read.csv(args[1])
mean_salary <- mean(df$salary, na.rm = TRUE)
write(paste("Mean Salary: ", mean_salary), file = "analyze_output.txt")

