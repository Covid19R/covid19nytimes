refresh_col_names <-
  c("date",
    "location",
    "location_type",
    "location_standardized",
    "location_standardized_type",
    "data_type",
    "value"
  )

test_that("states works", {

  res <- refresh_covid19nytimes_states()

  expect_named(res, refresh_col_names)

  expect_true(
    "New York" %in% unique(res$location)
  )
})

test_that("counties works", {

  res <- refresh_covid19nytimes_counties()

  expect_named(res, refresh_col_names)

  expect_true(
    "Kings,New York" %in% unique(res$location)
  )
})
