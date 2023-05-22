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





#-------------------------------------------------------------------------------
#hiv_pm <- entrez_search(db="pubmed", term = "hiv[all]")
#pcos_con_pm <- entrez_search(db="pubmed", term= "PCOS[all] AND contraceptives[all]")
#pcos_not_con_pm <- entrez_search(db="pubmed", term= "PCOS[all] AND contraceptives[all] NOT birth control")

#hiv_pm_author <- entrez_search(db="pubmed", term = "hiv[ALL] AND Kristen Stafford[AUTH]")
#hiv_pm_affiliation <- entrez_search(db="pubmed", term= "hiv[ALL] AND University of Maryland Baltimore[AFFL]")
#hiv_aids <- entrez_search(db="pubmed", term= "hiv[TITL] OR AIDS[TITL]")

#making id lists
#id_hiv <- c(hiv_pm$ids)
#author_hiv <- c(hiv_pm_author$ids)
#affl_hiv <- c(hiv_pm_affiliation$ids)
#aids_hiv <- c(hiv_aids$ids)

#hiv_summ <- entrez_summary(db= "pubmed", id= hiv_pm$ids)


#Making a dataframe of the ids 
#data <- tibble(id_hiv,author_hiv,affl_hiv,aids_hiv)

#Verifiying that ids are not duplicated
#duplicated(data)
#unique(data)


