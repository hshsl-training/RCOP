search_year <- function(year, term){
  query <- paste(term, " AND (", year, "[PDAT])")
  entrez_search(db="pubmed", term=query, retmax=0)$count
}

year <- 2010:2022
year
papers <- sapply(year, search_year, term="pcos", USE.NAMES=FALSE)
papers
plot(year, papers, type='b', main="PCOS term usage in research for the last 5 years")

search <- entrez_search(db="pubmed", term="pcos AND 2021:2023[PDAT]", use_history= TRUE)
#search <- entrez_search(db="pubmed", term="pcos", retmax=200)

all_journals = c()
for( seq_start in seq(1,min(search$count,100),100)){
  summaries <- entrez_summary(
    db="pubmed", 
    web_history = search$web_history, 
    retmax = 100,
    retstart = seq_start)
  all_journals <- c(
    extract_from_esummary(summaries,"source"),
    all_journals
  )
}
new_uniq_journals <- unique(all_journals)


all_journal_fetch = c()
for( seq_start in seq(1,min(search$count,800),100)){
  fetch <- entrez_fetch(
    db="pubmed", rettype = "xml",
    web_history = search$web_history, 
    retmax = 100,
    retstart = seq_start
  )
  all_journal_fetch <- c(all_journal_fetch, xmlToList(fetch))
}

# Obtained Linked Gene IDs from the "gene" NCBI Database
all_pubmed_gene_link = c() # Empty list to accumulate results
for( seq_start in seq(1,min(search$count,1000),100)){
  links <- entrez_link(
    dbfrom="pubmed", db="gene",
    web_history = search$web_history, 
    by_id = FALSE,
    retmax = 100, # retmax should match seq "by" argument
    retstart = seq_start # seq_start controls pagination
  )
  # Add results to list
  all_pubmed_gene_link <- c(
    all_pubmed_gene_link, 
    links$links$pubmed_gene
  ) 
}
uniq_pubmed_gene_link <- unique(all_pubmed_gene_link)
#summaries <- entrez_summary(db="pubmed", id=search$ids)

randome_gene <- entrez_summary(db="gene", id=uniq_pubmed_gene_link[[20]])

journals <- extract_from_esummary(summaries,"source")

uniq_journals <- unique(journals)

search_journal<- function(journal,term){
  query <- paste(term, " AND ", journal,"[JOUR]")
  entrez_search(db="pubmed", term= query, retmax=0)$count
}

df <- xmlToList(all_journal_fetch)
journal_counts <- sapply(new_uniq_journals, search_journal, term="pcos", USE.NAMES=FALSE)



Lets say that we want to save a list of the retrieved Kristin A. Stafford publications. 

# Creating a CSV or YAML
#install.packages("yaml")
library(yaml)
library(tidyverse)
#Performing the search
search <- entrez_search(db="pubmed", term = "Kristen A. Stafford[AUTH]",retmax=100)
#Getting Summaries
summary <- entrez_summary(db="pubmed", id=search$ids)

#Extracting information from summaries
uids <- extract_from_esummary(summary,"uid")
authors <- extract_from_esummary(summary,"authors")["name",]
pubdate <- extract_from_esummary(summary,"pubdate")
title <- extract_from_esummary(summary,"title")
pubtype <- extract_from_esummary(summary,"pubtype")
source <- extract_from_esummary(summary,"source")
issue <- extract_from_esummary(summary,"issue")
volume <- extract_from_esummary(summary,"volume")
pages <- extract_from_esummary(summary,"pages")
doi <- sapply(
  summary, 
  function(s) s$articleids$value[s$articleids$idtype=='doi'][1]
)

# Include Non Atomic Fields (author, pubtype)
yaml_data <- tibble(authors,title,pubtype,source,issue,volume,pages,pubdate,uids, doi)

# Exclude Non Atomic Fields (author, pubtype)
csv_data <- tibble(title,source,issue,volume,pages,pubdate,uids, doi)

# Store in YAML and CSV formats respectively
write_yaml(transpose(yaml_data),"ks.yaml")
write_csv(csv_data,"ks.csv")



