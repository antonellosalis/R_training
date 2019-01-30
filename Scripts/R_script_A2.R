##############################################################
# 
# MOD_A1 
# R Training
# # Developed and manteined by Antonello Salis
# antonellosalis@gmail.com
# antonello.salis@fao.org
# Ver: 20190130
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
setwd("Data_training/")
getwd()
Data <- read.csv("tree.csv", sep = ",", header = T)

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
Data$diameter

Data$total_height
mean(Data$diameter, na.rm=T)
SC_names<-Data$tree_species_scientific_name
mean(Data$total_height)
mean(Data$total_height, na.rm = T)
# Why NA? How we can solve?

# Other basic calculations by columns

max(Data$diameter, na.rm=T)
min(Data$diameter, na.rm = T)
length(Data$diameter)
sum(Data$diameter, na.rm=T)

# Data selection

Data[3,10]

Data_sub <- Data[which(Data$diameter>=50),c("diameter","total_height")]
head(Data_sub)
Data_SU24 <- Data[which(Data$cluster_no=="SU24"),c("diameter")]

Data_SU24

Data_SU11_Rhus <- Data[which( Data$cluster_no=="SU11" & Data$species_scientific_name=="Rhus vulgaris"),]
Data_SU11_Rhus

# & means "AND"
# == means "equal to"
# =! means "different from"

1:12

3:6

Data_sub2 <- Data[which(Data$diameter>=30),1:3]

# or 

Data_sub3 <- Data[which(Data$diameter>=30),c(1,3)]


ls()

##############################################################
# 
#   Exercises
#
##############################################################

#1. Create a new vector called NFI_DBH 
#    containig only the DBH column;

#2. Crete a new Dataset called NFI_small_trees,
#   containing all the information related to trees with 
#   height less than 10 meters;

#3. Create a new vector called NFI_DBHm 
#  containing the DBH in meters;

#4. Calculate the average of the first tree 10 dbh 
# of NFI_small_trees;

#5. Create a new Dataset called NFI_Acacia,
#   containig only the Acacia;

#6. Simple correlation plot of DBH and Heigth

