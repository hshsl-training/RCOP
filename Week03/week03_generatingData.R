library(tidyverse)
library(lubridate)
library(fs)

list_files <- list.files(path = "Week03/data", full.names = TRUE)

shelving_stats <- lapply(list_files, read_excel, range="A3:I5")

names(shelving_stats) <-path_ext_remove(path_file(list_files))

shelving_stats_df <- bind_rows(shelving_stats, .id = "month") %>% select(!starts_with("Trucks")) %>% 
  mutate(month=my(month))



shelving_stats_long <- shelving_stats_df %>% 
  pivot_longer(cols = `Stacks Books Shelved`:`Unbound Journals Shelved`) 

shelving_stats_monthly <-
  shelving_stats_long %>% 
  group_by(name, month) %>% 
  summarize(total_shelved = sum(value))

shelving_stats_long %>% 
  ggplot(aes(x=month, y=value, fill=name)) +
  geom_bar(stat = "identity", position="dodge") +
 scale_fill_brewer(palette = "Dark2")
