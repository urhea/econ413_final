#Hs96 codes will be extracted from the raw data by using grepl
patterns <- c("8703","840991","870880","870840")
#in order to use multiple grepl inputs and function filter(), dplyr and tidyr libraries are downloaded.
library(dplyr)
library(tidyr)

#by using filter() function and grepl, extract the car itself and 3 other mainparts
result1 <- filter(data1, grepl(paste(patterns, collapse="|"),hs96))
result2 <- filter(data2, grepl(paste(patterns, collapse="|"), hs96))
result3 <- filter(data3, grepl(paste(patterns, collapse="|"), hs96))
result4 <- filter(data4, grepl(paste(patterns, collapse="|"), hs96))
result5 <- filter(data5, grepl(paste(patterns, collapse="|"), hs96))
result6 <- filter(data6, grepl(paste(patterns, collapse="|"), hs96))
#result7 <- filter(data7, grepl(paste(patterns, collapse="|"), hs96))
result8 <- filter(data8, grepl(paste(patterns, collapse="|"), hs96))
result9 <- filter(data9, grepl(paste(patterns, collapse="|"), hs96))
result10 <- filter(data10, grepl(paste(patterns, collapse="|"), hs96))
result11 <- filter(data11, grepl(paste(patterns, collapse="|"), hs96))
result12 <- filter(data12, grepl(paste(patterns, collapse="|"), hs96))
result13 <- filter(data13, grepl(paste(patterns, collapse="|"), hs96))
result14 <- filter(data14, grepl(paste(patterns, collapse="|"), hs96))
result15 <- filter(data15, grepl(paste(patterns, collapse="|"), hs96))
result16 <- filter(data16, grepl(paste(patterns, collapse="|"), hs96))
result17 <- filter(data17, grepl(paste(patterns, collapse="|"), hs96))
result18 <- filter(data18, grepl(paste(patterns, collapse="|"), hs96))
result19 <- filter(data19, grepl(paste(patterns, collapse="|"), hs96))
result20<- filter(data20, grepl(paste(patterns, collapse="|"), hs96))
#result7 excluded

#rbind the results above
#therefore, dataset has been subsetted from 50million to 165.000 rows.
last<-rbind(result1,result2,result3,result4,result5,result6,result8,result9,result10,
            result11,result12,result13,result14,result15,result16,result17,result18,result19,result20)
##