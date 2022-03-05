library(readxl)
library(dplyr) 

#load data 
dustdata <- read_excel("~/Downloads/dustdata.xlsx")

#check data 
View(dustdata)
#data class check 
str(dustdata) 

#filter distrct 
dustdata_anal <- dustdata %>% filter(area %in% c("성북구","중구"))
View(dustdata_anal)

#check if data contains all dates and dusts information in distrcits 
count(dustdata_anal, yyyymmdd) %>% arrange(desc(n))
count(dustdata_anal, area) %>% arrange(desc(n))

#check distrct data separately 
dust_anal_area_sb <- subset(dustdata_anal, area== "성북구")
dust_anal_area_jg <- subset(dustdata_anal, area== "중구")
dust_anal_area_sb
dust_anal_area_jg

#statistical summary 
library(psych)
describe(dust_anal_area_jg$finedust)
describe(dust_anal_area_sb$finedust)

#visualize 
#box plot comparison
boxplot(dust_anal_area_jg$finedust, dust_anal_area_sb$finedust,
        main="finedust comparison", 
        xlab="AREA",
        ylab="FINE DUST",
        names=c("성북구","중구"),
        col=c("blue","orange"))

#fine dust mean data associated with area
#Two sample t-test
t.test(data=dustdata_anal, 
       finedust~area,
       var.equal=T)

#Two Sample t-test result
#t = 2.8347, p-value = 0.004975
#95 percent confidence interval: 2.085657 11.586474
#sample estimates: mean in group 성북구=42.74590  mean in group 중구 = 35.90984 

#conclusion: Since p-value result is 0.004975 which is smaller than 0.05, it may be concluded that two districts have mean differences in finedust for 4 months intervals. 



