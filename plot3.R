setwd("~/AAWorkingDIR")
hpower<-read.csv("hpc.txt",header=TRUE,sep=";")
##******************************************
##### this is the format that the date is in
hpower[,1] <- as.Date(hpower[,1], format='%d/%m/%Y')
hpower[,3] <- as.numeric(hpower[,3])

hpsub = subset(hpower,Date >= "2007-02-01" & Date <= "2007-02-02")


tiim<-paste(hpsub$Date,hpsub$Time)
subbtime<-as.POSIXct(tiim,format= "%Y-%m-%d %H:%M:%S")

finframe<-data.frame(cbind(subbtime,hpsub))



#png(plot3.png)
plot(finframe$subbtime,finframe$Sub_metering_1,ylab="Energy Sub Metering",type="l",col="black",ylim=range(c(finframe$Sub_metering_1,finframe$Sub_metering_2,finframe$Sub_metering_3)))
par(new=TRUE)
plot(finframe$subbtime,finframe$Sub_metering_2,type="l",col="red",ylim=range(c(finframe$Sub_metering_1,finframe$Sub_metering_2,finframe$Sub_metering_3)))
par(new=TRUE)
plot(finframe$subbtime,finframe$Sub_metering_3,type="l",col="blue",ylim=range(c(finframe$Sub_metering_1,finframe$Sub_metering_2,finframe$Sub_metering_3)))
par(new=T)
#names=C("finframe$Sub_metering_1","finframe$Sub_metering_2","finframe$Sub_metering_3")
labels<- c("Sub_Meter1","Sub_Meter2","Sub_Meter3")
legend("topright",title="Legend",labels,lwd=2,col=c("Black","Red","Blue"),cex=0.5)
par(new=F)
#dev.off()


