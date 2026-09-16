#load the packages
library(ISLR)
library(tidyverse)

#Read the data
data = read.csv("ais_data.csv")
data

data_scaled = scale(data) #Scale the data with a mean of 0 and a standard deviation of 1 so variables on a larger scale do not dominate the calculation

#K-Means Clustering
set.seed(2) #Allows us to replicate random number sequence
kvalues = 2:8 #Sequence of integers from 2 to 8 representing K 
tot_withinss = numeric(length(kvalues)) #Saved vector with the WSS (how clustered the data is)

for (i in 1:length(kvalues)){
  k = kvalues[i] #pulls actual number of clusters that we pass in k-means algorithm
  km.out = kmeans(data_scaled, centers = k, nstart= 20) #Tries 20 different initial random assignments and keeps the one with the lowest SS
  tot_withinss[i] = km.out$tot.withinss  #Store into the vector
}  

plot(kvalues, tot_withinss, type = "b", pch = 19, col = "blue", xlab = "Number of Clusters K",ylab = "Total Within-Cluster Sum of Squares", main = "Elbow Plot for Optimal K Selection")
#Optimal K is where the curve begins to flatten out because as K increases, WSS decreases

optimalK = 3
set.seed(2)
finalkm = kmeans(data_scaled, centers=optimalK, nstart= 20) #Distinct 3 clusters and triny g20 different assignments and keeping the best
scaled = finalkm$centers 
means = colMeans(data) #Means for each of the variables
sds = apply(data, 2, sd)

unscaledcenter = t(apply(scaled, 1, function(row) { #StatMate Gemini Gem
  row * sds + means
}))

print(unscaledcenter) #cluster centroids in original units

#Hierarchical Clustering
