install.packages()
library()
library()

# Helper Functions


# Search Functions

 entrez_search(db="",term="", retmax=)

 entrez_summary(db= "" , id=  , retmax=)

 extract_from_esummary(,)

# Exercise

# Step 1
# Im interested in seeing Dr. Kristen Stafford Publications
search <- entrez_search(db="", term = "",retmax=)
search

# Step 2
summary <- entrez_summary(db="", id=)
summary

# Step 3
# I want to know how many publications she has and in what journal she publishes the most. 

pubdate <- extract_from_esummary(,) 
  
  
source <- extract_from_esummary(,)

#Step 4

# Publications by Journal
ggplot(mapping = aes(x=)) + 
  geom_bar() +
  theme(axis.text.x = element_text(angle = )) + 
  labs(title = "", 
       x="", y= "")

#Publications by year
ggplot(mapping = aes(x=)) +
  geom_bar() +
  theme(axis.text.x = element_text(angle =)) +
  labs(title = "",
       x="", y= "")




