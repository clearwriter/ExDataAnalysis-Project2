## Assignment 2, Plot 2

## Load provided datasets, downloaded and stored locally
NEI <- readRDS("~/CourseraR/summarySCC_PM25.rds")
SCC <- readRDS("~/CourseraR/Source_Classification_Code.rds")

## Data sampling
NEI_sampling <- NEI[sample(nrow(NEI), size=5000, replace=F), ]

## Question 2:
## Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (fips == "24510") 
## from 1999 to 2008? Use the base plotting system to make a plot answering this question.

## We need to subset the data to present in a single data frame.
MD <- subset(NEI, fips=='24510')

# Generate the graph in the same directory as the source code.
png(filename='~/Exploratory_Data_Analysis/Assignment_2/plot2.png')

barplot(tapply(X=MD$Emissions, INDEX=MD$year, FUN=sum), 
        main='Total Emission in Baltimore City, MD', 
        xlab='Year', ylab=expression('PM'[2.5]))

dev.off()

## Result: You can see from Plot2.png that while emissions in 2008 are lower than 1999,
## the path has not been direct.