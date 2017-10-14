# Initializing libraries
library(arules)
library(plyr)

# Loading the data from file
df <-  read.csv(file = "~/data/transactions.csv")
print('A sample of loaded data')
head(df)

# Data wrangling with R: putting all the purchased items into a single transaction

# using subset of fields: the values in the result set are unique
ordersDF <- ddply(df,c('CUST_ORDER_NUMBER','PRODUCT_LINE'),summarize, unused=sum(1))
ordersDF <- subset(ordersDF , select = c('CUST_ORDER_NUMBER','PRODUCT_LINE'))

# merging multiple lines related to the same order inta a single line
ordersDF <- aggregate( PRODUCT_LINE ~ CUST_ORDER_NUMBER, data = ordersDF, paste, collapse = ",")

# getting an list of items istead of a comma separated strings
ordersDF <- dlply(ordersDF, 1, function(items) (strsplit(items$PRODUCT_LINE, split=",")))
transactions <- unlist(ordersDF, recursive = FALSE, use.names = FALSE)

# filtering the transaction with multiple purchased items
transactions <- transactions [lapply(transactions , length) > 1]

print('Sample of transactions ready for Apriori algorithm')
head(transactions)

#Transforming data according to arules requirements
transactions <- as(transactions, "transactions")

#applying Apriori algorithm

library(arules)

rulesMod <- apriori(transactions, parameter=list(support=0.2, conf=0.4, minlen=2))
rulesMod <- sort(rulesMod, decreasing=T, by="lift")

inspect(rulesMod)

#Visualizing association rules
library(graph)
library(Rgraphviz)
library(arulesViz)

plot(rulesMod, method = "graph", control = list(type = "items", engine = "graphviz"))



