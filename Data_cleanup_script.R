install.packages("plotly")
install.packages("reshape2")
install.packages("ggplot2")

library("plotly")
library("reshape2")
library("ggplot2")

### Importing the data
RC061517 <- read.csv("RC061517.csv")
View(RC061517)

### Subsetting the data so that we only graph the variables that we're interested in
RC061517 <- RC061517[,4:16]
RC061517 <- RC061517[,-2]
RC061517 <- RC061517[,-2]

RC061517 <- RC061517[,-4]
RC061517 <- RC061517[,-4]
RC061517 <- RC061517[,-4]
RC061517 <- RC061517[,-4]
RC061517 <- RC061517[,-5]

### renaming the data columns
colnames(RC061517) <- c("DateTime", "Temp", "SpCond", "pH", "Turbidity", "Volts")

### Making sure that the data frame is the right length for the data we're trying to correct
RC061517 <- RC061517 [2:6553,]

### Converting the date/time into a time series function
RC061517$DateTime <- as.POSIXct(strptime(RC061517$DateTime, format="%m/%d/%y %H:%M"))

### convert from short form to long form
RC061517 <- melt(RC061517, id.vars=c("DateTime"))

### create the initial plot
RC061517plot <- ggplot(data=RC061517, aes(x=DateTime, y=value))+
  geom_line()+
  theme_bw()+
  facet_grid(variable~., scales="free_y")

##create the interactive plotly plot
ggplotly(RC061517plot)