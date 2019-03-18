##############################################################
# 
# MOD_A4 
# R Training
# # Developed and manteined by Antonello Salis
# antonellosalis@gmail.com
# antonello.salis@fao.org
# Ver: 20190311
#
##############################################################

#No comments here, you're supposed to be very familiar with these commands now :)
rm(list = ls())
dev.off()
setwd("~/R_projects/R_training/")
getwd()
Data <- read.csv("Data_training//tree.csv", sep = ",", header = T)
Data

# The command:
seq(1:10);
# Show us the first 10 integers

# This one the integers 4 to 100 but jumping by 3 units 
seq(4,100,by=3)

# What show us this command?:
Data[,1]

# And this?:
length(Data[,1])
# Do you remeber dim(Data)?
# And this? :
<<<<<<< HEAD
seq(1:100)
=======
>>>>>>> 138421f8cdd8bc0ea264605efc59f364a8f63daa
seq(1:length((Data[,2])))

# integer for each line of our dataset

# Now, if we want to assign a "name" for each line instead the use of a simple
# integer, we will use a "code" composed by letter "T" followed by a 
# sequential number one for each line.

# to obtain this result, we ace to paste the "T" letter to our sequence
# like this:
paste('T', Data$Cluster,seq(1:length((Data[,2]))))
# Translation: please R show a sequence from 1 until the last line of our 
# Dataset and paste letter "T"
# The proble is that the "paste" command left in the list a space between 
# the "T" and the number. To correct this problem we use in the command paste()
# the option sep  =  that translated is "separated by"
# in this option sep = '' (separated by ...NOTHING)
<<<<<<< HEAD
paste('T', Data$Cluster,seq(1:length((Data[,2]))), sep  = '_')
=======
paste('T', seq(1:length((Data[,2]))), sep  = '_')
>>>>>>> 138421f8cdd8bc0ea264605efc59f364a8f63daa

# Here the full command:
Data$ID <- c(paste('T', Data$Cluster ,seq(1:length((Data[,2]))), sep  = '_'))
head(Data)

# Other ways to create a dataframe
Data_species <- data.frame(Data$ID,Data$Cluster,Data$Scientific_name, 
                      Data$DBH, 
                      Data$total_height)
<<<<<<< HEAD
head(Data_species)
=======
>>>>>>> 138421f8cdd8bc0ea264605efc59f364a8f63daa

colnames(Data_species)<-c("ID",
                     "Cluster",
                     "Specie", 
                     "DBH", 
                     "Height")
<<<<<<< HEAD
#Obtain the same column name by replacing "Data." with "" using the command gsub
=======

>>>>>>> 138421f8cdd8bc0ea264605efc59f364a8f63daa
dim(Data_species)
summary(Data_species)


# How many NA's there are in our dataframe?
sum(is.na(Data_species$Specie))

# In percent
sum(is.na(Data_species$Specie))/length(Data_species[,1])*100


Unknown_species <- unique(Data_species[is.na(Data_species$Specie),])
dim(Unknown_species)
<<<<<<< HEAD
#I want the number of the species on Data
(unique(Data$Scientific_name))
head(Data)
=======

>>>>>>> 138421f8cdd8bc0ea264605efc59f364a8f63daa
write.csv(Unknown_species,"Unknown_SP.csv")

SU_Admin <- read.csv("Data_training/coordinates.csv", sep = ",", header = T)

SU_Admin
<<<<<<< HEAD
names(Data)
names(SU_Admin)
=======

>>>>>>> 138421f8cdd8bc0ea264605efc59f364a8f63daa
SU_Admin$Cluster <- SU_Admin$cluster

Data_admin <- merge(Data, SU_Admin, by= 'Cluster', all.x = T)

Species <- unique(Data$Scientific_name)

# In this case is not necessary, but if we want to substitute a string:
# we use gsub command (grep-sub):

Species <- (gsub("\\ var.*","", Species))
Species <- (gsub("\\ sp.*","", Species))
Species <- (gsub("\\ subsp.*","", Species))

##############################################
############                      ############
############       PLAYTIME       ############
############(IN THE NEXT EPISODES)############
############                      ############
##############################################

library(ggplot2)
<<<<<<< HEAD
ggplot(Data, aes(x=DBH, y=total_height, label=ID)) + geom_text(cex=5)

# What is the result of this code?
p <- ggplot(Data[which(Data$Year<2017),], aes(x=DBH, y=total_height, label=ID))
p <- p + geom_point(cex=4)
=======
p <- ggplot(Data, aes(x=DBH, y=total_height, label=ID))
p <- p + geom_text(cex=5)
p
# What is the result of this code?
p <- ggplot(Data[which(Data$Teamleader=="Mr. X"),], aes(x=DBH, y=total_height, label=ID))
p <- p + geom_point(cex=1)
>>>>>>> 138421f8cdd8bc0ea264605efc59f364a8f63daa
p

##############################################
############                      ############
############   EXERCICE SECTION   ############
############                      ############
##############################################

# 1. Obtain a dataset containing each Forest type with no repetitions
#     
# 2. Obtain a list of Sc. names with no repetitions.

<<<<<<< HEAD
=======

##############################################
############                      ############
############   EXERCICE SECTION   ############
############                      ############
##############################################

>>>>>>> 138421f8cdd8bc0ea264605efc59f364a8f63daa
# Recall the BIG_Trees Dataset obtained by the new Dataset 
# and add the correspondant ID to it

#1. Create a LIST with the ID of the 10 bigger diametres; 
#2. Create a new DATAFRAME with the 10 higher trees;
#3. Create new column in the Data Dataset obteined by the ratio height/DBH;
#4. Eliminate the stumps from Data;
#5. Count the NA occurrences in the heights columns
#6. Invent a new ID and explain it 

