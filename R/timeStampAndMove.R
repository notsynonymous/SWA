timeStampAndMove <- function(dataframe, extension){

	tableName <- paste0(format(Sys.time(), "%H%M%S_"), paste0(Sys.Date(), extension)) 
	write.csv(dataframe, tableName)
	file.copy(tableName, paste0(paste0("C:/Users/", Sys.getenv("USERNAME")), "/Documents/R/Data")) 
	file.remove(tableName)
	
}