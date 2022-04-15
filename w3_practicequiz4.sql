CREATE TABLE testdb.emp_department(
	dpt_code INT NOT NULL,
    dpt_name VARCHAR(24) NOT NULL,
    dpt_allotment INT NOT NULL
);

INSERT INTO testdb.emp_department VALUES(57, 'IT', 65000);
INSERT INTO testdb.emp_department VALUES(63, 'Finance', 15000);
INSERT INTO testdb.emp_department VALUES(47, 'HR', 240000);
INSERT INTO testdb.emp_department VALUES(27, 'RD', 55000);
INSERT INTO testdb.emp_department VALUES(89, 'QC', 75000);




-- Question 1 --
-- From the testdb.orders table, write a SQL query to calculate total purchase amount of all orders. Return total purchase amount. --
SELECT SUM(purch_amt) AS 'Total Purchase Amount' FROM testdb.orders;

-- Question 2 --
-- From the testdb.orders table, write a SQL query to calculate average purchase amount of all orders. Return average purchase amount. --
SELECT AVG(purch_amt) AS 'Average Purchase Amount' FROM testdb.orders;

-- Question 3 --
-- From the testdb.orders table, write a SQL query to count the number of unique salespeople. Return number of salespeople. --
SELECT COUNT(DISTINCT salesman_id) AS 'Number of Salespeople' FROM testdb.orders;

-- Question 4 --
-- From the testdb.customer table, write a SQL query to count the number of customers. Return number of customers. --
SELECT COUNT(DISTINCT customer_id) AS 'Number of Customers' FROM testdb.customer;

-- Question 5 --
-- From the testdb.customer table, write a SQL query to find the number of customers who got at least a gradation for his/her activity. --
SELECT COUNT(grade) FROM testdb.customer WHERE grade IS NOT NULL;

-- Question 6 --
-- From the testdb.orders table, write a SQL query to find the maximum purchase amount. --
SELECT MAX(purch_amt) FROM testdb.orders;

-- Question 7 --
-- From the testdb.orders table, write a SQL query to find the minimum purchase amount. --
SELECT MIN(purch_amt) FROM testdb.orders;

-- Question 8 --
-- From the testdb.customer table, write a SQL query to find the highest grade of the customers for each of the city. Return city, maximum grade. --
SELECT city, MAX(grade) FROM testdb.customer GROUP BY city;

-- Question 9 --
-- From the testdb.orders table, write a SQL query to find the highest purchase amount ordered by each customer. Return customer ID, maximum purchase amount. --
SELECT customer_id, MAX(purch_amt) FROM testdb.orders GROUP BY customer_id;

-- Question 10 --
-- From the testdb.orders table, write a SQL query to find the highest purchase amount ordered by each customer on a particular date. Return customer_id, order date and highest purchase amount. --
SELECT customer_id, ord_date, purch_amt FROM testdb.orders GROUP BY ord_date;

-- Question 11 --
-- From the testdb.orders table, write a SQL query to find the highest purchase amount on '2012-08-17' by each salesperson. Return salesperson ID, purchase amount. --
SELECT salesman_id, MAX(purch_amt) FROM testdb.orders WHERE ord_date='2012-08-17' GROUP BY salesman_id;

-- Question 12 --
-- From the testdb.orders table, write a SQL query to find highest order (purchase) amount by each customer in a particular order date. --
-- Filter the result by highest order (purchase) amount above 2000.00. Return customer id, order date and maximum purchase amount. --
SELECT customer_id, ord_date, MAX(purch_amt) FROM testdb.orders WHERE purch_amt > 2000 GROUP BY ord_date, customer_id;

-- Question 13 --
-- From the testdb.orders table, write a SQL query to find the maximum order (purchase) amount in the range 2000, 6000 (Begin and end values are included.) --
-- by combination of each customer and order date. Return customer id, order date and maximum purchase amount. --
SELECT customer_id, ord_date, MAX(purch_amt) FROM testdb.orders WHERE purch_amt BETWEEN 2000 AND 6000 GROUP BY customer_id, ord_date;

-- Question 14 --
-- From the testdb.orders table, write a SQL query to find the maximum order (purchase) amount by the combination of each customer and order date. --
-- Filter the rows for maximum order (purchase) amount is either 2000, 3000, 5760, 6000. Return customer id, order date and maximum purchase amount. --
SELECT customer_id, ord_date, MAX(purch_amt) FROM testdb.orders GROUP BY customer_id, ord_date HAVING MAX(purch_amt) IN (2000, 3000, 5760, 6000);

-- Question 15 -- 
-- From the testdb.orders table, write a SQL query to find the maximum order (purchase) amount by each customer. --
-- The customer ID should be in the range 3002 and 3007(Begin and end values are included.). Return customer id and maximum purchase amount. --
SELECT customer_id, MAX(purch_amt) FROM testdb.orders GROUP BY customer_id HAVING customer_id BETWEEN 3002 AND 3007;

-- Question 16 -- 
-- From the testdb.orders table, write a SQL query to find the maximum order (purchase) amount for each customer. --
-- The customer ID should be in the range 3002 and 3007(Begin and end values are included.). --
-- Filter the rows for maximum order (purchase) amount is higher than 1000. Return customer id and maximum purchase amount. --
SELECT customer_id, MAX(purch_amt) FROM testdb.orders WHERE purch_amt>1000 GROUP BY customer_id HAVING customer_id BETWEEN 3002 and 3007;

-- Question 17 --
-- From the testdb.orders table, write a SQL query to find the maximum order (purchase) amount generated by each salesperson. --
-- Filter the rows for the salesperson ID is in the range 5003 and 5008 (Begin and end values are included.). Return salesperson id and maximum purchase amount. --
SELECT salesman_id, MAX(purch_amt) FROM testdb.orders GROUP BY salesman_id HAVING salesman_id BETWEEN 5003 AND 5008;

-- Question 18 --
-- From the testdb.orders table, write a SQL query to count all the orders generated on '2012-08-17'. Return number of orders. --
SELECT COUNT(DISTINCT ord_no) FROM testdb.orders WHERE ord_date='2012-08-17';

-- Question 19 --
-- From the testdb.salesman table, write a SQL query to count number of salespeople who belongs to a city. Return number of salespeople. --
SELECT city, COUNT(DISTINCT salesman_id) FROM testdb.salesman GROUP BY city;

-- Question 20 --
-- From the following table, write a SQL query to count number of orders by the combination of each order date and salesperson. Return order date, salesperson id. --
SELECT ord_date, salesman_id, COUNT(ord_no) FROM testdb.orders GROUP BY ord_date, salesman_id;

-- Question 21 --
-- From the following table, write a SQL query to calculate the average product price. Return average product price. --
SELECT AVG(pro_price) FROM testdb.item_mast;

-- Question 22 --
-- From the testdb.item_mast table, write a SQL query to count number of products where product price is higher than or equal to 350. Return number of products. --
SELECT COUNT(pro_id) AS "# of Products" FROM testdb.item_mast WHERE pro_price>=350;

-- Question 23 --
-- From the testdb.item_mast table, write a SQL query to compute the average price for unique companies. Return average price and company id. --
SELECT AVG(pro_price), pro_com FROM testdb.item_mast GROUP BY pro_com;

-- Question 24 --
-- From the following table, write a SQL query to compute the sum of the allotment amount of all departments. Return sum of the allotment amount. --
SELECT SUM(dpt_allotment) FROM testdb.emp_department;

-- Question 25 --
-- From the following table, write a SQL query to find the number of employees in each department. Return department code and number of employees. --
SELECT emp_dept, COUNT(DISTINCT emp_idno) FROM testdb.emp_details GROUP BY emp_dept;

-- https://www.w3resource.com/sql-exercises/sql-aggregate-functions.php --