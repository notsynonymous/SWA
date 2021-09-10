#' Average employee stop time
#' Takes a csv of different employee averages and transforms it into a performance metric
#' This is an effective way of getting a quick look at average employee effieciency along any given route.
#'
#' @name employeeStopTimeAVG
#' 
#' @returns average employee stop time
#' 
#' @examples
#' \dontrun{
#' mat.empStopTime <- employeeStopTimeAVG()
#' mat.empStopTime
#' }
#' @export
#' @md

employeeStopTimeAVG <- function(){

	dir <- paste0(paste0("C:/Users/", Sys.getenv("USERNAME")), "/Documents/R/WD")
	setwd(dir)

	shipDat <- read.csv(file = c(list.files(pattern = "Shipper*")) , stringsAsFactors=FALSE)
	delays <- as.data.frame(shipDat[,c(70,19)])
	delays[is.na(delays)] <- 0
	delays[,2] <- -1*delays[,2]

	colnames(delays) <- c("ID", "delay_m")

	employee <- levels(factor(delays[,1]))
	temp_n <- NULL
	delay_time <- NULL

	for(i in 1:length(employee)) {

		temp_n <- round(mean(delays[which(delays[,1] == c(employee[i])),]$delay_m),2)
		delay_time <- append(delay_time, temp_n)
		rm(temp_n)
		
	}

	delay_times <- as.data.frame(cbind(employee,delay_time))
	colnames(delay_times) <- c("ID", "delay_m")
	in_order <- delay_times[order(delay_time),]
	rownames(in_order) <- c(1:length(employee))
	write.csv(in_order, paste0(paste0("delays_", Sys.Date()),".csv"))

	return(in_order)
	
}