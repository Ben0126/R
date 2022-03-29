# ---------
#  21-5
# ---------
# ---------------------------------------------------------- #

# �̤p���ҫ�����L�ҫ�,�򥻤W�N�O�@�Ӫ��u����
nullModel <- lm(ValuePerSqFt ~ 1, data=housing)

# �ڭ̯౵�����̤j�ҫ�
fullModel <- lm(ValuePerSqFt ~ Units + SqFt*Boro + Boro*Class,
                data=housing)

# ���դ��P���ҫ�
# �qnullModel�}�l
# ����W�VfullModel
# �B��@�����V(both)�����N
houseStep <- step(nullModel,
                  scope=list(lower=nullModel, upper=fullModel),
                  direction="both")

# ��ܳQ�D�諸�ҫ�
houseStep

# ---------------------------------------------------------- #