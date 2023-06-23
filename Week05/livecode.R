#Using Rentrez
#R Package Documentation
#https://cran.r-project.org/web/packages/rentrez/vignettes/rentrez_tutorial.html

#Package Installation
#install.packages("rentrez")

#Calling libraries
library(rentrez)
library(tidyverse)

#List of NCBI Databases
entrez_dbs()

#Brief Description of the database
entrez_db_summary("pubmed")

#List of PubMed Search Fields
entrez_db_searchable("pubmed")

#PRACTICING SEARCHES
#Doing a simple search using search fields
pcos_pm <- entrez_search(db="pubmed", term = "pcos[all]")

#Doing a boolean search 
pcos_ir_pm <- entrez_search(db="pubmed", term= "pcos[all] AND insulin resistance[all]")

#See how may trials about this condition has been done
pcos_ir_ct_pm <- entrez_search(db="pubmed", term= "pcos[all] AND insulin resistance[all] AND Clinical Trial[ptyp]")

#Articles that include PCOS + Insulin Resistance AND have Authors affiliated with UMD
pcos_ir_umb_pm <- entrez_search(db="pubmed", term= "pcos[ALL] AND insulin resistance[ALL] AND University of Maryland[AFFL]")

#Rentrez summary command to get publication information
#In this command we are giving a list of ids by using pcos_pm$ids. The $ operator extract or subset a specific part of a data object in R. 
summary_pcos_pm <- entrez_summary(db="pubmed", id=pcos_pm$ids, rettype = "xml")

# Entrez Fetch
fetch <- entrez_fetch(db= "pubmed", id = pcos_pm$ids, rettype = "xml")


#Entrez Global Query
#This command Find the number of records that match a given term across all NCBI Entrez databases

global_query <- ("PCOS")
all_databases <- entrez_global_query(global_query)

#SEARCH RELATED ARTICLES USING ENTREZ_LINK
#Searching for related articles in other database
#Evaluating links for PCOS between NCBI databases
#Lets select an article that is related with two characteristics of PCOS, Insulin Resistance and Metabolic Syndrome

#Selected Article 
#Genetics of Insulin Resistance and the Metabolic Syndrome, https://www.ncbi.nlm.nih.gov/pmc/articles/PMC4911377/
#PMCID: PMC4911377
#PMID: 27312935

#Our results shows that there are related articles in databases such as the Single Nucleotide Polymorphism Database(dbSNP), Medgen, the Taxonomy database and others
pcos_links <-entrez_link(dbfrom="pubmed", id="10.1007/s11886-016-0755-4", db= "all")

#Searching the titles for articles that cited the selected article
summary_pcos_citedin <- entrez_summary(db="pubmed", id=pcos_links$links$pubmed_pubmed_citedin, rettype = "xml")
#Searching for matches in the SRA Database
summary_pcos_sra <- entrez_summary(db="sra", id=pcos_links$links$pubmed_sra, rettype = "xml")
#Searching for matches in the SNP Database
summary_pcos_snp <- entrez_summary(db="snp", id=pcos_links$links$pubmed_snp, rettype = "xml")


#Now that we know how to use rentrez lets move this information to a friendly format!
#We are going to learn how to use Rentrez helper function to extract data from the XML given by the entrez_summary command

#Our objective is to: 
#1. Select the values that you would like to save (example: author, title, source)
#2. Create and format a cvs document

#1. Select the values that you would like to save (example: author, title, source) ## TODO: GET AUTHORS, ARTICLES IDS CORRECTLY
uids <- extract_from_esummary(summary_pcos_pm,"uid")
authors <- extract_from_esummary(summary_pcos_pm,"authors")["name",]
pubdate <- extract_from_esummary(summary_pcos_pm,"pubdate")
title <- extract_from_esummary(summary_pcos_pm,"title")
pubtype <- extract_from_esummary(summary_pcos_pm,"pubtype")
source <- extract_from_esummary(summary_pcos_pm,"source")
issue <- extract_from_esummary(summary_pcos_pm,"issue")
volume <- extract_from_esummary(summary_pcos_pm,"volume")
pages <- extract_from_esummary(summary_pcos_pm,"pages")
articleids <- extract_from_esummary(summary_pcos_pm,"articleids", simplify=FALSE)


#2. Create and format a cvs document
data <- tibble(authors,title,pubtype,source,issue,volume,pages,pubdate,uids)
write.csv(data,"pcos.csv", col.names = NA)














