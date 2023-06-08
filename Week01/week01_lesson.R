library(tidyverse)
library(fs)

#read one csv
Workshop01 <- read_csv("Week01/Workshop01.csv")

files <- list.files(path = "Week01/data/", full.names = TRUE)

workshop_list <- map(files, read_csv)

names(df_list)

names(df_list) <-path_ext_remove(path_file(file_list))

all_workshops <- bind_rows(df_list, .id = "Workshop")

workshop_breakdown <- 
  all_workshops %>% 
  count(affiliation, status)

write_csv(all_workshops, "Week01/data_output/all_workshops.csv")

saveRDS(all_workshops, "Week01/data_output/all_workshops.RDS")

write_csv(workshop_breakdown, "Week01/data_output/workshop_breakdown.csv")

saveRDS(workshop_breakdown, "Week01/data_output/workshop_breakdown.RDS")
