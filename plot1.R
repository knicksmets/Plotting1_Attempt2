setwd("~/AAWorkingDIR")
hpower<-read.csv("hpc.txt",header=TRUE,sep=";")
##******************************************
##### this is the format that the date is in
hpower[,1] <- as.Date(hpower[,1], format='%d/%m/%Y')
hpower[,3] <- as.numeric(hpower[,3])
gtime<-paste(hpower$Date,hpower$Time)
fftime<-as.POSIXct(gtime,format= "%Y-%m-%d %H:%M:%S")

hpsub = subset(hpower,Date >= "2007-02-01" & Date <= "2007-02-02")
hpsub=mutate(hpsub,gap= Global_active_power/1000)

hist(hpsub$gap,main="Global Active Power",xlab="Global Active Power (kilowatts)",col="red",ylim=c(0,1400))
hist(hpsub$gap,main="Global Active Power",xlab="Global Active Power (kilowatts)",col="red")
