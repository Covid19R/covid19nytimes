# things to test against
refresh_col_names <-
  c(
    "date",
    "location",
    "location_type",
    "location_code",
    "location_code_type",
    "data_type",
    "value"
  )


location_types <- read.csv("https://github.com/Covid19R/covid19R_data/raw/master/controlled_vocabularies/location_type.csv", stringsAsFactors = FALSE)[,1]
location_code_types <- read.csv("https://github.com/Covid19R/covid19R_data/raw/master/controlled_vocabularies/location_code_type.csv", stringsAsFactors = FALSE)[,1]
data_types <- read.csv("https://github.com/Covid19R/covid19R_data/raw/master/controlled_vocabularies/data_type.csv", stringsAsFactors = FALSE)[,1]

#helper function

expect_contains <- function(vec1, vec2){
  vec1 <- unique(vec1)

  expect(all(vec1 %in% vec2),
         paste0("Some or all values of ",
                paste0(vec1, collapse = ","),
                "\ndo not match ",
                paste0(vec2, collapse = ",")
         ))
}

test_that("states works", {
  res <- refresh_covid19nytimes_states()

  #make sure there's there there
  expect_gt(nrow(res), 0)

  #make sure column names are in order
  expect_named(res, refresh_col_names)

  #loc types
  expect_contains(res$location_type, location_types)

  #loc codes
  expect_contains(res$location_code_type, location_code_types)

  #dat types
  expect_contains(res$data_type, data_types)


  expect_true(
    "New York" %in% unique(res$location)
  )
})

test_that("counties works", {
  res <- refresh_covid19nytimes_counties()

  #make sure there's there there
  expect_gt(nrow(res), 0)

  #make sure column names are in order
  expect_named(res, refresh_col_names)

  #loc types
  expect_contains(res$location_type, location_types)

  #loc codes
  expect_contains(res$location_code_type, location_code_types)

  #dat types
  expect_contains(res$data_type, data_types)

  expect_true(
    "Westchester,New York" %in% unique(res$location)
  )
})
