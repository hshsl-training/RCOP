library(tidyverse)
library(randomNames)

Status_options <- c("Staff", "Faculty", "Student")
Schools <- c("Medicine", "Graduate", "Nursing", "Social Work", "Dentistry", "Pharmacy")

workshops <- replicate(10, tibble(attendees = randomNames(n=sample(5:30,1), name.order = "first.last", name.sep = " "),
affiliation = sample(Schools, length(attendees), replace = TRUE),
status = sample(Status_options, length(attendees), replace = TRUE)), simplify = FALSE)



workshop_names <- paste0("Workshop0", 1:10)

names(workshops) <- workshop_names

imap(workshops, ~write_csv(.x, paste0(.y, '.csv'), col_names = TRUE))




