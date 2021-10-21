#' A model that selects BT for stops.
#' Trained against arbitrary threshold.
#'
#' @details beta
#'
#' @name BTMetric
#'
#' @param volume_report a generated frequency graph stop volume overview (see read_whole_folder_RTW)
#' @param thsd_p a double of threshold value for metrics. This can be used in a loop to test common threshold historically.
#' @param thsd_n a threshold for the number of packages at a stop
#' 
#' @returns boxtrucks a boxtrucks of size stations x stations$max_stops that is a list of stops that require a box truck
#' 
#' @examples
#' \dontrun{
#' holder <- c("PLACE")
#' holder
#' }
#' @export
#' @md

BTMetric <- function(volume_report, thsd_p, thsd_n) {

	volume_report[,2] <- as.numeric(volume_report[,2])
	volume_report[,3] <- as.numeric(volume_report[,3])
	volume_report <- volume_report[volume_report$PkupPercent > thsd_p,]
	volume_report <- volume_report[volume_report$N_pickups > thsd_n,]
	size <- length(volume_report[,1])
	stps <- NULL
	for(i in size:1) {
	
		if((!is.na(volume_report[i,1]))&&(volume_report[i,1] != "TOTAL ROUTES")) {
			tmp <- volume_report[i,]
			stps <- rbind(stps, tmp)
			rm(tmp)
		}
	}
	rm(i)
	
	print(stps)
	return(stps)
}
