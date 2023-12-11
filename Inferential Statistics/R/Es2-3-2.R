# Observed sample data
observed_data <- c(8.935, 0.492, 6.951, 4.102, 0.111, 2.699, 3.255, 6.254, 2.120, 29.389)

# Create a boxplot
boxplot(observed_data, main = "Boxplot of Observed Data", ylab = "Values")

# Generate a summary of the boxplot
summary_stats <- summary(observed_data)
cat("Summary Statistics:\n")
cat("Min:", summary_stats[1], "\n")
cat("1st Quartile (Q1):", summary_stats[2], "\n")
cat("Median (Q2):", summary_stats[3], "\n")
cat("Mean:", mean(observed_data), "\n")
cat("3rd Quartile (Q3):", summary_stats[5], "\n")
cat("Max:", summary_stats[6], "\n")

# Create a comparison boxplot using ggplot2
library(ggplot2)

ggplot(data.frame(x = observed_data), aes(x = "Observed Data", y = observed_data)) +
  geom_boxplot() +
  labs(title = "Boxplot of Observed Data (ggplot2)", y = "Values") +
  theme_minimal()