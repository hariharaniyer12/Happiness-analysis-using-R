install.packages("dplyr")
library(dplyr)

# Read data from CSV files
csv1 <- read.csv("~/BDA/death/Caused of Deaths.csv")  # Make sure to provide the correct path to your CSV file
csv2 <- read.csv("~/BDA/happy/2015.csv")  # Make sure to provide the correct path to your CSV file
csv1_1 <- csv1 %>% filter(Year == 2015)
# Merge the data based on the "date" column
Merged_data <- merge(csv1_1, csv2, by=c("Country"))
Merged_data1 <- Merged_data %>% filter(Cause == "Conflict and Terrorism")
#print(Merged_data1)
#write.csv(Merged_data1, "~/BDA/2015dh.csv", row.names = FALSE)


csv2_2 <- read.csv("~/BDA/happy/2016.csv")  # Make sure to provide the correct path to your CSV file
csv1_2 <- csv1 %>% filter(Year == 2016)
# Merge the data based on the "date" column
Merged_data2 <- merge(csv1_2, csv2_2, by=c("Country"))
Merged_data3 <- Merged_data2 %>% filter(Cause == "Conflict and Terrorism")
#print(Merged_data3)

csv2_3 <- read.csv("~/BDA/happy/2017.csv")  # Make sure to provide the correct path to your CSV file
csv1_3 <- csv1 %>% filter(Year == 2017)
# Merge the data based on the "date" column
Merged_data4 <- merge(csv1_3, csv2_3, by=c("Country"))
Merged_data5 <- Merged_data4 %>% filter(Cause == "Conflict and Terrorism")
#print(Merged_data5)



df2015 <- Merged_data1[c("Country","Deaths", "Happiness.Rank","Happiness.Score","Economy..GDP.per.Capita.","Health..Life.Expectancy.","Freedom","Trust..Government.Corruption.")]
write.csv(df2015, "~/BDA/2015new.csv")
df2016 <- Merged_data3[c("Country","Deaths", "Happiness.Rank","Happiness.Score","Economy..GDP.per.Capita.","Health..Life.Expectancy.","Freedom","Trust..Government.Corruption.")]
write.csv(df2016, "~/BDA/2016new.csv")
df2017 <- Merged_data5[c("Country","Deaths", "Happiness.Rank","Happiness.Score","Economy..GDP.per.Capita.","Health..Life.Expectancy.","Freedom","Trust..Government.Corruption.")]
write.csv(df2016, "~/BDA/2017new.csv")
print(csv2)


