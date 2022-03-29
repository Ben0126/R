# ---------
#  21-1
# ---------
# ---------------------------------------------------------- #

# Ū�����
housing <- read.table("data/housing.csv", sep=",", header=TRUE,
                      stringsAsFactors=FALSE)

# ����ƨ��W
names(housing) <- c("Neighborhood", "Class", "Units", "YearBuilt",
                    "SqFt", "Income", "IncomePerSqFt", "Expense",
                    "ExpensePerSqFt", "NetIncome", "Value",
                    "ValuePerSqFt", "Boro")

# �����@�����s��
housing <- housing[housing$Units < 1000, ]
head(housing)

# �إ߼ҫ�
house1 <- lm(ValuePerSqFt ~ Units + SqFt + Boro, data=housing)
summary(house1)

# ��ı�Ƽҫ�
library(coefplot)
coefplot(house1)

# ---------------------------------------------------------- #

library(ggplot2)

# �˵��Q�d�T�᪺lm�ҫ�������ˤl
head(fortify(house1))

# �x�s�@�ӹϨ�@�Ӫ���
# �i�H�o�{��ڭ̥ηs�إߪ����Ƨ@��x�My�b
# x�b��.fitted�My�b��.resid
h1 <- ggplot(aes(x=.fitted, y=.resid), data = house1) +
             geom_point() +
             geom_hline(yintercept = 0) +
             geom_smooth(se = FALSE) +
             labs(x="Fitted Values", y="Residuals")

# ��ܸӹ�
h1

# ---------------------------------------------------------- #

h1 + geom_point(aes(color = Boro))

# ---------------------------------------------------------- #

# �q�L���ب��ø��
plot(house1, which=1)

# ---------------------------------------------------------- #

# �P�˪���,���ھ�Boro��W�F�C��
plot(house1, which=1, col=as.numeric(factor(house1$model$Boro)))

# ��Ϫ��@�ǻ���
legend("topright", legend=levels(factor(house1$model$Boro)), pch=1,
       col=as.numeric(factor(levels(factor(house1$model$Boro)))),
       text.col=as.numeric(factor(levels(factor(house1$model$Boro)))),
       title="Boro")

# ---------------------------------------------------------- #

plot(house1, which = 2)
ggplot(house1, aes(sample = .stdresid)) + stat_qq() + geom_abline()

# ---------------------------------------------------------- #

ggplot(house1, aes(x = .resid)) + geom_histogram()

# ---------------------------------------------------------- #