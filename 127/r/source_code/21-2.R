# ---------
#  21-2
# ---------
# ---------------------------------------------------------- #

house2 <- lm(ValuePerSqFt ~ Units * SqFt + Boro, data=housing)
house3 <- lm(ValuePerSqFt ~ Units + SqFt * Boro + Class,
             data=housing)
house4 <- lm(ValuePerSqFt ~ Units + SqFt * Boro + SqFt*Class,
             data=housing)
house5 <- lm(ValuePerSqFt ~ Boro + Class, data=housing)

# ---------------------------------------------------------- #

multiplot(house1, house2, house3, house4, house5, pointSize = 2)

# ---------------------------------------------------------- #

anova(house1, house2, house3, house4, house5)

# ---------------------------------------------------------- #

AIC(house1, house2, house3, house4, house5)
BIC(house1, house2, house3, house4, house5)

# ---------------------------------------------------------- #

# �إ߷s���G���ܼ�,�䬰ValuePerSqFt�O�_�j��150�������ܼ�
housing$HighValue <- housing$ValuePerSqFt >= 150

# �إߴX�Ӽҫ�
high1 <- glm(HighValue ~ Units + SqFt + Boro,
             data=housing, family=binomial(link="logit"))
high2 <- glm(HighValue ~ Units * SqFt + Boro,
             data=housing, family=binomial(link="logit"))
high3 <- glm(HighValue ~ Units + SqFt * Boro + Class,
             data=housing, family=binomial(link="logit"))
high4 <- glm(HighValue ~ Units + SqFt * Boro + SqFt*Class,
             data=housing, family=binomial(link="logit"))
high5 <- glm(HighValue ~ Boro + Class,
             data=housing, family=binomial(link="logit"))

# ��ANOVA(���t����M,deviance),AIC�MBIC�ӶE�_�ҫ�
anova(high1, high2, high3, high4, high5)
AIC(high1, high2, high3, high4, high5)
BIC(high1, high2, high3, high4, high5)

# ---------------------------------------------------------- #