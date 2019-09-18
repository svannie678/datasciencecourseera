####Handy Dandy Function Script####


###Course 3: Getting and Cleaning Data###
##Week 1##
#tidy data: variable = column, observation is row 
#code book: information about each variable 
#instruction list: add comments mofo 
getwd()
setwd()
#relative directory ("./folder)
if(!file.exists()){
  dir.create()
}

fileURL <- "linkaddress"
download.file(fileURL,destfile = ddir, method = "curl")
list.files(ddir)
datedownloaded <- date()
read.table(ddir,sep = , header = TRUE, quote = "" )#supposedly helpful
read.csv()
library(xlsx)
read.xlsx(ddir,sheetIndex = 1, header = TRUE)
write.xlsx
library(XML)
fileURL <- "linkaddress"
doc <- xmlTreeParse(fileURL,useInternal = TRUE)
rootNode <- xmlRoot(doc)
xmlName(rootNode)
library(jsonlite)
fromJSON()
toJSON()
library(data.table)
DT[,list(mean(x),sum(z))] #functions on columns in datatable 
DT[,w:=z^2] #new column
DT[,.N,by=x] #.N is counting number of unique variables
setkey(DT,x)
DT['a']
merge(DT1,DT2)
fread()
?melt

##WEEK 2##
library(RMySQL)
#opens up the connection to mySQL and gets all diff databased
ucscDb <- dbConnect(MySQL(),user = "genome",
                    host = "genome-mysql.soe.ucsc.edu")
result <- dbGetQuery(ucscDb,"show databases;"); dbDisconnect(ucscDb);
result

#gets one database and all the tables in it 
hg19 <- dbConnect(MySQL(),user = "genome",db = "hg19",
                    host = "genome-mysql.soe.ucsc.edu")
allTables <- dbListTables(hg19)
length(allTables)
allTables[1:5]
#getting column names
dbListFields(hg19,"affyU133Plus2")
#getting rows 
dbGetQuery(hg19,"select count(*) from affyU133Plus2")
affyData <- dbReadTable(hg19,"affyU133Plus2")
head(affyData)
query <- dbSendQuery(hg19,"select * from affyU133Plus2 where misMatches between 1 and 3")
affyMis <- fetch(query); quantile(affyMis$misMatches)
dbDisconnect(hg19)

#HDF5
source("http://bioconductor.org/biocLite.R")
biocLite("rhdf5")
library(rhdf5)
created = h5createFile("example.h5")
created
created = h5createGroup("example.h5","foo")
h5ls("example.h5")

#webscraping from HTML codes
con = url("https://scholar.google.com/citations?user=HI-I6C0AAAAJ&hl=en")
htmlCode = readLines(con)
close(con)
htmlCode

#doesnt werk
library(XML)
urs <- "https://scholar.google.com/citations?user=HI-I6C0AAAAJ&hl=en"
html <- htmlTreeParse(urs, useInternalNodes = TRUE)
xpathSApply(html,"//title",xmlValue)

#werks
library(httr)
html2 = GET(urs)
content2 = content(html2,as = "text")
parsedHtml = htmlParse(content2,asText = TRUE)
xpathSApply(parsedHtml,"//title",xmlValue)

##APIs
#can make your own application
oauth_app() #starts authorization process
sign_oauth1.0()
file(), url(), gzfile(),bzfile() ?connections
read.foo #foo is extension 
#ex : read.spss
tuneR ,seewave, jpeg, png

###WEEK 3###
X[which(x$var2 > 8),]
sort(X$var1,decreasing = TRUE)
X[order(X$var1),]
arrange(X,var1)
cbind(X,rnorm(5)) #on the right
head(data, n = 3) #the beginning of the dataframe 
summary(data)
str(data)
quantile(data,na.rm = TRUE)
table(data$variable, useNA = "ifany")
sum(is.na(data$variable)) #returns a number
any(is.na(data$variable)) #returns a logical
all(data$variable > some number) #logical
colSums(is.na(data))
table(data$variable %in% c(a bunch of values))
data[data$variable %in% c(a bunch of values),]
xtabs(variable ~ Gender+Admit, data = data) #creates a table, first variable of what goes in the data
ftable(crosstab) #will summarize data more compactly 
ifelse(data$variable< condition, TRUE, FALSE)
cut(data$variable, breaks = condition(data$variable)) #turns a quantitative varible into a cut variable 
#cutting produces factor variables
mutate()
#tidy data: every variable is a column and every observation is a row
install.packages("reshape")
library(reshape)
melt(data, id = c("variables"),measure.vars = c(""))
dcast(data,cyl~variable, mean)#allows us to reform dataset 
tapply(data$variable1, data$variable2, sum)
arrange()
mutate()
#dplyr verbs 
select()
filter()
arrange()
rename()
mutate()
group_by() #sort by categorical variables
summarise/summarize()
%>% #dattttt pipeeee
library(dplyr)
merge(data1,data2,by.x="variabledata1",by.y "?", all = TRUE)
join(data,data2) #only datasets w common names


##TIDY DATA: 
##Tidy data is formatted in a standard way that facilitates exploration and analysis and works seamlessly with other tidy data tools. Specifically, tidy data
# satisfies three conditions:
  # 1) Each variable forms a column
  #2) Each observation forms a row
  # 3) Each type of observational unit forms a table


###WEEK 4###
tolower()
toupper()
strsplit(names(dataset),"\\.") #split on periods
sub("_","",names(dataset),) #to remove an underscore
gsub() #replaces multiple instances in one string 
grep("string",dataset$column) #returns elements where string matches 
  #value = TRUE returns the string
grepl() #same as grep but true and false
data2 <- dataset[!grepl("string",dataset$column),] #subset using grepl
nchar()
substr("string", 1, 3)
paste()
paste0()
str_trim()
#regular expressions = literals and metacharacters 
# ^ = start of a line 
#$ = end of line
#[Aa][Nn][Dd] = will match at either letter 
#[^?.]$ = here the ^ means not 
#9.11 = . looks for any character 
#flood|fire = or 
#(W\.)? = optional
#* = repetition 
#+ = at least one 
#{1,5} #min and max number of times to match expression
#\1 number of matches
date()
Sys.Date()
#julian date = #days since origin
library(lubridate)





