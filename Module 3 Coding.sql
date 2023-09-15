-- Ben Nguyen

--Part 1: 
--Q1) Using a subquery, find the names of all the tracks for the album "Californication".

SELECT Name,
       AlbumID
FROM   Tracks
WHERE  AlbumId IN (SELECT AlbumId
                   FROM   Albums
                   WHERE  Title = "Californication");
    
------------------------------------------------------------------------------------
-- Q2) Find the total number of invoices for each customer along 
-- with the customer's full name, city and email.

SELECT   FirstName,
         LastName,
         City,
         Email,
         COUNT(Invoices.CustomerId) AS Invoices
FROM     Customers INNER JOIN Invoices
ON       Customers.CustomerId = Invoices.CustomerId
GROUP BY Customers.CustomerId

------------------------------------------------------------------------------------
-- Q3) Retrieve the track name, album, artist, and trackID for all the albums.

SELECT          Tracks.Name,
                Albums.ArtistId As ID,
                Albums.Title As Album,
                Tracks.TrackId
From            Tracks
Inner Join      Albums
On              Albums.AlbumId-Tracks.AlbumId

------------------------------------------------------------------------------------
-- Q4) Retrieve a list with the managers last name, and the last 
-- name of the employees who report to him or her.

SELECT     M.LastName AS Manager, 
           E.LastName AS Employee
FROM       Employees E 
INNER JOIN Employees M 
ON         E.ReportsTo = M.EmployeeID

------------------------------------------------------------------------------------
-- Q5) Find the name and ID of the artists who do not have albums.

SELECT    Name AS Artist,
          Artists.ArtistId,
          Albums.Title AS Album
FROM      Artists
LEFT JOIN Albums
ON        Artists.ArtistId = Albums.ArtistId
WHERE     Albums IS NULL

------------------------------------------------------------------------------------
-- Q6) Use a UNION to create a list of all the employee's & customer's first names\
-- and last names ordered by the last name in descending order.

SELECT   FirstName,
         LastName
FROM     Employees
UNION
SELECT   FirstName,
         LastName
FROM     Customers
ORDER BY LastName DESC

------------------------------------------------------------------------------------
-- Q7) See if there are any customers who have a different city
-- listed in their billing city versus their customer city.

SELECT     C.FirstName,
           C.LastName,
           C.City AS CustomerCity,
           I.BillingCity
FROM       Customers C
INNER JOIN Invoices I
ON         C.CustomerId = I.CustomerId
WHERE      CustomerCity != BillingCity


-- Part 2: Praticing Coding

-- Combined for a Subquery: Need to know the region each customer is from who has had an order
-- with freight over 100

Select    CustomerID,
          CompanyName,
          Region
From      Customers
Where     customerID In ( Select customerID
                          From   Orders
                          Where  Freight>100);
--------------------------------------------------------------------------------------------
-- Example of Triple Queries

Select    Customer_name
          Customer_contact
From      Customers
Where     cust_in In  Select  customer_id
                      From    Orders
                      Where   order_number In (Select  order_number
                                               From    OrderItems
                                               Where   prod_name = 'Toothbrush');
---------------------------------------------------------------------------------------------
-- Inner Join Example

Select    suppliers.CompanyName,
          ProductName,
          UnitPrice
From      Suppliers Inner Join Products On Suppliers.supplierid = Products.supplierid
----------------------------------------------------------------------------------------------
-- Query Example Using Alias

Select    vendor_name,
          product_name,
          product_price
From Vendors As v, Products As p
Where v.vendor_id = p.vendor_id;
----------------------------------------------------------------------------------------------
-- Example of Right Join

Select     Orders.OrderID,
           Employees.LastName,
           Employees.FirstName
From       Orders
Right Join EMployees On Orders.EmployeeID = Employees.EmployeeID
Order By   Orders.OrderID;
----------------------------------------------------------------------------------------------
--Example of Union
--Which German cities have suppliers?

Select     City,
           Country
From       Customers
Where      Country = 'Germany'
Union
Select     City,
           Country
From       Suppliers
Where      Country = 'Germany'
Order By   City;

