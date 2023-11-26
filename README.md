# Module-7-Challenge

In this assignment the given task was divided by 3 parts.

Data Modeling
Here I've built the entity relationship diagram (ERD) by inspecting the provided CSV files, and then I saved it as PNG file.

Data Engineering
Using the database model as a blueprint, I created a database schema for each of your tables and relationships. I specified data types, primary keys, foreign keys. After creating the database schema, imported the data from the corresponding CSV files.

Data Analysis
Part 1 Using my newly created database, I generated queries that would discover the information needed to answer the following questions, then I used repository's ReadME file to create a markdown report I could share

Some fraudsters hack a credit card by making several small transactions (generally less than $2.00), which are typically ignored by cardholders.
How can you isolate (or group) the transactions of each cardholder

Count the transactions that are less than $2.00 per cardholder.

Is there any evidence to suggest that a credit card has been hacked Explain your rationale.

Take your investigation a step further by considering the time period in which potentially fraudulent transactions are made.
What are the top 100 highest transactions made between 700 am and 900 am

Do you see any anomalous transactions that could be fraudulent

Is there a higher number of fraudulent transactions made during this time frame versus the rest of the day

If you answered yes to the previous question, explain why you think there might be fraudulent transactions during this time frame.

What are the top 5 merchants prone to being hacked using small transactions
Created a view for each of queries.

Part 2
I used the starter notebook to query the database and generate visualizations that supply the requested information as follows, then added my visualizations and observations to markdown report

Using hvPlot, I created a line plot representing the time series of transactions over the course of the year for each cardholder separately.

Next, to better compare their patterns,I created a single line plot that contains both card holders' trend data.
