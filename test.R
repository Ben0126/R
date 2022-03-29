library(tidyquant)

# 下載資料
stockData <- c("SPY") %>%
  tq_get(get = "stock.price", from = "2020-03-01", to = "2022-03-16")

# 觀看資料
stockData

#===================
#匯入quantmod
library(quantmod)
#取得股價資訊
getSymbols('SPY')
#getSymbols('BTC-USD')
#印出資訊其中包含open、high、low、close、volume、adjusted
SPY
#rename(BTC-USD=BTC)
#BTC
#繪製K線
chartSeries(last(SPY, '6 years'),theme="white")
#chartSeries(last(BitcoinUSD, '6 years'),theme="white")
ma_20<-runMean(SPY[,4],n=20)#20日均線(20ma)
ma_60<-runMean(SPY[,4],n=60)#60日均線(60ma)
ma_200<-runMean(SPY[,4],n=200)#200日均線(60ma)
addTA(ma_20,on=1,col="blue") #畫出20日均線且為藍色線
addTA(ma_60,on=1,col="red") #畫出60日均線且為紅色線
addTA(ma_200,on=1,col="green") #畫出200日均線且為紅色線

