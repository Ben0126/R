# ---------
#  8-2
# ---------
# ---------------------------------------------------------- #

# ���N�@�ӯS����r��
sprintf("Hello %s", "Jared")

# ���N��ӯS����r��
sprintf("Hello %s, today is %s", "Jared", "Sunday")

# ---------------------------------------------------------- #

hello.person <- function(name)
{
   print(sprintf("Hello %s", name))
}

hello.person("Jared")
hello.person("Bob")
hello.person("Sarah")

# ---------------------------------------------------------- #

hello.person <- function(first, last)
{
   print(sprintf("Hello %s %s", first, last))
}

# �z�L�޼Ƭ۹��m
hello.person("Jared", "Lander")

# �z�L�޼ƦW��
hello.person(first = "Jared", last = "Lander")

# ��޼ƤϹL��
hello.person(last = "Lander", first = "Jared")

# �u���w��@�Ӥ޼ƦW��
hello.person("Jared", last = "Lander")

# ���w�t�@�Ӥ޼ƦW��
hello.person(first = "Jared", "Lander")

# �z�L�޼ƦW�٫��w�ĤG�Ӥ޼�,���ۦb�S��J�޼ƦW�٤U���w�Ĥ@�Ӥ޼�
hello.person(last = "Lander", "Jared")

# ---------------------------------------------------------- #

hello.person(fir = "Jared", l = "Lander")

# ---------------------------------------------------------- #
# ---------
#  8-2-1
# ---------
# ---------------------------------------------------------- #

hello.person <- function(first, last = "Doe")
{
   print(sprintf("Hello %s %s", first, last))
}

# �I�s��Ʈɤ����w�m��
hello.person("Jared")

# �I�s��Ʈɫ��w�䥦���m��
hello.person("Jared", "Lander")

# ---------------------------------------------------------- #
# ---------
#  8-2-2
# ---------
# ---------------------------------------------------------- #

# �I�shello.person,�å[�J�B�~���޼�
hello.person("Jared", extra = "Goodbye")

# �H��Ӧ��Ĥ޼ƩI�s���,�ĤT�Ӥ޼ƬO�B�~��
hello.person("Jared", "Lander", "Goodbye")

# �{�b�إ�hello.person, �å[�J...�޼ƥH�������[�޼�
hello.person <- function(first, last = "Doe", ...)
{
   print(sprintf("Hello %s %s", first, last))
}

# �I�shello.person,�å[�J�B�~���޼�
hello.person("Jared", extra = "Goodbye")

#�H��Ӧ��Ĥ޼ƩI�s���,�ĤT�Ӥ޼ƬO�B�~��
hello.person("Jared", "Lander", "Goodbye")

# ---------------------------------------------------------- #