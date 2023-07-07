#All Databases Available
entrez_dbs()

# When Database was updates, and How many articles has?
entrez_db_summary("pubmed")

# What search terms I can use to build my query
entrez_db_searchable("pubmed")

# Perform a search
search1 <- entrez_search(db="pubmed", term = "ovarian cancer")
search2 <- entrez_search(db="pubmed", term = "cancer AND 2019:2023[PDAT]")
search3 <- entrez_search(db="pubmed", term= "cancer AND 2019:2023[PDAT] AND Clinical Trial[PTYP]" )

# Get articles summaries
summaries <- entrez_summary(db="pubmed", id= search1$ids)
pubdate <- extract_from_esummary(summaries,"pubdate")
date <- substr(pubdate, start= 1, stop=4)
year <- mdy(date)
bdate <- sapply(c("2022 Jul 01", "1999 May 12"), as.Date, tryFormats = c("%Y %b %d","%Y"))
# Fetch article abstracts

fetch <- entrez_fetch(db="pubmed", id= search1$ids, rettype="xml")
df <- xmlToList(fetch)

# Entrez Link
links_id <- entrez_link(dbfrom="pubmed", id= "10.1007/s11886-016-0755-4", db="all")
summary_links_citedin <- entrez_summary(db="pubmed", id=links_id$links$pubmed_pubmed_citedin, rettype = "xml")

#------

library(ggplot2)

#Set your query search
query <- "University of Maryland, Health Sciences and Human Services Library[AFFL]"

#Fetch publication data from PubMed
search_results <- entrez_search(db="pubmed", term=query)

#Save publication IDs from the search results
pubmed_ids <- search_results$ids

#Fetch publication data for the retrieved ids
publication_data <- entrez_summary(db="pubmed", id= search_results$ids, rettype = "xml", parsed=TRUE)

#Extract publication dates 
publication_dates <- xpathSApply(publication_data)

#--------
pubmed_search <- entrez_search(db="pubmed", term="Kristen Stafford[all] AND 2018:2022[pdat]", use_history= TRUE)
pubmed_search
pubmed_summary <- entrez_summary(db= "pubmed", web_history = pubmed_search$web_history)
pubmed_summary

ks_journals <- extract_from_esummary(pubmed_summary,"fulljournalname")
ks_journals
ks_sort_journals <- sort(table(ks_journals),decreasing= TRUE)
ks_sort_journals


trends_search <- entrez_search(db="pubmed", term="pcos AND 2018:2022[pdat]")
trends_search
trends_summary <- entrez_summary(db= "pubmed", id= trends_search$ids)
trends_summary

trends_journals <- extract_from_esummary(trends_summary,"fulljournalname")
trends_journals
trends_sort_journals <- sort(table(trends_journals),decreasing= TRUE)
trends_sort_journals

articleids <- extract_from_esummary(summary,"articleids", simplify = TRUE) 
articleids[["value",1]][articleids[["idtype",1]]=='doi']
