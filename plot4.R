setwd("~/AAWorkingDIR")
hpower<-read.csv("hpc.txt",header=TRUE,sep=";")
##******************************************
##### this is the format that the date is in
hpower[,1] <- as.Date(hpower[,1], format='%d/%m/%Y')
hpower[,3] <- as.numeric(hpower[,3])

hpsub = subset(hpower,Date >= "2007-02-01" & Date <= "2007-02-02")
hpsub=mutate(hpsub,gap= Global_active_power/1000)

tiim<-paste(hpsub$Date,hpsub$Time)
subbtime<-as.POSIXct(tiim,format= "%Y-%m-%d %H:%M:%S")

finframe<-data.frame(cbind(subbtime,hpsub))

finframe[,6]<-as.numeric(finframe[,6])
finframe=mutate(finframe,volts= Voltage/10)
finframe[,5]<-as.numeric(finframe[,5])
finframe=mutate(finframe,globrepo= Global_reactive_power/1000)


old.par2<-par(mfrow=c(2,2))
plot(finframe$subbtime,finframe$gap,type="l",col="black")
plot(finframe$subbtime,finframe$volt,type="l",col="green",xlab="datetime",ylab="Voltage")
######################Composite
plot(finframe$subbtime,finframe$Sub_metering_1,xlab="",ylab="",type="l",col="black",ylim=range(c(finframe$Sub_metering_1,finframe$Sub_metering_2,finframe$Sub_metering_3)))
par(new=TRUE)
plot(finframe$subbtime,finframe$Sub_metering_2,xlab="",ylab="",type="l",col="red",ylim=range(c(finframe$Sub_metering_1,finframe$Sub_metering_2,finframe$Sub_metering_3)))
par(new=TRUE)
plot(finframe$subbtime,finframe$Sub_metering_3,ylab="Energy Sub_Metering",type="l",col="blue",ylim=range(c(finframe$Sub_metering_1,finframe$Sub_metering_2,finframe$Sub_metering_3)),ylab="Energy Sub_Meeting")
par(new=T)
#names=C("finframe$Sub_metering_1","finframe$Sub_metering_2","finframe$Sub_metering_3")
labels<- c("Sub_Meter1","Sub_Meter2","Sub_Meter3")
legend("topright",title="Legend",labels,lwd=2,col=c("Black","Red","Blue"),cex=0.5)
par(new=F)

plot(finframe$subbtime,finframe$globrepo,type="l",col="black")
par(old.par2)
#######################End Of Composite
plot(finframe$subbtime,finframe$globrepo,type="l",col="black",xlab="datetime",ylab="Global_Reactive_Power")
