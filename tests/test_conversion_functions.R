library(testthat)

source("conversion_functions.R")

# Tests for conversions with tolerance for floating-point precision

# Test for Length Conversion
# Testing various length conversions to ensure accuracy within a tolerance of 1e-4
test_that("Length conversion works for different units", {
  expect_equal(convert_length(1000, "mm", "m"), 1, tolerance = 1e-4)
  expect_equal(convert_length(110.5, "m", "km"), 0.1105, tolerance = 1e-4)
  expect_equal(convert_length(13, "km", "m"), 13000, tolerance = 1e-4)
  expect_equal(convert_length(12, "in", "ft"), 1, tolerance = 1e-4)
  expect_equal(convert_length(56, "yd", "m"), 51.2064, tolerance = 1e-4)
  expect_equal(convert_length(6089, "ft", "mi"), 1.15322, tolerance = 1e-4)
})

# Test for Volume Conversion
# Testing various volume conversions to ensure accuracy within a tolerance of 1e-4
test_that("Volume conversion works for different units", {
  expect_equal(convert_volume(1000, "ml", "l"), 1, tolerance = 1e-4)
  expect_equal(convert_volume(5, "gal", "l"), 18.9271, tolerance = 1e-4)
  expect_equal(convert_volume(2, "qt", "l"), 1.89271, tolerance = 1e-4)
  expect_equal(convert_volume(250, "fl.oz.", "l"), 7.39316, tolerance = 1e-4)
  expect_equal(convert_volume(500, "tbsp", "cup"), 31.25, tolerance = 1e-4)
})

# Test for Mass Conversion
# Testing various mass conversions to ensure accuracy within a tolerance of 1e-4
test_that("Mass conversion works for different units", {
  expect_equal(convert_mass(1000, "g", "kg"), 1, tolerance = 1e-4)
  expect_equal(convert_mass(16, "oz", "lb"), 1, tolerance = 1e-4)
  expect_equal(convert_mass(2000, "g", "kg"), 2, tolerance = 1e-4)
  expect_equal(convert_mass(1, "ton", "kg"), 907.18474, tolerance = 1e-4)
  expect_equal(convert_mass(14, "lb", "st"), 1, tolerance = 1e-4)
})

# Test for Time Conversion
# Testing various time conversions to ensure accuracy within a tolerance of 1e-4
test_that("Time conversion works for different units", {
  expect_equal(convert_time(15, "sec", "min"), 0.25, tolerance = 1e-4)
  expect_equal(convert_time(24, "hr", "min"), 1440, tolerance = 1e-4)
  expect_equal(convert_time(50, "hr", "day"), 2.08333, tolerance = 1e-4)
  expect_equal(convert_time(80, "day", "week"), 11.4286, tolerance = 1e-4)
  expect_equal(convert_time(1, "year", "sec"), 3.154e7, tolerance = 1e-4)
})

# Test for Digital Storage Conversion
# Testing storage volume conversions to ensure accuracy within a tolerance of 1e-4
test_that("Storage conversion works for different units", {
  expect_equal(convert_storage(2000, "B", "KB"), 1.953125, tolerance = 1e-4)
  expect_equal(convert_storage(13, "GB", "MB"), 13312, tolerance = 1e-4)
  expect_equal(convert_storage(40, "TB", "GB"), 40960, tolerance = 1e-4)
  expect_equal(convert_storage(157, "MB", "KB"), 160768, tolerance = 1e-4)
  expect_equal(convert_storage(569, "PB", "TB"), 582656, tolerance = 1e-4)
})
