# This program "ATMs Transaction" Creat by Mahmud Sayed Youssef
library(tidyverse)
library(tidyr)
library(dplyr)
library(purrr)
data1 = read.csv("data/atm_data_part1.csv")
data2 = read.csv("data/atm_data_part2.csv")
str(data1)
Full_Data <- rbind(data1,data2)
nrow(Full_Data)==nrow(data1)+nrow(data2)
View(Full_Data)
the_ATM_Activation <-c(Full_Data$atm_status)
The_Boolean_VEC <- the_ATM_Activation=="Active"
The_Boolean_VEC_Inactive <- the_ATM_Activation=="Inactive"
the_Index_of_True <- which(The_Boolean_VEC,TRUE)
the_Index_of_True_Inactive<- which(The_Boolean_VEC_Inactive,TRUE)
Full_Data$Index <- c(1:(length(Full_Data$atm_id)))
The_Active_ATMs<-Full_Data[the_Index_of_True,]
View(The_Active_ATMs)
The_Inactive_ATMS<-Full_Data[the_Index_of_True_Inactive,]
View(The_Inactive_ATMS)
ratio_Active_ATMs<-(length(The_Active_ATMs$Index))/(length(Full_Data$Index))
ratio_INActive_ATMs<-(length(The_Inactive_ATMS$Index))/(length(Full_Data$Index))
x<-round(ratio_Active_ATMs*100,2)
y<-round(ratio_INActive_ATMs*100,2)
print(paste("The Ratio of ACtive ATMS =",x,"%"))
print(paste("The Ratio of ACtive ATMS =",y,"%"))
length_of_InActive<-length(The_Inactive_ATMS$Index)
cc<-The_Inactive_ATMS$atm_manufacturer
table(cc)
print(paste("All INactive ATMS made by NCR with number",length(cc)))
table(The_Active_ATMs$atm_manufacturer)
the_ATM_Manufacturer <-c(Full_Data$atm_manufacturer)
The_Boolean_Manufacturer <- the_ATM_Manufacturer=="NCR"
the_Index_of_True_Manufacturer <- which(The_Boolean_Manufacturer,TRUE)
the_ATM_ByNCR<-Full_Data[the_Index_of_True_Manufacturer,]
Total_Atms_By_NCR<-length(the_ATM_ByNCR$Index)
Total_Atms_By_Diebold_Nixdorf<-(length(Full_Data$atm_manufacturer))-(length(the_ATM_ByNCR$Index))
D<-round((length(cc)/Total_Atms_By_NCR)*100,2)
print(paste("The number of ATMs made by NCR is",Total_Atms_By_NCR,"and the number of ATMS made by Diebold Nixdorf is",Total_Atms_By_Diebold_Nixdorf))
print( paste("The Ratio of in INactive ATMS made by Diebold Nixdorf = Zero and The Ratio of INactive ATMS made by NCR =",D,"%"))

