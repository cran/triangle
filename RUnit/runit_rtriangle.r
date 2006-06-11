###############################################################################
#
# Program Name:  testrtriangle.R
# Purpose:       To provide test functions for rtriangle.R
# Author:        Rob Carnell
# Date:          June 2006
#
# Required Functions: rtriangle.R
# Required Packages:  RUnit
# R version:          2.3.0 (>=2.0.0)
#
################################################################################

#source("c:////program files//R//triangle//R//rtriangle.R")
require(RUnit)

test.rtriangle <- function(){
  checkEqualsNumeric({set.seed(1976); rtriangle(1, 0, 1, .5)}, 0.1993473295,
                     tolerance=1E-7)
  checkEqualsNumeric({set.seed(1972); rtriangle(2, -5, 5, 3)},
                     c(2.64973641, -0.09889617), tolerance=1E-7)
  checkException(rtriangle(-5), silent=TRUE)
  checkEquals(rtriangle(2, NaN, 3, 1), c(NaN, NaN))
  checkEquals(rtriangle(1, 3, NA, 4), NaN)
  checkException(rtriangle(NA), silent=TRUE)
}
