#' Concatenate frequency tables by station
#' This function looks for particular character sets in a string pulled from the filename and reads them.
#' It is used recursively with getTable and read_whole_folder_RTW, for more information, please refer to the documentation for those functions
#' @name concatTables
#' 
#' @param stations a vector of type string containing the names of stations
#' @param viewTable a logical argument that will display the output of the generated table, if \code viewTable=TRUE, concatTables will print the table
#' @param writeFile a logical arugment that will write the file to the data folder included in the SWA portable designed for Amazon.
#'
#' @returns dataframe of generated stop frequency by station
#' 
#' @seealso [SWA::getTable()], [SWA::read_whole_folder_RTW()]
#'
#' @examples
#' \code stationNames <- c("DLA7", "DPS1")
#' \code weekStopFreq <- concatTable(stationNames, TRUE)
#' \code # This generates a table when RTW files are placed in the RTW folder of the R for Amazon portable.
#' @export
#' @md


concatTables <- function(stations, viewTable=FALSE, writeFile=FALSE) {

	bigMat <- getTable(stations[1])
	
	for(i in 2:length(stations)){
		bigMat <- rbind(bigMat, getTable(stations[i]))
	}
	
	dataframe <- as.data.frame(bigMat)
	rownames(dataframe) <- c(1:length(bigMat[,1]))
	
	if(viewTable) {print(dataframe)}
	if(writeFile) {timeStampAndMove(dataframe, "_sepPkup.csv")}
	
	return(dataframe)
}