# ---------
#  11-1
# ---------
# ---------
#  11-1-1
# ---------
# ---------------------------------------------------------- #

# �إ�matrix
theMatrix <- matrix(1:9, nrow = 3)

# �C�@��ƪ��`�M
apply(theMatrix, 1, sum)

# �C�@���ƪ��`�M
apply(theMatrix, 2, sum)

# ---------------------------------------------------------- #

rowSums(theMatrix)
colSums(theMatrix)

# ---------------------------------------------------------- #

theMatrix[2, 1] <- NA
apply(theMatrix, 1, sum)
apply(theMatrix, 1, sum, na.rm = TRUE)
rowSums(theMatrix)
rowSums(theMatrix, na.rm = TRUE)

# ---------------------------------------------------------- #
# ---------
#  11-1-2
# ---------
# ---------------------------------------------------------- #

theList <- list(A = matrix(1:9, 3), B = 1:5, C = matrix(1:4, 2), D = 2)
lapply(theList, sum)

# ---------------------------------------------------------- #

sapply(theList, sum)

# ---------------------------------------------------------- #

theNames <- c("Jared", "Deb", "Paul")
lapply(theNames, nchar)

# ---------------------------------------------------------- #
# ---------
#  11-1-3
# ---------
# ---------------------------------------------------------- #

## �إߨ��list
firstList <- list(A = matrix(1:16, 4), B = matrix(1:16, 2), C = 1:5)
secondList <- list(A = matrix(1:16, 4), B = matrix(1:16, 8), C = 15:1)

# �����露�����˴�, �ݥ��̬O�_�ۦP
mapply(identical, firstList, secondList)

## �إߤ@��²�檺��Ƨ�U��������ƪ��ƶq(����)�[�_��
simpleFunc <- function(x, y)
{
   NROW(x) + NROW(y)
}

# �������Ψ쨺���list
mapply(simpleFunc, firstList, secondList)

# ---------------------------------------------------------- #