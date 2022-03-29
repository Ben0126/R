# ---------
#  16-3
# ---------
# ---------------------------------------------------------- #

library(XML)

# ---------------------------------------------------------- #

load("data/presidents.rdata")
theURL <- "http://www.loc.gov/rr/print/list/057_chron.html"
presidents <- readHTMLTable(theURL, which=3, as.data.frame=TRUE,
                            skip.rows=1, header=TRUE,
                            stringsAsFactors=FALSE)

# ---------------------------------------------------------- #

head(presidents)

# ---------------------------------------------------------- #

tail(presidents$YEAR)
presidents <- presidents[1:64, ]

# ---------------------------------------------------------- #

library(stringr)
# ��}�r��
yearList <- str_split(string = presidents$YEAR, pattern = "-")
head(yearList)

# �⥦�̦X�֦��@��matrix(�x�})
yearMatrix <- data.frame(Reduce(rbind, yearList))
head(yearMatrix)

# �諾�ƩR�W
names(yearMatrix) <- c("Start", "Stop")

# ��s�����ƦX�֨�data.frame
presidents <- cbind(presidents, yearMatrix)

# ��W���M�����~���ഫ��numeric
presidents$Start <- as.numeric(as.character(presidents$Start))
presidents$Stop <- as.numeric(as.character(presidents$Stop))

# �ݰ��F�ƻ����
head(presidents)
tail(presidents)

# ---------------------------------------------------------- #

# ����e�T�Ӧr��
str_sub(string = presidents$PRESIDENT, start = 1, end = 3)

# ����ĥ|��ĤK�Ӧr��
str_sub(string = presidents$PRESIDENT, start = 4, end = 8)

# ---------------------------------------------------------- #

presidents[str_sub(string = presidents$Start, start = 4,
                   end = 4) == 1, c("YEAR", "PRESIDENT", "Start", "Stop")]

# ---------------------------------------------------------- #