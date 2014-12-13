data <- read.table("../../vensim/emaresults.tab", header=TRUE, sep="\t")

data <- data[!data$householdshortage < 0, ]
data$bin <- cut(data$householdshortage, 
                            c(0, 1500, 3000, 6000, 9000, 12000, 20000, 30000, 50000, 100000, 1000000),
                            labels = 
                                c("0-1500", 
                                  "1500-3000", 
                                  "3000-6000", 
                                  "6000-9000", 
                                  "9000-12000", 
                                  "12000-20000", 
                                  "20000-30000", 
                                  "30000-50000", 
                                  "50000-100000", 
                                  "100000+")
                           )


hist(data$householdshortage)
counts <- table(data$bin)
barplot(counts, main="outcome dist", 
        xlab="bin")


if(!require(rpart)) install.packages("rpart")
if(!require(rattle)) install.packages("rattle")
if(!require(rpart.plot)) install.packages("rpart.plot")
if(!require(RColorBrewer)) install.packages("RColorBrewer")
library(rpart)
library(rattle)
library(rpart.plot)
library(RColorBrewer)

fit <- rpart(bin ~ Annual.financial.bail.out +
                          Attention.rate.for.planning.new.infrastructure + 
                          Default.infrastructure.aging.time + 
                          Maximum.capacity.exceeding +
                          Percentage.of.income.used.for.maintenance	+
                          Staff.Hired +
                          Staff.required.for.tankers +
                          Staff.service.time +
                          switch.policy.staff.attention +
                          Target.percentage.infrastructure.maintenance,
                      data = data,
                      method="class"
                      )

pfit<- prune(fit, cp=   fit$cptable[which.min(fit$cptable[,"xerror"]),"CP"])
pfit <- prp(pfit,snip=TRUE)$obj
# plot the pruned tree 
fancyRpartPlot(pfit)
