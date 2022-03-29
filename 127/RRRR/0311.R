#1 不可以

#2 向量

#3-1  
  diamondsTable1 <- dbGetQuery(con,"SELECT carat, cut,color,price FROM diamonds",stringsAsFactors=FALSE)
  diamondsTable2 <- dbGetQuery(con,"SELECT carat, cut,color,price FROM diamonds where price<1000",stringsAsFactors=FALSE)

#4 
  longQuery = "SELECT diamonds.cut.dimonds.color ,DiamondColors.color FROM diamonds inner join DiamondColor on Diamonds.color = DiamondColors.color"

#5 
  save(n, r, w, file = "data/diamondsJoin.rdata")
   save(n, r, w, file = "data/diamondsTable2.rdata")

   rm(n, r, w)

  n
  r
  w
  
  load("data/diamondsJoin.rdata")
  load("data/diamondsTable2.rdata")

#6 
  url <- "https://www.jaredlander.com/2012/02/another-kind-of-super-bowl-pool"
  library(httr)
  
  tabs <- GET(url)
  tabs <- readHTMLTable(rawToChar(tabs$content), stringsAsFactors = F)

#7 json
  