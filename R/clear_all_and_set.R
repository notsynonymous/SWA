clear_all_and_set <- function(){
	rm(list = ls())
	dir <- paste0(paste0("C:/Users/", Sys.getenv("USERNAME")), "/Documents/R/WD/RTW")
	setwd(dir)
	rm(dir) 
	getwd()
	library(readxl)
}