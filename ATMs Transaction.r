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
the_ATM_Activation <-c(Full_Data$atm_status)
The_Boolean_VEC <- the_ATM_Activation=="Active"
The_Boolean_VEC_Inactive <- the_ATM_Activation=="Inactive"
the_Index_of_True <- which(The_Boolean_VEC,TRUE)
the_Index_of_True_Inactive<- which(The_Boolean_VEC_Inactive,TRUE)
Full_Data$Index <- c(1:(length(Full_Data$atm_id)))
The_Active_ATMs<-Full_Data[the_Index_of_True,]
The_Inactive_ATMS<-Full_Data[the_Index_of_True_Inactive,]
View(The_Active_ATMs)
ratio_Active_ATMs<-(length(The_Active_ATMs$Index))/(length(Full_Data$Index))
ratio_INActive_ATMs<-(length(The_Inactive_ATMS$Index))/(length(Full_Data$Index))
print(paste("The Ratio of ACtive ATMS =",ratio_Active_ATMs*100,"%"))
print(paste("The Ratio of ACtive ATMS =",ratio_INActive_ATMs*100,"%"))
length_of_InActive<-length(The_Inactive_ATMS$Index)
cc<-The_Inactive_ATMS$atm_manufacturer
i<-0
while (cc=="NCR") {
  i=i+1
}
print(i)
if(i==length(The_Inactive_ATMS$Index))
  print("All INactive ATMS made by NCR")

