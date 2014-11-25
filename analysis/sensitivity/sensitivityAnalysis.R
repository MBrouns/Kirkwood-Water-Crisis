# Copyright (c) 2014, M Brouns
#    
#    Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#    
#    The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
# THE SOFTWARE.

# README:
# This script allows you to easily do a sensitivity analysis over multiple output variables and experiments
# As an output it generates the outputMatrix variable 
# which is a matrix with the experiment names as rows, and output variables as columns
#
# Use the options section below to set some base values specifically for your case
# 
# The script expects a number of CSV files in a certain directory which can be specified
# The time in those csv files should be going down, not across


#Options
# The name of the file to compare with
baselineDataName <- "Baseline.csv" 

# A vector of the output variables you want to compare with the baseline
# Note: Spaces in the csv variable names will be transformed into a "." (dot) 
# so adjust the variable names here accordingly
outputVariables <- c("Total.water.demand", "Practical.infrastructure.capacity","Available.funds.for.maintenance","percentage.infrastructure.maintained.annually","Total.production.possible","Infrastructure.Shortage") 


# The path where the experiment data files can be found. Files are expected to be in csv format with time going downwards
experimentPath <- "data"



# DO NOT CHANGE ANYTHING BELOW HERE UNLESS YOU KNOW WHAT YOU'RE DOING
experimentFiles <- list.files(path=experimentPath)

outputMatrix <- matrix(nrow=length(experimentFiles), ncol=length(outputVariables))
rownames(outputMatrix) <- experimentFiles
colnames(outputMatrix) <- outputVariables
    
    
# Read in baseline dataset
baseline <- read.csv(paste(experimentPath, '/', baselineDataName, sep=""))
timestep <- baseline[2,1] - baseline[1,1] 
    

calculateSensitivity <- function(experimentDataFile, outputColumn){
    # Read in experiment dataset
    experiment <- read.csv(paste('data/',experimentDataFile, sep=''))
    
    # Calculate f_i for desired output column
    fi = abs(experiment[,c(outputColumn)] - baseline[,c(outputColumn)])/abs(baseline[,c(outputColumn)])
    fi[is.na(fi)] <- 0
    fi[is.infinite(fi)] <- 0
    # Calculate integral over f_i
    sensitivity <- 0.5*timestep * (fi[1] + fi[length(fi)] + 2*sum(fi))
    return(sensitivity)
}


for (experiment in experimentFiles){
    for (outputVariable in outputVariables){
        outputMatrix[c(experiment), c(outputVariable)] <- calculateSensitivity(experiment, outputVariable)
    } 
}
