% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/read_excel_allsheets.R
\name{read_excel_allsheets}
\alias{read_excel_allsheets}
\title{Reads a workbook to a multidimensional matrix
This is a function to take a workbook and transform it into a multidimensional matrix. This function was created by Jeromy Anglim.}
\usage{
read_excel_allsheets(filename, tibble = FALSE)
}
\arguments{
\item{filename}{a vector of type string and length 1 that takes the name of a file}

\item{tibble}{a logical argument that uses tibbles instead of dataframes if set to TRUE}
}
\value{
None
}
\description{
Reads a workbook to a multidimensional matrix
This is a function to take a workbook and transform it into a multidimensional matrix. This function was created by Jeromy Anglim.
}
\examples{
\dontrun{
setwd(PATH_TO_FOLDER)
read_excel_allshets(filename)
}
}
\author{
Jeromy Anglim
}
