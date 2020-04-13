reshape_raw <- function(tbl, location_col) {
  tbl %>%
    dplyr::rename(
      cases_total = cases,
      deaths_total = deaths,
      fips_code = fips
    ) %>%
    tidyr::pivot_longer(
      cols = c(cases_total, deaths_total),
      names_to = "data_type",
      values_to = "value"
    ) %>%
    tidyr::pivot_longer(
      cols = {{ location_col }},
      names_to = "location_type",
      values_to = "location"
    ) %>%
    tidyr::pivot_longer(
      cols = fips_code,
      names_to = "location_code_type",
      values_to = "location_code"
    ) %>%
    dplyr::select(
      date,
      location, location_type,
      location_code, location_code_type,
      data_type, value
    ) %>%
    dplyr::arrange(
      dplyr::desc(date), location
    )
}

pull_unique <- function(tbl, col) {
  q_col <- rlang::enquo(col)

  tbl %>%
    tidyr::drop_na(!!q_col) %>%
    dplyr::pull(!!q_col) %>%
    unique() %>%
    stringr::str_c(collapse = ", ")
}

#' Pipe operator
#'
#' See \code{magrittr::\link[magrittr:pipe]{\%>\%}} for details.
#'
#' @name %>%
#' @rdname pipe
#' @keywords internal
#' @export
#' @importFrom magrittr %>%
#' @usage lhs \%>\% rhs
NULL
