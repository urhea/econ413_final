#Mert Yazal

#################################################################################
#                                                                               #  
#As explained in the presentation, BACII data set was processed in this project.# (not UNCOMTRADE)
#                                                                               #
#################################################################################


#the BACII dataset provided by CEPI can be imported only by manually downloading.
#This is because, as it is explained in CEPII's website, the data is annually updated, and CEPII does not provide an interactive database for individual subscriptors. 
#Therefore, I had to deal with laborious data extraction merging process: each .csv file varies between 5mil to 7mil rows, about 5.8 GB when summed, 
#and this was very time-consuming with my disabled macbook.
##########################################################################################################################################################################

#All the data set of predetermined range of years.
data1 = read.csv("baci92_1996.csv")
data2 = read.csv("baci92_1997.csv")
data3 = read.csv("baci96_1998.csv")
data4 = read.csv("baci96_1999.csv")
data5 = read.csv("baci96_2000.csv")
data6 = read.csv("baci96_2001.csv")
#data7 = read.csv("baci96_2002.csv") I had to exclude the year 2002 because CEPII data could not be read. 
data8 = read.csv("baci96_2003.csv")
data9 = read.csv("baci96_2004.csv")
data10= read.csv("baci96_2005.csv")
data11= read.csv("baci96_2006.csv")
data12 = read.csv("baci96_2007.csv")
data13= read.csv("baci96_2008.csv")
data14 = read.csv("baci96_2009.csv")
data15= read.csv("baci96_2010.csv")
data16 = read.csv("baci96_2011.csv")
data17= read.csv("baci96_2012.csv")
data18= read.csv("baci96_2013.csv")
data19= read.csv("baci96_2014.csv")
data20= read.csv("baci96_2015.csv")

#column names are renamed, from i to exporter, from j to impoter, from v to value, q to quantity.
colnames(data1)=c("time","hs96","exporter","importer","value","quantity")
colnames(data2)=c("time","hs96","exporter","importer","value","quantity")
colnames(data3)=c("time","hs96","exporter","importer","value","quantity")
colnames(data4)=c("time","hs96","exporter","importer","value","quantity")
colnames(data5)=c("time","hs96","exporter","importer","value","quantity")
colnames(data6)=c("time","hs96","exporter","importer","value","quantity")
#colnames(data7)=c("time","hs96","exporter","importer","value","quantity")
colnames(data8)=c("time","hs96","exporter","importer","value","quantity")
colnames(data9)=c("time","hs96","exporter","importer","value","quantity")
colnames(data10)=c("time","hs96","exporter","importer","value","quantity")
colnames(data11)=c("time","hs96","exporter","importer","value","quantity")
colnames(data12)=c("time","hs96","exporter","importer","value","quantity")
colnames(data13)=c("time","hs96","exporter","importer","value","quantity")
colnames(data14)=c("time","hs96","exporter","importer","value","quantity")
colnames(data15)=c("time","hs96","exporter","importer","value","quantity")
colnames(data16)=c("time","hs96","exporter","importer","value","quantity")
colnames(data17)=c("time","hs96","exporter","importer","value","quantity")
colnames(data18)=c("time","hs96","exporter","importer","value","quantity")
colnames(data19)=c("time","hs96","exporter","importer","value","quantity")
colnames(data20)=c("time","hs96","exporter","importer","value","quantity")

#columns redefined as.factor in order the vector to have factor properties.
#this section is copied in the beginning even though ggplot visualizations are processed in the later sections
#in order to provide less complicated facet.
data1$exporter=as.factor(data1$exporter)
data1$importer=as.factor(data1$importer)

data2$exporter=as.factor(data2$exporter)
data2$importer=as.factor(data2$importer)

data3$exporter=as.factor(data3$exporter)
data3$importer=as.factor(data3$importer)

data4$exporter=as.factor(data4$exporter)
data4$importer=as.factor(data4$importer)

data5$exporter=as.factor(data5$exporter)
data5$importer=as.factor(data5$importer)

data6$exporter=as.factor(data6$exporter)
data6$importer=as.factor(data6$importer)

#data7$exporter=as.factor(data7$exporter)
#data7$importer=as.factor(data7$importer)

data8$exporter=as.factor(data8$exporter)
data8$importer=as.factor(data8$importer)

data9$exporter=as.factor(data9$exporter)
data9$importer=as.factor(data9$importer)

data10$exporter=as.factor(data10$exporter)
data10$importer=as.factor(data10$importer)

data11$exporter=as.factor(data11$exporter)
data11$importer=as.factor(data11$importer)

data12$exporter=as.factor(data12$exporter)
data12$importer=as.factor(data12$importer)

data13$exporter=as.factor(data13$exporter)
data13$importer=as.factor(data13$importer)

data14$exporter=as.factor(data14$exporter)
data14$importer=as.factor(data14$importer)

data15$exporter=as.factor(data15$exporter)
data15$importer=as.factor(data15$importer)

data16$exporter=as.factor(data16$exporter)
data16$importer=as.factor(data16$importer)

data17$exporter=as.factor(data17$exporter)
data17$importer=as.factor(data17$importer)

data18$exporter=as.factor(data18$exporter)
data18$importer=as.factor(data18$importer)

data19$exporter=as.factor(data19$exporter)
data19$importer=as.factor(data19$importer)

data20$exporter=as.factor(data20$exporter)
data20$importer=as.factor(data20$importer)

#save workspace, this process took many hours since Rmarkdown went down many times 
#while organizing more than 50million rows of data.
