library(readxl)
library(fs)
library(tidyverse)
library(lubridate)

list_files <- list.files(path = "Week04/data", full.names = TRUE)

shelving_stats <- lapply(list_files, read_excel, range="A3:I5")

names(shelving_stats) <-path_ext_remove(path_file(list_files))

shelving_stats_df <- bind_rows(shelving_stats, .id = "month") %>% select(!starts_with("Trucks")) %>% 
  mutate(month = month(my(month)), 
         Shelver = 
           case_when(Shelver == "CM" ~ "A", 
                     Shelver=="PD" ~ "B")) 
shelving_stats_df <- shelving_stats_df %>%
  rename_with(~gsub(pattern=" Shelved", replacement="", x=.x, fixed = TRUE)) %>% 
  rename_with(~tolower(gsub(" ", "_", .x, fixed = TRUE)))

shelving_stats_df <- shelving_stats_df %>%
  arrange(month)

write_csv(shelving_stats_df, "Week04/data/shelving_wide.csv")


