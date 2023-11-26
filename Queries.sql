select * from card_holder;

select * from credit_card;

SELECT * FROM merchant;

select * from transaction;

select * from merchant_category;

select * from card_holder;

-- Some fraudsters hack a credit card by making several small transactions (generally less than $2.00), which are typically ignored by cardholders.
-- How can you isolate (or group) the transactions of each cardholder?
CREATE VIEW isolated_transactions_of_each_cardholder as
SELECT 
card_holder.name, 
credit_card.card, 
transaction.date, 
transaction.amount, 
merchant.name AS merchant,
merchant_category.name AS category
FROM transaction
JOIN credit_card ON credit_card.card = transaction.card
JOIN card_holder ON card_holder.id = credit_card.cardholder_id
JOIN merchant ON merchant.id = transaction.id_merchant
JOIN merchant_category ON merchant_category.id = merchant.id_merchant_category
ORDER BY card_holder.name;

SELECT * FROM isolated_transactions_of_each_cardholder;

-- Count the transactions that are less than $2.00 per cardholder.
CREATE VIEW transactions_that_are_less_than_2 as
SELECT COUNT(transaction.amount) AS transaction_amount
FROM transaction
WHERE transaction.amount < 2

SELECT * FROM transactions_that_are_less_than_2;

-- Is there any evidence to suggest that a credit card has been hacked? Explain your rationale.
	-- I can say that evidence is covered in suspicious amount of transactions. 
	-- For example, amount of transactions greater than 10 may be count as fraudulent, therefore card has been hacked.

-- Take your investigation a step further by considering the time period in which potentially fraudulent transactions are made.
-- What are the top 100 highest transactions made between 7:00 am and 9:00 am?

CREATE VIEW top_100_highest_transactions AS
  SELECT * FROM transaction
  WHERE date_part('hour', transaction.date) >= 7 AND date_part('hour', transaction.date) <= 9
  ORDER BY amount DESC
  LIMIT 100;
  
SELECT * FROM top_100_highest_transactions;

-- Do you see any anomalous transactions that could be fraudulent?
	--Of course transactions with amount from 100.00 to 1894.00 may be considered as highly fraudulent
-- Is there a higher number of fraudulent transactions made during this time frame versus the rest of the day?
	--Yes
-- If you answered yes to the previous question, explain why you think there might be fraudulent transactions during this time frame.
	--There were 12 fraudulent transactions. The thing is that such transactions are unusual for ordinary card holder. 
	--For example, transaction made on "2018-12-07 07:22:03" had the amount of $1894.00, and the id_merchant was 9. 
	--9 is an ID of "Curry, Scott and Richardson"
	--and "Curry, Scott and Richardson" is the id_merchant_category = 3, which is bar. 
	--It's extremely suspicious for me, that someone could pay for a check of $1894.00 in a bar at 7AM.
	
-- What are the top 5 merchants prone to being hacked using small transactions?
CREATE VIEW top_5_merchants_prone AS
SELECT merchant.name, COUNT(*) AS transaction_count
FROM transaction
JOIN merchant ON transaction.id_merchant = merchant.id
WHERE transaction.amount <= 100
GROUP BY merchant.name
ORDER BY transaction_count ASC
LIMIT 5;

SELECT * FROM top_5_merchants_prone;  

-- Create a view for each of your queries. I've put all of them down below.
SELECT * FROM isolated_transactions_of_each_cardholder;
SELECT * FROM transactions_that_are_less_than_2;
SELECT * FROM top_100_highest_transactions;
SELECT * FROM top_5_merchants_prone;  