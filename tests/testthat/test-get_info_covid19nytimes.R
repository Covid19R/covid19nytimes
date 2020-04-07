info_col_names <-
  c(
    "data_set_name",
    "package_name",
    "function_to_get_data",
    "data_details",
    "data_url",
    "license_url",
    "data_types",
    "location_types",
    "spatial_extent",
    "has_geospatial_info"
  )

test_that("get_info works", {
  res <- get_info_covid19nytimes()

  expect_named(res, info_col_names)

  expect_equal(nrow(res), 2)
})
