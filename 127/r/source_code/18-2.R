# ---------
#  18-2
# ---------
# ---------------------------------------------------------- #

library(ggplot2)
head(economics)

# ---------------------------------------------------------- #

cor(economics$pce, economics$psavert)

# ---------------------------------------------------------- #

# ��cor�p������Y��
cor(economics$pce, economics$psavert)

## �p��Ψӧ�X�����Y�ƪ��C�ӳ���
xPart <- economics$pce - mean(economics$pce)
yPart <- economics$psavert - mean(economics$psavert)
nMinusOne <- (nrow(economics) - 1)
xSD <- sd(economics$pce)
ySD <- sd(economics$psavert)

# ���ά����Y�ƪ�����
sum(xPart * yPart) / (nMinusOne * xSD * ySD)

# ---------------------------------------------------------- #

cor(economics[, c(2, 4:6)])

# ---------------------------------------------------------- #

GGally::ggpairs(economics[, c(2, 4:6)], params = list(labelSize = 8))

# ---------------------------------------------------------- #

# ���Jreshape�M��H���Ƹ��
require(reshape2)

# ���Jscales�M��H�W�Kø�ϥ\��
require(scales)

# �إ߬����Y�Ưx�}
econCor <- cor(economics[, c(2, 4:6)])

# �⥦���Ʀ������榡
econMelt <- melt(econCor, varnames=c("x", "y"),
                 value.name="Correlation")

# �̾ڬ����Y�ư��Ƨ�
econMelt <- econMelt[order(econMelt$Correlation), ]

# ��ܷ��ƫ᪺���
econMelt

## ��ggplotø��
# ��x�My�]��x�My�b�@���Ϫ���l�إ�
ggplot(econMelt, aes(x=x, y=y)) +
      # �e�W�j��(���),�̾ڬ����Y��(Correlation)��W�C��
      geom_tile(aes(fill=Correlation)) +
      # �H�T�h��m���h(color gradient)���C���j����W�C��
      # �R��(muted)���@���̧C�I, �զ⬰����, ���K�ŧ@���̰��I
      # �C�⻡�����@�����]�����(ticks)����a(colorbar), �䰪�׬�10��
      # limits�h���w�Ҷ�W���ث׽d�򬰱q-1��1
      scale_fill_gradient2(low=muted("red"), mid="white",
                           high="steelblue",
                           guide=guide_colorbar(ticks=FALSE, barheight=10),
                           limits=c(-1, 1)) +
      # �ϥγ�²�檺�D�D(minimal theme)�H�T�O�Ϥ��S�h�l���F��
      theme_minimal() +
      # �Nx�My���үd��
      labs(x=NULL, y=NULL)

# ---------------------------------------------------------- #

m <- c(9, 9, NA, 3, NA, 5, 8, 1, 10, 4)
n <- c(2, NA, 1, 6, 6, 4, 1, 1, 6, 7)
p <- c(8, 4, 3, 9, 10, NA, 3, NA, 9, 9)
q <- c(10, 10, 7, 8, 4, 2, 8, 5, 5, 2)
r <- c(1, 9, 7, 6, 5, 6, 2, 7, 9, 10)

# �⥦�̦X�֦b�@�_
theMat <- cbind(m, n, p, q, r)

# ---------------------------------------------------------- #

cor(theMat, use = "everything")
cor(theMat, use = "all.obs")

# ---------------------------------------------------------- #

cor(theMat, use = "complete.obs")
cor(theMat, use = "na.or.complete")

# �u�Χt�������ƪ���ƭp������Y��
cor(theMat[c(1, 4, 7, 9, 10), ])

# ���"complete.obs"�M��ʥΫ��w����ƨӭp������Y��
# ���G���ӬO�n�@�˪�
identical(cor(theMat, use = "complete.obs"),
              cor(theMat[c(1, 4, 7, 9, 10), ]))

# ---------------------------------------------------------- #

# ���㪺�����Y�Ưx�}
cor(theMat, use = "pairwise.complete.obs")

# �u��m��n�����G,�A��ӯx�}�����G�����
cor(theMat[, c("m", "n")], use = "complete.obs")

# �u��m��p�����G,�A��ӯx�}�����G�����
cor(theMat[, c("m", "p")], use = "complete.obs")

# ---------------------------------------------------------- #

data(tips, package = "reshape2")
head(tips)
GGally::ggpairs(tips)

# ---------------------------------------------------------- #

require(RXKCD)
getXKCD(which = "552")

# ---------------------------------------------------------- #

cov(economics$pce, economics$psavert)
cov(economics[, c(2, 4:6)])

# �˴�cov�Mcor*sd*sd�����G�O�_�@��
identical(cov(economics$pce, economics$psavert),
              cor(economics$pce, economics$psavert) *
              sd(economics$pce) * sd(economics$psavert))

# ---------------------------------------------------------- #