# ---------
#  4-4
# ---------
# ---------------------------------------------------------- #

x <- c(1, 2, 3, 4, 5, 6, 7, 8, 9, 10)
x

# ---------------------------------------------------------- #
# ---------
#  4-4-1
# ---------
# ---------------------------------------------------------- #

x * 3

# ---------------------------------------------------------- #

x + 2
x - 3
x/4
x^2
sqrt(x)

# ---------------------------------------------------------- #

1:10
10:1
-2:3
5:-7

# ---------------------------------------------------------- #

# 製造兩個同長度的向量
x <- 1:10
y <- -5:4

# 把它們加起來
x + y

# 一個向量減另一個
x - y

# 把它們互乘
x * y

#一個向量除另一個—可注意到除以0會得到Inf為結果
x/y

# 然一個向量成為另一個的指數
x^y

# 差看每個向量的長度
length(x)
length(y)

# 把它們加起來之後的長度應該等於未加之前
length(x + y)

# ---------------------------------------------------------- #

x + c(1, 2)
x + c(1, 2, 3)

# ---------------------------------------------------------- #

x <= 5
x > y
x < y

# ---------------------------------------------------------- #

x <- 10:1
y <- -4:5
any(x < y)
all(x < y)

# ---------------------------------------------------------- #

q <- c("Hockey", "Football", "Baseball", "Curling", "Rugby",
       "Lacrosse", "Basketball", "Tennis", "Cricket", "Soccer")
nchar(q)
nchar(y)

# ---------------------------------------------------------- #

x[1]
x[1:2]
x[c(1, 4)]

# ---------------------------------------------------------- #

# 用”名字-值”的方法對一排列的元素命名
c(One = "a", Two = "y", Last = "r")

# 建立vector
w <- 1:3

# 名命元素
names(w) <- c("a", "b", "c")
w

# ---------------------------------------------------------- #
# ---------
#  4-4-2
# ---------
# ---------------------------------------------------------- #

q2 <- c(q, "Hockey", "Lacrosse", "Hockey", "Water Polo",
        "Hockey", "Lacrosse")

# ---------------------------------------------------------- #

q2Factor <- as.factor(q2)
q2Factor

# ---------------------------------------------------------- #

as.numeric(q2Factor)

# ---------------------------------------------------------- #

factor(x=c("High School", "College", "Masters", "Doctorate"),
       levels=c("High School", "College", "Masters", "Doctorate"),
       ordered=TRUE)

# ---------------------------------------------------------- #
