#new dataset is saved in order to compute with smaller numbers of rows.
last1 <- read.table("data.txt", sep ="")

#check data
View(last) 

#Country codes are provided by CEPII
#Turkey, Germany, South Africa, South Korea, Mexico, Poland, South Korea and Japan subsetted to the dataset.
last1=last[last$exporter=="792"|last$exporter=="842"|last$exporter=="392"|last$exporter=="410"|last$exporter=="276"|last$exporter=="616"|last$exporter=="711"|last$exporter=="484",]
head(last1)

#additinal column to see value added per country.
last1$valueadd=last1$value/last1$quantity
##############################################
#Up to here,
#Raw data of 50millions columns are subsetted and merged.
#Smaller data set is saved, and all the process will be lead through the data.txt.
#data.txt saved with header TRUE.
#################################################################################################
#One can only run the data.txt above and run this code on any computer.
last1=read.table("data.txt",header=T)
head(last1)
############################################################################################
#######START POINT#################

#cars and three main parts are subsetted.
cars <- last1[grep("8703", last1$hs96), ]
engine <- last1[grep("840991", last1$hs96), ]
suspension <- last1[grep("870880", last1$hs96), ]
transmission<- last1[grep("870840",last1$hs96), ]
head(last1)

#required plots
library(ggplot2)
library(dplyr)

#we subset cars regarding value added by using dplyr 
a=cars%>%group_by(exporter,time)%>%summarize(sum_add = sum(valueadd, na.rm = TRUE))
#dataframing the object a in order to penetrate country names instead of numbers
a1=data.frame(a)
Country=c(rep("Germany",19),rep("Japan",19),rep("Korea",19),rep("Mexico",19),rep("Poland",19),rep("SouthAfrica",19),rep("Turkey",19),rep("USA",19))
a1$Country=Country
#plotting above-mentioned
ggplot(a1, aes(x = time, y=log(sum_add), colour=Country))+geom_line()+geom_point()+theme_bw()+xlab("Time")+ylab("Logarithm of Value Added")+labs(title="Evolution of Value Added of Selected Countries in terms of Vehicles")

#next 3 organization is the same as above##########################################################
  
b=engine%>%group_by(exporter,time)%>%summarize(sum_add = sum(valueadd, na.rm = TRUE))
b1=data.frame(b)
Country=c(rep("Germany",19),rep("Japan",19),rep("Korea",19),rep("Mexico",19),rep("Poland",19),rep("SouthAfrica",19),rep("Turkey",19),rep("USA",19))
b1$Country=Country
ggplot(b1, aes(x = time,y=log(sum_add),colour=Country))+geom_line()+geom_point()+theme_bw()+xlab("Time")+ylab("Logarithm of Value Added")+labs(title="Evolution of Value Added of Selected Countries in terms of Engine")


s=suspension%>%group_by(exporter,time)%>%summarize(sum_add = sum(valueadd, na.rm = TRUE))
s1=data.frame(s)
Country=c(rep("Germany",19),rep("Japan",19),rep("Korea",19),rep("Mexico",19),rep("Poland",19),rep("SouthAfrica",19),rep("Turkey",19),rep("USA",19))
s1$Country=Country
ggplot(s1, aes(x = time,y=log(sum_add),colour=Country))+geom_line()+geom_point()+theme_bw()+xlab("Time")+ylab("Logarithm of Value Added")+labs(title="Evolution of Value Added of Selected Countries in terms of suspension")




d=transmission%>%group_by(exporter,time)%>%summarize(sum_add = sum(valueadd, na.rm = TRUE))
d1=data.frame(d)
Country=c(rep("Germany",19),rep("Japan",19),rep("Korea",19),rep("Mexico",19),rep("Poland",19),rep("SouthAfrica",19),rep("Turkey",19),rep("USA",19))
d1$Country=Country
ggplot(d1, aes(x = time,y=log(sum_add),colour=Country))+geom_line()+geom_point()+theme_bw()+xlab("Time")+ylab("Logarithm of Value Added")+labs(title="Evolution of Value Added of Selected Countries in terms of transmission")

#######################################################################################

#using treemap in order proportinate the export values' size of 8 different countries.
library(treemap)
#using dplyr, grouping the exporters 
cv=last1 %>% group_by(exporter) %>% summarize(Value = sum(value, na.rm = TRUE))
#penetrating the country names in the same order of countries
cv$Country=c("Germany","Japan","Korea","Mexico","Poland","SouthAfrica","Turkey","USA")
#plotting treemap
#this map shows us a relative size of exporters regarding the car
#and other three main parts
treemap(cv, index=c("Country"), vSize="Value", type="index",
        fontsize.labels=c(15,12), fontcolor.labels=c("white","orange"), 
        fontface.labels=c(2,1),  bg.labels=c("transparent"), 
        align.labels=list(c("center", "center"),c("right", "bottom")),
        overlap.labels=0.5, 
        inflate.labels=F,
        title.legend = "Relative share in terms of Export Value")


head()

#subsetting Turkey from our main data set
last1_turkey=last1[last1$exporter=="792",]
head(last1_turkey)
library(dplyr)
#it is intened to see Turkish imports
newdata=last1_turkey%>%group_by(time,importer)%>%summarise(Value=sum(value))
#penetration of country names into dataframe
newdata=newdata[newdata$importer=="842"|newdata$importer=="392"|newdata$importer=="410"|newdata$importer=="276"|newdata$importer=="616"|newdata$importer=="711"|newdata$importer=="484",]
newdata$importer[newdata$importer=="842"]="USA"
newdata$importer[newdata$importer=="392"]="Japan"
newdata$importer[newdata$importer=="410"]="Korea"
newdata$importer[newdata$importer=="276"]="Germany"
newdata$importer[newdata$importer=="616"]="Poland"
newdata$importer[newdata$importer=="711"]="SouthAfrica"
newdata$importer[newdata$importer=="484"]="Mexico"
#to benefit from vector properties, we define it as factor instead of
#integer
newdata$importer=as.factor(newdata$importer)
#plotting
ggplot(newdata, aes(x=time, y=Value, fill=importer)) + geom_area()+theme_bw()+labs(title="Turkish Import")


#using the above-mentioned process to extract export relation of Turkey##################
last11_turkey=last1[last1$importer=="792",]
library(dplyr)
newdata1=last11_turkey%>%group_by(time,exporter)%>%summarise(Value=sum(value))
newdata1=newdata1[newdata1$exporter=="842"|newdata1$exporter=="392"|newdata1$exporter=="410"|newdata1$exporter=="276"|newdata1$exporter=="616"|newdata1$exporter=="711"|newdata1$exporter=="484",]
newdata1$exporter[newdata1$exporter=="842"]="USA"
newdata1$exporter[newdata1$exporter=="392"]="Japan"
newdata1$exporter[newdata1$exporter=="410"]="Korea"
newdata1$exporter[newdata1$exporter=="276"]="Germany"
newdata1$exporter[newdata1$exporter=="616"]="Poland"
newdata1$exporter[newdata1$exporter=="711"]="SouthAfrica"
newdata1$exporter[newdata1$exporter=="484"]="Mexico"
newdata1$exporter=as.factor(newdata1$exporter)
ggplot(newdata1, aes(x=time, y=Value, fill=exporter)) + geom_area()+theme_bw()+labs(title="Turkish Export")
############################


#now, we want to make a bar chart to see the evolution of value addition of
#the four products.

#Cars - Turkey
c_turkey=cars[cars$exporter=="792",]
head(c_turkey)
tt=c_turkey%>%group_by(time)%>%summarise(averagevehicle=mean(valueadd))
tt

#engine-Turkey
e_turkey=engine[engine$exporter=="792",]
head(e_turkey)
tt1=e_turkey%>%group_by(time)%>%summarise(averageengine=mean(valueadd))
tt1

#suspension
s_turkey=suspension[suspension$exporter=="792",]
head(s_turkey)
tt2=s_turkey%>%group_by(time)%>%summarise(averagesuspension=mean(valueadd))
tt2

#transmission
t_turkey=transmission[transmission$exporter=="792",]
head(t_turkey)
tt3=t_turkey%>%group_by(time)%>%summarise(averagetransmission=mean(valueadd))
tt3

ttfull=data.frame(tt$time,tt$averagevehicle,tt1$averageengine,tt2$averagesuspension,tt3$averagetransmission)
colnames(ttfull)=c("time","vehicle","engine","suspension","tranmission")
ttfull

#Year defined through rep function 4 times, since we have 4 products.
Year=rep(ttfull$time,4)
#Class defined 19 times since our range from 1996 to 2015 is 19, 2002 excluded.
Class=c(rep("vehicle",19),rep("engine",19),rep("submisson",19),rep("transmisson",19))
#binding the columns
AverageValueAdd=c(ttfull[,2],ttfull[,3],ttfull[,4],ttfull[,5])
#dataframing
deneme=data.frame(Year,Class,AverageValueAdd)
######################################################################
#grouping each part for valueadded
tt=cars%>%group_by(time)%>%summarise(averagevehicle=mean(valueadd))
tt
tt1=engine%>%group_by(time)%>%summarise(averageengine=mean(valueadd))
tt1
tt2=suspension%>%group_by(time)%>%summarise(averagesuspension=mean(valueadd))
tt2
tt3=transmission%>%group_by(time)%>%summarise(averagetransmission=mean(valueadd))
tt3
ttfull=data.frame(tt$time,tt$averagevehicle,tt1$averageengine,tt2$averagesuspension,tt3$averagetransmission)
colnames(ttfull)=c("time","vehicle","engine","suspension","tranmission")
ttfull
###########################
#evolution of Turkish products, value added
ggplot() + geom_bar(aes(y = AverageValueAdd, x = Year, fill = Class), data = deneme,stat="identity")+theme_bw()+coord_flip()+labs(title="Extension of Vehicles and Main Parts")

#adding the coordinates of 8 different counties
coor <- read.csv("countries_lat.csv", sep = ";")
#check
head(coor)
#adjusting the 
coordinates <- rbind(coor[coor$name == "Germany",],
                     coor[coor$name == "Japan",], coor[coor$name == "South Korea",]
                     ,coor[coor$name == "Mexico",],coor[coor$name == "Poland",],
                     coor[coor$name == "South Africa",],
                    coor[coor$name == "Turkey",], coor[coor$name == "United States",])
coordinates
cc<-coordinates$name

data=last1%>%group_by(exporter)%>%summarise(ValueAdd=sum(valueadd))
data=data.frame(data,coordinates)
data$order=c(30,40,25,15,5,20,10,35)
head(data)


library(leaflet)
library(raster)
leaflet(data) %>% addTiles() %>% 
  addCircleMarkers(data=data, lng=~longitude , lat=~latitude, 
                   radius= data$order,
                   color=~ifelse(data$order>20, "blue", "red"),
                   fillOpacity = 0.4) %>%
  addLegend("bottomright", colors= c("blue", "red"), labels=c("Advanced Economies", "EME"), title="Country Sets")


