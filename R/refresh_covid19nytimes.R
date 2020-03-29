#' US State Data from the NY Times
#'
#' @return
#' @export
#'
#' @examples
"refresh_covid19nytimes_states"

refresh_covid19nytimes_states <- function(){
  url <- "https://raw.githubusercontent.com/nytimes/covid-19-data/master/us-states.csv"

  #load the data
  dat <- readr::read_csv(url,
                         col_types = list(
                           date = readr::col_date(),
                           state = readr::col_character(),
                           fips = readr::col_character(),
                           cases = readr::col_double(),
                           deaths = readr::col_double()
                         ))

  #reshape to data standard
  dat <- dat %>%
    dplyr::rename(cases_total = cases,
                  deaths_total = deaths,
           fips_code = fips) %>%
    tidyr::pivot_longer(cols = c(cases_total, deaths_total),
                        names_to = "data_type",
                        values_to = "value") %>%
    tidyr::pivot_longer(cols = state,
                        names_to = "location_type",
                        values_to = "location") %>%
    tidyr::pivot_longer(cols = fips_code,
                        names_to = "location_standardized_type",
                        values_to = "location_standardized") %>%
    dplyr::select(date,
           location, location_type,
           location_standardized, location_standardized_type,
           data_type, value)

  #return
  return(dat)
}


#' US County Data from the NY Times
#'
#' @return
#' @export
#'
#' @examples
"refresh_covid19nytimes_counties"

refresh_covid19nytimes_counties <- function(){
  url <- "https://raw.githubusercontent.com/nytimes/covid-19-data/master/us-counties.csv"

  #load the data
  dat <- readr::read_csv(url,
                         col_types = list(
                           date = readr::col_date(),
                           county = readr::col_character(),
                           state = readr::col_character(),
                           fips = readr::col_character(),
                           cases = readr::col_double(),
                           deaths = readr::col_double()
                         ))

  #reshape to data standard
  dat <- dat %>%
    dplyr::mutate(county_state = paste(county, state, sep = ",")) %>%
    dplyr::rename(cases_total = cases,
                  deaths_total = deaths,
                  fips_code = fips) %>%
    tidyr::pivot_longer(cols = c(cases_total, deaths_total),
                        names_to = "data_type",
                        values_to = "value") %>%
    tidyr::pivot_longer(cols = county_state,
                        names_to = "location_type",
                        values_to = "location") %>%
    tidyr::pivot_longer(cols = fips_code,
                        names_to = "location_standardized_type",
                        values_to = "location_standardized") %>%
    dplyr::select(date,
                  location, location_type,
                  location_standardized, location_standardized_type,
                  data_type, value)

  return(dat)
}
