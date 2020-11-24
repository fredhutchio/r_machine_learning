## Script used to download data files from https://www.stjuderesearch.org/site/data/ALL1/all_datafiles
## and convert to csv!

## LOAD LIBRARIES ##
library(tidyverse)
library(readxl)

## CREATE TIBBLE WITH FILE INFORMATION ##
# `fullname` is the exact file name used on the st judes website
fullname <- c("BCR-ABL", "E2A-PBX1", "Hyperdiploid >50", "MLL",
              "T-ALL", "TEL-AML1", "Additional diagnostic cases", "Dx of patients that relapse or develop secondary AML")
# `urls` is the url of the file. Note - e2a pulls the zip file
urls <- c("http://ftp.stjude.org/pub/data/ALL1/excel_files/BCR.xls",
          "http://ftp.stjude.org/pub/data/ALL1/excel_files/e2a_zip.zip", 
          "http://ftp.stjude.org/pub/data/ALL1/excel_files/Hyperdip50.xls",
          "http://ftp.stjude.org/pub/data/ALL1/excel_files/MLL.xls",
          "http://ftp.stjude.org/pub/data/ALL1/excel_files/T.xls",
          "http://ftp.stjude.org/pub/data/ALL1/excel_files/TEL.xls",
          "http://ftp.stjude.org/pub/data/ALL1/excel_files/Others.xls",
          "http://ftp.stjude.org/pub/data/ALL1/excel_files/group_2_3.xls")
# pulldat pulls all this together and adds a column with the actual file name
pullDat <- tibble(fullname = fullname, url = urls) %>%
  mutate(filename = tolower(basename(url)))

## LOOP OVER TIBBLE AND PULL FILES DOWN ##

# create excelPath for ease of pasting
excelPath <- "./data/leukemia/excel/"

for(i in 1:length(pullDat$fullname)) {
  url <- as.character(pullDat[i,2])
  download.file(url = url, 
                destfile = file.path(excelPath, pullDat[i,3]))
}

## OPEN ZIP FILE ##
# Note: This file had to be downloaded as a `zip` file because the excel download link goes to the wrong destination.

# get index of zip file
index <- grep("*zip", pullDat$filename)
zipFile <- file.path(excelPath, pullDat[index, 3])

# unzip
unzip(zipFile, exdir = excelPath)
# remove zip
file.remove(zipFile)

## CONVERT FILES TO CSV ##

# make a new directory in data/leukemia/ to put csv files
dir.create("./data/leukemia/csv")

# loop over file names to read in xls and output csv 
filesList <- list.files(excelPath, pattern = "xls")
csvPath <- "./data/leukemia/csv"
lapply(filesList, function(f){
  inpath <- file.path(excelPath, f)
  csvfilename <- gsub("xls", "csv", f)
  outpath <- file.path(csvPath, csvfilename)
  df <- read_excel(inpath, sheet=1)
  write_csv(df, outpath)
})