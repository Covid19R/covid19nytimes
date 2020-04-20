#' US State Data from the NY Times
#'
#' @description Update the state-level data from the New York Times on Covid-19
#'
#' @details Pulls from the open source data at https://www.nytimes.com/article/coronavirus-county-data-us.html
#' including cumulative cases and deaths. Returns the data in the covid19R standard tidy format for easy use.
#' See https://github.com/nytimes/covid-19-data for extensive methodology description and license. Please
#' follow the license guidelines at https://github.com/nytimes/covid-19-data/blob/master/LICENSE if you plan
#' to use the data for public display.
#'
#' @source New York Times, "We’re Sharing Coronavirus Case Data for Every U.S. County" \href{https://www.nytimes.com/article/coronavirus-county-data-us.html}{article} and {https://github.com/nytimes/covid-19-data}{data repository}
#' @source \href{https://github.com/Covid19R/documentation}{covid19R documentation}
#'
#' @return A tibble object
#' * date - The date in YYYY-MM-DD form
#' * location - The name of the location as provided by the data source. The counties dataset provides county and state. They are combined and separated by a `,`, and can be split by `tidyr::separate()`, if you wish.
#' * location_type - The type of location using the covid19R controlled vocabulary. Nested locations are indicated by multiple location types being combined with a `_
#' * location_code - A standardized location code using a national or international standard. In this case, FIPS state or county codes. See https://en.wikipedia.org/wiki/Federal_Information_Processing_Standard_state_code and https://en.wikipedia.org/wiki/FIPS_county_code for more
#' * location_code_type The type of standardized location code being used according to the covid19R controlled vocabulary. Here we use `fips_code`
#' * data_type - the type of data in that given row. Includes `total_cases` and `total_deaths`, cumulative measures of both.
#' * value - number of cases of each data type
#' @export refresh_covid19nytimes_states
#'
#' @examples
#' \dontrun{
#' # update the data
#' covid19nytimes_states <- refresh_covid19nytimes_states()
#' }
#'
refresh_covid19nytimes_states <- function() {
  url <- "https://raw.githubusercontent.com/nytimes/covid-19-data/master/us-states.csv"

  # load the data
  dat <- readr::read_csv(url,
    col_types = list(
      date = readr::col_date(),
      state = readr::col_character(),
      fips = readr::col_character(),
      cases = readr::col_double(),
      deaths = readr::col_double()
    )
  )

  # reshape to data standard
  dat %>%
    reshape_raw(location_col = state)
}


#' US County Data from the NY Times
#'
#' @description Update the county-level data from the New York Times on Covid-19
#'
#' @details Pulls from the open source data at https://www.nytimes.com/article/coronavirus-county-data-us.html
#' including cumulative cases and deaths. Returns the data in the covid19R standard tidy format for easy use.
#' Location data is returned as `County,State`.
#' See https://github.com/nytimes/covid-19-data for extensive methodology description and license. Please
#' follow the license guidelines at https://github.com/nytimes/covid-19-data/blob/master/LICENSE if you plan
#' to use the data for public display.
#'
#' @source New York Times, "We’re Sharing Coronavirus Case Data for Every U.S. County" \href{https://www.nytimes.com/article/coronavirus-county-data-us.html}{article} and {https://github.com/nytimes/covid-19-data}{data repository}
#' @source \href{https://github.com/Covid19R/documentation}{covid19R documentation}
#'
#' @return A tibble object
#' * date - The date in YYYY-MM-DD form
#' * location - The name of the location as provided by the data source. The counties dataset provides county and state. They are combined and separated by a `,`, and can be split by `tidyr::separate()`, if you wish.
#' * location_type - The type of location using the covid19R controlled vocabulary. Nested locations are indicated by multiple location types being combined with a `_
#' * location_code - A standardized location code using a national or international standard. In this case, FIPS state or county codes. See https://en.wikipedia.org/wiki/Federal_Information_Processing_Standard_state_code and https://en.wikipedia.org/wiki/FIPS_county_code for more
#' * location_code_type The type of standardized location code being used according to the covid19R controlled vocabulary. Here we use `fips_code`
#' * data_type - the type of data in that given row. Includes `total_cases` and `total_deaths`, cumulative measures of both.
#' * value - number of cases of each data type
#' @export refresh_covid19nytimes_counties
#'
#' @examples
#' \dontrun{
#' # update the data
#' covid19nytimes_counties <- refresh_covid19nytimes_counties()
#' }
#'
refresh_covid19nytimes_counties <- function() {
  url <- "https://raw.githubusercontent.com/nytimes/covid-19-data/master/us-counties.csv"

  # load the data
  dat <- readr::read_csv(url,
    col_types = list(
      date = readr::col_date(),
      county = readr::col_character(),
      state = readr::col_character(),
      fips = readr::col_character(),
      cases = readr::col_double(),
      deaths = readr::col_double()
    )
  ) %>%
    dplyr::mutate(county_state = paste(county, state, sep = ","))

  # reshape to data standard
  dat %>%
    reshape_raw(location_col = county_state)
}
