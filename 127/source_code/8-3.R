# ---------
#  8-3
# ---------
# ---------------------------------------------------------- #

# �إߨ�Ʈɤ��ϥ�return���O
double.num <- function(x)
{
   x * 2
}
double.num(5)

# �ϥ�return���O�إ�
double.num <- function(x)
{
   return(x * 2)
}
double.num(5)

# �A���إߨ��,�o���breturn�᭱�]��@�ǫ��O
double.num <- function(x)
{
   return(x * 2)
   # �H�U���O���|�Q����,�]����Ƥw�g�Q�h�X�F
   print("Hello!")
   return(17)
}
double.num(5)

# ---------------------------------------------------------- #