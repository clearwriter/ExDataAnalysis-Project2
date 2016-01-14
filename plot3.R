## Assignment 2, Plot 3

## Because we will be using ggplot, we need to load the ggplot2 library.
require(ggplot2)

## As before, load provided datasets, downloaded and stored locally.
NEI <- readRDS("~/CourseraR/summarySCC_PM25.rds")
SCC <- readRDS("~/CourseraR/Source_Classification_Code.rds")

## Question 3:
## Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) variable, 
## which of these four sources have seen decreases in emissions from 1999–2008 for Baltimore City? 
## Which have seen increases in emissions from 1999–2008? 
## Use the ggplot2 plotting system to make a plot answer this question.

## Again, we're working with data from Baltimore City, Maryland == fips 24510.
subsetNEI  <- NEI[NEI$fips=="24510", ]

## And we want to call out the total pollution by year and type.
TotalByYearAndType <- aggregate(Emissions ~ year + type, subsetNEI, sum)

## Generate the graph in the same directory as the source code.
png(filename='~/CourseraR/plot3.png', width=640, height=480)
Answer3 <- ggplot(TotalByYearAndType, aes(year, Emissions, color = type))
Answer3 <- Answer3 + geom_line() +
  +     xlab("year") +
  +     ylab(expression('Total PM'[2.5]*" Emissions")) +
  +     ggtitle('Total Emissions in Baltimore City, Maryland (fips == "24510") from 1999 to 2008')
print(Answer3)

dev.off()

## Result: Non-road, non-point and on-road emissions have seen a decrease in the 1999-2008 period.
## The Point data shows a spike between 2004-2006, with 2008 data similar to 1999.