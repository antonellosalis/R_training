##############################################################
# 
# MOD_A1 
# R Training
# # Developed and manteined by Antonello Salis
# antonellosalis@gmail.com
# antonello.salis@fao.org
# Ver: 20190129
#
##############################################################


# Type CTRL+Enter at the begin of the line when you want to send a command from here to the console.
# Select the command and then CTRL+Enter to send a portion of the script or a selected command
# Type CTRL+1,CTRL+2,CTRL+3,CTRL+4 as shortcut to move around the 4 spaces of RStudio

# Before start remember that this line is a comment, because the # starts a comment line

THIS IS NOT A COMMENT

# A first view on RStudio

# Simple operations
2+3

#2+3 
#You see? If I add # to a line the operation will be ignored
#Below some simple operations that can be done on R

2*3
2-3
2/3
2^3
2%%3
sqrt(2)
log(2)
log10(2)
log1p(2)
2+3; 2*3; log10(2)

# Help!

?log
?sqrt

#Example here the first important command:

rm(list=ls())
# Translation: rm() means remove 
#              list() mean (surprise!) list
#              ls() give us the list of all the objects in our workspace
#              This command will clean the workspace and all the objects!

# Restart the plot device
dev.off()
# Translation: "please RStudio  also clean all the graphics"
# It is recomnmended to clean the plot device and the environment in RStudio before start.
#Assignation process, we can assign, numbers, names, vectors, datasets, tables and commands

A <- 3

B <- 10

A + B

a + B

# This means R is CaSe SeNsItIve!

A + B + 2

A <- B

# A + B + 2 = ?


C <- A + B + 2

C

#Now, we create a medium box, a vector
NFI_DBH <- c(12.3,7,8.4,13.9,6)
NFI_DBH
# "<-" Means assign
# "c" Means combine

#Let's view this first vector
NFI_DBH
#In a different view
View(NFI_DBH)

# How to view the third data?
NFI_DBH[3]

# A first and simple operation
mean(NFI_DBH)
mean(NFI_DBH[3:4])

# BONUS TIP & TRICKS: Clic on the TAB button to complete the command
# For example me+TAB to complete mean then Eth+TAB to complete Ethiopian_DBH

#  A new list
NFI_Data <-c("Juniperus spp.", 30, "12", "SU15")
mean(NFI_Data)

# TIPS & TRICKS: Spaces, dots, minus, commas are not allowed in varable names...so if you 
# ned spaces only use underscores
NFI_DBH_average <- mean(NFI_DBH)
NFI_DBH_average


typeof(NFI_DBH_average)

typeof(NFI_DBH)

typeof(NFI_Data)

summary(NFI_DBH)

# A simple plot
NFI_DBH
plot(NFI_DBH)

# Particular cases
#  NA

NFI_Heights <- c(12,34.4, 5, 12, NA)
mean(NFI_Heights)
mean(NFI_Heights, na.rm = T)
# What it means?
# We are asking R: please don't consider NA values in this mean.

plot(NFI_DBH,NFI_Heights)

# Logical operations
10>12

1<2

A <- 10>12

B <- 1<2

A

B

##############################################################
# 
#   Exercises
#
##############################################################

#1. Create a new vector called 
#   NFI_Densities containig 5 realistic wood densities;

#2. Crete a new vector called NFI_Species 
#   containg 5 tree species;

#3. Calculate the average of NFI_densities;

#4. Calculate the average of the first three elements 
#   of NFI_densities;

#5. Create a new vector containing the log of 
#   NFI_densities called Log_NFI_densities;
 
#6. Simple plot of log_NFI_densities
