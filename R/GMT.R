#' Load a GMT file from disc
#'
#' @param FileLocation 
#'
#' @return
#' @export
#'
#' @examples
ReadGMTFile <- function(FileLocation) {
  
  Done <- FALSE
  GeneList <- list()
  Idx <- 0
  
  while(!Done){
    
    Idx <- Idx + 1
    
     tLine <- unlist(readr::read_delim(FileLocation, "\t", escape_double = FALSE,
                                         col_names = FALSE, trim_ws = TRUE, n_max = 1, skip = Idx - 1),
                              use.names = FALSE)
    
    if(length(tLine) < 3){
      Done <- TRUE
    } else {
      GeneList[[Idx]] <- list(Name = tLine[1], Desc = tLine[2], Genes = tLine[-c(1:2)])
    }
    
  }
  
  return(GeneList)
}

