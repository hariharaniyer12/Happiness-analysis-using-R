csv1 <- read.csv("~/BDA/2015newwithpop.csv")
selected_data <- csv1[, c("Country", "Deaths", "Health..Life.Expectancy.","Total.Pop")]
new_data=selected_data%>% filter(Deaths > 0)
place <- new_data[, c("Country")]
place1 <- place[1:50]
pop <- new_data[, c("Total.Pop")]
pop1=pop[1:50]
Death <- new_data[,c("Deaths")]
Death1 <- Death[1:50]
Death1 <- Death1/pop1*100
Death1 <- Death1/max(Death1)*100
happy <- new_data[,c("Health..Life.Expectancy.")]
happy1=happy[1:50]
happy1=happy1/max(happy1)*100
df <- matrix(c(Death1,happy1),nrow = 2, ncol = 50, byrow = TRUE)
correlation <- cor(Death1, happy1)
print(correlation)
# Create a matrix for the barplot
bar_matrix <- as.matrix(selected_data[, -1])  # Exclude the x_axis column

# Create a bar chart
colors = c("green", "orange")
png("~/BDA/2015HvL1.png", width = 800, height = 600)
barplot(df, main = "Life and Death comparison", names.arg =place1,  
        xlab = "Country", ylab = "Deaths(Green),Happiness(Orange)",  
        col = colors, beside = TRUE) 
dev.off()