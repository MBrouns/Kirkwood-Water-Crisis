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
