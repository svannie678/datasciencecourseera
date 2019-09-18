####Handy Dandy Function Script####

###Course 4: Exploratory Data Analysis###

getwd()
setwd("/Users/simonevantaylor/Documents/Coursera/Course4")

##Lesson 1: Graphs##
#building analytic graphics#
  #1 show comparisons: compared to what? 
  #2 Show mechanism/explanation: what is the causal framework?
  #3 Show multivariate data: more than 2 dimensions
  #4 Integrate evidence: combine multiple modes, don't let "tools do the thinking"
  #5 Describe and document evidence you present: preserve code 
  #6 Content is king 
#Exploratory graphs#
#are there counties that exceed standard for fine particle pollution?
#1 d summaries
  #5 num summary = summary(data)
  #boxplot(data,col="blue")
  #abline(h=number)
  #hist(data,col,breaks) & rug(data)
#2 d summaries
  #multiple boxplots : boxplot(pm23~region, data,col)
  #multiple hist
  #scatterplot: with(data,plot(colum,colum,col = region)
#rgraph gallery, r bloggers
##Lesson 2: Graphs##
#Base Plotting: series of commands
#Lattice System: single function plot, conditioning plots, good for many plots on a screen
#library(lattice)
#ggplot2: in between to lattice and base package
#cant mix functions between systems
#base plotting: initialize -> anotate
  plot(x,y, xlab=, ylab=, pch,lyt,lwd,col)
       #color
  lines,points, text, axis,title #all functions as part of a plot
  #type = "n" creates a space
  par(las #label orientation)
  hist(x)
  
##Lesson 2: Lattice Plotting System##
  install.packages('lattice')
  library(lattice)
#need to call it in one shot 
xyplot()
bwplot
histogram
stripplot
levelplot #"image" data
xyplot(y~x|f*g,data) #f and g are different levels of variables
#lattice functions create an object of trellis, need to print 
#lattice has panel functions, to define each panel 
#good for looking at a lot of data quickly

##GGPlot##
#comes from the grammar of graphics 
#aesthetic attributes, geometrics, stats, coordinate system 
#aesthetics = size, shape, color
#geoms = points,lines
#factor = subsets of data, and they need to be properly labeled
#qplot hides a lot of details of ggplot function 
#color = color by different factors 
#geom = ("point", "smooth") adding stats, including smooth and CI 
#facets are like panels facet = .~ or ~. rows and columns 
#density smooth geom= "density"
# + geom_smooth(method = "lm")
#summary of ggplot object is helpful 
#default for smooth is loess smoother 
#geom_point (color = 'steelblue', size = 4,alpha = 1/2)

##WEEK 3: Clustering ###
#Hierarchical Clustering: agglomerative approach
#Needs Distance and merging approach
#Gets a Dendogram
#distance can be continuous and binary
#find distance
dist(dataframe) #defults to Euclidean 
#then make dendrogram
#hclust(dist(dataframe))
#myplclust
#how to merge points: 
#can average
#can complete linkage
heatmap(as.matrix(data))
#make sure to scale variables
#determining how many clusters isnt always obvious
#mostly for exploratory analysis

#K means clustering#
#define distance: Euclidean, correlation,binary
#define number of clusters before --> get centroid of each cluster --> assign obvs to centroids --> reiterate
kmeans(data, centers)
point(kmeansObj$centers)

#PCA and Singular Value Decomp
#not all variables are all independant factors 
#want to create new set of variables which are independant AND Explain as much variance as possible <- PCA
#want the new matrix to be a smaller data set that also explains the data <- SVD
#SVD: X = UDV^t 
  # X = matrix, U = orthogonal (left singular vectors), V (right singular vectors), D= diagnonal matrix (singular values)
  #D matrix gives variance explained, in terms of components
#plotting u and v can maybe detect boundaries 
#but plotting d  / sum(d) will give proportion of the varience explained

#PCA: uses SVD except normalizes is by subtracting column mean and dividing by standard deviation

#need to get rid of missing values first
#can impute data with library(impute), impute.knn
#scale matters
#other alternatives: 
  #factor analysis, independent component analysis, latent semantic analysis 

##colors##
#grDevices package
#interpolates colors
colorRamp(c("red", "blue"))
colorRampPalette()

#RColorBrewerPackage
#gives a set of palattes 
  #sequential (ordered), diverging, qualitative (not ordered)

#scatterplot with ALOT of points
#rgb function is good too
smoothScatter()



#http://sebastianraschka.com/Articles/heatmaps_in_r.html#clustering

