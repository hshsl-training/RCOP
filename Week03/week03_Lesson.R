library(tidyverse)
all_workshops %>% 
  ggplot(aes(affiliation, fill=affiliation)) +
  geom_

#simplest bar chart
all_workshops %>% 
  ggplot(mapping=aes(x=affiliation)) +
  geom_bar()

#bar chart with y variable
workshop_breakdown %>% 
  ggplot(mapping = aes(x=affiliation, y=n)) +
  geom_bar(stat="identity") +
  labs(x="School Affiliation", y="# of Participants at Workshops")

#reordered bar chart
workshop_breakdown %>% 
  ggplot(mapping = aes(x=reorder(affiliation, -n), y=n)) +
  geom_bar(stat="identity")

#grouped bar chart
all_workshops %>% 
  ggplot(mapping=aes(x=affiliation, fill=status)) +
  geom_bar()

#grouped bar chart dodged
all_workshops %>% 
  ggplot(mapping=aes(x=affiliation, fill=status)) +
  geom_bar(position = "dodge", width =0.75)
