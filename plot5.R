## Assignment 2, Plot 5

## Because we will be using ggplot, we need to load the ggplot2 library.
require(ggplot2)

## As before, load provided datasets, downloaded and stored locally.
NEI <- readRDS("~/CourseraR/summarySCC_PM25.rds")
SCC <- readRDS("~/CourseraR/Source_Classification_Code.rds")

## Question 5:
## How have emissions from motor vehicle sources changed from 1999-2008 in Baltimore City? 

## We start by subsetting the data to look only for "on road" for the Baltimore City
## fips code == 24510.
subsetNEI <- NEI[NEI$fips=="24510" & NEI$type=="ON-ROAD",  ]

## And we want to aggregate the totals by year.
TotalByYear <- aggregate(Emissions ~ year, subsetNEI, sum)

## I like to generate the graph in the same directory as the source code.
png(filename='~/CourseraR/plot5.png', width=640, height=480)
Answer5 <- ggplot(TotalByYear, aes(factor(year), Emissions))
Answer5 <- Answer5 + geom_bar(stat="identity") +
  xlab("year") +
  ylab(expression('Total PM'[2.5]*" Emissions")) +
  ggtitle('Total ON ROAD emissions in Baltimore City, Maryland (fips = "24510") from 1999 to 2008')
print(Answer5)
dev.off()