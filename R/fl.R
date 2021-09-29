#' The worlds simplest travese function of all time
#' It takes and integer and returns the file history cache.
#' This function will eventually be used with the search function of Motherfucking Automation
#'
#' @name fl
#'
#' @importFrom utils tail
#'
#' @param up takes an integer and traverses up the number of levels
#'
#' @returns folderHist a cache of folders that were traverves in order to traverse back down
#' 
#' @examples
#' \dontrun{
#' getwd()
#' tr <- fl(2)
#' tr
#' setwd(tr[1])
#' }
#' @export
#' @md

fl <- function(up=0) {

	folderHist <- getwd()
	
	if(up >=1) {
		for(i in 1:up){
			folderHist <- append(folderHist, getwd())
			setwd("..")
		}
	}
	folderHist <- tail(folderHist, -1)
	
	return(folderHist)
}