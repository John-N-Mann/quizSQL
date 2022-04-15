CREATE TABLE testdb.testtable(
	col1 VARCHAR(255) NOT NULL
);

INSERT INTO testdb.testtable VALUES('A001/DJ-402\44_/100/2015');
INSERT INTO testdb.testtable VALUES('A001_\DJ-402\44_/100/2015');
INSERT INTO testdb.testtable VALUES('A001_DJ-402-2014-2015');
INSERT INTO testdb.testtable VALUES('A002_DJ-401-2014-2015');
INSERT INTO testdb.testtable VALUES('A001/DJ_401');
INSERT INTO testdb.testtable VALUES('A001/DJ_402\44');
INSERT INTO testdb.testtable VALUES('A001/DJ_402\44\2015');
INSERT INTO testdb.testtable VALUES('A001/DJ-402%45\2015/200');
INSERT INTO testdb.testtable VALUES('A001/DJ_402\45\2015%100');
INSERT INTO testdb.testtable VALUES('A001/DJ_402%45\2015/300');
INSERT INTO testdb.testtable VALUES('A001/DJ-402\44');



-- Question 1 --
-- From the testdb.salesman table, write a SQL query to find the details of those salespeople who come from the 'Paris' City or 'Rome' City. Return salesman_id, name, city, commission. --
SELECT salesman_id, name, city, commission FROM testdb.salesman WHERE city IN ('Paris', 'Rome');

-- Question 2 --
-- SKIP QUESTION: REPEAT OF QUESTION 1 --

-- Question 3 --
-- From the testdb.salesman table, write a SQL query to find the details of those salespeople who live in cities apart from 'Paris' and 'Rome'. Return salesman_id, name, city, commission. --
SELECT salesman_id, name, city, commission FROM testdb.salesman WHERE city NOT IN ('Paris', 'Rome');

-- Question 4 --
-- From the testdb.customer table, write a SQL query to find the details of the customers whose ID belongs to any of the values 3007, 3008 and 3009. Return customer_id, cust_name, city, grade, and salesman_id. --
SELECT customer_id, cust_name, city, grade, salesman_id FROM testdb.customer WHERE customer_id IN (3007, 3008, 3009);

-- Question 5 -- 
-- From the testdb.salesman table, write a SQL query to find the details of salespeople who get the commission in the range from 0.12 to 0.14 (inclusive). Return salesman_id, name, city, commission. --
SELECT salesman_id, name, city, commission FROM testdb.salesman WHERE commission >= 0.12 AND commission <= 0.14;
-- Can use combined logic statements OR can use BETWEEN operator --
SELECT salesman_id, name, city, commission FROM testdb.salesman WHERE commission BETWEEN 0.12 AND 0.14;

-- Question 6 --
-- From the testdb.orders table, write a SQL query to select orders value within a range 500, 4000 (begin and end values are included). Exclude orders amount 948.50 and 1983.43. --
-- Return ord_no, purch_amt, ord_date, customer_id, and salesman_id. --
SELECT ord_no, purch_amt, ord_date, customer_id, salesman_id FROM testdb.orders WHERE (purch_amt BETWEEN 500 AND 4000) AND NOT purch_amt IN (948.50, 1983.43);

-- Question 7 --
-- From the testdb.salesman table, write a SQL query to find the details of those salespeople whose name starts with any letter within 'A' and 'L' (not inclusive). --
-- Return salesman_id, name, city, commission. --
SELECT salesman_id, name, city, commission FROM testdb.salesman WHERE name BETWEEN 'A' AND 'L';

-- Question 8 --
-- From the following table, write a SQL query to find the details of all salespeople except whose name starts with any letter within 'A' and 'L' (not inclusive). --
-- Return salesman_id, name, city, commission. --
SELECT salesman_id, name, city, commission FROM testdb.salesman WHERE name NOT BETWEEN 'A' AND 'L';

-- Question 9 --
-- From the testdb.customer table, write a SQL query to find the details of the customers whose name begins with the letter 'B'. --
-- Return customer_id, cust_name, city, grade, salesman_id. --
SELECT customer_id, cust_name, city, grade, salesman_id FROM testdb.customer WHERE cust_name LIKE 'B%';

-- Question 10 --
-- From the testdb.customer table, write a SQL query to find the details of the customers whose names end with the letter 'n'. Return customer_id, cust_name, city, grade, salesman_id. --
SELECT customer_id, cust_name, city, grade, salesman_id FROM testdb.customer WHERE cust_name LIKE '%n';

-- Question 11 --
-- From the testdb.salesman table, write a SQL query to find the details of those salespeople whose name starts with ‘N’ and the fourth character is 'l'. Rests may be any character. --
-- Return salesman_id, name, city, commission. --
SELECT salesman_id, name, city, commission FROM testdb.salesman WHERE (name LIKE 'N__l%');

-- Question 12 --
-- From the testdb.testtable table, write a SQL query to find those rows where col1 contains the escape character underscore ( _ ). Return col1.
SELECT col1 FROM testdb.testtable WHERE col1 LIKE '%/_%' ESCAPE '/';

-- Question 13 --
-- From the testdb.testtable table, write a SQL query to find those rows where col1 does not contain the escape character underscore ( _ ). Return col1. --
SELECT col1 FROM testdb.testtable WHERE col1 NOT LIKE '%/_%' ESCAPE '/';

-- Question 14 --
-- From the testdb.testtable table, write a SQL query to find those rows where col1 contains the forward slash character ( / ). Return col1. --
SELECT col1 FROM testdb.testtable WHERE col1 LIKE '%/%';

-- Question 15 --
-- From the testdb.testtable table, write a SQL query to find those rows where col1 does not contain the forward slash character ( / ). Return col1. --
SELECT col1 FROM testdb.testtable WHERE col1 NOT LIKE '%/%';

-- Question 16 --
-- From the testdb.testtable table, write a SQL query to find those rows where col1 contains the string ( _/ ). Return col1. --
SELECT col1 FROM testdb.testtable WHERE col1 LIKE '%|_/%' ESCAPE '|';

-- Question 17 --
-- From the testdb.testtable, write a SQL query to find those rows where col1 does not contain the string ( _/ ). Return col1. --
SELECT col1 FROM testdb.testtable WHERE col1 NOT LIKE '%|_/%' ESCAPE '|';

-- Question 18 --
--  From the testdb.testtable table, write a SQL query to find those rows where col1 contains the character percent ( % ). Return col1. --
SELECT col1 FROM testdb.testtable WHERE col1 LIKE '%|%%' ESCAPE '|';

-- Question 19 --
-- From the testdb.testtable table, write a SQL query to find those rows where col1 does not contain the character percent ( % ). Return col1. --
SELECT col1 FROM testdb.testtable WHERE col1 NOT LIKE '%|%%' ESCAPE '|';

-- Question 20 --
-- From the testdb.customer table, write a SQL query to find all those customers who does not have any grade. Return customer_id, cust_name, city, grade, salesman_id. --
SELECT customer_id, cust_name, city, grade, salesman_id FROM testdb.customer WHERE grade IS NULL;

-- Question 21 --
-- From the testdb.customer table, write a SQL query to find all those customers whose grade value exists. Return customer_id, cust_name, city, grade, salesman_id. --
SELECT customer_id, cust_name, city, grade, salesman_id FROM testdb.customer WHERE grade IS NOT NULL;

-- Question 22 --
-- From the testdb.emp_details table, write a SQL query to find the employees whose last name begins with the character 'D'. Return emp_idno, emp_fname, emp_lname and emp_dept. --
SELECT emp_idno, emp_fname, emp_lname, emp_dept FROM testdb.emp_details WHERE emp_lname LIKE 'D%';

-- https://www.w3resource.com/sql-exercises/sql-wildcard-special-operators.php --