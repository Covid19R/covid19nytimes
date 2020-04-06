#' Demo of US State Data from the NY Times
#'
#' @description demo of the daily summary of the Coronavirus (COVID-19) total cases and deaths by state.
#'
#'
#' @format A tibble object
#' @source New York Times, "We’re Sharing Coronavirus Case Data for Every U.S. County" \href{https://www.nytimes.com/article/coronavirus-county-data-us.html}{article} and {https://github.com/nytimes/covid-19-data}{data repository}
#' @keywords datasets coronavirus COVID19 covid19nytimes_states
#' @details The dataset contains the daily summary of Coronavirus cases (total confirmed and total deaths), by state
#' from the NY Times.
#'
#' To get the latest data, use \code{\link{refresh_covid19nytimes_states}}
#' @examples
#'
#' data(covid19nytimes_states_demo)
#'
#' require(dplyr)
#'
#' # Get top confirmed cases by state
#' covid19nytimes_states_demo %>%
#'   filter(data_type == "cases_total") %>%
#'   filter(value == max(value))
"covid19nytimes_states_demo"


#' Demo of US County-Level Data from the NY Times
#'
#' @description  demo of the daily summary of the Coronavirus (COVID-19) total cases and deaths by county
#'
#'
#' @format A tibble object
#' @source New York Times, "We’re Sharing Coronavirus Case Data for Every U.S. County" \href{https://www.nytimes.com/article/coronavirus-county-data-us.html}{article} and {https://github.com/nytimes/covid-19-data}{data repository}
#' @keywords covid19nytimes_counties
#' @details The dataset contains the daily summary of Coronavirus cases (total confirmed and total deaths), by county
#' from the NY Times.
#'
#' To get the latest data, use \code{\link{refresh_covid19nytimes_states}}.
#' @examples
#'
#' data(covid19nytimes_states_demo)
#'
#' require(dplyr)
#'
#' # Get top confirmed cases by county,state
#' covid19nytimes_states_demo %>%
#'   filter(data_type == "cases_total") %>%
#'   filter(value == max(value))
"covid19nytimes_counties_demo"
