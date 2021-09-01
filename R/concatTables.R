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