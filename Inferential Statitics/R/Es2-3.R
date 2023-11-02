# Observed sample data
observed_data <- c(8.935, 0.492, 6.951, 4.102, 0.111, 2.699, 3.255, 6.254, 2.120, 29.389)

# Create QQ plots
par(mfrow = c(1, 3))  # Create a 1x3 layout for the plots

# Function to create QQ plot with the line
create_qq_plot <- function(rate, title) {
  qqplot(qexp(ppoints(length(observed_data)), rate), observed_data,
         xlab = "Theoretical Quantiles", ylab = "Sample Quantiles",
         main = title)
  abline(0, 1, col = "blue")  # Add a line with intercept 0 and slope 1 (y = x)
}

create_qq_plot(1, "QQ Plot against Exp(1)")
create_qq_plot(1/4, "QQ Plot against Exp(1/4)")
create_qq_plot(4, "QQ Plot against Exp(4)")

par(mfrow = c(1, 1))  # Reset the layout

# Save the plots as pictures
dev.print(pdf, 'Documents/Uni/Inferential\ Statitics/R/qqplot_2-3.pdf')
