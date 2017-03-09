#This function illustrates how to use env in order to modify 
#(a subset of columns and rows in) a data.frame using lapply ;)
modifyingSpecificColumnsAndRowsInAdataFrameUsinglapply <- function(bigDF, which.col, which.row) {
  makeModification <- function(i, j, env = parent.frame()) {
    env$bigDF[[i, j]] <- rev(env$bigDF[[i, j]]) #This will work also on a list within a data.frame
  }
  lapply(which.col, function(j, env) { lapply(which.row, makeModification, j, env)}, environment())
  return(bigDF)
}
