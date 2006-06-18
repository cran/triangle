################################################################################
#
# Program Name:  runitTestSuite_triangle.R
# Purpose:       To provide test functions for teh triangle package
# Author:        Rob Carnell
# Date:          June 2006
#
# Required Packages:  RUnit
# R version:          2.3.0 (>=2.0.0)
#
################################################################################

require(RUnit)

## used as part of package
#require(triangle)
#defaultPath <- chartr("/", "//", paste(.path.package("triangle"), "/RUnit", sep=""))

################# used in development ##########################################
defaultPath <- "c:////program files//r//triangle//RUnit"                       #
source("c:////program files//r//triangle//R//qtriangle.R")                     #
source("c:////program files//r//triangle//R//dtriangle.R")                     #
source("c:////program files//r//triangle//R//rtriangle.R")                     #
source("c:////program files//r//triangle//R//ptriangle.R")                     #

testSuite.triangle <- defineTestSuite("triangle",
  dirs=defaultPath)

testResult <- runTestSuite(testSuite.triangle)

################# used in development ##########################################
                                                                               #
## warning expected about gcc compiler                                         #
suppressWarnings(printHTMLProtocol(testResult,                                 #
  fileName=paste(defaultPath, "//Test Results.html", sep="")))                 #
                                                                               #
browseURL(paste(defaultPath, "//Test Results.html",sep=""),                    #
          browser=getOption("browser"))                                        #

