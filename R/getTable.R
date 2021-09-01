getTable <- function(stationStr) {

	# To autopopulate a seperate volume for each station, uncomment the line below, and comment out the other
	# NOTRUN {
	# 	matrix <- read_whole_folder_RTW(list.files(pattern = stationStr), stationStr, writeEachStation=TRUE)
	# }
	
	matrix <- read_whole_folder_RTW(list.files(pattern = stationStr), stationStr)
	return(matrix)
	
}