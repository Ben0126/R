# ---------
#  23-3
# ---------
# ---------------------------------------------------------- #

# �إߪ��ƦW�٪�vector
creditNames <- c("Checking", "Duration", "CreditHistory",
                 "Purpose", "CreditAmount", "Savings", "Employment",
                 "InstallmentRate", "GenderMarital", "OtherDebtors",
                 "YearsAtResidence", "RealEstate", "Age",
                 "OtherInstallment", "Housing", "ExistingCredits", "Job",
                 "NumLiable", "Phone", "Foreign", "Credit")

# ��read.tableŪ�����
# ���w�쥻���]�A�b����ت����ƦW��
# col.names����J�ȬO�qcreditNames�Ӫ�
theURL <- "http://archive.ics.uci.edu/ml/machine-learning-databases/statlog/german/german.data"
credit <- read.table(theURL, sep = " ", header = FALSE,
                     col.names = creditNames,
                     stringsAsFactors = FALSE)
head(credit)

# ---------------------------------------------------------- #

# ���e
head(credit[, c("CreditHistory", "Purpose", "Employment", "Credit")])

creditHistory <- c(A30 = "All Paid", A31 = "All Paid This Bank",
                   A32 = "Up To Date", A33 = "Late Payment",
                   A34 = "Critical Account")

purpose <- c(A40 = "car (new)", A41 = "car (used)",
             A42 = "furniture/equipment", A43 = "radio/television",
             A44 = "domestic appliances", A45 = "repairs",
             A46 = "education", A47 = "(vacation - does not exist?)",
             A48 = "retraining", A49 = "business", A410 = "others")

employment <- c(A71 = "unemployed", A72 = "< 1 year",
                A73 = "1 - 4 years", A74 = "4 - 7 years", A75 = ">= 7 years")

credit$CreditHistory <- creditHistory[credit$CreditHistory]
credit$Purpose <- purpose[credit$Purpose]
credit$Employment <- employment[credit$Employment]

# �N�H�έ��s�s���n(good)/�t(bad)
credit$Credit <- ifelse(credit$Credit == 1, "Good", "Bad")

# �N�H�Φn(good)�]����h
credit$Credit <- factor(credit$Credit, levels = c("Good", "Bad"))

# ---------------------------------------------------------- #

# ����
head(credit[, c("CreditHistory", "Purpose", "Employment","Credit")])

library(useful)
ggplot(credit, aes(x=CreditAmount, y=Credit)) +
         geom_jitter(position = position_jitter(height = .2)) +
         facet_grid(CreditHistory ~ Employment) +
         xlab("Credit Amount") +
         theme(axis.text.x=element_text(angle=90, hjust=1, vjust=.5)) +
         scale_x_continuous(labels=multiple)

ggplot(credit, aes(x=CreditAmount, y=Age)) +
         geom_point(aes(color=Credit)) +
         facet_grid(CreditHistory ~ Employment) +
         xlab("Credit Amount") +
         theme(axis.text.x=element_text(angle=90, hjust=1, vjust=.5)) +
         scale_x_continuous(labels=multiple)

# ---------------------------------------------------------- #

library(mgcv)

# �إߤ@��ù�N��GAM
# ��i�q�n�B�ΦbCreditAmount, �ӱN�˱��B�ΦbAge
creditGam <- gam(Credit ~ te(CreditAmount) + s(Age) + CreditHistory +
                 Employment,
                 data=credit, family=binomial(link="logit"))
summary(creditGam)

# ---------------------------------------------------------- #

plot(creditGam, select = 1, se = TRUE, shade = TRUE)
plot(creditGam, select = 2, se = TRUE, shade = TRUE)

# ---------------------------------------------------------- #