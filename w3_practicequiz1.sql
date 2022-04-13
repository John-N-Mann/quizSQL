CREATE TABLE testdb.salesman(
	salesman_id INT NOT NULL,
    name VARCHAR(20) NOT NULL,
    city VARCHAR(20) NOT NULL,
    commission DECIMAL(3,2) NOT NULL
);

INSERT INTO testdb.salesman VALUES (5001, "James Hoog", "New York", 0.15);
INSERT INTO testdb.salesman VALUES (5002, "Nail Knite", "Paris", 0.13);
INSERT INTO testdb.salesman VALUES (5005, "Pit Alex", "London", 0.11);
INSERT INTO testdb.salesman VALUES (5006, "Mc Lyon", "Paris", 0.14);
INSERT INTO testdb.salesman VALUES (5007, "Paul Adam", "Rome", 0.13);
INSERT INTO testdb.salesman VALUES (5003, "Lauson Hen", "San Jose", 0.12);

CREATE TABLE testdb.customer(
	customer_id INT NOT NULL,
    cust_name VARCHAR(20) NOT NULL,
    city VARCHAR(20) NOT NULL,
    grade INT NULL,
    salesman_id INT NOT NULL
);

INSERT INTO testdb.customer VALUES (3002, "Nick Rimando", "New York", 100, 5001);
INSERT INTO testdb.customer VALUES (3007, "Brad Davis", "New York", 200, 5001);
INSERT INTO testdb.customer VALUES (3005, "Graham Zusi", "California", 200, 5002);
INSERT INTO testdb.customer VALUES (3008, "Julian Green", "London", 300, 5002);
INSERT INTO testdb.customer VALUES (3004, "Fabian Johnson", "Paris", 300, 5006);
INSERT INTO testdb.customer VALUES (3009, "Geoff Cameron", "Berlin", 100, 5003);
INSERT INTO testdb.customer VALUES (3003, "Jozy Altidor", "Moscow", 200, 5007);
INSERT INTO testdb.customer VALUES (3001, "Brad Guzan", "London", NULL, 5005);

CREATE TABLE testdb.nobel_win(
	year INT NOT NULL,
    subject VARCHAR(255) NOT NULL,
    winner VARCHAR(255) NOT NULL,
    country VARCHAR(255) NOT NULL,
	category VARCHAR(255) NOT NULL
);

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/prac_table.csv'
INTO TABLE testdb.nobel_win
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n';

CREATE TABLE testdb.orders(
	ord_no INT NOT NULL,
    purch_amt DECIMAL(6,2) NOT NULL,
    ord_date DATE NOT NULL,
    customer_id INT NOT NULL,
    salesman_id INT NOT NULL
);

INSERT INTO testdb.orders VALUES (70001, 150.5, "2012-10-05", 3005, 5002);
INSERT INTO testdb.orders VALUES (70009, 270.65, "2012-09-10", 3001, 5005);
INSERT INTO testdb.orders VALUES (70002, 65.26, "2012-10-05", 3002, 5001);
INSERT INTO testdb.orders VALUES (70004, 110.5, "2012-08-17", 3009, 5003);
INSERT INTO testdb.orders VALUES (70007, 948.5, "2012-09-10", 3005, 5002);
INSERT INTO testdb.orders VALUES (70005, 2400.6, "2012-07-27", 3007, 5001);
INSERT INTO testdb.orders VALUES (70008, 5760, "2012-09-10", 3002, 5001);
INSERT INTO testdb.orders VALUES (70010, 1983.43, "2012-10-10", 3004, 5006);
INSERT INTO testdb.orders VALUES (70030, 2480.4, "2012-10-10", 3009, 5003);
INSERT INTO testdb.orders VALUES (70012, 250.45, "2012-06-27", 3008, 5002);
INSERT INTO testdb.orders VALUES (70011, 75.29, "2012-08-17", 3003, 5007);
INSERT INTO testdb.orders VALUES (70013, 3045.6, "2012-04-25", 3002, 5001);

CREATE TABLE testdb.item_mast(
	pro_id INT NOT NULL,
    pro_name VARCHAR(255) NOT NULL,
    pro_price DECIMAL(10,2) NOT NULL,
    pro_com INT NOT NULL
);

INSERT INTO testdb.item_mast VALUES(101, 'Mother Board', 3200.00, 15);
INSERT INTO testdb.item_mast VALUES(102, 'Key Board', 450.00, 16);
INSERT INTO testdb.item_mast VALUES(103, 'ZIP Drive', 250.00, 14);
INSERT INTO testdb.item_mast VALUES(104, 'Speaker', 550.00, 16);
INSERT INTO testdb.item_mast VALUES(105, 'Monitor', 5000.00, 11);
INSERT INTO testdb.item_mast VALUES(106, 'DVD Drive', 900.00, 12);
INSERT INTO testdb.item_mast VALUES(107, 'CD Drive', 800.00, 12);
INSERT INTO testdb.item_mast VALUES(108, 'Printer', 2600.00, 13);
INSERT INTO testdb.item_mast VALUES(109, 'Refill Cartridge', 350.00, 13);
INSERT INTO testdb.item_mast VALUES(110, 'Mouse', 250.00, 12);

CREATE TABLE testdb.emp_details(
	emp_idno INT NOT NULL,
    emp_fname VARCHAR(255) NOT NULL,
    emp_lname VARCHAR(255) NOT NULL,
    emp_dept INT NOT NULL
);

INSERT INTO testdb.emp_details VALUES(127323, 'Michale', 'Robbin', 57);
INSERT INTO testdb.emp_details VALUES(526689, 'Carlos', 'Snares', 63);
INSERT INTO testdb.emp_details VALUES(843795, 'Enric', 'Dosio', 57);
INSERT INTO testdb.emp_details VALUES(328717, 'Jhon', 'Snares', 63);
INSERT INTO testdb.emp_details VALUES(444527, 'Joseph', 'Dosni', 47);
INSERT INTO testdb.emp_details VALUES(659831, 'Zanifer', 'Emily', 47);
INSERT INTO testdb.emp_details VALUES(847674, 'Kuleswar', 'Sitaraman', 57);
INSERT INTO testdb.emp_details VALUES(748681, 'Henrey', 'Gabriel', 47);
INSERT INTO testdb.emp_details VALUES(555935, 'Alex', 'Manuel', 57);
INSERT INTO testdb.emp_details VALUES(539569, 'George', 'Mardy', 27);
INSERT INTO testdb.emp_details VALUES(733843, 'Mario', 'Saule', 63);
INSERT INTO testdb.emp_details VALUES(631548, 'Alan', 'Snappy', 27);
INSERT INTO testdb.emp_details VALUES(839139, 'Maria', 'Foster', 57);




-- Question 1: Write a SQL statement to display all the information of all salesmen. --
SELECT * FROM testdb.salesman;

-- Question 2: Write a SQL statement to display a string: "This is a SQL practice question." --
SELECT "This is a SQL practice question.";

-- Question 3: Write a query to display three numbers in three columns. --
SELECT 1 AS Column1, 2 AS Column2, 3 AS Column3;

-- Question 4: Write a query to display the sum of two numbers 10 and 15. --
SELECT 10 + 15 AS "Sum of 10 + 15 =";

-- Question 5: Write a query to display the result of a more complex arithmetic expression. --
SELECT (10 / 2) - (3 * 10) + 25;

-- Question 6: Write a SQL statement to display each column of data for all salesman. --
SELECT salesman_id AS "Salesman ID" FROM testdb.salesman;
SELECT name AS "Name" FROM testdb.salesman;
SELECT city AS "City" FROM testdb.salesman;
SELECT commission AS "Commission" FROM testdb.salesman;

-- Question 7: Write a query to display the columns in a specific order: order date, salesman ID, order number, purchase amount - for all editors. --
SELECT ord_date AS "Order Date", salesman_id as "Salesman ID", ord_no AS "Order Number", purch_amt AS "Purchase Amount" FROM testdb.orders;

-- Question 8: From the orders table - write a SQL query to find unique Salespeople ID. Return salesman_id. --
SELECT DISTINCT salesman_id FROM testdb.orders;

-- Question 9: From the salesman table - write a SQL query to find the salespeople who lives in the City of 'Paris'. Return name, city. --
SELECT name, city FROM testdb.salesman WHERE city='Paris';

-- Question 10: From the customer table - write a SQL query to find the customers whose grade is 200. Return customer_id, cust_name, city, grade, salesman_id. --
SELECT customer_id, cust_name, city, grade, salesman_id FROM testdb.customer WHERE grade=200;

-- Question 11: From tyhe orders table - write a SQL query to find the orders which are delivered by a salesperson of ID 5001. Return ord_no, ord_date, purch_amt. --
SELECT ord_no, ord_date, purch_amt FROM testdb.orders WHERE salesman_id=5001;

-- Question 12: From the nobel_win table - write a SQL query to find the Nobel Prize winner(s) in the year 1970. Return year, subject, winner. --
SELECT year, subject, winner FROM testdb.nobel_win WHERE year=1970;

-- Question 13: From the following table - write a SQL query to find the Nobel Prize winner in 'Literature' in the year 1971. Return winner. --
SELECT winner FROM testdb.nobel_win WHERE year=1971 AND subject='Literature';

-- Question 14: From the nobel_win table - write a SQL query to find the Nobel Prize winner 'Dennis Gabor.' Return year, subject. --
SELECT year, subject FROM testdb.nobel_win WHERE winner='Dennis Gabor';

-- Question 15: From the nobel_win table - write a SQL query to find the Nobel Prize winners in 'Physics' since the year 1950. Return winner. --
SELECT winner FROM testdb.nobel_win WHERE subject='Physics' AND year>=1950;

-- Question 16: From the nobel_win table - write a SQL query to find the Nobel Prize winners in 'Chemistry' between the years 1965 and 1975 (inclusive). Return year, subject, winner, country. --
SELECT year, subject, winner, country FROM testdb.nobel_win WHERE subject='Chemistry' AND year >= 1965 AND year <= 1975;

-- Question 17: Write a SQL query to show all details of the Prime Minister winners after 1972 of Menachem Begina nd Yitzhak Rabin. --
SELECT * FROM testdb.nobel_win WHERE year > 1972 AND winner IN ('Menachem Begin', 'Yitzhak Rabin');

-- Question 18: From the nobel_win table - write a SQL query to find the details of the winners whose first name matches with the string 'Louis'. Return year, subject, winner, country, category. --
SELECT year, subject, winner, country, category FROM testdb.nobel_win WHERE winner LIKE 'Louis %';

-- Question 19: From the nobel_win table - write a SQL query to combine the winners in Physics, 1970, and in Economincs, 1971. Return year, subject, winner, country, category. --
SELECT year, subject, winner, country, category FROM testdb.nobel_win WHERE year=1970 AND subject='Physics'
UNION
SELECT year, subject, winner, country, category FROM testdb.nobel_win WHERE year=1971 AND subject='Economics';

-- Question 20: From the nobel_win table - write a SQL query to find the Nobel Prize winners in 1970 excluding the subjects in Physiology and Economics. Return year, subject, winner, country, and category. --
SELECT year, subject, winner, country, category FROM testdb.nobel_win WHERE year=1970 AND subject NOT IN ('Physiology', 'Economics');

-- Question 21: From the nobel_win table -- write a SQL query to combine the winners in 'Physiology' before 1971 and the winners in 'Peace' on or after 1974. Return year, subject, winner, country, category. --
SELECT year, subject, winner, country, category FROM testdb.nobel_win WHERE year < 1971 AND subject='Physiology'
UNION
SELECT year, subject, winner, country, category FROM testdb.nobel_win WHERE year >= 1974 AND subject='Peace';

-- Question 22: From the nobel_win table write a SQL query to find the details of the Nobel Prize winner 'Johannes Georg Bednorz'. Return year, subject, winner, country, and category. --
SELECT year, subject, winner, country, category FROM testdb.nobel_win WHERE winner = 'Johannes Georg Bednorz';

-- Question 23: From the following table write a SQL query to find the Nobel Prize winners for the subject not starting with the letter 'P'. Return year, subject, winner, country, category. Order by year, descending. --
SELECT year, subject, winner, country, category FROM testdb.nobel_win WHERE subject NOT LIKE 'P%' ORDER BY year DESC, winner;

-- Question 24: From the nobel_win table write a SQL query to find the details of the 1970 winners. Order by subject, ascending except 'Chemistry' and 'Economics' -- which will come at the end of set. --
-- Return year, subject, winner, country, category. --
SELECT year, subject, winner, country category FROM testdb.nobel_win WHERE year=1970
ORDER BY
	CASE
		WHEN subject IN ('Economics', 'Chemistry') THEN 1
        ELSE 0
	END ASC,
    subject, winner;
    
-- Question 25: From the item_mast table write a SQL query to select a range of products whose price is in the range Rs.200 to Rs.600. Begin and end values included. --
-- Return pro_id, pro_name, pro_price, and pro_com. --
SELECT pro_id, pro_name, pro_price, pro_com FROM testdb.item_mast WHERE pro_price >= 200 AND pro_price <= 600;

-- Question 26: From the item_mast table write a SQL query to calculate the average price for manufacturer code equal to 16. Return avg value. -- 
SELECT AVG(pro_price) FROM testdb.item_mast WHERE pro_com=16;

-- Question 27: From the item_mast table write a SQL query to display the pro_name as 'Item Name' and pro_price as 'Price in Rs.' --
SELECT pro_name AS 'Item Name', pro_price AS 'Price in Rs' FROM testdb.item_mast;

-- Question 28: From the item_mast table write a SQL query to find the items whose prices are higher than or equal to $250. Order by product price desc, then prod name asc. --
-- Return pro_name and pro_price. --
SELECT pro_name, pro_price FROM testdb.item_mast WHERE pro_price >= 250 ORDER BY pro_price DESC, pro_name ASC;

-- Question 29: From the item_mast table write a SQL query to calculate the avg price of the items of each company. Return avg price and company code. --
SELECT AVG(pro_price), pro_com FROM testdb.item_mast GROUP BY pro_com;

-- Question 30: From the item_mast table write a SQL query to find the cheapest item(s). Return pro_name and pro_price. --
SELECT pro_name, pro_price FROM testdb.item_mast WHERE pro_price=(SELECT MIN(pro_price) FROM testdb.item_mast);

-- Question 31: From the emp_details table write a SQL query to find unique last names of all employees. Return emp_lname. --
SELECT DISTINCT emp_lname FROM testdb.emp_details;

-- Question 32: From the emp_details table write a SQL query to find the details of all employees whose last name is 'Snares'. Return emp_idno, emp_fname, emp_lname, emp_dept. --
SELECT emp_idno, emp_fname, emp_lname, emp_dept FROM testdb.emp_details WHERE emp_lname='Snares';

-- Question 33: From the emp_details table write a SQL query to find the details of all employees who work in Dept 57. Return emp_idno, emp_fname, emp_lname, and emp_dept. --
SELECT emp_idno, emp_fname, emp_lname, emp_dept FROM testdb.emp_details WHERE emp_dept=57;

-- https://www.w3resource.com/sql-exercises/sql-retrieve-from-table.php --