# ---------
#  17-2
# ---------
# ---------------------------------------------------------- #

rbinom(n = 1, size = 10, prob = 0.4)

# ---------------------------------------------------------- #

rbinom(n = 1, size = 10, prob = 0.4)
rbinom(n = 5, size = 10, prob = 0.4)
rbinom(n = 10, size = 10, prob = 0.4)

# ---------------------------------------------------------- #

rbinom(n = 1, size = 1, prob = 0.4)
rbinom(n = 5, size = 1, prob = 0.4)
rbinom(n = 10, size = 1, prob = 0.4)

# ---------------------------------------------------------- #

binomData <- data.frame(Successes = rbinom(n = 10000, size = 10,
                                           prob = 0.3))
ggplot(binomData, aes(x = Successes)) + geom_histogram(binwidth = 1)

# ---------------------------------------------------------- #

# �إߤ@�ӫ�����Ӫ��ƩM10,000��ƪ�data.frame 
# �Ĥ@���Ƭ�Successes,�O�����O10,000�ո��窺���\����
# �ĤG���ưO���C�ո��禸��(Size),�C�զ��Ƭ�5
binom5 <- data.frame(Successes=rbinom(n=10000, size=5,
                                      prob=.3), Size=5)
dim(binom5)
head(binom5)

# �򤧫e���@��,�٬O10,000���
# �o���q���P���禸�ƪ����G������\����
# �{�b10,000��ƪ�Size�Ҭ�10
binom10 <- data.frame(Successes=rbinom(n=10000, size=10,
                                       prob=.3), Size=10)
dim(binom10)
head(binom10)
binom100 <- data.frame(Successes=rbinom(n=10000, size=100,
                                        prob=.3), Size=100)
binom1000 <- data.frame(Successes=rbinom(n=10000, size=1000,
                                         prob=.3), Size=1000)

# �⥦�̳��X�֦b�@�_
binomAll <- rbind(binom5, binom10, binom100, binom1000)
dim(binomAll)
head(binomAll, 10)
tail(binomAll, 10)

# �{�bø��
# ����ϥu�ݳ]�wx�b
# �Ϫ����h(���)�̾ڬ�Size����
# �o�ǭȬ�5, 10, 100, 1000
ggplot(binomAll, aes(x=Successes)) + geom_histogram() +
       facet_wrap(~ Size, scales="free")

# ---------------------------------------------------------- #

# 10�������ؤT�����\�����v
dbinom(x = 3, size = 10, prob = 0.3)

# 10�������ؤT���Χ�֦����\�����v
pbinom(q = 3, size = 10, prob = 0.3)

# �Ө�Ө�Ƥ]�i�H����V�q�ƹB��
dbinom(x = 1:10, size = 10, prob = 0.3)
pbinom(q = 1:10, size = 10, prob = 0.3)

# ---------------------------------------------------------- #

qbinom(p = 0.3, size = 10, prob = 0.3)
qbinom(p = c(0.3, 0.35, 0.4, 0.5, 0.6), size = 10, prob = 0.3)

# ---------------------------------------------------------- #