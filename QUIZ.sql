CREATE TABLE office_locations(
    office_code VARCHAR(3) NOT NULL,
    office_city varchar(30) NOT NULL,
    PRIMARY KEY(office_code)
);

CREATE TABLE atm_locations(
    atm_code VARCHAR(3) NOT NULL,
    atm_city VARCHAR(30) NOT NULL,
    PRIMARY KEY(atm_code)
);

CREATE TABLE account_transactions(
    transaction_sequence DECIMAL(10,0) NOT NULL,
    transaction_type VARCHAR(10) NOT NULL,
    account_name VARCHAR(10) NOT NULL,
    transaction_date DATETIME NOT NULL,
    account_balance DECIMAL(10,4) NOT NULL,
    transaction_amount DECIMAL(10,4) NOT NULL,
    office_code VARCHAR(20) NULL,
    FOREIGN KEY(office_code) REFERENCES office_locations(office_code)
);

SELECT * from office_locations;
SELECT * from account_transactions;


INSERT INTO office_locations VALUES ('001','Boston, MA');
INSERT INTO office_locations VALUES ('002','Chelsea, MA');
INSERT INTO office_locations VALUES ('003','Lynn, MA');
INSERT INTO office_locations VALUES ('004','Wakefield, MA');

INSERT INTO atm_locations VALUES ('00A','Boston, MA');
INSERT INTO atm_locations VALUES ('00B','Reading, MA');

INSERT INTO account_transactions VALUES (1,'create','james_f','2003-08-01 10:00:00',0,0,'001');
INSERT INTO account_transactions VALUES (2,'create','john_q','2003-08-05 11:45:00',100,100,'002');
INSERT INTO account_transactions VALUES (3,'create','tim_c','2003-08-05 09:30:00',250,250,'001');
INSERT INTO account_transactions VALUES (4,'deposit','james_f','2003-08-07 15:30:00',200,200,NULL);
INSERT INTO account_transactions VALUES (5,'deposit','john_q','2003-08-10 12:15:00',250,150,'001');
INSERT INTO account_transactions VALUES (6,'withdrawal','tim_c','2003-08-25 09:13:00',200,50,'002');
INSERT INTO account_transactions VALUES (7,'withdrawal','john_q','2003-09-01 10:22:00',200,50,'003');
INSERT INTO account_transactions VALUES (8,'close','james_f','2003-09-10 10:18:00',0,200,'002');
INSERT INTO account_transactions VALUES (9,'create','henry_j','2003-09-20 15:30:00',77,77,'002');
INSERT INTO account_transactions VALUES(10,'deposit','tim_c','2003-09-22 13:45:00',550,350,'003');
INSERT INTO account_transactions VALUES(11,'withdrawal','john_q','2003-10-01 11:11:00',150,50,'003');

-- Notes: using basic SQL syntax so DECIMAL instead of NUMBER, VARCHAR instead of VARCHAR2, DATETIME instead of DATE --

-- Question 1 --
-- Write a query to display a listing of all transactions sorted by date (without time) and account name. --
-- The listing should include the office city if available, if not display 'N/A' --
SELECT account_transactions.account_name AS ACCOUNT_NAME, 
CONVERT(account_transactions.transaction_date,date) AS TRANSACTION_DATE, 
IFNULL(office_locations.office_city, 'N/A') AS OFFICE_CITY
FROM account_transactions
LEFT JOIN office_locations
ON account_transactions.office_code = office_locations.office_code
ORDER BY transaction_date, account_name ASC;

-- Question 2 --
-- Write a query to display a list of accounts with activity (defined by having a deposit or withdrawal --
-- between Sept 1st 2003 and Sept 30th 2003 (inclusive) and whether or not the account has a deposit. --
SELECT account_transactions.account_name as ACCOUNT_NAME,
CASE WHEN account_transactions.transaction_type = 'deposit' THEN 'Yes' ELSE 'No'
END AS DEPOSITED
FROM account_transactions
WHERE account_transactions.transaction_date >= '2003-09-01 00:00:00' AND account_transactions.transaction_date <= '2003-09-30 23:59:59'
AND account_transactions.transaction_type IN ('deposit', 'withdrawal');

-- Question 3 --
-- Write a query to display a list of all accounts and the number of deposits and withdrawals. --
-- Accounts created or closed (but without deposit/withdrawal activity) should be included. --
SELECT sub1.account_name AS ACCOUNT_NAME, IFNULL(sub2.DEPOSIT,0) AS DEPOSITS, IFNULL(sub3.WITHDRAWAL,0) AS WITHDRAWALS
FROM account_transactions sub1
LEFT JOIN (
    SELECT account_name AS NAME, COUNT(transaction_type) AS DEPOSIT
    FROM account_transactions
    WHERE transaction_type = 'deposit'
    GROUP BY account_name
) sub2 ON sub1.account_name = sub2.NAME
LEFT JOIN (
    SELECT account_name AS name2, COUNT(transaction_type) AS WITHDRAWAL
    from account_transactions
    WHERE transaction_type = 'withdrawal'
    GROUP BY account_name
) AS sub3 ON sub2.NAME = sub3.name2
GROUP BY sub1.account_name;

-- Question 4 --
-- Write a query to display a list of accounts that had one or more withdrawals and --
-- no deposits between Sept 1st 2003 and Sept 30th 2003 (inclusive). --
SELECT sub.ACCOUNT_NAME
FROM (
    SELECT account_name AS ACCOUNT_NAME, transaction_type, transaction_date
    FROM account_transactions
    WHERE transaction_date BETWEEN '2003-09-01 00:00:00' AND '2003-09-30 23:59:59'
) sub
WHERE transaction_type <> 'deposit' AND transaction_type = 'withdrawal'
GROUP BY sub.ACCOUNT_NAME;

-- Question 5 --
-- Write a query to display a list of accounts that have at least two withdrawals. --
SELECT sub.account_name
FROM (
    SELECT account_name, COUNT(transaction_type) AS count
    FROM account_transactions
    WHERE transaction_type = 'withdrawal'
    GROUP BY account_name
) sub
WHERE count > 1;

-- Question 6 --
-- Write a query to display all the account balances as of close of business Sept 15th 2003. --
SELECT main.account_name, sub.account_balance
FROM account_transactions main
JOIN (
    SELECT account_name, account_balance, transaction_date
    FROM account_transactions
    WHERE transaction_date <'2003-09-16 00:00:00'
    ORDER BY transaction_date DESC
) AS sub ON main.account_name = sub.account_name
GROUP BY main.account_name;

-- Question 7 --
-- Write a query to display the current time, in 24 hour format, from the database/server. --
-- Note: this answer is context-sensitive depending on SQL type. GETDATE(), CURRENT_TIMESTAMP, etc. are also commonly used. --
SELECT CONVERT(NOW(),time);

-- Question 8 --
-- Write a query to display a unique list of all cities that have an office or an ATM, sorted by city name in descending order. --
SELECT office_city AS CITY
FROM office_locations
UNION
SELECT atm_city
FROM atm_locations
ORDER BY CITY DESC;

-- Question 9 --
-- Write a query to display a unique list of all office cities where accounts have been created. --
SELECT DISTINCT main.office_city
FROM office_locations main
JOIN (
    SELECT office_code
    FROM account_transactions
    WHERE transaction_type = 'create'
) AS sub ON main.office_code = sub.office_code;

-- Question 10 --
-- Write a query to display a unique list of all accounts that had a deposit or withdrawal in September 2003. --
SELECT DISTINCT account_name
FROM account_transactions
WHERE transaction_date BETWEEN '2003-09-01 00:00:00' AND '2003-09-30 23:23:59'
AND (transaction_type = 'deposit' OR transaction_type = 'withdrawal');

-- Question 11 --
-- Write a statement to change the account name of 'tim_c' to 'timothy_c'
UPDATE account_transactions
SET account_name = 'timothy_c'
WHERE account_name = 'tim_c';

-- Question 12 --
-- Write a statement to change the office_code of 'Lynn, MA' from '003' to '993'. --
-- Note that there are FK constraints from account_transactions to office_locations. --
-- Can drop constraints in a few ways. This method is very 'bruteforce'. --
SET FOREIGN_KEY_CHECKS = 0;
UPDATE office_locations
SET office_code = '993'
WHERE office_city = 'Lynn, MA';
SET FOREIGN_KEY_CHECKS = 1;

-- Question 13 --
-- Write a query to list the account names of all open accounts as of Sept 15th 2003 --
SELECT DISTINCT account_name
FROM account_transactions
WHERE transaction_date < '2003-09-16 00:00:00' AND account_name NOT IN(
    SELECT account_name
    FROM account_transactions
    WHERE transaction_date < '2003-09-16 00:00:00' AND transaction_type = 'close'
);

-- Question 14 --
-- Write a query to list the account names of all open accounts as of Sept 15th 2003. --
-- Sort the resulting list by the total number of withdrawals. --
SELECT DISTINCT sub1.account_name AS ACCOUNT_NAME, sub2.AMOUNT_OF_WITHDRAWALS, IFNULL(sub3.NUMBER_OF_WITHDRAWALS,0) AS NUMBER_OF_WITHDRAWALS
FROM account_transactions sub1
LEFT JOIN (
    SELECT account_name, SUM(CASE WHEN transaction_type = 'withdrawal' THEN transaction_amount ELSE 0 END) AS AMOUNT_OF_WITHDRAWALS
    FROM account_transactions
    GROUP BY account_name
) AS sub2 ON sub1.account_name = sub2.account_name
LEFT JOIN(
    SELECT account_name, COUNT(transaction_type) AS NUMBER_OF_WITHDRAWALS
    FROM account_transactions
    WHERE transaction_type = 'withdrawal'
    GROUP BY account_name
) AS sub3 ON sub1.account_name = sub3.account_name
WHERE transaction_date < '2003-09-16 00:00:00' AND sub1.account_name NOT IN(
    SELECT account_name
    FROM account_transactions
    WHERE transaction_date < '2003-09-16 00:00:00' AND transaction_type = 'close'
)
ORDER BY NUMBER_OF_WITHDRAWALS;

