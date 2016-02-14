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
plot(finframe$subbtime,finframe$gap,type="l",col="black")
