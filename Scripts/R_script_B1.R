##############################################################
# 
# MOD_B1 
# R Training
# # Developed and manteined by Antonello Salis
# antonellosalis@gmail.com
# antonello.salis@fao.org
# Ver: 20190316
#
##############################################################

#I import my graphic library (there ae several, ggplot is just one of them)
library("ggplot2") #or require()

#Environment cleaning, data import and merging
rm(list = ls())
dev.off()

setwd("~/R_projects/R_training/")
getwd()
Data <- read.csv("Data_training//tree.csv", sep = ",", header = T)
SU_Admin <- read.csv("Data_training/coordinates.csv", sep = ",", header = T)
names(Data)
names(SU_Admin)
SU_Admin$Cluster <- SU_Admin$cluster
Data_admin <- merge(Data, SU_Admin, by= 'Cluster', all.x = T)

hist(Data_admin$DBH)
plot(Data_admin$total_height~Data_admin$DBH)

#qplot means quick plot
qplot(data=Data_admin, DBH, y=total_height, geom="point")

qplot(data=Data_admin[Data_admin$DBH<50,], DBH, y=total_height, geom="point")

qplot(data=Data_admin[Data_admin$total_height<3 & Data_admin$DBH<40,], DBH, y=total_height, geom="point")

#Same kind of output with ggplot
ggplot(Data_admin, aes(DBH, total_height)) + 
  geom_point()

#Let's try a barplot
qplot(data=Data_admin[Data_admin$DBH<50,], DBH, fill=LULC, geom="bar")

#In this case is useful to convert our continuous dataset in ranks
seq(min(Data_admin$DBH, na.rm = T), max(Data_admin$DBH, na.rm = T), by=5)

Data_admin$DBHclasses<-cut(Data_admin$DBH, breaks=c(seq(5,50,by=5)), 
                           labels=c("5-10","10-15","15-20","20-25","25-30","30-35","35-40","40-45","45-50"))

Data_admin$DBHclasses<-cut(Data_admin$DBH, breaks=c(-Inf,seq(5,50,by=5),+Inf), 
                           labels=c("<5","5-10","10-15","15-20","20-25","25-30","30-35","35-40","40-45","45-50",">50"))

# Differences between qplot and ggplot
qplot(data=Data_admin, DBHclasses, fill=LULC, geom="bar")

ggplot(Data_admin, aes(DBHclasses, total_height)) + 
  geom_point()

# ggplot is much more customizable
ggplot(Data_admin, aes(DBHclasses, total_height,colour=LULC)) + 
  geom_point()

# I can add fifferent information layers
ggplot(Data_admin, aes(DBHclasses)) + 
    geom_bar(fill="blue")

ggplot(Data_admin, aes(DBHclasses)) + 
  geom_bar(fill="#9183E6")

ggplot(Data_admin, aes(DBH, total_height))+
  geom_point()+
  geom_smooth()

ggplot(Data_admin, aes(DBH, total_height))+
  geom_point(aes(colour=LULC, shape=Admin))

  
ggplot(Data_admin, aes(DBH, total_height))+
  geom_point(aes(colour=LULC, shape=Admin, size=crown_diameter))


ggplot(Data_admin, aes(DBHclasses, total_height))+
  geom_point(aes(colour=LULC, shape=Admin, size=crown_diameter))


ggplot(Data_admin, aes(DBHclasses, total_height))+
  geom_point(aes(colour=crown_diameter, shape=Admin, size=crown_diameter, alpha=0.5))

ggplot(Data_admin, aes(DBHclasses, total_height))+
  geom_point(aes(colour=crown_diameter, 
                 shape=LULC, alpha=0.5))

ggplot(Data_admin, aes(DBH, total_height))+
  geom_point()+
  geom_smooth(method = "lm", 
              formula = y~x+log(x), se=T, color="red")

ggplot(Data_admin, aes(DBHclasses, fill=LULC))+
  geom_bar()+
  labs(title="DBH classes by LULC")


##############################################################
# 
#   Exercises
#
##############################################################

# Prepare three different graphics (your choice) using the given data and explain the content 
