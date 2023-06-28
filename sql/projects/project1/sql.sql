To get all the details from the Person table including email ID, phone number, and phone number type, you can use the following query:
stylus
Copy
SELECT p.BusinessEntityID, p.FirstName, p.LastName, e.EmailAddress,
       pn.PhoneNumber, pt.Name AS PhoneNumberType
FROM Person.Person p
LEFT JOIN Person.EmailAddress e ON p.BusinessEntityID = e.BusinessEntityID
LEFT JOIN Person.PersonPhone pp ON p.BusinessEntityID = pp.BusinessEntityID
LEFT JOIN Person.PhoneNumberType pt ON pp.PhoneNumberTypeID = pt.PhoneNumberTypeID
LEFT JOIN Person.PhoneNumber pn ON pp.PhoneNumber = pn.PhoneNumber;
To get the details of the sales header order made in May 2011, you can use the following query:
Copy
SELECT *
FROM Sales.SalesOrderHeader
WHERE YEAR(OrderDate) = 2011 AND MONTH(OrderDate) = 5;
To get the details of the sales details order made in the month of May 2011, you can use the following query:
Copy
SELECT *
FROM Sales.SalesOrderDetail
WHERE SalesOrderID IN (
    SELECT SalesOrderID
    FROM Sales.SalesOrderHeader
    WHERE YEAR(OrderDate) = 2011 AND MONTH(OrderDate) = 5
);
To get the total sales made in May 2011, you can use the following query:
Copy
SELECT SUM(TotalDue) AS TotalSales
FROM Sales.SalesOrderHeader
WHERE YEAR(OrderDate) = 2011 AND MONTH(OrderDate) = 5;
To get the total sales made in the year 2011 by month in increasing order of sales, you can use the following query:
sql_more
Copy
SELECT YEAR(OrderDate) AS Year, MONTH(OrderDate) AS Month, SUM(TotalDue) AS TotalSales
FROM Sales.SalesOrderHeader
WHERE YEAR(OrderDate) = 2011
GROUP BY YEAR(OrderDate), MONTH(OrderDate)
ORDER BY TotalSales ASC;
To get the total sales made to the customer with FirstName='Gustavo', you can use the following query:
Copy
SELECT SUM(TotalDue) AS TotalSales
FROM Sales.SalesOrderHeader h
INNER JOIN Person.Person p ON h.CustomerID = p.BusinessEntityID
WHERE p.FirstName = 'Gustavo';
