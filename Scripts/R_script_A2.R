##############################################################
# 
# MOD_A2 
# R Training
# # Developed and manteined by Antonello Salis
# antonellosalis@gmail.com
# antonello.salis@fao.org
# Ver: 20190307
#
##############################################################


#Download and/or copy the Data_Training folder inside your R_training folder
#Let's import the NFI dataset
rm(list = ls())
dev.off()
# 

# It's time to better organize our ideas!
# We have to try to be methodical.
# First we set our Working Directory
setwd("~/R_projects/R_training/") 
# For Windows users under the quotation we paste the path, this can be:
# Absolute is like: C:\Documents\ or 
# relative if you already are in the Hard Drive you want: /R_training
# For Unix users: 
# the absolute path starts with home
# /home/UserName/R_training  or ~/R_training


getwd()
Data <- read.csv("Data_training/tree.csv", sep = ",", header = T)

# How can we display data?

Data

View (Data)

# How to show only the first lines

head(Data)

# ...and how to show the last lines 
names(Data)
tail(Data)

# (please see ?head and ?tail for more informations)
# Another option for help is...

help(summary)

summary(Data)

# Which objects are in my Environment?

ls()

# Let's analyse the Dataframe

str(Data)

dim(Data)
nrow(Data)
ncol(Data)
# How to show only one column?
names(Data)
Data$DBH

Data$total_height
mean(Data$DBH, na.rm=T)
SC_names<-Data$Scientific_name
mean(Data$total_height)
mean(Data$total_height, na.rm = T)
# Why NA? How we can solve?

# Other basic calculations by columns

max(Data$DBH, na.rm=T)
min(Data$DBH, na.rm = T)
length(Data$DBH)
sum(Data$DBH, na.rm=T)

# Data selection

Data[3,10]

Data_sub <- Data[which(Data$DBH>=50),c("DBH","total_height")]
head(Data_sub)
Data_SU24 <- Data[which(Data$Cluster=="SU24"),c("DBH")]

Data_SU24

Data_SU11_Rhus <- Data[which( Data$Cluster=="SU11" & Data$Scientific_name=="Rhus vulgaris"),]
Data_SU11_Rhus

# & means "AND"
# == means "equal to"
# =! means "different from" if we use numbers
# if we use string to exclude a value we use the "!" before the selector Data[which(!Data$Cluster=="SU11"), ]

1:12

3:6

Data_sub2 <- Data[which(Data$DBH>=30),1:3]

# or 

Data_sub3 <- Data[which(Data$DBH>=30),c(1,3)]


ls()

##############################################################
# 
#   Exercises
#
##############################################################

#1. Create a new vector called NFI_DBH containig only the DBH column;

#2. Crete a new Dataset called NFI_small_trees,containing all the information related to trees with 
#   height less than 10 meters;

#3. Create a new vector called NFI_DBHm, containing the DBH in meters;

#4. Calculate the average of the first 10 dbhs in NFI_small_trees;

#5. Create a new Dataset called NFI_Acacia,containig only the Acacia;

#6. Simple correlation plot of DBH and Heigth

