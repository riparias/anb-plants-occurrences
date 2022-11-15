# load libraries
library(testthat)
library(readr)
library(dplyr)
library(here)

# read proposed new version of the DwC mapping
event_path <- here::here("data", "processed", "event.csv")
occ_path <- here::here("data", "processed", "occurrence.csv")
mof_path <- here::here("data", "processed", "mof.csv")
dwc_event <- readr::read_csv(event_path, guess_max = 10000)
dwc_occurrence <- readr::read_csv(occ_path, guess_max = 10000)
dwc_mof <- readr::read_csv(mof_path, guess_max = 10000)

# test event core
testthat::test_that("Right columns in right order in event core", {
  columns_event <- c(
    "type",
    "language",
    "license",
    "rightsHolder",
    "datasetID",
    "institutionCode",
    "datasetName",
    "basisOfRecord",
    "samplingProtocol",
    "eventID",
    "eventDate",
    "eventTime",
    "countryCode",
    "locality",
    "waterBody",
    "locationRemarks",
    "decimalLatitude",
    "decimalLongitude",
    "geodeticDatum",
    "coordinateUncertaintyInMeters"
  )
  testthat::expect_equal(names(dwc_event), columns_event)
})

testthat::test_that("eventID is always present and is unique in event core", {
  testthat::expect_true(all(!is.na(dwc_event$eventID)))
  testthat::expect_equal(length(unique(dwc_event$eventID)),
                         nrow(dwc_event))
})

testthat::test_that("eventDate is always filled in", {
  testthat::expect_true(all(!is.na(dwc_event$eventDate)))
})

testthat::test_that("eventTime is always filled in", {
  testthat::expect_true(all(!is.na(dwc_event$eventTime)))
})

testthat::test_that("decimalLatitude is always filled in", {
  testthat::expect_true(all(!is.na(dwc_event$decimalLatitude)))
})

testthat::test_that("decimalLatitude is within Flemish boundaries", {
  testthat::expect_true(all(dwc_event$decimalLatitude < 51.65))
  testthat::expect_true(all(dwc_event$decimalLatitude > 50.63))
})

testthat::test_that("decimalLongitude is always filled in", {
  testthat::expect_true(all(!is.na(dwc_event$decimalLongitude)))
})

testthat::test_that("decimalLongitude is within Flemish boundaries", {
  testthat::expect_true(all(dwc_event$decimalLongitude < 5.95))
  testthat::expect_true(all(dwc_event$decimalLongitude > 2.450))
})

testthat::test_that("locality is always filled in and one of the list", {
  testthat::expect_true(all(!is.na(dwc_event$locality)))
  testthat::expect_equal(unique(dwc_event$locality),
                         c("Dijle Valley", "Zenne Valley", "Mark Valley")
  )
})

testthat::test_that("locality is always filled in", {
  testthat::expect_true(all(!is.na(dwc_event$waterBody)))
})

testthat::test_that("locationRemarks is always filled in", {
  testthat::expect_true(all(!is.na(dwc_event$locationRemarks)))
})

testthat::test_that("geodeticDatum is always filled in and equal to WGS84", {
  testthat::expect_true(all(!is.na(dwc_event$geodeticDatum)))
  testthat::expect_equal(unique(dwc_event$geodeticDatum), "WGS84")
})

testthat::test_that("coordinateUncertaintyInMeters is always filled in and equal to 30", {
  testthat::expect_true(all(!is.na(dwc_event$coordinateUncertaintyInMeters)))
  testthat::expect_equal(unique(dwc_event$coordinateUncertaintyInMeters), 30)
})


# test occurrence extension

testthat::test_that("Right columns in right order in occurrence extension", {
  columns_occ <- c(
    "eventID",
    "basisOfRecord",
    "occurrenceID",
    "individualCount",
    "occurrenceStatus",
    "organismQuantity",
    "organismQuantityType",
    "scientificName",
    "vernacularName",
    "kingdom",
    "taxonRank"
  )
  testthat::expect_equal(names(dwc_occurrence), columns_occ)
})

testthat::test_that(
  "occurrenceID is always present and is unique in occurrence extension", {
    testthat::expect_true(all(!is.na(dwc_occurrence$occurrenceID)))
    testthat::expect_equal(length(unique(dwc_occurrence$occurrenceID)),
                           nrow(dwc_occurrence)
    )
  })

testthat::test_that("eventID is always present in occurrence extension", {
  testthat::expect_true(all(!is.na(dwc_occurrence$eventID)))
})

testthat::test_that("All eventIDs are in event core ", {
  testthat::expect_true(all(dwc_occurrence$eventID %in% dwc_event$eventID))
})

testthat::test_that("eventID and occurrenceID are identical", {
  testthat::expect_equal(dwc_occurrence$eventID, dwc_occurrence$occurrenceID)
})

testthat::test_that("individualCount is NA or an integer from 1 to 5", {
  testthat::expect_equal(
    dwc_occurrence %>%
      distinct(individualCount) %>%
      filter(!is.na(individualCount)) %>%
      pull(individualCount),
    c(2, 1, 5, 3, 4)
  )
})

testthat::test_that("occurrenceStatus is always filled in and is 'present'", {
    testthat::expect_true(all(!is.na(dwc_occurrence$occurrenceStatus)))
    testthat::expect_equal(unique(dwc_occurrence$occurrenceStatus), "present")
  })

testthat::test_that("organismQuantity is always filled in and one of DAFO", {
  testthat::expect_true(all(!is.na(dwc_occurrence$organismQuantity)))
  testthat::expect_equal(unique(dwc_occurrence$organismQuantity),
                         c("A", "D", "O", "F")
  )
})

testthat::test_that("organismQuantityType is always filled in and is always DAFOR scale", {
  testthat::expect_true(all(!is.na(dwc_occurrence$organismQuantityType)))
  testthat::expect_equal(unique(dwc_occurrence$organismQuantityType), "DAFOR Scale")
})


testthat::test_that("kingdom is always filled in and is always Plantae", {
  testthat::expect_true(all(!is.na(dwc_occurrence$kingdom)))
  testthat::expect_equal(unique(dwc_occurrence$kingdom), "Plantae")
})

testthat::test_that("taxonRank is always filled in and is always species", {
  testthat::expect_true(all(!is.na(dwc_occurrence$taxonRank)))
  testthat::expect_equal(unique(dwc_occurrence$taxonRank), "species")
})

testthat::test_that("scientificName is never NA and one of the list", {
  species <- c(
    "Impatiens glandulifera",
    "Fallopia japanica",
    "Myriophyllum aquaticum",
    "Heracleum mantegazzianum",
    "Nymphaea ×marliacea",
    "Elodea canadensis",
    "Elodea nuttallii"
  )
  testthat::expect_true(all(!is.na(dwc_occurrence$scientificName)))
  testthat::expect_equal(unique(dwc_occurrence$scientificName), species)
})

testthat::test_that("vernacularName is never NA and one of the list", {
  vn <- c(
    "Reuzenbalsemien",
    "Japanse duizendknoop",
    "Parelvederkruid",
    "Reuzenberenklauw",
    "roze waterlelie",
    "brede waterpest",
    "smalle waterpest"
  )
  testthat::expect_true(all(!is.na(dwc_occurrence$vernacularName)))
  testthat::expect_equal(unique(dwc_occurrence$vernacularName), vn)
})


# test mof extension


testthat::test_that("Right columns in right order in mof extension", {
  columns_mof <- c(
    "eventID",
    "measurementType",
    "measurementValue",
    "measurementUnit"
  )
  testthat::expect_equal(names(dwc_mof), columns_mof)
})

testthat::test_that("eventID is always present in mof extension", {
  testthat::expect_true(all(!is.na(dwc_mof$eventID)))
})

testthat::test_that("All eventIDs are in event core ", {
  testthat::expect_true(all(dwc_mof$eventID %in% dwc_event$eventID))
})

testthat::test_that("measurementType is always filled in and one of the list", {
  testthat::expect_true(all(!is.na(dwc_mof$measurementType)))
  testthat::expect_equal(unique(dwc_mof$measurementType),
                         c("estimated covered area", "river bank", "coverage")
  )
})

testthat::test_that("measurementUnit is one of the list", {
  testthat::expect_equal(unique(dwc_mof$measurementUnit),
                         c("m²", NA_character_, "%")
  )
})

testthat::test_that(
  "estimated covered area is always expressed in square meters", {
    testthat::expect_equal(
      dwc_mof %>%
        filter(measurementType == "estimated covered area") %>%
        distinct(measurementUnit) %>%
        pull(),
      "m²"
    )
  }
)

testthat::test_that(
  "coverage is always expressed in percentages", {
    testthat::expect_equal(
      dwc_mof %>%
        filter(measurementType == "coverage") %>%
        distinct(measurementUnit) %>%
        pull(),
      "%"
    )
  }
)

testthat::test_that(
  "river bank has no unit", {
    testthat::expect_true(all(
      is.na(dwc_mof %>%
              filter(measurementType == "river bank") %>%
              distinct(measurementUnit) %>%
              pull()
            )
      )
    )
  }
)

testthat::test_that(
  "measurementValue is one of the list if measurementType is river bank", {
  testthat::expect_equal(
    dwc_mof %>%
      filter(measurementType == "river bank") %>%
      distinct(measurementValue) %>%
      pull(),
    c("both", "left", "right")
  )
})
