#' Get information about the datasets provided by covid19nytimes
#'
#' @return
#' @export
#'
#' @examples
"get_info_covid19nytimes"

get_info_covid19nytimes <- function(){
  tibble::tribble(
    ~data_set_name, ~package_name, ~function_to_get_data,
    ~data_details, ~data_url, ~license_url,
    ~data_types,  ~has_geospatial_info,

    "covid19nytimes_states",
    "covid19nytimes",
    "refresh_covid19nytimes_states",
    "Open Source data from the New York Times on distribution of confirmed Covid-19 cases and deaths in the US States. For more, see https://www.nytimes.com/article/coronavirus-county-data-us.html or the readme at https://github.com/nytimes/covid-19-data.",
    "https://raw.githubusercontent.com/nytimes/covid-19-data/master/us-counties.csv",
    "https://github.com/nytimes/covid-19-data/blob/master/LICENSE",
    "cases_total, deaths_total",
    FALSE,

    "covid19nytimes_counties",
    "covid19nytimes",
    "refresh_covid19nytimes_counties",
    "Open Source data from the New York Times on distribution of confirmed Covid-19 cases and deaths in the US by County. For more, see https://www.nytimes.com/article/coronavirus-county-data-us.html or the readme at https://github.com/nytimes/covid-19-data.",
    "https://raw.githubusercontent.com/nytimes/covid-19-data/master/us-counties.csv",
    "https://github.com/nytimes/covid-19-data/blob/master/LICENSE",
    "cases_total, deaths_total",
    FALSE,


  )


}
