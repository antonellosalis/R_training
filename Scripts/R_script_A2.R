##############################################################
# 
# MOD_A2 
# R Training, Ethiopia
# Last: 2017/07/06
# Developed and manteined by Antonello Salis
# antonello.salis@fao.org
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
setwd("../Data_Training/")
getwd()
Data <- read.csv("trees.csv", sep = ",", header = T)

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
Data$tree_dbh

Data$tree_height
mean(Data$tree_dbh, na.rm=T)
SC_names<-Data$tree_species_scientific_name
mean(Data$tree_height)
mean(Data$tree_height, na.rm = T)
# Why NA? How we can solve?

# Other basic calculations by columns

max(Data$tree_dbh, na.rm=T)
min(Data$tree_dbh, na.rm = T)
length(Data$tree_dbh)
sum(Data$tree_dbh, na.rm=T)

# Data selection

Data[3,10]

Data_sub <- Data[which(Data$tree_dbh>=50),c("tree_dbh","tree_height")]
head(Data_sub)
Data_SU124 <- Data[which(Data$sampling_unit_su_no==124),c("tree_dbh")]

Data_SU124

Data_SU115_P1_S_Acacia_seyal <- Data[which( Data$sampling_unit_su_no==115 & Data$plot_plot_no==1 & Data$tree_species_scientific_name=="Acacia seyal"),
                      ,]

View(Data_SU115_P1_S_Acacia_seyal)
# & means "AND"
# == means "equal to"
# =! means "different from"

1:12

3:6

Data_sub2 <- Data[which(Data$tree_dbh>=30),1:3]

# or 

Data_sub3 <- Data[which(Data$tree_dbh>=30),c(1,3)]


ls()

##############################################################
# 
#   Exercises
#
##############################################################

#1. Create a new vector called Ethiopian_DBH 
#    containig only the DBH column;

#2. Crete a new Dataset called Ethiopian_small_trees,
#   containing all the information related to trees with 
#   height less than 10 meters;

#3. Create a new vector called Ethiopian_DBHm 
#  containing the DBH in meters;

#4. Calculate the average of the first tree 10 dbh 
# of Ethiopian_small_trees;

#5. Create a new Dataset called Ethiopian_Eucaliptus,
#   containig only the Eucalitus trees;

#6. Simple correlation plot of DBH and Heigth

