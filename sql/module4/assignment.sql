SELECT MAX(DevelopmentCost) AS CostliestDevelopment 
SELECT MAX(DevelopmentCost) AS CostliestDevelopment 
FROM SOFTWARE 
WHERE Language = 'Basic';

SELECT * FROM SOFTWARE 
WHERE CopiesSold > 2000;

SELECT Name, DateOfBirth FROM PROGRAMMER 
WHERE MONTH(DateOfBirth) = MONTH(CURRENT_DATE()) 
      AND YEAR(DateOfBirth) = YEAR(CURRENT_DATE());

SELECT ProgrammerID, SUM(DevelopmentCost) AS TotalCost 
FROM SOFTWARE 
GROUP BY ProgrammerID;

SELECT ProgrammerID, SUM(SellingCost * CopiesSold) AS TotalSalesValue 
FROM SOFTWARE 
GROUP BY ProgrammerID;


SELECT ProgrammerID, SUM(CopiesSold) AS TotalCopiesSold 
FROM SOFTWARE 
GROUP BY ProgrammerID;

SELECT p.Name, MAX(s.SellingCost) AS CostliestPackage, MIN(s.SellingCost) AS CheapestPackage 
FROM PROGRAMMER p 
INNER JOIN SOFTWARE s ON p.ProgrammerID = s.ProgrammerID 
GROUP BY p.ProgrammerID;


SELECT Institute, COUNT(Course) AS NumCourses, AVG(Fee) AS AvgCostPerCourse 
FROM COURSE 
GROUP BY Institute;


SELECT Institute, COUNT(*) AS NumStudents 
FROM PROGRAMMER 
GROUP BY Institute;

SELECT s.ProgrammerID, p.Name, p.Institute 
FROM SOFTWARE s 
INNER JOIN PROGRAMMER p ON s.ProgrammerID = p.ProgrammerID;

SELECT COUNT(*) FROM SOFTWARE 
WHERE ProgrammerID IN (SELECT ProgrammerID FROM PROGRAMMER WHERE Institute IN 
                             (SELECT Institute FROM COURSE WHERE Fee = (SELECT MIN(Fee) FROM COURSE)));

SELECT AVG(Salary) AS AvgSalary FROM PROGRAMMER 
WHERE EXISTS (SELECT * FROM SOFTWARE WHERE ProgrammerID = PROGRAMMER.ProgrammerID AND SellingCost*CopiesSold > 50000);

SELECT DISTINCT l.Language 
FROM LANGUAGE l 
LEFT JOIN SOFTWARE s ON l.Language = s.Language 
WHERE s.SoftwareID IS NULL AND l.Language IN (SELECT PROF1 FROM PROGRAMMER UNION SELECT PROF2 FROM PROGRAMMER);


SELECT p.Institute, SUM(s.CopiesSold * s.SellingCost) AS TotalSalesValue 
FROM PROGRAMMER p 
INNER JOIN SOFTWARE s ON p.ProgrammerID = s.ProgrammerID 
GROUP BY p.Institute;

SELECT s.SoftwareID, s.SoftwareName, s.Language, s.DevelopmentCost, s.SellingCost, s.CopiesSold 
FROM SOFTWARE s 
INNER JOIN PROGRAMMER p ON s.ProgrammerID = p.ProgrammerID 
WHERE p.Institute = 'Pragathi' AND p.Gender = 'F' AND s.Language = 'C';


SELECT s.SoftwareID, s.SoftwareName, s.Language, s.DevelopmentCost, s.SellingCost, s.CopiesSold, p.Name, p.Gender 
FROM SOFTWARE s 
INNER JOIN PROGRAMMER p ON s.ProgrammerID = p.ProgrammerID 
WHERE p.Gender = 'F' AND s.Language = 'Pascal';

SELECT Language 
FROM LANGUAGE 
GROUP BY Language 
ORDER BY COUNT(*) DESC 
LIMIT 1;

SELECT p.Name 
FROM PROGRAMMER p 
INNER JOIN SOFTWARE s ON p.ProgrammerID = s.ProgrammerID 
WHERE s.SellingCost = (SELECT MAX(SellingCost) FROM SOFTWARE);


SELECT SoftwareName 
FROM SOFTWARE 
WHERE DevelopmentCost = (SELECT MAX(DevelopmentCost) FROM SOFTWARE);

SELECT Name 
FROM PROGRAMMER 
WHERE Gender = 'F' AND LanguageProficiency = 'COBOL' 
ORDER BY Salary DESC 
LIMIT 1;

SELECT p.Name, s.SoftwareName 
FROM PROGRAMMER p 
INNER JOIN SOFTWARE s ON p.ProgrammerID = s.ProgrammerID;


SELECT Language, COUNT(*) AS NumPackages 
FROM SOFTWARE 
WHERE Language NOT IN ('C','C++') 
GROUP BY Language;

SELECT SoftwareName, AVG(SCOST - DCOST) AS AvgDiff 
FROM SOFTWARE 
GROUP BY SoftwareName;

SELECT p.Name, SUM(s.SCOST) AS TotalSCOST, SUM(s.DCOST) AS TotalDCOST, 
       SUM(CASE WHEN s.CopiesSold * s.SellingCost < s.DevelopmentCost THEN s.DevelopmentCost - s.CopiesSold * s.SellingCost ELSE 0 END) AS AmountToBeRecovered 
FROM PROGRAMMER p 
INNER JOIN SOFTWARE s ON p.ProgrammerID = s.ProgrammerID 
GROUP BY p.ProgrammerID;

SELECT Name 
FROM PROGRAMMER 
WHERE LanguageProficiency = 'C' 
ORDER BY Salary DESC 
LIMIT 1;


SELECT Name 
FROM PROGRAMMER 
WHERE Gender = 'F' AND LanguageProficiency = 'COBOL' 
ORDER BY Salary DESC 
LIMIT 1;


