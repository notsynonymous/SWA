#' Takes the string "dat" and pastes an index
#' This function is mostly a DRY private function that helps generate the name of dataframes 
#' @name name_func
#' 
#' @param index A numeric vector of length 1 that takes an index. Intended to be used in loops for generating large batches of objects (like Anonymous, or any other fucking thing that I constantly have to avoid or move around)
#'
#' @returns None
#' 
#' @examples
#' \code num <- c(1,2,3,4,5)
#' \code for(i in 1:length(num)){
#' \code 	
#' \code		assign(name_func(i), i)
#' \code }
#' \code ls()
#' @export
#' @md

name_func = function(index) {
	paste0("dat", index)
}