# Apriori (Association Rule)

# Importing the dataset
# install.packages('arules')
library(arules)
dataset = read.csv('Market_Basket_Optimisation.csv', header = FALSE)
# sparse matrix
dataset = read.transactions('Market_Basket_Optimisation.csv', sep = ',',
                            rm.duplicates = TRUE) # 5 transactions containing 1 duplicate
summary(dataset)
itemFrequencyPlot(dataset, topN = 20)

# Training Apriori on the dataset
# product that appear in at least 3 transactions a day
# dataset is recoreded for a week
# min_times = 4 * 7
min_times = 28
rules = apriori(data = dataset, parameter = list(support = round(min_times / length(dataset), 4)
                                                 , confidence = 0.2, minlen = 2))
# Visualising the results
# inspect(sort(rules, by = 'lift')[1:10])

# Ensure 'rules' is sorted by 'lift'
sorted_rules <- sort(rules, by = "lift", decreasing = TRUE)

# Inspect the top 10 rules based on lift
inspect(sorted_rules[1:10])