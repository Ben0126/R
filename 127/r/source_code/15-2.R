# ---------
#  15-2
# ---------
# ---------------------------------------------------------- #

library(readr)
colorsURL <- 'http://www.jaredlander.com/data/DiamondColors.csv'
diamondColors <- read_csv(colorsURL)

diamondColors

# ---------------------------------------------------------- #

# ���Jdiamonds���(�b�L���Jggplot2�M�󪺱��p�U)
data(diamonds, package='ggplot2')
unique(diamonds$color)

# ---------------------------------------------------------- #

library(dplyr)
left_join(diamonds, diamondColors, by=c('color'='Color'))

# ---------------------------------------------------------- #

left_join(diamonds, diamondColors, by=c('color'='Color')) %>%
          select(carat, color, price, Description, Details)

# ---------------------------------------------------------- #

left_join(diamonds, diamondColors, by=c('color'='Color')) %>%
          distinct(color, Description)
diamondColors %>% distinct(Color, Description)
# ---------------------------------------------------------- #

right_join(diamonds, diamondColors, by=c('color'='Color')) %>% nrow
diamonds %>% nrow

# ---------------------------------------------------------- #

all.equal(
          left_join(diamonds, diamondColors, by=c('color'='Color')),
          inner_join(diamonds, diamondColors, by=c('color'='Color'))
          )

# ---------------------------------------------------------- #

all.equal(
          right_join(diamonds, diamondColors, by=c('color'='Color')),
          full_join(diamonds, diamondColors, by=c('color'='Color'))
          )

# ---------------------------------------------------------- #

semi_join(diamondColors, diamonds, by=c('Color'='color'))

# ---------------------------------------------------------- #

anti_join(diamondColors, diamonds, by=c('Color'='color'))

# ---------------------------------------------------------- #

diamondColors %>% filter(Color %in% unique(diamonds$color))
diamondColors %>% filter(!Color %in% unique(diamonds$color))

# ---------------------------------------------------------- #