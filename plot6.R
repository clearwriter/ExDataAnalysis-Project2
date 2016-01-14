## Assignment 2, Plot 6

## Because we will be using ggplot, we need to load the ggplot2 library.
require(ggplot2)

## As before, load provided datasets, downloaded and stored locally.
NEI <- readRDS("~/CourseraR/summarySCC_PM25.rds")
SCC <- readRDS("~/CourseraR/Source_Classification_Code.rds")

## Question 6:
## Compare emissions from motor vehicle sources in Baltimore City with emissions from motor vehicle sources 
## in Los Angeles County, California (fips == 06037). Which city has seen greater changes over time 
## in motor vehicle emissions?

## We want to subset by the localities: Baltimore City and LA County for "on road".
subsetNEI <- NEI[(NEI$fips=="24510"|NEI$fips=="06037") & NEI$type=="ON-ROAD",  ]

TotalByYearAndFips <- aggregate(Emissions ~ year + fips, subsetNEI, sum)
TotalByYearAndFips$fips[TotalByYearAndFips$fips=="24510"] <- "Baltimore, MD"
TotalByYearAndFips$fips[TotalByYearAndFips$fips=="06037"] <- "Los Angeles, CA"

## I like to generate the graph in the same directory as the source code.
png(filename='~/CourseraR/plot6.png', width=800, height=480)
Answer6 <- ggplot(TotalByYearAndFips, aes(factor(year), Emissions, fill=year))
Answer6 <- Answer6 + facet_grid(. ~ fips)
Answer6 <- Answer6 + geom_bar(stat="identity")  +
  xlab("year") +
  ylab(expression('Total PM'[2.5]*" Emissions")) +
  ggtitle('Total ON ROAD emissions in Baltimore City, MD ("24510") vs Los Angeles, CA ("06037")  1999-2008')
print(Answer6)

dev.off()

## Result: Significantly higher emissions levels are present in LA than Baltimore.