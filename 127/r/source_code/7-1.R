# ---------
#  7-1
# ---------
# ---------------------------------------------------------- #

library(ggplot2)
data(diamonds)
head(diamonds)

# ---------------------------------------------------------- #
# ---------
#  7-1-1
# ---------
# ---------------------------------------------------------- #

hist(diamonds$carat, main = "Carat Histogram", xlab = "Carat")

# ---------------------------------------------------------- #
# ---------
#  7-1-2
# ---------
# ---------------------------------------------------------- #

plot(price ~ carat, data = diamonds)

# ---------------------------------------------------------- #

plot(diamonds$carat, diamonds$price)

# ---------------------------------------------------------- #
# ---------
#  7-1-3
# ---------
# ---------------------------------------------------------- #

boxplot(diamonds$carat)

# ---------------------------------------------------------- #
