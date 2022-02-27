install.packages("treemap")
library("readxl")
library(dplyr)
library(treemap)


ck <- read_excel("~/Downloads/chicken_restaurants.xlsx", encoding= "UTF-8")
head(ck)

addr <- substr(ck$소재지전체주소, 11, 16)
head(addr)

addr_num <- gsub("[0-9]", "", addr) # 숫자제거 
addr_trim <- gsub(" ", "", addr_num) #공백제거
head(addr_trim)

addr_count <- addr_trim %>%
    table() %>%   #도수분포표 생성
    data.frame()
head(addr_count)

treemap(addr_count, index=".", vSize = "Freq",
        title="Seodaemoon district chicken restaurants frequency")
arrange(addr_count, desc(Freq)) %>% head() 









