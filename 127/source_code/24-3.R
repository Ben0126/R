# ---------
#  24-3
# ---------
# ---------------------------------------------------------- #

library(quantmod)
load("data/att.rdata")

library(quantmod)
att <- getSymbols("T", auto.assign = FALSE)

# ---------------------------------------------------------- #

library(xts)

# ��ܸ��
head(att)
plot(att)

# ---------------------------------------------------------- #

chartSeries(att)
addBBands()
addMACD(32, 50, 12)

# ---------------------------------------------------------- #

attClose <- att$T.Close
class(attClose)
head(attClose)

# ---------------------------------------------------------- #

library(rugarch)
attSpec <- ugarchspec(variance.model=list(model="sGARCH",
                                          garchOrder=c(1, 1)),
                      mean.model=list(armaOrder=c(1, 1)),
                      distribution.model="std")

# ---------------------------------------------------------- #

attGarch <- ugarchfit(spec = attSpec, data = attClose)
attGarch

# ---------------------------------------------------------- #

# attGarch�O�@��S4����,�ح�����ƻݳz�L@�ӹ復�i��M��
# �Ӹ���x�s�榡��list,�]���ݳq�L$��Ū��
plot(attGarch@fit$residuals, type="l")
plot(attGarch, which=10)

# ---------------------------------------------------------- #

# ARMA(1,1)
attSpec1 <- ugarchspec(variance.model=list(model="sGARCH",
                                           garchOrder=c(1, 1)),
                       mean.model=list(armaOrder=c(1, 1)),
                       distribution.model="std")
# ARMA(0,0)
attSpec2 <- ugarchspec(variance.model=list(model="sGARCH",
                                           garchOrder=c(1, 1)),
                       mean.model=list(armaOrder=c(0, 0)),
                       distribution.model="std")
# ARMA(0,2)
attSpec3 <- ugarchspec(variance.model=list(model="sGARCH",
                                           garchOrder=c(1, 1)),
                       mean.model=list(armaOrder=c(0, 2)),
                       distribution.model="std")
# ARMA(1,2)
attSpec4 <- ugarchspec(variance.model=list(model="sGARCH",
                                           garchOrder=c(1, 1)),
                       mean.model=list(armaOrder=c(1, 2)),
                       distribution.model="std")

attGarch1 <- ugarchfit(spec=attSpec1, data=attClose)
attGarch2 <- ugarchfit(spec=attSpec2, data=attClose)
attGarch3 <- ugarchfit(spec=attSpec3, data=attClose)
attGarch4 <- ugarchfit(spec=attSpec4, data=attClose)

infocriteria(attGarch1)
infocriteria(attGarch2)
infocriteria(attGarch3)
infocriteria(attGarch4)

# ---------------------------------------------------------- #

attPred <- ugarchboot(attGarch, n.ahead=50,
                      method = c("Partial", "Full")[1])
plot(attPred, which=2)

# ---------------------------------------------------------- #

# ���Ƴ��S�v���t��,�ç�Ĥ@���ܦ�NA�Ȫ���Ʋ�����
attLog <- diff(log(attClose))[-1]

# �إ߼ҫ��W��
attLogSpec <- ugarchspec(variance.model=list(model="sGARCH",
                                             garchOrder=c(1, 1)),
                         mean.model=list(armaOrder=c(1, 1)),
                         distribution.model="std")

# �إ߼ҫ�
attLogGarch <- ugarchfit(spec=attLogSpec, data=attLog)
infocriteria(attLogGarch)

# ---------------------------------------------------------- #