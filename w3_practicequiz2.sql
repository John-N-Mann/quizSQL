-- Question 1 --
-- From the customer table, write a SQL query to find the details of the customers who have a gradevalue above 100. Return customer_id, cust_name, city, grade, and salesman_id. --
SELECT customer_id, cust_name, city, grade, salesman_id FROM testdb.customer WHERE grade>100;

-- Question 2 --
-- From the customer table, write a SQL query to find all the customers in ‘New York’ city who have a grade value above 100. Return customer_id, cust_name, city, grade, and salesman_id. --
SELECT customer_id, cust_name, city, grade, salesman_id FROM testdb.customer WHERE grade>100 AND city='New York';

-- Question 3 --
-- From the customer table, write a SQL query to find the customers who belong to either the city ‘New York’ or have a grade above 100. Return customer_id, cust_name, city, grade, and salesman_id. --
SELECT customer_id, cust_name, city, grade, salesman_id FROM testdb.customer WHERE grade>100 OR city='New York';

-- Question 4 --
-- From the customer table, write a SQL query to find the customers who belong to either the city ‘New York’ or not have a grade above 100. Return customer_id, cust_name, city, grade, and salesman_id. --
SELECT customer_id, cust_name, city, grade, salesman_id FROM testdb.customer WHERE NOT grade>100 AND city='New York';
-- Question 5 --
-- From the customer table, write a SQL query to find those customers who belong to neither the ‘New York’ city nor their grade value exceeds 100. Return customer_id, cust_name, city, grade, and salesman_id. --
SELECT customer_id, cust_name, city, grade, salesman_id FROM testdb.customer WHERE NOT city='New York' AND NOT grade>100;

-- Question 6 --
-- From the orders table, write a SQL query to find details of all order excluding combination of ord_date equal to '2012-09-10' and salesman_id higher than 5005 or purch_amt greater than 1000. --
-- Return ord_no, purch_amt, ord_date, customer_id and salesman_id. --
SELECT ord_no, purch_amt, ord_date, customer_id, salesman_id FROM testdb.orders WHERE NOT ord_date='2012-09-10' AND salesman_id <= 5005 AND purch_amt <= 1000;

-- Question 7 --
-- From the salesman table, write a SQL query to find the details of those salespeople whose commissions range from 0.10 to 0.12. Return salesman_id, name, city, and commission. --
SELECT salesman_id, name, city, commission FROM testdb.salesman WHERE commission >= 0.10 AND commission <= 0.12;

-- Question 8 --
-- From the orders table, write a SQL query to find details of all order where purchase amount less than 200 or --
-- excluding combination of order date greater than or equal to '2012-02-10' and customer ID less than 3009. --
-- Return ord_no, purch_amt, ord_date, customer_id and salesman_id. --
SELECT ord_no, purch_amt, ord_date, customer_id, salesman_id FROM testdb.orders WHERE (purch_amt<200 OR NOT (ord_date>='2012-02-10' AND customer_id<3009));

-- Question 9 --
-- From the orders table, write a SQL query to find all orders subject to following conditions. --
-- Exclude combination of order date equal to '2012-08-17' or customer ID higher than 3005 and purchase amount less than 1000. --
SELECT * FROM testdb.orders WHERE NOT ((ord_date='2012-08-17' OR customer_id>3005) AND purch_amt<1000);

-- Question 10 --
-- Write a SQL query to display order number, purchase amount, achieved, the unachieved percentage for those order which exceeds the 50% of the target value of 6000. --
SELECT ord_no, purch_amt, ((100*purch_amt)/6000) AS "Achieved %", (100*(6000-purch_amt)/6000) AS 'Unachieved %' FROM testdb.orders WHERE ((100*purch_amt)/6000)>50;

-- Question 11 --
-- From the emp_details table, write a SQL query to find the details of all employees whose last name is ‘Dosni’ or ‘Mardy’. Return emp_idno, emp_fname, emp_lname, and emp_dept. --
SELECT emp_idno, emp_fname, emp_lname, emp_dept FROM testdb.emp_details WHERE emp_lname IN ('Dosni', 'Mardy');

-- Question 12 --
-- From the emp_details table, write a SQL query to find the employees who works at depart 47 or 63. Return emp_idno, emp_fname, emp_lname, and emp_dept. --
SELECT emp_idno, emp_fname, emp_lname, emp_dept FROM testdb.emp_details WHERE emp_dept IN (47, 63);
