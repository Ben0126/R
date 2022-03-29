# ---------
#  6-3
# ---------
# ---------------------------------------------------------- #

#1不可以
#2向量

download.file("http://www.jaredlander.com/data/diamonds.db",
              destfile = "data/diamonds.db", mode='wb')

# ---------------------------------------------------------- #

library(RSQLite)

# ---------------------------------------------------------- #

drv <- dbDriver('SQLite')
class(drv)

# ---------------------------------------------------------- #

con <- dbConnect(drv, 'data/diamonds.db')
class(con)

# ---------------------------------------------------------- #

dbListTables(con)
dbListFields(con, name='diamonds')
dbListFields(con, name='DiamondColors')

# ---------------------------------------------------------- #

# 用SELECT * 查詢一個表
diamondsTable1 <- dbGetQuery(con,
                            "SELECT carat, cut,color,price FROM diamonds",
                            stringsAsFactors=FALSE)


diamondsTable2 <- dbGetQuery(con,
                             "SELECT carat, cut,color,price FROM diamonds where price<1000",
                             stringsAsFactors=FALSE)

colorTable1 <- dbGetQuery(con,
                          "SELECT carat, cut,color,price FROM DiamondColors",
                          stringsAsFactors=FALSE)
#  將兩張表合併起來
longQuery <- "SELECT * FROM diamonds, DiamondColors
              WHERE
              diamonds.color = DiamondColors.Color"

diamondsJoin <- dbGetQuery(con, longQuery,
                           stringsAsFactors=FALSE)

longQuery = "SELECT diamonds.cut.dimonds.color ,DiamondColors.color
FROM diamonds inner join DiamondColor on Diamonds.color = DiamondColors.color"

theUrl <- "http://www.jaredlander.com/data/Tomato%20First.csv"

# ---------------------------------------------------------- #

save(n, r, w, file = "data/multiple.rdata")

rm(n, r, w)

load("data/multiple.rdata")


head(diamondsTable)
head(colorTable)
head(diamondsJoin)

# ---------------------------------------------------------- #