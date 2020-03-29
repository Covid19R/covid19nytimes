#---------------------------
# Code to update NY Times Datasets
#---------------------------

setwd(here::here())
source("./R/refresh_covid19nytimes.R")

covid19nytimes_states <- refresh_covid19nytimes_states()
covid19nytimes_counties <- refresh_covid19nytimes_counties()

#look
head(covid19nytimes_states)
head(covid19nytimes_states)

#test with testthat

#deploy data
usethis::use_data(covid19nytimes_states, overwrite = TRUE)
usethis::use_data(covid19nytimes_counties, overwrite = TRUE)
