#Using Rentrez

#Package Installation
#install.packages("rentrez")

#Calling libraries
library(rentrez)
library(dyplr)

#List of Pubmed Search Fields
entrez_db_searchable("pubmed")

#Doing a simple search using search fields
pcos_pm <- entrez_search(db="pubmed", term = "pcos[all]")

#Doing a boolean search 
pcos_ir_pm <- entrez_search(db="pubmed", term= "pcos[all] AND insulin resistance[all]")
#See how may trials about this condition has been done
pcos_ir_ct_pm <- entrez_search(db="pubmed", term= "pcos[all] AND insulin resistance[all] AND Clinical Trial[ptyp]")


#Searching for related articles in other database
#Evaluating links for PCOS between NCBI databases
#Lets select an article that is related with two ouf the mayor characteristics of PCOS, Insulin Resistance and Metabolic Syndrome

#Selected Article 
#Genetics of Insulin Resistance and the Metabolic Syndrome, https://www.ncbi.nlm.nih.gov/pmc/articles/PMC4911377/
#PMCID: PMC4911377
#PMID: 27312935

#Our results shows that there are related articles in databases such as the Single Nucleotide Polymorphism Database(dbSNP), Medgen, the Taxonomy database and others
pcos_links <-entrez_link(dbfrom="pubmed", id="27312935", db= "all")

#Now lets create the list of related articles 








