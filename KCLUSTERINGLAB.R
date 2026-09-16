########################################
#### ***K*-means Clustering**      #####
########################################

#Create simulated data
set.seed(2) # why do we set a seed? 
# To find a random number in aisle 2 between 1-50. 
x=matrix(rnorm(50*2), ncol=2) # what distribution are observations being drawn from?
# Normal distribution 
x[1:25,1]=x[1:25,1]+3 # what does "+3" do?
# It adds 3 to V1/ first aisle 

x[1:25,2]=x[1:25,2]-4 # what does "-4" do?
# Subtracts 4 from v2/ second aisle 
km.out=kmeans(x,2,nstart=20) # what does the 2 mean? 2 represents the number of clusters and why did we choose 2? We chose 2 because we have 2 aisles?
# what does the nstart argument do? Trying 20 different random starts. 

#What objects / values are returned (in the output)?
# lists, matrices, and integers
#Use help

#Investigate output
km.out$cluster
plot(x, col=(km.out$cluster+1), main="K-Means Clustering Results with K=2", 
     xlab="", ylab="", pch=20, cex=2)

#What do you notice about the cluster assignments?
# I notice that they are separated by color. There are 2 clusters. The green ones on the left side have a low x, but a high y. And red is the opposite. 

#Use k=3 clusters 
set.seed(4)
km.out=kmeans(x,3,nstart=20)
km.out
plot(x, col=(km.out$cluster+1), main="K-Means Clustering Results with K=3", 
     xlab="", ylab="", pch=20, cex=2)

#What do you notice about the cluster assignments now?
# Now there are 3 clusters and its in the upper level in the right, low x and high y. 
#Compare the results of one initial assignment to many initial assignments.
km.out=kmeans(x,3,nstart=1)
km.out$tot.withinss
km.out=kmeans(x,3,nstart=20)
km.out$tot.withinss
# The within ss is higher where there are less random intial configurations
#What does **tot.withinss** tell us?
# within tells us the total sum of squares within the clusters