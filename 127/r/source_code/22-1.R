# ---------
#  22-1
# ---------
# ---------------------------------------------------------- #

acs <- read.table("http://jaredlander.com/data/acs_ny.csv", sep = ",",
                   header = TRUE, stringsAsFactors = FALSE)

# ---------------------------------------------------------- #

�إߤ@�ӫe�T�Ӫ��Ƭ�numeric��data.frame
testFrame <-
   data.frame(First=sample(1:10, 20, replace=TRUE),
            Second=sample(1:20, 20, replace=TRUE),
            Third=sample(1:10, 20, replace=TRUE),
            Fourth=factor(rep(c("Alice", "Bob", "Charlie", "David"),
                              5)),
            Fifth=ordered(rep(c("Edward", "Frank", "Georgia",
                                 "Hank", "Isaac"), 4)),
            Sixth=rep(c("a", "b"), 10), stringsAsFactors=F)
head(testFrame)

head(model.matrix(First ~ Second + Fourth + Fifth, testFrame))

# ---------------------------------------------------------- #

library(useful)
# ��Ҧ��ܼƨϥΨ�Ҧ�level
head(build.x(First ~ Second + Fourth + Fifth, testFrame,
             contrasts=FALSE))

# �u��Fourth�ϥΩҦ�level
head(build.x(First ~ Second + Fourth + Fifth, testFrame,
             contrasts=c(Fourth=FALSE, Fifth=TRUE)))

# ---------------------------------------------------------- #

# ��Income�ܼƫإߤ@�ӷs���G���ܼƥH�إ�ù�N���j�k
acs$Income <- with(acs, FamilyIncome >= 150000)
head(acs)

# �إ߹w����Ưx�}
# ���ݭn�[�J�I�Z��,�]��glmnet�|�۰ʥ[�J��
acsX <- build.x(Income ~ NumBedrooms + NumChildren + NumPeople +
                NumRooms + NumUnits + NumVehicles + NumWorkers +
                OwnRent + YearBuilt + ElectricBill + FoodStamp +
                HeatingFuel + Insurance + Language - 1,
                data=acs, contrasts=FALSE)

# �˵�class(��Ƶ��c)�Mdim(����)
class(acsX)
dim(acsX)

# �˵����W(top left)�M�k�W(top right)�����
topleft(acsX, c=6)
topright(acsX, c=6)

# �إߤ����ܼ�
acsY <- build.y(Income ~ NumBedrooms + NumChildren + NumPeople +
                NumRooms + NumUnits + NumVehicles + NumWorkers +
                OwnRent + YearBuilt + ElectricBill + FoodStamp +
                HeatingFuel + Insurance + Language - 1, data=acs)

head(acsY)
tail(acsY)

# ---------------------------------------------------------- #

library(glmnet)
set.seed(1863561)

# ���������e���Ҫ�glmnet
acsCV1 <- cv.glmnet(x = acsX, y = acsY, family = "binomial", nfold = 5)

# ---------------------------------------------------------- #

acsCV1$lambda.min
acsCV1$lambda.1se
plot(acsCV1)

# ---------------------------------------------------------- #

coef(acsCV1, s = "lambda.1se")

# ---------------------------------------------------------- #

# ����|�e�X
plot(acsCV1$glmnet.fit, xvar = "lambda")

# �﷥�Τƪ�lambda�ȥ[�J�����u
abline(v = log(c(acsCV1$lambda.min, acsCV1$lambda.1se)), lty = 2)

# ---------------------------------------------------------- #

# �إ߯�j�k�ҫ�
set.seed(71623)
acsCV2 <- cv.glmnet(x = acsX, y = acsY, family = "binomial", nfold = 5,
                    alpha = 0)

# �˵�lambda��
acsCV2$lambda.min
acsCV2$lambda.1se

# �˵��Y��
coef(acsCV2, s = "lambda.1se")

# ø�s��e���һ~�t���|
plot(acsCV2)

# ø�s�Y�Ƹ��|
plot(acsCV2$glmnet.fit, xvar = "lambda")
abline(v = log(c(acsCV2$lambda.min, acsCV2$lambda.1se)), lty = 2)	

# ---------------------------------------------------------- #

library(parallel)
library(doParallel)

# ---------------------------------------------------------- #

# �]�w�ؤl�H���H�����G�i�H�Q����
set.seed(2834673)

# �إ߼h�O,�ڭ̭n�[���Ȧb�C������ɳ��|���b�P�@�h
theFolds <- sample(rep(x = 1:5, length.out = nrow(acsX)))

# �s�y�@�ǦC��alpha��
alphas <- seq(from = 0.5, to = 1, by = 0.05)

# ---------------------------------------------------------- #

# �]�w�ؤl�H���H�����G�i�H�Q����
set.seed(5127151)

# �Ұʤ@�Ӿ֦����worker���O��
cl <- makeCluster(2)

# �]worker���Ȧs��(register)
registerDoParallel(cl)

# ��L�{�p��
before <- Sys.time()

# �إ�foreach�j��åH����B�⪺�覡����
## �@�Ǥ޼ƪ��]�w
acsDouble <- foreach(i=1:length(alphas), .errorhandling="remove",
                     .inorder=FALSE, .multicombine=TRUE,
                     .export=c("acsX", "acsY", "alphas", "theFolds"),
                     .packages="glmnet") %dopar%
            {
               print(alphas[i])
               cv.glmnet(x=acsX, y=acsY, family="binomial", nfolds=5,
               foldid=theFolds, alpha=alphas[i])
            }

# ����p��
after <- Sys.time()

# �T�O�b�Ҧ��L�{������N�O���פ�
stopCluster(cl)

# �L�{�үӪ��ɶ�
# �o�]�q���t��,�O����M�֤߭ӼƦӲ�
after - before
sapply(acsDouble, class)

# �Ψө��cv.glmnet����T�������
extractGlmnetInfo <- function(object)
      {
         # ��X�Q�襤��lambda
         lambdaMin <- object$lambda.min
         lambda1se <- object$lambda.1se

         # ��X����lambda���b���|������a��
         whichMin <- which(object$lambda == lambdaMin)
         which1se <- which(object$lambda == lambda1se)

         # �إߤ@�ӥu���@�檺data.frame,�ح��t���Q�襤��lambda
         # �M�����������~�T��
         data.frame(lambda.min=lambdaMin, error.min=object$cvm[whichMin],
                    lambda.1se=lambda1se, error.1se=object$cvm[which1se])
      }

# �N�Ө�����Ψ�list�����C�Ӥ���
# �⵲�G����X��@��data.frame��
alphaInfo <- Reduce(rbind, lapply(acsDouble, extractGlmnetInfo))

# �]�i�H�q�Lplyr�M�󤤪�ldply�ӧ���
alphaInfo2 <- plyr::ldply(acsDouble, extractGlmnetInfo)
identical(alphaInfo, alphaInfo2)

# �إߤ@�Ӫ��ƥH�C�Xalpha
alphaInfo$Alpha <- alphas
alphaInfo

# ---------------------------------------------------------- #

## �إ�data.frame�H��K�N���P���T��ø�s�X��
library(reshape2)
library(stringr)

# �N��ƺ��Ʀ������榡
alphaMelt <- melt(alphaInfo, id.vars="Alpha", value.name="Value",
                  variable.name="Measure")
alphaMelt$Type <- str_extract(string=alphaMelt$Measure,
                              pattern="(min)|(1se)")

# ���X�@�ǳB�z��������
alphaMelt$Measure <- str_replace(string=alphaMelt$Measure,
                                 pattern="nn.(min|1se)",
                                 replacement="")
alphaCast <- dcast(alphaMelt, Alpha + Type ~ Measure,
                   value.var="Value")
ggplot(alphaCast, aes(x=Alpha, y=error)) +
       geom_line(aes(group=Type)) +
       facet_wrap(~Type, scales="free_y", ncol=1) +
       geom_point(aes(size=lambda))

# ---------------------------------------------------------- #

set.seed(5127151)
acsCV3 <- cv.glmnet(x = acsX, y = acsY, family = "binomial", nfold = 5,
                    alpha = alphaInfo$Alpha[which.min(alphaInfo$error.1se)])

# ---------------------------------------------------------- #

plot(acsCV3)
plot(acsCV3$glmnet.fit, xvar = "lambda")
abline(v = log(c(acsCV3$lambda.min, acsCV3$lambda.1se)), lty = 2)

# ---------------------------------------------------------- #

theCoef <- as.matrix(coef(acsCV3, s = "lambda.1se"))
coefDF <- data.frame(Value = theCoef,
                     Coefficient = rownames(theCoef))
coefDF <- coefDF[nonzeroCoef(coef(acsCV3, s = "lambda.1se")), ]
ggplot(coefDF, aes(x = X1, y = reorder(Coefficient, X1))) +
       geom_vline(xintercept = 0, color = "grey", linetype = 2) +
       geom_point(color = "blue") + labs(x = "Value",
                                         y = "Coefficient", title = "Coefficient Plot")

# ---------------------------------------------------------- #