Immigration <-read_xlsx("EmploymentDataByYear.xlsx")

Immigration<-as.data.frame(Immigration)
Immigration <- sapply(Immigration, as.numeric)
#Immigration <- apply(Immigration,2,mean)
Immigration

mean(Immigration$Civillian_Non_Institutional)
str(Immigration)

#Immigration[,1]<-Immigration[,1]*Immigration[,1]
str(as.numeric(Immigration))

Immigration[1,1]

Model <- ts(Immigration, start=c(1949), end=c(2019), frequency=1) # Yearly Data
plot(Model)






