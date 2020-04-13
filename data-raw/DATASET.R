#---------------------------
# Code to update NY Times Datasets
#---------------------------

setwd(here::here())
source("./R/refresh_covid19nytimes.R")
source("./R/utils.R")

covid19nytimes_states_demo <- refresh_covid19nytimes_states()
covid19nytimes_counties_demo <- refresh_covid19nytimes_counties()

#look
head(covid19nytimes_states_demo)
head(covid19nytimes_counties_demo)

#test with testthat

#deploy data
usethis::use_data(covid19nytimes_states_demo, overwrite = TRUE)
usethis::use_data(covid19nytimes_counties_demo, overwrite = TRUE)
