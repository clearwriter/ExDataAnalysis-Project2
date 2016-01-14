## Assignment 2, Plot 1

## Load provided datasets, downloaded and stored locally 
NEI <- readRDS("~/CourseraR/summarySCC_PM25.rds")
SCC <- readRDS("~/CourseraR/Source_Classification_Code.rds")

## Data sampling
NEI_sampling <- NEI[sample(nrow(NEI), size=2000, replace=F), ]

## Data aggregation
Emissions <- aggregate(NEI[, 'Emissions'], by=list(NEI$year), FUN=sum)
Emissions$PM <- round(Emissions[,2]/1000,2)

## Question 1: 
## Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? 
## Using the base plotting system, make a plot showing the total PM2.5 emission from 
## all sources for each of the years 1999, 2002, 2005, and 2008.

## I like to generate the plot in the same file as the source code to keep all of my
## various Coursera Plot1 files distinct and separate.
png(filename='~/CourseraR/plot1.png')

barplot(Emissions$PM, names.arg=Emissions$Group.1, 
        main=expression('Total Emission of PM'[2.5]),
        xlab='Year', ylab=expression(paste('PM', ''[2.5], ' in Kilotons')))

dev.off()

## Result: You can see in Plot1.png that there is a downward trend from 1999-2008.