# fetch_raw_data.R

# FetchRawData: Downloads and extracts the raw data for the assignment. Will
#               skip all actions if the local data directory already exists.
FetchRawData <- function() {
  # Input and output file locations.
  data.dir       <- "data"
  data.zip.url   <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
  data.zip.file  <- file.path(data.dir, "data.zip")
  data.timestamp <- file.path(data.dir, "timestamp.txt")
  data.unzip.dir <- file.path(data.dir, "unzip")

  # Create data directory.
  if (!file.exists(data.dir)) {
    dir.create(data.dir)
  }

  # Download the zip file.
  if (!file.exists(data.zip.file)) {
    download.file(data.zip.url, data.zip.file, mode = "wb")

    # Record the timestamp.
    timestamp <- file(data.timestamp)
    writeLines(date(), timestamp)
    close(timestamp)
  }

  # Extract the zip file.
  if (!file.exists(data.unzip.dir)) {
    dir.create(data.unzip.dir)

    unzip(data.zip.file, exdir = data.unzip.dir)
  }
}
