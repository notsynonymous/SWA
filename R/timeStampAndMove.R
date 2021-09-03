#' Time stamp, and then move
#' takes a dataframe and moves it to the Data folder built for the R portable, with an added name extension, then adds a time stamp.
#' @name timeStampAndMove
#' 
#' @param dataframe the name of the dataframe
#' @param extension a really fun name
#'
#' @returns None
#' 
#' @examples
#' \code d1 <- c(1:5)
#' \code d2 <- c(2:6)
#' \code d3 <- c(3:7)
#' \code mat <- cbind(d1, d2, d3)
#' \code mat <- as.data.frame(mat)
#' \code colnames(mat) <- c(1:3)
#' \code rownames(mat) <- c(1:5)
#' \code timeStampAndMove(mat, "SchmooooooNozzle")
#' @export
#' @md

timeStampAndMove <- function(dataframe, extension){
	tableName <- paste0(format(Sys.time(), "%H%M%S_"), paste0(Sys.Date(), extension))
	write.csv(dataframe, tableName)
	file.copy(tableName, paste0(paste0("C:/Users/", Sys.getenv("USERNAME")), "/Documents/R/Data")) 
	file.remove(tableName)
}