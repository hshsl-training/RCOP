
shelving_wide <- read_csv("Week03/data/shelving_wide.csv")

shelving_long <- shelving_wide %>% 
  pivot_longer(cols = `Stacks Books Shelved`:`Unbound Journals Shelved`, names_to = "material_type",
               values_to = "n") 

shelving_stats_monthly <-
  shelving_stats_long %>% 
  group_by(name, month) %>% 
  summarize(total_shelved = sum(value))
