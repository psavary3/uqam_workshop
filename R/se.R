se <- function(x){
  se <- sqrt( var(x) / length(x) )
  return(se)
}