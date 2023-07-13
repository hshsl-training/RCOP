install.packages("rentrez")
library(rentrez)
library(tidyverse)

# Helper Functions
entrez_dbs()
entrez_db_summary("pubmed")
entrez_db_searchable("pubmed")

# Search Functions

simple_search<- entrez_search(db="pubmed",term="pcos[all]", retmax=40)


boolean_search<- entrez_search(db="pubmed",term="pcos[all] AND pcos[tiab]", retmax=100)

boolean_summary <- entrez_summary(db="pubmed", id= boolean_search$ids, retmax=100)
simple_summary <- entrez_summary(db= "pubmed" , id= simple_search$ids , retmax= 40)

mesh_search <- entrez_search(db="pubmed", term="neoplasms[MESH]")


journal<- extract_from_esummary(simple_summary,"source")
dates <- extract_from_esummary(simple_summary, "pubdate") %>%
  substr(start = 1, stop = 4)

# Exercise

# Step 1
# Im interested in seeing Dr. Kristen Stafford Publications
search <- entrez_search(db="pubmed", term = "Kristen Stafford[AUTH]",retmax=100)
search

# Step 2
summary <- entrez_summary(db="pubmed", id=search$ids, retmax= 71)
summary

# Step 3
# I want to know how many publications she has and in what journal she publishes the most. 

pubdate <- extract_from_esummary(,) 
  
  
source <- extract_from_esummary(summary,"source")

#Step 4

# Publications by Journal
ggplot(mapping = aes(x=source)) + 
  geom_bar() +
  theme(axis.text.x = element_text(angle = 90)) + 
  labs(title = "KA Stafford Publications By Journal", 
       x="Journal", y= "Amount")

#Publications by year
ggplot(mapping = aes(x=)) +
  geom_bar() +
  theme(axis.text.x = element_text(angle =)) +
  labs(title = "",
       x="", y= "")




