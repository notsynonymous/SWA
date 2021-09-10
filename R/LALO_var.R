#' Latitude and Longitude total differential
#' Takes latitude and longitude data and extracts a differential
#' Allows user to see the differences between displaced area as an additional metric for route risk analysis.
#'
#' @importFrom stats sd
#' @importFrom utils read.csv
#' 
#' @param fileName the name of a file (character vector, length 1) from comp in csv format
#'
#' @returns total differential
#' 
#' @examples
#' \dontrun{
#' tot_diff <- LALO_var(data.csv)
#' tot_diff
#' }
#' @export
#' @md

LALO_var <- function(fileName) {

	datatt <- read.csv(fileName)
	names(datatt)
	# Area = A x B, C^2 = A^2 + B^2, Sd(x/y)^2 = d^2x^2 + d^2y^2 as F(<x><y>)
	LALo_lf <- datatt[,c(3,48,49)] #reducing PkgsExSports to lat/long matrix
	LALo_sqrs <- data.frame(LALo_lf[,c(2,3)]^2) #finding the squares to extrapolate the drift
	LALo_AF <- c(LALo_sqrs[,1] + LALo_sqrs[,2]) #concatenating the left and righthand squares
	LALo_vars <- c(sqrt(LALo_AF)) #calculating the differences across an area (F(A<x,y>) = A(x) x B(y)) (variance)
	total_differential <- sd(LALo_vars) #finding the amount of total displacement in the area of delivery through SD (dF(A<x,y>))
	return(total_differential)

}