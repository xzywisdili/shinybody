tumors <- read.csv("data-raw/tumors.csv", header = TRUE)

usethis::use_data(tumors, overwrite = TRUE)
