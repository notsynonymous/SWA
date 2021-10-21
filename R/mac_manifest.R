#' Concatenate frequency tables by station
#' This function looks for particular character sets in a string pulled from the filename and reads them.
#' It is used recursively with getTable and read_whole_folder_RTW, for more information, please refer to the documentation for those functions
#'
#' @name mac_manifest
#' 
#' @param viewTable a boolean that will display the output of the generated table, TRUE, concatTables will print the table
#' @param writeFile a boolean that will write the file to the data folder included in the SWA portable designed for Amazon.
#' @param routeOverviews a boolean that will print a route overview for each station that shows the stops for each SWA route
#'
#' @returns dataframe of generated stop frequency by station
#' 
#' @examples
#' \dontrun{
#' dir <- paste0(paste0("C:/Users/", Sys.getenv("USERNAME")), "/Documents/R/WD/RTW")
#' setwd(dir)
#' stationNames <- c("DLA7", "DPS1")
#' weekStopFreq <- mac_manifest(stationNames, TRUE)
#' }
#' @export
#' @md

mac_manifest <- function(viewTable=FALSE, writeFile=FALSE, routeOverviews=FALSE) {

	folder <- getwd()
	stations <- c("DXH6", "DPS1", "DLA7")
	
	if(routeOverviews) {
	
		for(i in 1:length(stations)) {
		
			stationName <- stations[i]
			route(stationName)
			rm(stationName)
			
		}
	}
	
	bigMat <- getTable(stations[1])
	for(i in 2:length(stations)) {bigMat <- rbind(bigMat, getTable(stations[i]))}
	
	dataframe <- as.data.frame(bigMat)
	rownames(dataframe) <- c(1:length(bigMat[,1]))
	
	if(viewTable) {print(dataframe)}
	if(writeFile) {timeStampAndMove(dataframe, "_sepPkup.csv")}
	
	setwd(folder)
	return(dataframe)
}