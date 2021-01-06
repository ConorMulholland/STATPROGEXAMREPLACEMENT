install.packages("tidyverse")
library(tibble)
library(dplyr)
library(readr)
library(ggplot2)
setwd("C:/Users/Conor/Documents/College/Statistical programming/Exam Replacement/dataset")

## Making the data usable ##

Advertisers <- tibble(read_csv("C:/Users/Conor/Documents/College/Statistical programming/Exam Replacement/dataset/advertiser.csv"))
Campaigns <- tibble(read_csv("C:/Users/Conor/Documents/College/Statistical programming/Exam Replacement/dataset/campaigns.csv"))
Impressions <- tibble(read_csv("C:/Users/Conor/Documents/College/Statistical programming/Exam Replacement/dataset/impressions.csv"))
Clicks <- tibble(read_csv("C:/Users/Conor/Documents/College/Statistical programming/Exam Replacement/dataset/clicks.csv"))
Conversions <- tibble(read_csv("C:/Users/Conor/Documents/College/Statistical programming/Exam Replacement/dataset/conversions.csv"))

names(Advertisers)[names(Advertisers) == "ID"] <- "advertiser_id"
names(Advertisers)[names(Advertisers) == "name"] <- "NameofAdvertiser"

Amount_of_Impressions <- Impressions %>% group_by(campaign_id) %>% tally()
names(Amount_of_Impressions)[names(Amount_of_Impressions) == "campaign_id"] <- "id"
names(Amount_of_Impressions)[names(Amount_of_Impressions) == "n"] <- "AmountOfImpressions"

Amount_of_Clicks <- Clicks %>% group_by(campaign_id) %>% tally()
names(Amount_of_Clicks)[names(Amount_of_Clicks) == "campaign_id"] <- "id"
names(Amount_of_Clicks)[names(Amount_of_Clicks) == "n"] <- "AmountOfClicks"

Amount_of_Conversions <- Conversions %>% group_by(campaign_id) %>% tally()
names(Amount_of_Conversions)[names(Amount_of_Conversions) == "campaign_id"] <- "id"
names(Amount_of_Conversions)[names(Amount_of_Conversions) == "n"] <- "AmountOfConversions"

Adding_impressions <- inner_join(Campaigns,Amount_of_Impressions, key = "id")
Adding_Clicks <- inner_join(Adding_impressions,Amount_of_Clicks, key = "id")
Adding_Conversions <- inner_join(Adding_Clicks,Amount_of_Conversions, key ="id")
Final_Table <- inner_join(Adding_Conversions,Advertisers, key = "advertiser_id")
names(Final_Table)[names(Final_Table) == "name"] <- "NameOfCampaign"
view(Final_Table)

## GRAPHS ##

ggplot(data=Final_Table, aes(x=NameOfCampaign, y=AmountOfImpressions)) +
  geom_bar(stat="identity", width=0.5) + ggtitle("Impressions per Campaign")

ggplot(data=Final_Table, aes(x=NameOfCampaign, y=AmountOfClicks)) +
  geom_bar(stat="identity", width=0.5) + ggtitle("Clicks per Campaign")

ggplot(data=Final_Table, aes(x=NameOfCampaign, y=AmountOfConversions)) +
  geom_bar(stat="identity", width=0.5) + ggtitle("Conversions per Campaign")

ggplot(data=Final_Table, aes(x=NameOfCampaign, y=budget)) + 
  geom_bar(stat="identity", width=0.5) + ggtitle("Budget Per Campaign")

ggplot(data = Final_Table) + geom_point(mapping = aes(x = budget,y = AmountOfImpressions)) + ggtitle("Impressions VS Budgets")
ggplot(data = Final_Table) + geom_point(mapping = aes(x = budget,y = AmountOfClicks)) + ggtitle("Clicks VS Budget")
ggplot(data = Final_Table) + geom_point(mapping = aes(x = budget,y = AmountOfConversions)) + ggtitle("Conversions VS Budget")

ggplot(data = Final_Table) + geom_point(mapping = aes(x = AmountOfImpressions,y = AmountOfClicks,)) + ggtitle("Impressions VS Clicks")
ggplot(data = Final_Table) + geom_point(mapping = aes(x = AmountOfConversions,y = AmountOfClicks,)) + ggtitle("Conversions VS Clicks")




