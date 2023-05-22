#read one csv
Workshop01 <- read_csv("Week01/Workshop01.csv")


file_list <- list.files(path = "Week01/data/")

df_list <- lapply(file_list, read_csv)

all_workshops <- bind_rows(df_list, .id = "Workshop")

count(all_workshops, affiliation)

count(all_workshops, Workshop)
