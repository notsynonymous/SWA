#' A simple search function
#'
#' Takes a fucking word and looks for shit
#' @details This is totally some obvious thing that someone somehow overlooked at somepoint because they're an asshole.
#'
#' @name surch
#'
#' @param term a word to search all the folders for
#'
#' @returns files a list of files with the search term (WOW!)
#' 
#' @examples
#' \dontrun{
#' filesINeed <- search("obviously")
#' }
#' @export
#' @md

surch <- function(term){

	files <- list.files(pattern = term, recursive=TRUE)
	return(files)

}