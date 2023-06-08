library(tidyverse)
library(lubridate)

#read in the data
consults <- read_csv("data/consults.csv")

#what data type is dates variable
class(consults$date)

#change date to date type with lubridate
consults <- consults %>% 
  mutate(date = mdy(date))

#summarize the data
consults_monthly <- consults %>% 
  count(year=year(date), month=month(date), name="total_consults")

#look at interval
fy2022 <- interval(mdy("07/01/2021"), mdy("06/30/2022"))

consults_fy2022 <-
  consults %>% 
  filter(date %within% fy2022)
