#' @title Binomial Distribution
#'
#' @param iter Number of iterations
#' @param n Size of sample
#' @param p Probability of success
#'
#' @return Table of probabilities for each number of successes
#' @export
#' @import graphics
#' @import grDevices
#'
#' @examples
#' \dontrun{mybin(iter=1000,n=18, p=0.3)}
mybin=function(iter=100,n=10, p=0.5){
  sam.mat=matrix(NA,nrow=n,ncol=iter, byrow=TRUE)
  succ=c()
  for( i in 1:iter){
    #Fill each column with a new sample
    sam.mat[,i]=sample(c(1,0),n,replace=TRUE, prob=c(p,1-p))
    #Calculate a statistic from the sample (this case it is the sum)
    succ[i]=sum(sam.mat[,i])
    #Make a table of successes
    succ.tab=table(factor(succ,levels=0:n))
    #Make a barplot of the proportions
    barplot(succ.tab/(iter), col=rainbow(n+1), main="Binomial simulation", xlab="Number of successes")
    succ.tab/iter
  }
}
