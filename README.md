# STATPROGEXAMREPLACEMENT

Statistical Programming Exam replacement 6th January 2021 by Conor Mulholland

The Start of the program is importing the required packages and setting the correct working directory, if someone else was to usee this code they need to put there own Working Directory here instead.

After that we need to import the CSV files using tibble so that we can join the Files together. As you can see another user will need to change the path for each of the CSV files that we are using.

I then needed to make the files usable together, so I had to change some of the Column names in the Advertisers file so I could join them with the final table.

I used tally to count up how many impressions, clicks and Conversions there were for each campaign ran. These numbers were small but if we used a bigger dataset the results would be much better. 
Again I had to change the column names In the newly created tables I got when I Used tally so that all the data could be joined together.

I then used inner_join to connect all the tallys using the keys I created by changing column names.
These inner_joins create the Final_Table that I used for the graphs representing how effective the ad campaigns were.
This Final_Table has the names of the advertisers, the campaigns , their Budgets and the amount of impressions,clicks and conversions.

After getting the Final_Table I used the data collected by the tallys to create graphs.

I used the bar chart and point chart to see the effectiveness of each ad campaign.

The bar charts show the "Impressions per campaign" , "Clicks per campaign" , "Conversions per campaign" and "Budget per campaign".
I think the having each impression click conversion being compared to the campaign shows how effective each campaign is, especially when you look at each variable being compared to the budget of these campaigns.

I then used the point graphs to show the "Impressions VS Budgets", "Clicks VS Budgets" and "Conversions VS Budgets" 
These graphs show each variable compared to the budget of each ad campaign which clearly shows if the campaign would of been worth it or not, for example the "Q4 performance" campaign that was ran by "lever brows" was definitely not worth it as they had a budget of 250000 and made 3 conversions, which is the same as the amount made by "run of network" ran by "ninetendo" which had a budget of 1000.

Then I Compared "Impressions VS Clicks" and "Conversions VS Clicks"
I will upload these Graphs into the GITHUB.

I feel like if this code is used with another much larger dataset the resulting graphs will be a lot better than the ones produced by using the small sample data set
