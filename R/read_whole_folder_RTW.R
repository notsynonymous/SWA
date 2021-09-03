#' Reads Manifests to Frequency Tablouse
#' Takes a file of manifests and transforms it into a a stop frequency table. This is really interesting because it is likely one of the more useful things to ever happen to Jeff Bezos, and he's never really going to give a fuck about that.
#' 
#' @name read_whole_folder_RTW
#' @author the Blousy Girl from accounts receivable
#'
#' @param files a vector of type string that contains the station name
#' @param ext a vector object of length 1 that contains the object name extension -- this will also be passed to the filename along with a timestample.
#'
#' @returns None
#' 
#' @examples
#' \code # 
#' \code # set the current working directory to a folder with XLS files in it
#' \code # this code is in a block comment because it requires a XLS files
#' \code # NOTRUN {
#' \code # setwd(PATH_TO_FOLDER)
#' \code # fileNames <- list.files()
#' \code # read_whole_folder_RTW(fileNames, "ALL")
#' \code # ls()
#' \code # }
#' @export
#' @md

read_whole_folder_RTW <- function(files, ext, writeEachStation=FALSE) {

	tmp_obj <- NULL
	address <- NULL
	
	for(i in 1:length(files)){
		tmp_obj <- read_excel_allsheets(files[i])
		temp_length <- length(names(tmp_obj))
		j <- NULL
		
		assign(name_func(i), tmp_obj)
		
		for(j in 1:temp_length){
			tmp_obj2 <- tmp_obj[j]
			assign(paste0("dat1", paste0("_", paste0(i, paste0("_", j)))), as.data.frame(tmp_obj2))
			address <- append(address, tmp_obj[[j]][,6])
			rm(tmp_obj2)
		}
		rm(i, tmp_obj, j, temp_length)
	}		


	freq.stops <- table(address)
	Addresses <- names(freq.stops)

	N_pickups <- NULL

	for(i in 1:(length(freq.stops))) {
		n <- freq.stops[[i]] 
		N_pickups <- append(N_pickups, freq.stops[[i]])
	}

	rm(i, n)

	# Table formating section below{ 
		theTable <- as.data.frame(cbind(Addresses, N_pickups)) 
		theTable[length(theTable[,1])-1,1] <- c("TOTAL ROUTES") 
		theTable <- head(theTable, -1) 
		PkupPercent <- c(round(prop.table(head(N_pickups, -2))*100,2)) 
		PkupPercent <- append(PkupPercent, sum(PkupPercent)) 
		theTable <- cbind(theTable, PkupPercent) 
		
		if(writeEachStation){
	
			tableName <- paste0(format(Sys.time(), "%H%M%S_"), paste0(Sys.Date(), paste0(ext, "_pkups.csv"))) 
			write.csv(theTable, tableName) 

			file.copy(tableName, paste0(paste0("C:/Users/", Sys.getenv("USERNAME")), "/Documents/R/Data")) 
			file.remove(tableName)
			
		}
	
		vec1 <- c(ext, "", "")
		vec2 <- c("", "", "")
		theTable <- as.matrix(rbind(vec1, theTable))
		theTable <- rbind(theTable, vec2)
		return(theTable)
	#{
	
}