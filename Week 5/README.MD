# Accessing NCBI data with the Rentrez package

### Learning Objectives:

The objective of this session is to:

1.  Understand how to use/read API documentation.
2.  Learn how to pull data from API.
3.  Learn how to select and execute API commands.
4.  Wrangle data to usable form (like csv or a graph).

### Course Activities:

This section activities are:

1.  Explore the Rentrez API documentation.
2.  Download Rentrez and learn basic search commands.
3.  Perform simple and Boolean searches.
4.  Extract data using Rentrez helper function and placing it into a dataframe.
5.  Create a CSV file using the extracted data from Rentez. 

### How to interact with this document and session:

The code has already been pre-written. 
This document is yours, so you can modify the search terms, commands and their arguments according to your interests.

### Output of this session:

1.  A CSV file with bibliographic data extracted from Rentrez.

---

# Now, What is an API? and Why do I need to know this?

## What is an API?

Is a way that two or more computers programs communicate with each other.
 
For this communication to be successful, there are specifications to follow to ensure that both sides have: 

1. The appropriate credentials to request information.
2. The information requested is organized in the appropriate format.

It is like a waiter running back and forth in between you and the kitchen to deliver information requested.You **request** information to a device, and the device returns request with a **response**.
 
An API can operate in different ways, but for this exercise we will be working under a HTTP Request Methods. 
What that means?

The HTTP Request Method is the format that the text should be arranged so that the two or more computers understand what is being requested.
With an HTTP Protocol you can: 

1. **Get** information
2. **Post** information which creates/updates a resource
3. **Delete** information
4. An many other functions...

## Why do I need to know this?

Rentrez is an R interface that allows its users to interact with NCBI API. 
With Rentrez, you do not need to use any additional program or terminal to access NCBI Data. 
This means that you can request data to multiple databases (PubMed, SNP,Clinvar,SRA, Gene and others) in the same RStudio Session. 

In our context, the method that applies to us is the GET method since we will be only **requesting information** to the NCBI API using the rentrez R package. 

If you want to learn more about API, you can see this video on Youtube called [What is an API?](https://youtu.be/s7wmiS2mSXY)

If you want to learn more about Rentrez, you can access this [Rentrez Tutorial](https://cran.r-project.org/web/packages/rentrez/vignettes/rentrez_tutorial.html)

