#' The worlds simplest travese function of all time.
#'
#' It takes an integer and returns the file history cache.
#' This function will eventually be used with the search function of Motherfucking Automation
#'
#' @name fl
#'
#' @importFrom utils tail
#'
#' @param up takes an integer and traverses up the number of levels
#' @param pat a character vector containing a shortened string of a folder to traverse into
#'
#' @returns folderHist a cache of folders that were traverves in order to traverse back down
#' 
#' @examples
#' \dontrun{
#' getwd()
#' tr <- fl(2,)
#' tr
#' setwd(tr[1])
#' }
#' @export
#' @md

fl <- function(up=0, pat) {

	if(missing(pat)) {

		folderHist <- getwd()
		
		if(up >=1) {
			for(i in 1:up) {
				folderHist <- append(folderHist, getwd())
				setwd("..")
			}
		}
		folderHist <- tail(folderHist, -1)
	}
	if(missing(up)) {
	
		folderHist <- getwd()
		folder <- list.files(pattern=pat)
		
		if(length(folder > 1)) {
			
			setwd(folder[1])
			
		} else {
			
			setwd(folder)
			
		}
	}
	
	return(folderHist)
	
}