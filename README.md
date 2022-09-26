# Module-7-challenge
FinTech bootcamp assignment

This work reflects my skills in using of PostgreSQL for creating databases, performing queries and analyzing information.

In the first query I isolated and counted all the transaction less or equal to 2 dollars for each credit card. The result shows that every card had several small transactions, some cards more than other. I find the result of this query ambiguous. Further investigation should be done.
In the next step I isolated transactions below 2 dollars and sort them by the merchant to find the merchants with the most amount of such transactions. No more than 7 of such transactions were perform by each merchant. It is not an extremely suspicious amount considering the time period. But close attention should be paid to the mentioned merchants.
In the third step I made a query to select 100 transactions, performed in the early morning hours. Transaction performed that early could be considered suspicious, especially if the amount exceeds certain threshold. I would further investigate first 9 transactions to verify their legitimacy.
When comparing transactions of two cards I observed quite steady transactions in amount and frequency for the card of the cardholder with ID 2, while in the case of the other card with cardholder ID 18 the pattern looks more suspicious with much higher transactions quite dispersed over the time. I would consult the holder of the card about that.
The boxplot created for the card of client with ID 25 shows up to three outlying transactions in period between January and June. In the first quarter of the year there were only two such transactions.
I also created functions that would help to determine outlying transactions using standard deviation and interquartile range.
