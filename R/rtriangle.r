################################################################################
#
# Program:   rtriangle.R
# Purpose:   To draw from the triangle distribution
# Author:    Rob Carnell
# Date:      June 06
#
# Variables
#   used the same naming conventions as other R distributions (q,p,d)
#   n = number of values to return
#   a = left triangle endpoint,
#   b = right triangle endpoint
#   c = distribution mode
#   First, exclude situations which are impossible with the function definition
#   Next, define the value of the function on the various intervals
#
################################################################################

rtriangle <- function(n=1, a=0, b=1, c=0.5){
  if(length(n)>1) n <- length(n)
  if(n<1 | is.na(n)) stop("invalid arguments")
  n <- floor(n)
  if(any(is.na(c(a,b,c)))) return(rep(NaN, times=n)) # to match behavior of runif
  if(a > c | b < c) return(rep(NaN, times=n)) # to match behavior of runif
  if(any(is.infinite(c(a,b,c)))) return(rep(NaN, times=n))
  
  p <- runif(n)
  
  i <- which((a + sqrt(p * (b - a)*(c - a))) <= c)
  #print(i)
  j <- which((b - sqrt((1 - p) * (b - a) * (b - c))) > c)
  #print(j)
  if(length(i)!=0)
    p[i] <- a + sqrt(p[i] * (b - a) * (c - a))
  if(length(j)!=0)
    p[j] <- b - sqrt((1 - p[j]) * (b - a) * (b - c))
  
  return(p)
}


