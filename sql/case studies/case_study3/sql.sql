Display the count of customers in each region who have done the transaction in the year 2020.
sql_more
Copy
SELECT c.region_id, COUNT(DISTINCT c.customer_id) AS count_customers
FROM Customers c
INNER JOIN Transaction t ON c.customer_id = t.customer_id
WHERE YEAR(t.txn_date) = 2020
GROUP BY c.region_id;
Display the maximum and minimum transaction amount of each transaction type.
Copy
SELECT txn_type, MAX(txn_amount) AS max_txn_amount, MIN(txn_amount) AS min_txn_amount
FROM Transaction
GROUP BY txn_type;
Display the customer id, region name and transaction amount where transaction type is deposit and transaction amount > 2000.
n1ql
Copy
SELECT c.customer_id, ct.region_name, t.txn_amount
FROM Customers c
INNER JOIN Continent ct ON c.region_id = ct.region_id
INNER JOIN Transaction t ON c.customer_id = t.customer_id
WHERE t.txn_type = 'deposit' AND t.txn_amount > 2000;
Find duplicate records in the Customer table.
oxygene
Copy
SELECT customer_id, region_id, start_date, end_date, COUNT(*) AS count_duplicates
FROM Customers
GROUP BY customer_id, region_id, start_date, end_date
HAVING COUNT(*) > 1;
Display the customer id, region name, transaction type and transaction amount for the minimum transaction amount in deposit.
n1ql
Copy
SELECT c.customer_id, ct.region_name, t.txn_type, t.txn_amount
FROM Customers c
INNER JOIN Continent ct ON c.region_id = ct.region_id
INNER JOIN Transaction t ON c.customer_id = t.customer_id
WHERE t.txn_type = 'deposit'
AND t.txn_amount = (SELECT MIN(txn_amount) FROM Transaction WHERE txn_type = 'deposit');
Create a stored procedure to display details of customers in the Transaction table where the transaction date is greater than Jun 2020.
pgsql
Copy
CREATE PROCEDURE GetCustomersByDate
    @date DATE
AS
BEGIN
    SELECT c.customer_id, ct.region_name, t.txn_date, t.txn_type, t.txn_amount
    FROM Customers c
    INNER JOIN Continent ct ON c.region_id = ct.region_id
    INNER JOIN Transaction t ON c.customer_id = t.customer_id
    WHERE t.txn_date > @date;
END;
Create a stored procedure to insert a record in the Continent table.
less
Copy
CREATE PROCEDURE InsertContinent
    @region_id INT,
    @region_name VARCHAR(50)
AS
BEGIN
    INSERT INTO Continent (region_id, region_name) VALUES (@region_id, @region_name);
END;
Create a stored procedure to display the details of transactions that happened on a specific day.
pgsql
Copy
CREATE PROCEDURE GetTransactionsByDate
    @date DATE
AS
BEGIN
    SELECT c.customer_id, ct.region_name, t.txn_type, t.txn_amount
    FROM Customers c
    INNER JOIN Continent ct ON c.region_id = ct.region_id
    INNER JOIN Transaction t ON c.customer_id = t.customer_id
    WHERE t.txn_date = @date;
END;
Create a user defined function to add 10% of the transaction amount in a table.
less
Copy
CREATE FUNCTION AddTenPercent (@amount FLOAT)
RETURNS FLOAT
AS
BEGIN
    RETURN (@amount * 1.1);
END;
Create a user defined function to find the total transaction amount for a given transaction type.
sql
Copy
CREATE FUNCTION GetTotalTxnAmount (@txn_type VARCHAR(20))
RETURNS FLOAT
AS
BEGIN
    DECLARE @total_amount FLOAT;
    SELECT @total_amount = SUM(txn_amount) FROM Transaction WHERE txn_type = @txn_type;
    RETURN @total_amount;
END;
Create a table value function which comprises the columns customer_id, region_id, txn_date, txn_type, txn_amount which will retrieve data from the above table.
pgsql
Copy
CREATE FUNCTION GetTransactionDetails ()
RETURNS TABLE
AS
RETURN
    SELECT c.customer_id, c.region_id, t.txn_date, t.txn_type, t.txn_amount
    FROM Customers c
    INNER JOIN Transaction t ON c.customer_id = t.customer_id;
Create a TRY...CATCH block to print a region id and region name in a single column.
oxygene
Copy
BEGIN TRY
    SELECT region_id + '-' + region_name AS region_id_name
    FROM Continent;
END TRY
BEGIN CATCH
    PRINT 'Error occurred: ' + ERROR_MESSAGE();
END CATCH;
Create a TRY...CATCH block to insert a value in the Continent table.
powershell
Copy
BEGIN TRY
    INSERT INTO Continent (region_id, region_name) VALUES (7, 'Antarctica');
END TRY
BEGIN CATCH
    PRINT 'Error occurred: ' + ERROR_MESSAGE();
END CATCH;
Create a trigger to prevent deleting a table in a database.
Copy
CREATE TRIGGER PreventTableDeletion
ON DATABASE
FOR DROP_TABLE
AS
BEGIN
    PRINT 'Table deletion is not allowed.';
    ROLLBACK;
END;
Create a trigger to audit the data in a table.
sql_more
Copy
CREATE TRIGGER AuditTransaction
ON Transaction
AFTER INSERT, UPDATE, DELETE
AS
BEGIN
    DECLARE @action VARCHAR(10);
    IF EXISTS(SELECT * FROM inserted)
        IF EXISTS(SELECT * FROM deleted)
            SET @action = 'UPDATE';
        ELSE
            SET @action = 'INSERT';
    ELSE
        SET @action = 'DELETE';
        
    INSERT INTO TransactionAudit (txn_id, txn_date, txn_type, txn_amount, action) 
    SELECT txn_id, txn_date, txn_type, txn_amount, @action FROM inserted;
END;
Create a trigger to prevent login of the same user id in multiple pages.
less
Copy
CREATE TRIGGER PreventMultipleLogins
ON Logins
AFTER INSERT
AS
BEGIN
    DECLARE @user_id INT = (SELECT user_id FROM inserted);
    IF EXISTS(SELECT * FROM Logins WHERE user_id = @user_id AND page_id <> (SELECT TOP 1 page_id FROM Logins WHERE user_id = @user_id ORDER BY login_time DESC))
    BEGIN
        PRINT 'User ' + CAST(@user_id AS VARCHAR(10)) + ' is already logged in from another page.';
        ROLLBACK;
    END;
END;
Display top n customers on the basis of transaction type.
pgsql
Copy
DECLARE @n INT = 5;
SELECT TOP (@n) c.customer_id, ct.region_name, COUNT(*) AS count_transactions
FROM Customers c
INNER JOIN Continent ct ON c.region_id = ct.region_id
INNER JOIN Transaction t ON c.customer_id = t.customer_id
GROUP BY c.customer_id, ct.region_name
ORDER BY count_transactions DESC;
Create a pivot table to display the total purchase, withdrawal and deposit for all the customers.
sql_more
Copy
SELECT customer_id,
    ISNULL([purchase], 0) AS purchase,
    ISNULL([withdrawal], 0) AS withdrawal,
    ISNULL([deposit], 0) AS deposit
FROM
(
    SELECT customer_id, txn_type, txn_amount
    FROM Transaction
) AS t
PIVOT
(
    SUM(txn_amount)
    FOR txn_type IN ([purchase], [withdrawal], [deposit])
) AS p;

