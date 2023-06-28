-- Create tables
CREATE TABLE LOCATION (
    Location_ID INT PRIMARY KEY,
    City VARCHAR(50)
);

CREATE TABLE DEPARTMENT (
    Department_Id INT PRIMARY KEY,
    Name VARCHAR(50),
    Location_Id INT,
    FOREIGN KEY (Location_Id) REFERENCES LOCATION(Location_ID)
);

CREATE TABLE JOB (
    Job_ID INT PRIMARY KEY,
    Designation VARCHAR(50)
);

CREATE TABLE EMPLOYEE (
    Employee_Id INT PRIMARY KEY,
    Last_Name VARCHAR(50),
    First_Name VARCHAR(50),
    Middle_Name VARCHAR(50),
    Job_Id INT,
    Hire_Date DATE,
    Salary DECIMAL(10,2),
    Commission DECIMAL(10,2),
    Department_Id INT,
    FOREIGN KEY (Job_Id) REFERENCES JOB(Job_ID),
    FOREIGN KEY (Department_Id) REFERENCES DEPARTMENT(Department_Id)
);

-- Insert data into tables
INSERT INTO LOCATION (Location_ID, City)
VALUES (122, 'New York'), (123, 'Dallas'), (124, 'Chicago'), (167, 'Boston');

INSERT INTO DEPARTMENT (Department_Id, Name, Location_Id)
VALUES (10, 'Accounting', 122), (20, 'Sales', 124), (30, 'Research', 123), (40, 'Operations', 167);

INSERT INTO JOB (Job_ID, Designation)
VALUES (667, 'Clerk'), (668, 'Staff'), (669, 'Analyst'), (670, 'Sales Person'), (671, 'Manager'), (672, 'President');

INSERT INTO EMPLOYEE (Employee_Id, Last_Name, First_Name, Middle_Name, Job_Id, Hire_Date, Salary, Commission, Department_Id)
VALUES (7369, 'Smith', 'John', 'Q', 667, '1984-12-17', 800, NULL, 20),
       (7499, 'Allen', 'Kevin', 'J', 670, '1985-02-20', 1600, 300, 30),
       (7555, 'Doyle', 'Jean', 'K', 671, '1985-04-04', 2850, NULL, 30),
       (7556, 'Dennis', 'Lynn', 'S', 671, '1985-05-15', 2750, NULL, 30),
       (7557, 'Baker', 'Leslie', 'D', 671, '1985-06-10', 2200, NULL, 40),
       (7521, 'Wark', 'Cynthia', 'D', 670, '1985-02-22', 1250, 500, 30);

-- Simple Queries

-- 1. List all the employee details.
SELECT * FROM EMPLOYEE;

-- 2. List all the department details.
SELECT * FROM DEPARTMENT;

-- 3. List all job details.
SELECT * FROM JOB;

-- 4. List all the locations.
SELECT * FROM LOCATION;

-- 5. List out the First Name, Last Name, Salary, Commission for all Employees.
SELECT First_Name, Last_Name, Salary, Commission FROM EMPLOYEE;

-- 6. List out the Employee ID, Last Name, Department ID for all employees and alias Employee ID as "ID of the Employee", Last Name as "Name of the Employee", Department ID as "Dep_id".
SELECT Employee_Id AS "ID of the Employee", Last_Name AS "Name of the Employee", Department_Id AS "Dep_id" FROM EMPLOYEE;

-- 7. List out the annual salary of the employees with their names only.
SELECT CONCAT(First_Name, ' ', Last_Name) AS "Employee Name", Salary*12 AS "Annual Salary" FROM EMPLOYEE;

-- WHERE Condition

-- 1. List the details about "Smith".
SELECT * FROM EMPLOYEE WHERE Last_Name = 'Smith';

-- 2. List out the employees who are working in department 20.
SELECT * FROM EMPLOYEE WHERE Department_Id = 20;

-- 3. List out the employees who are earning salaries between 3000 and 4500.
SELECT * FROM EMPLOYEE WHERE Salary BETWEEN 3000 AND 4500;

-- 4. List out the employees who are working in department 10 or 20.
SELECT * FROM EMPLOYEE WHERE Department_Id IN (10, 20);

-- 5. Find out the employees who are not working in department 10 or 30.
SELECT * FROM EMPLOYEE WHERE Department_Id NOT IN (10, 30);

-- 6. List out the employees whose name starts with 'S'.
SELECT * FROM EMPLOYEE WHERE Last_Name LIKE 'S%';

-- 7. List out the employees whose name starts with 'S' and ends with 'H'.
SELECT * FROM EMPLOYEE WHERE Last_Name LIKE 'S%H';

-- 8. List outthe employees whose name length is 4 and start with 'S'.
SELECT * FROM EMPLOYEE WHERE Last_Name LIKE 'S___';

-- 9. List out employees who are working in department 10 and draw salaries more than 3500.
SELECT * FROM EMPLOYEE WHERE Department_Id = 10 AND Salary > 3500;

-- 10. List out the employees who are not receiving commission.
SELECT * FROM EMPLOYEE WHERE Commission IS NULL;

-- ORDER BY Clause

-- 1. List out the Employee ID and Last Name in ascending order based on the Employee ID.
SELECT Employee_Id, Last_Name FROM EMPLOYEE ORDER BY Employee_Id ASC;

-- 2. List out the Employee ID and Name in descending order based on salary.
SELECT Employee_Id, CONCAT(First_Name, ' ', Last_Name) AS "Employee Name" FROM EMPLOYEE ORDER BY Salary DESC;

-- 3. List out the employee details according to their Last Name in ascending order.
SELECT * FROM EMPLOYEE ORDER BY Last_Name ASC;

-- 4. List out the employee details according to their Last Name in ascending order and then Department ID in descending order.
SELECT * FROM EMPLOYEE ORDER BY Last_Name ASC, Department_Id DESC;

-- GROUP BY and HAVING Clause

-- 1. How many employees are in different departments in the organization?
SELECT Department_Id, COUNT(*) AS "Number of Employees" FROM EMPLOYEE GROUP BY Department_Id;

-- 2. List out the department wise maximum salary, minimum salary and average salary of the employees.
SELECT Department_Id, MAX(Salary) AS "Max Salary", MIN(Salary) AS "Min Salary", AVG(Salary) AS "Avg Salary" FROM EMPLOYEE GROUP BY Department_Id;

-- 3. List out the job wise maximum salary, minimum salary and average salary of the employees.
SELECT Job_Id, MAX(Salary) AS "Max Salary", MIN(Salary) AS "Min Salary", AVG(Salary) AS "Avg Salary" FROM EMPLOYEE GROUP BY Job_Id;

-- 4. List out the number of employees who joined each month in ascending order.
SELECT MONTH(Hire_Date) AS "Month", COUNT(*) AS "Number of Employees" FROM EMPLOYEE GROUP BY MONTH(Hire_Date) ORDER BY MONTH(Hire_Date) ASC;

-- 5. List out the number of employees for each month and year in ascending order based on the year and month.
SELECT YEAR(Hire_Date) AS "Year", MONTH(Hire_Date) AS "Month", COUNT(*) AS "Number of Employees" FROM EMPLOYEE GROUP BY YEAR(Hire_Date), MONTH(Hire_Date) ORDER BY YEAR(Hire_Date) ASC, MONTH(Hire_Date) ASC;

-- 6. List out the Department ID having at least four employees.
SELECT Department_Id FROM EMPLOYEE GROUP BY Department_Id HAVING COUNT(*) >= 4;

-- 7. How many employees joined in the month of January?
SELECT COUNT(*) AS "Number of Employees" FROM EMPLOYEE WHERE MONTH(Hire_Date) = 1;

-- 8. How many employees joined in the month of January or September?
SELECT COUNT(*) AS "Number of Employees" FROM EMPLOYEE WHERE MONTH(Hire_Date) IN (1, 9);

-- 9. How many employees joined in 1985?
SELECT COUNT(*) AS "Number of Employees" FROM EMPLOYEE WHERE YEAR(Hire_Date) = 1985;

-- 10. How many employees joined each month in 1985?
SELECT MONTH(Hire_Date) AS "Month", COUNT(*) AS "Number of Employees" FROM EMPLOYEE WHERE YEAR(Hire_Date) = 1985 GROUP BY MONTH(Hire_Date);

-- 11. How many employees joined in March 1985?
SELECT COUNT(*) AS "Number of Employees" FROM EMPLOYEE WHERE MONTH(Hire_Date) = 3 AND YEAR(Hire_Date) = 1985;

-- 12. Which is the Department ID having greater than or equal to 3 employees joining in April 1985?
SELECT Department_Id FROM EMPLOYEE WHERE MONTH(Hire_Date) = 4 AND YEAR(Hire_Date) = 1985 GROUP BY Department_Id HAVING COUNT(*) >= 3;

-- Joins

-- 4. How many employees are working in different departments? Display with department names.
SELECT d.Name AS "Department Name", COUNT(*) AS "Number of Employees" FROM EMPLOYEE e JOIN DEPARTMENT d ON e.Department_Id = d.Department_Id GROUP BY d.Name;

-- 5. List out the employees with their department names and locations.
SELECT e.Employee_Id, e.Last_Name, d.Name AS "Department Name", l.City AS "Location" FROM EMPLOYEE e JOIN DEPARTMENT d ON e.Department_Id = d.Department_Id JOIN LOCATION l ON d.Location_Id = l.Location_Id;

-- 6. List out the employees who are working in the "Sales" department and their commission.
SELECT e.Employee_Id, e.Last_Name, e.Commission FROM EMPLOYEE e JOIN DEPARTMENT d ON e.Department_Id = d.Department_Id WHERE d.Name = 'Sales';

-- 7. List out the employees who are working in the "Research" department and their job designations.
SELECT e.Employee_Id, e.Last_Name, j.Designation FROM EMPLOYEE e JOIN DEPARTMENT d ON e.Department_Id = d.Department_Id JOIN JOB j ON e.Job_Id = j.Job_Id WHERE d.Name = 'Research';

-- 8. List out the employees who are working in the "Operations" department and their job designations and salaries.
SELECT e.Employee_Id, e.Last_Name, j.Designation, e.Salary FROM EMPLOYEE e JOIN DEPARTMENT d ON e.Department_Id = d.Department_Id JOIN JOB j ON e.Job_Id = j.Job_Id WHERE d.Name = 'Operations';

-- 9. List out the employees who are working in the "Accounting" department and their hire date.
SELECT e.Employee_Id, e.Last_Name, e.Hire_Date FROM EMPLOYEE e JOIN DEPARTMENT d ON e.Department_Id = d.Department_Id WHERE d.Name = 'Accounting';

-- 10. List out the employees who are working in the "Sales" department and have a commission greater than 500.
SELECT e.Employee_Id, e.Last_Name, e.Commission FROM EMPLOYEE e JOIN DEPARTMENT d ON e.Department_Id = d.Department_Id WHERE d.Name = 'Sales' AND e.Commission > 500;

