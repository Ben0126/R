# ---------
#  9-1
# ---------
# ---------------------------------------------------------- #

as.numeric(TRUE)
as.numeric(FALSE)

# ---------------------------------------------------------- #

1 == 1 # TRUE
1 < 1 # FALSE
1 <= 1 # TRUE
1 > 1 # FALSE
1 >= 1 # TRUE
1 != 1 # FALSE

# ---------------------------------------------------------- #

# �إߤ@�ӧt��1���ܼ�
toCheck <- 1

# �YtoCheck����1,���hello
if (toCheck == 1)
{
   print("hello")
}

# �{�b�p�GtoCheck����0,�h���hello
if (toCheck == 0)
{
 	print("hello")
}

# �i�H�ݨ쵲�G�èS��ܥ���F��

# ---------------------------------------------------------- #

# �������إߨ��
check.bool <- function(x)
{
   if (x == 1)
   {

   # �Y��J�Ȭ�1�h���hello
   print("hello")
   } else
   {
   # �_�h���goodbye
   print("goodbye")
   }
}

# ---------------------------------------------------------- #

check.bool(1)
check.bool(0)
check.bool("k")
check.bool(TRUE)
# ---------------------------------------------------------- #

check.bool <- function(x)
{
   if (x == 1)
   {
      # �Y��J�ȵ���1,���hello
      print("hello")
   } else if (x == 0)
   {
      # �Y��J�ȵ���0,���goodbye
      print("goodbye")
   } else
   {
      # �_�h���confused
      print("confused")
   }
}

check.bool(1)
check.bool(0)
check.bool(2)
check.bool("k")

# ---------------------------------------------------------- #