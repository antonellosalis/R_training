##############################################################
# 
# MOD_A3 
# R Training
# # Developed and manteined by Antonello Salis
# antonellosalis@gmail.com
# antonello.salis@fao.org
# Ver: 20190304
#
##############################################################


# Where learn R and RStudio and where find solutions
# 
# http://stackoverflow.com/
# http://www.r-bloggers.com/
# https://google.github.io/styleguide/Rguide.xml

# Import your Data 

rm(list = ls())
dev.off()

setwd("~/R_projects/R_training/")
getwd()

Data <- read.csv("Data_training/tree.csv", sep = ",", header = T)
Data
#Object dimensions
dim(Data)
nrow(Data)
ncol(Data)

# Lines extractions
Data[2,7]
Data[2:5,7]
#Select the line 345 and assign it to a variable
Data_345 = Data[345,]

# Select the first 3 lines of the tree_dbh column

Data_DBH_3 <-Data[1:3, c("DBH")]
Data_DBH_3 <-Data[1:3, "DBH"]
Data_DBH_3 <-Data[1:3, 5]

# Select the 5th column
Data[,5]
# Select first 20 lines and assign it to a variable

Data_20 <- Data[1:20,]
Data_20

# Select the first 20 lines and first 5 columns


Data_20_5 <- Data[1:20, 1:5]

# Multiple criteria selection
# & means AND
Data_training <- Data[Data$Cluster=="SU12" & Data$DBH>30,]

# How to install external libraries

# First let see the installed packages list
installed.packages()

# Let's install our first package 

install.packages("ggplot2", dependencies=T)
library (ggplot2)

# If internet is down use this syntax

install.packages("PATH TO ZIP FILE", repos = NULL)



##############################################################
# 
#   Exercises
#
##############################################################

#1. How many trees there are in the dataset with DBH>40 and height>20?
#2. Create a new dataframe with these trees (call BIG_TREES);
#3. Create a list with only the big trees Species name;
#4. Calculate the average of DBH and height of the big trees;
#5. Eliminate the stumps;
#6. Correlation plot of DBH and Heigth



