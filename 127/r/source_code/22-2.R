# ---------
#  22-2
# ---------
# ---------------------------------------------------------- #

download.data('http://jaredlander.com/data/ideo.rdata','data/ideo.rdata')
load("data/ideo.rdata")
head(ideo)

# ---------------------------------------------------------- #

## �إߤ@�Ǽҫ�
library(dplyr)
results <- ideo %>%
   # �̦~�׹��Ƥ��s
   group_by(Year) %>%
   # ��C�s��ƫإ߼ҫ�
   do(Model=glm(Vote ~ Race + Income + Gender + Education,
                 data=.,
                 family=binomial(link="logit")))

# �ҫ��x�s�b�@��list���椤�A�]���ڭ̵������@�Ӫ���
# �諾��R�W
names(results$Model) <- as.character(results$Year)
results

# ---------------------------------------------------------- #

library(coefplot)

# �o��Y�ƪ��T��
voteInfo <- multiplot(results, coefficients="Raceblack", plot=FALSE)
head(voteInfo)

# �N���������(-20, 10)�~ø��
multiplot(results$Model, 
          coefficients="Raceblack", secret.weapon=TRUE)
    coord_flip(xlim=c(-20, 10))

# ---------------------------------------------------------- #

resultsB <- ideo %>%
      # �̦~�׹��ƶi����s
      group_by(Year) %>%
      # ��C�s��ƫإ߼ҫ�
      do(Model=arm::bayesglm(Vote ~ Race + Income + Gender + Education,
                               data=.,
                               family=binomial(link="logit"),
                               prior.scale=2.5, prior.df=1))
# ��list�R�W
names(resultsB$Model) <- as.character(resultsB$Year)

# �إ߫Y�ƹ�
multiplot(resultsB, coefficients="Raceblack", secret.weapon=TRUE)

# ---------------------------------------------------------- #