#' Clear Local Objects/ Set Library
#' This function manually removes all local variables and then sets the working directoy proximal to the portable built for this SWA and the library
#' it should be used if the library fails to import, or if issues are experienced running read_whole_folder
#' @name clear_all_and_set
#'
#' @examples
#' \code{NOTTRUN{}
#' \code{   clear_all_and_set()}
#' \code{}}
#'
#' @export
#' @md

clear_all_and_set <- function(){
	rm(list = ls())
	dir <- paste0(paste0("C:/Users/", Sys.getenv("USERNAME")), "/Documents/R/WD/RTW")
	setwd(dir)
	rm(dir) 
	getwd()
	library(readxl)
}