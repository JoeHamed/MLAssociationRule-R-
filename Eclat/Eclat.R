# Eclat (Association Rule)

# Importing the dataset
dataset = read.csv('Market_Basket_Optimisation.csv', header = FALSE)

# sparse matrix
library(arules)
dataset = read.transactions('Market_Basket_Optimisation.csv',
                            sep = ',',
                            rm.duplicates = TRUE)
summary(dataset)
itemFrequencyPlot(dataset, topN = 15)

# Training the Eclat Model on the dataset
min_times = 21
sets = eclat(data = dataset, parameter = list(support = round(min_times/length(dataset), 3),
                                               minlen = 2))

# Visualising the Results
# inspect(sort(sets, by = 'support')[1:10])

# Ensure 'rules' is sorted by 'lift'
sorted_rules <- sort(sets, by = "support", decreasing = TRUE)

# Inspect the top 10 rules based on lift
inspect(sorted_rules[1:10])