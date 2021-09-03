#' Reads a workbook to a multidimensional matrix
#' This is a function to take a workbook and transform it into a multidimensional matrix. This function was created by Jeromy Anglim.
#' @name read_excel_allsheets
#'
#' @author Jeromy Anglim
#'
#' @param filename a vector of type string and length 1 that takes the name of a file
#' @param tibble a logical argument that uses tibbles instead of dataframes if set to TRUE
#'
#' @returns None
#' 
#' @examples
#' \code # set the current working directory to a folder with an XLS file in it
#' \code # this code is in a block comment because it requires an XLS file
#' \code # NOTRUN {
#' \code #	setwd(PATH_TO_FOLDER)
#' \code # }
#' \code # read_excel_allshets(filename)
#' \code # ls()
#' @export
#' @md

require(readxl)
read_excel_allsheets <- function(filename, tibble = FALSE) {
	print("Created by Jeromy Anglim")
    sheets <- readxl::excel_sheets(filename)
    x <- lapply(sheets, function(X) readxl::read_excel(filename, sheet = X))
    if(!tibble) x <- lapply(x, as.data.frame)
    names(x) <- sheets
    x
}