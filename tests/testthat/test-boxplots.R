test_that("boxplots outputs object of class ggplot", {
  expect_s3_class(boxplots(datateachr::apt_buildings, air_conditioning, year_built), "ggplot")
})

test_that("boxplots throws an error if a numeric column is inputted to the 'cat' argument", {
  expect_error(boxplots(datateachr::apt_buildings, year_built, year_built,
                        "I am sorry, `cat` column must be of class character or factor.You have provided an object of class:numeric"))
})

test_that("boxplots throws an error if a column name that is not present in the dataset is inputted to the 'num' argument", {
  expect_error(boxplots(datateachr::apt_buildings, air_conditioning, x))
})
