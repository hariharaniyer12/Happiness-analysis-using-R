csv1 <- read.csv("~/BDA/2015new.csv")
selected_data <- csv1[, c("Country", "Happiness.Score", "Trust..Government.Corruption.")]
place <- csv1[, c("Country")]
place1 <- place[1:50]
Death <- csv1[,c("Happiness.Score")]
Death1 <- Death[1:50]
Death1 <- Death1/max(Death1)*100
happy <- csv1[,c("Trust..Government.Corruption.")]
happy1=happy[1:50]
happy1=happy1/max(happy1)*100
df <- matrix(c(Death1,happy1),nrow = 2, ncol = 50, byrow = TRUE)
# Create a matrix for the barplot
bar_matrix <- as.matrix(selected_data[, -1])  # Exclude the x_axis column
correlation <- cor(Death1, happy1)
print(correlation)
# Create a bar chart
colors = c("green", "orange")
png("~/BDA/2015HvC.png", width = 800, height = 600)
barplot(df, main = "Happiness vs Trust in Govt", names.arg =place1,  
        xlab = "Country", ylab = "Freedom",  
        col = colors, beside = TRUE) 
dev.off()
#print(csv1)