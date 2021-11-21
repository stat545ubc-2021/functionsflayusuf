test_that("Testing boxplots function", {
  expect_is(boxplots(datateachr::apt_buildings, air_conditioning, year_built), "ggplot")

  expect_error(boxplots(datateachr::apt_buildings, year_built, year_built,
                        "I am sorry, `cat` column must be of class character or factor.You have provided an object of class:numeric"))

  expect_error(boxplots(datateachr::apt_buildings, air_conditioning, x))

})
