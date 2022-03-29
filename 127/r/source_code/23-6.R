# ---------
#  23-6
# ---------
# ---------------------------------------------------------- #

library(randomForest)
creditFormula <- Credit ~ CreditHistory + Purpose + Employment +
  Duration + Age + CreditAmount - 1

# �]���O�𪺫إߡA�ڭ̨ϥ����O�ܼƪ��Ҧ�level
creditX <- build.x(creditFormula, data=credit, contrasts=FALSE)
creditY <- build.y(creditFormula, data=credit)

# �إ��H���˪L
creditForest <- randomForest(x=creditX, y=creditY)
creditForest

# ---------------------------------------------------------- #

#�إߤ����ܼ�matrix(�x�})
creditY2 <- as.integer(relevel(creditY, ref='Bad')) - 1

# �إ��H���˪L
boostedForest <- xgboost(data=creditX, label=creditY2, max_depth=4,
                         num_parallel_tree=1000,
                         subsample=0.5, colsample_bytree=0.5,
                         nrounds=3, objective="binary:logistic")

# ---------------------------------------------------------- #

xgb.plot.multi.trees(boostedForest, feature_names=colnames(creditX))

# ---------------------------------------------------------- #

