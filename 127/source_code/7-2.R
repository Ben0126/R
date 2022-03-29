# ---------
#  7-2
# ---------
# ---------
#  7-2-1
# ---------
# ---------------------------------------------------------- #

ggplot(data = diamonds) + geom_histogram(aes(x = carat))

# ---------------------------------------------------------- #

ggplot(data = diamonds) + geom_density(aes(x = carat), fill = "grey50")

# ---------------------------------------------------------- #
# ---------
#  7-2-2
# ---------
# ---------------------------------------------------------- #

ggplot(diamonds, aes(x = carat, y = price)) + geom_point()

# ---------------------------------------------------------- #

# ���l��ggplot����s�J�ܼ�
g <- ggplot(diamonds, aes(x = carat, y = price))

# ---------------------------------------------------------- #

g + geom_point(aes(color = color))

# ---------------------------------------------------------- #

g + geom_point(aes(color = color)) + facet_wrap(~color)
g + geom_point(aes(color = color)) + facet_grid(cut ~ clarity)


# ---------------------------------------------------------- #

ggplot(diamonds, aes(x = carat)) + geom_histogram() + facet_wrap(~color)

# ---------------------------------------------------------- #
# ---------
#  7-2-3
# ---------
# ---------------------------------------------------------- #

ggplot(diamonds, aes(y = carat, x = 1)) + geom_boxplot()

# ---------------------------------------------------------- #

ggplot(diamonds, aes(y = carat, x = cut)) + geom_boxplot()

# ---------------------------------------------------------- #

ggplot(diamonds, aes(y = carat, x = cut)) + geom_violin()

# ---------------------------------------------------------- #
# ---------
#  7-2-4
# ---------
# ---------------------------------------------------------- #

ggplot(economics, aes(x = date, y = pop)) + geom_line()

# ---------------------------------------------------------- #

# ���Jlubridate�M��
require(lubridate)

## �إ�year(�~��)�Mmonth(���)�ܼ�
economics$year <- year(economics$date)

# label�޼Ƴ]��TRUE���ܵ��G��������n�H������W�����,�ӫD�Ʀr 
economics$month <- month(economics$date, label=TRUE)

# �Ĩ��������
# which��ƩҦ^�Ǫ��N�|�O���˴����G��TRUE�ҹ�������m(�μФ�)
# �Y�~���j��2000���[���Ȫ���m�N�Q�^��
econ2000 <- economics[which(economics$year >= 2000), ]

# ���Jscales�M��H��n�a�榡�ƹϤ����b
library(scales)

# �إ߹Ϫ���
g <- ggplot(econ2000, aes(x=month, y=pop))

# �H���P�C�⪺�u�ӥN�����P���~��
# group�~�[�޼ƱN���Ƥ����ܦh�s
g <- g + geom_line(aes(color=factor(year), group=year))

# �⻡���R�W��"Year"
g <- g + scale_color_discrete(name="Year")

# �榡��y-�b
g <- g + scale_y_continuous(labels=comma)

# �s�W���D�Mx-,y-�b������
g <- g + labs(title="Population Growth", x="Month", y="Population")

# �e��
g

# ---------------------------------------------------------- #
# ---------
#  7-2-5
# ---------
# ---------------------------------------------------------- #

library(ggthemes)

# ø�Ϩæs�pg2
g2 <- ggplot(diamonds, aes(x=carat, y=price)) +
      geom_point(aes(color=color))

# �ϥΤ@�ǥD�D
g2 + theme_economist() + scale_colour_economist()
g2 + theme_excel() + scale_colour_excel()
g2 + theme_tufte()
g2 + theme_wsj()

# ---------------------------------------------------------- #