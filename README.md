# Unit Conversion Tool

This is a Shiny application designed to perform various unit conversions. It includes functionalities for converting units of length, volume, mass, time, and digital storage. The tool is intended for educational purposes, showcasing how unit conversion can be implemented and tested in R.

## Description

The Unit Conversion Tool allows users to easily convert between different units within the same category. For example, users can convert kilometers to miles, gallons to liters, or bytes to gigabytes. This tool is especially useful for students and professionals who regularly work with different unit systems.

## Installation

To run this project, it is necessary to have R installed on your machine. Clone this repository, and then follow the steps below:

### Using renv

The project uses `renv` for R package management to ensure consistent and reproducible environments.

```r
# Install renv if it is not alrey done
install.packages("renv")

# Navigate to the project directory
setwd("/path/to/project")

# Restore the project environment
renv::restore()
```

## Usage

To run the Unit Conversion Tool, the necessary packages are needed. After installing the dependencies with `renv`, follow these steps to run the app:

1. Open R or RStudio.
2. Set the working directory to the root of the project (as done above).
3. Run the following command:

```r
shiny::runApp("app.R")
```

## Running the Tests

To ensure the reliability of the conversion functions, automated tests are included. To run these tests:

1.  Ensure that the root directory of the project is set.
2. Source the test script using the following command:

```r
source("tests/test_conversion_functions.R")
```
