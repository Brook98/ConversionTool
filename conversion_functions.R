#' Convert Length Units
#'
#' This function converts a given value from one length unit to another.
#'
#' @param value A numeric value representing the length to convert.
#' @param from A character string representing the unit to convert from.
#' @param to A character string representing the unit to convert to.
#' @return A numeric value representing the length in the target unit.
#' @examples
#' convert_length(1000, "mm", "m")  # Should return 1

convert_length <- function(value, from, to) {
  units <- c("mm", "cm", "m", "km", "ft", "yd", "in", "mi")
  factors <- c(1000, 100, 1, 0.001, 3.28084, 1.09361, 39.3701, 0.000621371)
  
  if (!(from %in% units && to %in% units)) {
    stop("Invalid length units")
  }
  
  value_in_meters <- value / factors[which(units == from)]
  return(value_in_meters * factors[which(units == to)])
}

#' Convert Volume Units
#'
#' This function converts a given volume from one unit to another.
#'
#' @param value A numeric value representing the volume to convert.
#' @param from A character string representing the unit to convert from.
#' @param to A character string representing the unit to convert to.
#' @return A numeric value representing the volume in the target unit.
#' @examples
#' convert_volume(1000, "ml", "l")  # Should return 1

convert_volume <- function(value, from, to) {
  units <- c("ml", "cl", "l", "kl", "fl.oz.", "cup", "pt", "qt", "gal", "tbsp", "tsp")
  factors <- c(1000, 100, 1, 0.001, 33.814, 4.22675, 2.11338, 1.05669, 0.264172, 67.628, 202.884)
  
  if (!(from %in% units && to %in% units)) {
    stop("Invalid volume units")
  }
  
  value_in_liters <- value / factors[which(units == from)]
  return(value_in_liters * factors[which(units == to)])
}

#' Convert Mass Units
#'
#' This function converts a given mass from one unit to another.
#'
#' @param value A numeric value representing the mass to convert.
#' @param from A character string representing the unit to convert from.
#' @param to A character string representing the unit to convert to.
#' @return A numeric value representing the mass in the target unit.
#' @examples
#' convert_mass(1000, "g", "kg")  # Should return 1

convert_mass <- function(value, from, to) {
  units <- c("mg", "g", "kg", "oz", "lb", "st", "ton")
  factors <- c(1e6, 1000, 1, 35.274, 2.20462, 0.157473, 0.00110231)
  
  if (!(from %in% units && to %in% units)) {
    stop("Invalid mass units")
  }
  
  value_in_kilograms <- value / factors[which(units == from)]
  return(value_in_kilograms * factors[which(units == to)])
}

#' Convert Time Units
#'
#' This function converts a given time from one unit to another.
#'
#' @param value A numeric value representing the time to convert.
#' @param from A character string representing the unit to convert from.
#' @param to A character string representing the unit to convert to.
#' @return A numeric value representing the time in the target unit.
#' @examples
#' convert_time(60, "sec", "min")  # Should return 1

convert_time <- function(value, from, to) {
  units <- c("sec", "min", "hr", "day", "week", "month", "year")
  factors <- c(1, 60, 3600, 86400, 604800, 2.628e6, 3.154e7)
  
  if (!(from %in% units && to %in% units)) {
    stop("Invalid time units")
  }
  
  value_in_seconds <- value * factors[which(units == from)]
  return(value_in_seconds / factors[which(units == to)])
}

#' Convert Digital Storage Units - in binary 
#'
#' This function converts a given digital storage amount from one unit to another.
#'
#' @param value A numeric value representing the digital storage amount to convert.
#' @param from A character string representing the unit to convert from.
#' @param to A character string representing the unit to convert to.
#' @return A numeric value representing the digital storage amount in the target unit.
#' @examples
#' convert_storage(1024, "B", "KB")  # Should return 1

convert_storage <- function(value, from, to) {
  units <- c("bit", "B", "KB", "MB", "GB", "TB", "PB", "EB")
  factors <- c(1/8, 1, 1024, 1024^2, 1024^3, 1024^4, 1024^5, 1024^6)
  
  if (!(from %in% units && to %in% units)) {
    stop("Invalid storage units")
  }
  
  value_in_bytes <- value * factors[which(units == from)]
  return(value_in_bytes / factors[which(units == to)])
}

#' Format the Result
#'
#' This function formats the result of a conversion to be displayed to the user, 
#' ensuring that the unit is pluralized only when appropriate.
#'
#' @param value A numeric value representing the result of the conversion.
#' @param unit A character string representing the unit of the result.
#' @return A character string representing the formatted result including the unit.
#' @examples
#' format_result(2, "kg")  # Should return "2 kg"
#' format_result(1, "m")   # Should return "1 m"
#' format_result(0.5, "cup") # Should return "0.5 cups"

format_result <- function(value, unit) {
  formatted_value <- format(value, scientific = FALSE)
  
  # List of units that should be pluralized
  plural_units <- c("bit", "day", "week", "month", "year", "cup")
  
  # Check if the unit should be pluralized
  plural_unit <- ifelse(value != 1 && unit %in% plural_units, paste0(unit, "s"), unit)
  
  # Combine the formatted value with the unit
  paste(formatted_value, plural_unit)
}
