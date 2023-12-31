﻿--  Ben Nguyen

-- Part 1: Problems

-- Q1) Pull a list of customer ids with the customer’s full name, 
-- and address, along with combining their city and country together.
-- Be sure to make a space in between these two and make it UPPER CASE.

SELECT CustomerId,
       FirstName || " " || LastName AS FullName,
       Address,
       UPPER(City || " " || Country) AS CityCountry
FROM Customers

------------------------------------------------------------------------------------
-- Q2) Create a new employee user id by combining the first 4 letter of the
-- employee’s first name with the first 2 letters of the employee’s last name. 
-- Make the new field lower case and pull each individual step to show your work.

SELECT FirstName,
       LastName,
       LOWER(SUBSTR(FirstName,1,4)) AS A,
       LOWER(SUBSTR(LastName,1,2)) AS B,
       LOWER(SUBSTR(FirstName,1,4)) || LOWER(SUBSTR(LastName,1,2)) AS userId
FROM Employees

------------------------------------------------------------------------------------
-- Q3) Show a list of employees who have worked for the company for 15 or more 
-- years using the current date function. Sort by lastname ascending.

SELECT FirstName,
       LastName,
       HireDate,
       (STRFTIME('%Y', 'now') - STRFTIME('%Y', HireDate)) 
          - (STRFTIME('%m-%d', 'now') < STRFTIME('%m-%d', HireDate)) 
          AS YearsWorked
FROM Employees
WHERE YearsWorked >= 15
ORDER BY LastName ASC

------------------------------------------------------------------------------------
-- Q4) Profiling the Customers table, answer the following question.

SELECT COUNT(*)
FROM Customers
WHERE [columnlist] IS NULL

-- some_column: FirstName, PostalCode, Company, Fax, Phone, Address
-- Answers: Postal Code, Company, Fax, Phone

------------------------------------------------------------------------------------
-- Q5) Find the cities with the most customers and rank in descending order.

SELECT City,
       COUNT(*)
FROM Customers
GROUP BY City
ORDER BY COUNT(*) DESC

------------------------------------------------------------------------------------
-- Q6) Create a new customer invoice id by combining a customer’s invoice id with
-- their first and last name while ordering your query in the following order:
-- firstname, lastname, and invoiceID.

SELECT C.FirstName,
       C.LastName,
       I.InvoiceId,
       C.FirstName || C.LastName || I.InvoiceID AS NewId
FROM Customers C INNER JOIN Invoices I
ON C.CustomerId = I.CustomerID
WHERE NewId LIKE 'AstridGruber%'

-- Part 2: Practice and Example Code

-- Substring
Select	first_name,
Substr	(first_name,1,3) 
From	Employees
Where	department_id=100;

-- Upper and Lower
Select upper(column_name) from table_name;
Select lower(column_name) from table_name;
Select ucase(column_name) from table_name;

-- Case Statement
Case 
When C1 Then E1
When C2 Then E2
...
Else [result sels]
End

Select		employeeid,
			firstname,
			lastname,
			city,
			case City when 'Calgary' then 'Calgary'
			Else 'Other' end calgary
From		Employees
Order By	LastName, FirstName;

Select		trackid,
			name,
			bytes,
			Case	When bytes < 300000	Then 'small'
					When bytes <= 300001 and byte <= 500000	Then 'medium'
					When bytes >= 500001 Then 'large'
					Else 'Other'
					End bytescategory
From tracks;