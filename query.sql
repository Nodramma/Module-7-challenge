-- 1. Isolate transaction less that 2 $ and group by credit card 
CREATE VIEW small_transactions_cardholders AS
SELECT card_holder_id, t.card_number, t.small_transaction FROM credit_card 
INNER JOIN (SELECT transaction.card_number, COUNT (transaction.trnsaction_amount) AS small_transaction 
FROM transaction WHERE trnsaction_amount <= 2 
GROUP BY transaction.card_number) t  ON credit_card.card_number = t.card_number

-- 2. Isolate transaction less that 2 $ and group by mercahts   
CREATE VIEW small_transactions_merchants AS
SELECT merchant_id, COUNT (trnsaction_amount) AS small_transaction
FROM transaction 
WHERE trnsaction_amount <= 2
GROUP BY merchant_id
ORDER BY COUNT(*) DESC
LIMIT (5)

-- 3. Top 100 highest transactions made between 7:00 am and 9:00 am
SELECT *
FROM transaction
WHERE CAST(transaction_date AS TIME) >= '07:00:00' AND CAST(transaction_date AS TIME) <= '09:00:00'
ORDER BY trnsaction_amount DESC
LIMIT (100)

-- 4.Transactions for cardholder IDs are 2 and 18

SELECT transaction_date, trnsaction_amount, transaction.card_number, card_holder_id 
FROM transaction
INNER JOIN credit_card ON credit_card.card_number = transaction.card_number
WHERE credit_card.card_holder_id IN (2, 18)


-- 5. Transactions for cardholder IDs 25 Jan to June 2018
SELECT transaction_date, trnsaction_amount, transaction.card_number, card_holder_id 
FROM transaction
INNER JOIN credit_card ON credit_card.card_number = transaction.card_number
WHERE credit_card.card_holder_id = 25
AND DATE (transaction_date) >= '2018-01-01' and DATE (transaction_date) < '2018-07-01'

-- 6 SD and IQR
SELECT transaction_date, trnsaction_amount, transaction.card_number, card_holder_id 
FROM transaction
INNER JOIN credit_card ON credit_card.card_number = transaction.card_number
