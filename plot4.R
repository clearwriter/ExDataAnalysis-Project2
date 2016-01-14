## Assignment 2, Plot 4

## Because we will be using ggplot, we need to load the ggplot2 library.
require(ggplot2)

## As before, load provided datasets, downloaded and stored locally.
NEI <- readRDS("~/CourseraR/summarySCC_PM25.rds")
SCC <- readRDS("~/CourseraR/Source_Classification_Code.rds")

NEISCC <- merge(NEI, SCC, by="SCC")

## Question 4: 
## Across the United States, how have emissions from coal combustion-related sources 
## changed from 1999-2008?

coalSources  <- grepl("coal", NEISCC$Short.Name, ignore.case=TRUE)
subsetNEISCC <- NEISCC[coalSources, ]

aggregatedTotalByYear <- aggregate(Emissions ~ year, subsetNEISCC, sum)

## I like to generate the graph in the same directory as the source code.
png(filename='~/CourseraR/plot4.png', width=640, height=480)
Answer4 <- ggplot(aggregatedTotalByYear, aes(factor(year), Emissions))
Answer4 <- Answer4 + geom_bar(stat="identity") +
  xlab("year") +
  ylab(expression('Total PM'[2.5]*" Emissions")) +
  ggtitle('Total Emissions from coal sources from 1999 to 2008')
print(Answer4)

dev.off()

## Result: The plot indicates that coal combustion-related emissions have declined from 
## 1999 through 2008.