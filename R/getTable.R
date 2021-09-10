#' A getter that generates stop frequency matrix
#' This function looks for particular character sets in a string pulled from the filename and reads them.
#' It is used recursively with getTable and read_whole_folder_RTW, for more information, please refer to the documentation for those functions
#'
#' @name getTable
#' 
#' @param stationStr a single vector string
#'
#' @returns a matrix that contains the vector string token in the filename
#' 
#' @seealso [SWA::read_whole_folder_RTW()]
#'
#' @examples
#' \dontrun{DLA7.mat <- getTable("DLA7")
#' DLA7.mat
#' }
#' @export
#' @md

getTable <- function(stationStr) {
	matrix <- read_whole_folder_RTW(list.files(pattern = stationStr), stationStr)
	return(matrix)
}