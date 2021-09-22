#' Adresses in route
#' Route stops
#' Takes a workbook and extracts the route stops
#' 
#' @name route
#'
#' @param stationName character vector of length 1 for the name of the station
#'
#' @examples
#' \dontrun{
#' route("DPS1")
#' }
#' @export
#' @md

route <- function(stationName){

	setwd("C:/Users/sdeclerk/Documents/R/WD/today")

	stnFile <- list.files(pattern=c(stationName))[1]

	tmp_obj <- NULL
	address <- NULL
	
	tmp_obj <- read_excel_allsheets(stnFile)
	temp_length <- length(names(tmp_obj))
	j <- NULL
	
	assign("dat", tmp_obj)
	
	for(j in 1:temp_length){
	
		address <- NULL
		tmp_obj2 <- tmp_obj[j]
		assign(paste0("man", j), as.data.frame(tmp_obj2))
		address <- tmp_obj[[j]][,6]
		assign(paste0("SWA", j), address)
		rm(tmp_obj2, address)
		
	}
	rm(tmp_obj, j, temp_length)
	
	routes <- ls(pattern="SWA")	
	print(" -----------------------------------------------------------------")
	print(c("| Station ID: ", stationName))
	print(" -----------------------------------------------------------------")
	
	for(i in 1:length(routes)){
	
		get(routes[i]) -> tmp
		tmptn <- names(table(tmp))
		tmptn <- tmptn[!tmptn %in% c("Actual Customer Address", "DPS1", "DLA7", "DXH6")]
		print(paste0("SWA", i))
		print(tmptn)
		rm(tmp, tmptn)
		
	}
}