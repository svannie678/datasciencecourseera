###Week 2 Quiz: 
library(httr)

oauth_endpoints("github")

myapp <- oauth_app("github",
                   key = "89aec32d1376673170d6",
                   secret = "1de7cc4c14a02a22a10455b6fa2d7ec6668d2604"
)

github_token <- oauth2.0_token(oauth_endpoints("github"), myapp)

gtoken <- config(token = github_token)
req <- GET("https://api.github.com/rate_limit", gtoken)
stop_for_status(req)
content(req)


req2 <- GET("https://api.github.com/users/jtleek/repos", gtoken)
stop_for_status(req2)
content(req2)

$creq2$created_at

install.packages("sqldf")
library(sqldf)
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv", destfile =  "quiz2data.csv")
acs = read.csv("quiz2data.csv")
sqldf("select pwgtp1 from acs where AGEP < 50")

library(httr)
URL <- url("http://biostat.jhsph.edu/~jleek/contact.html")
lines <- readLines(URL)
close(URL)
c(nchar(lines[10]), nchar(lines[20]), nchar(lines[30]), nchar(lines[100]))

url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fwksst8110.for"
widths <- c(1, 9, 5, 4, 1, 3, 5, 4, 1, 3, 5, 4, 1, 3, 5, 4, 1, 3)
fixed <- read.fwf(url, widths, header = FALSE, skip = 4)
sum(fixed$V8)

##Week 3 Quiz###
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv", destfile =  "quiz3data.csv")
dataq1 = read.csv("quiz3data.csv")
head(dataq1)
names(dataq1)
#acr = 3 is 10 acres or more
#AGS = 6 is $100000 or more of product
agriculturelocal <- dataq1$ACR == 3 & dataq1$AGS==6
which(agriculturelocal)

#q2
install.packages("jpeg")
library(dplyr)
?jpeg
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fjeff.jpg",  destfile =  "quiz3jpeg.jpg", mode = 'wb')
dataq2 <- readJPEG("quiz3jpeg.jpg",native = TRUE)
quantile(dataq2,probs= c(.3,.8))

#q3
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv", destfile =  "quiz3GDP.csv")
dataq3GDP <- data.table::fread("quiz3GDP.csv", skip=4, nrows = 190, select = c(1, 2, 4, 5), col.names=c("CountryCode", "Rank", "Economy", "Total"))

download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv", destfile =  "quiz3education.csv")
dataq3education = read.csv("quiz3education.csv")

names(combined)
names(dataq3education)
combined <- merge(dataq3GDP,dataq3education, by = "CountryCode")
nrow(combined)
library(magrittr)
combined %<>%arrange(desc(Rank))
head(combined,n=13)
arrange(combined, desc(Rank))[13, Economy]

combined %>% group_by(Income.Group) %>%
  filter("High income: OECD" %in% Income.Group | "High income: nonOECD" %in% Income.Group) %>%
  summarise(average = mean(Rank,na.rm = TRUE)) %>%
  arrange(desc(Income.Group))

combined$RankGroups <- cut(combined$Rank,breaks = 5)
table <- table(combined$RankGroups,combined$Income.Group)
table[1,"Lower middle income"]


##Week 4 Quiz 

#q 1 
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv", destfile =  "quiz4q1.csv")
q1 <- read.csv("quiz4q1.csv")
strsplit(names(q1),"wgtp")[[123]]

#q2 
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv", destfile =  "quiz4q2.csv")
q2 <- read.csv("quiz4q2.csv")
q2$X.3
q2$X.3 <- sub(",","",q2$X.3)
class(q2$X.3)
q2$X.3 <- as.numeric(q2$X.3)
mean(q2$X.3, na.rm = TRUE)

#q4
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv", destfile =  "quiz4q4a.csv")
q4GDP <- read.csv("quiz4q4a.csv")

download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv", destfile =  "quiz4q4b.csv")
q4edu <- read.csv("quiz4q4b.csv")
names(q4GDP)
names(q4edu)

View(q4GDP)
q4GDP <- rename(q4GDP, CountryCode = X)
q4big <- merge(q4GDP,q4edu, by = "CountryCode")  
table(grepl("june",tolower(q4big$Special.Notes)))

#q5
install.packages('quantmod')
library(quantmod)
amzn = getSymbols("AMZN",auto.assign=FALSE)
sampleTimes = index(amzn)

timeDT <- data.table::data.table(timeCol = sampleTimes)

# How many values were collected in 2012? 
timeDT[(timeCol >= "2012-01-01") & (timeCol) < "2013-01-01", .N ]
# Answer: 
# 250

# How many values were collected on Mondays in 2012?
timeDT[((timeCol >= "2012-01-01") & (timeCol < "2013-01-01")) & (weekdays(timeCol) == "Monday"), .N ]
# Answer:
# 47  
  
  
  