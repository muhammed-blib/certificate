SELECT COUNT(*) FROM PROGRAMMER 
WHERE ProgrammerID NOT IN (SELECT ProgrammerID FROM STUDIES 
                           WHERE Course IN ('Pascal', 'C'));



SELECT * FROM PROGRAMMER 
WHERE ProgrammerID NOT IN (SELECT ProgrammerID FROM STUDIES 
                           WHERE Course IN ('Clipper', 'COBOL', 'Pascal'));


SELECT s.Language, AVG(s.DevelopmentCost) AS AvgDevCost, AVG(s.SellingCost) AS AvgSellCost, AVG(s.SellingCost/s.CopiesSold) AS AvgPricePerCopy 
FROM SOFTWARE s 
GROUP BY s.Language;


SELECT p.Name, COUNT(s.SoftwareID) AS NumPackages 
FROM PROGRAMMER p 
LEFT JOIN SOFTWARE s ON p.ProgrammerID = s.ProgrammerID 
GROUP BY p.ProgrammerID;


SELECT ((s.SellingCost - s.DevelopmentCost) * s.CopiesSold) AS Profit, 
       COUNT(DISTINCT s.ProgrammerID) AS NumProgrammers, 
       COUNT(s.SoftwareID) AS NumPackages 
FROM SOFTWARE s 
GROUP BY Profit;


SELECT COUNT(*) FROM SOFTWARE 
WHERE ProgrammerID = (SELECT ProgrammerID FROM PROGRAMMER 
                      WHERE Institute = 'BDPS' 
                      ORDER BY Experience DESC 
                      LIMIT 1);




SELECT COUNT(*) FROM SOFTWARE 
WHERE ProgrammerID IN (SELECT p.ProgrammerID FROM PROGRAMMER p 
                       WHERE p.Gender = 'F' AND p.Salary > 
                             (SELECT MAX(p2.Salary) FROM PROGRAMMER p2 
                              WHERE p2.Gender = 'M'));



SELECT p.Name, p.Salary, s.Language, s.SellingCost 
FROM PROGRAMMER p 
INNER JOIN SOFTWARE s ON p.ProgrammerID = s.ProgrammerID 
WHERE s.SellingCost = (SELECT MAX(SellingCost) FROM SOFTWARE);

SELECT p.Institute 
FROM PROGRAMMER p 
INNER JOIN SOFTWARE s ON p.ProgrammerID = s.ProgrammerID 
WHERE s.DevelopmentCost = (SELECT MAX(DevelopmentCost) FROM SOFTWARE);



SELECT p.Name FROM PROGRAMMER p 
LEFT JOIN SOFTWARE s ON p.ProgrammerID = s.ProgrammerID 
WHERE s.SoftwareID IS NULL;


SELECT s.SoftwareID, s.SoftwareName, s.Language 
FROM SOFTWARE s 
INNER JOIN STUDIES st ON s.ProgrammerID = st.ProgrammerID 
LEFT JOIN LANGUAGE l ON s.Language = l.Language 
WHERE st.Language1 <> s.Language AND st.Language2 <> s.Language;




SELECT s.SoftwareID, s.SoftwareName, p.Name, p.Gender, p.DateOfBirth 
FROM SOFTWARE s 
INNER JOIN PROGRAMMER p ON s.ProgrammerID = p.ProgrammerID 
WHERE ((p.Gender = 'M' AND p.DateOfBirth < '1965-01-01') 
       OR (p.Gender = 'F' AND p.DateOfBirth > '1975-01-01'));


SELECT s.SoftwareID,s.SoftwareName, p.Name, p.Salary 
FROM SOFTWARE s 
INNER JOIN PROGRAMMER p ON s.ProgrammerID = p.ProgrammerID 
WHERE p.Gender = 'M' AND p.Salary > 3000;

SELECT p.Name, p.Salary FROM PROGRAMMER p 
WHERE p.Gender = 'F' AND p.Salary > 
      (SELECT MAX(p2.Salary) FROM PROGRAMMER p2 WHERE p2.Gender='M');

SELECT p.Name, MAX(s.Language) AS HighestSellingLanguage, MIN(s.Language) AS LowestSellingLanguage 
FROM PROGRAMMER p 
INNER JOIN SOFTWARE s ON p.ProgrammerID = s.ProgrammerID 
WHERE s.SellingCost = (SELECT MAX(SellingCost) FROM SOFTWARE) 
      OR s.SellingCost = (SELECT MIN(SellingCost) FROM SOFTWARE);

SELECT s.SoftwareName, s.CopiesSold, AVG(s.CopiesSold) AS AvgCopiesSold 
FROM SOFTWARE s 
GROUP BY s.SoftwareID 
HAVING s.CopiesSold < AVG(s.CopiesSold);

SELECT s.SoftwareName, s.DevelopmentCost 
FROM SOFTWARE s 
WHERE s.Language = 'Pascal' 
      AND s.DevelopmentCost = (SELECT MAX(DevelopmentCost) FROM SOFTWARE WHERE Language = 'Pascal');

SELECT s.SoftwareName, s.DevelopmentCost, s.SellingCost, s.CopiesSold 
FROM SOFTWARE s 
WHERE s.DevelopmentCost - s.SellingCost = (SELECT MIN(DevelopmentCost - SellingCost) FROM SOFTWARE) 
LIMIT 1;


SELECT s.Language 
FROM SOFTWARE s 
WHERE s.SellingCost = (SELECT MAX(SellingCost) FROM SOFTWARE);


SELECT p.Name, s.SoftwareName 
FROM PROGRAMMER p 
INNER JOIN SOFTWARE s ON p.ProgrammerID = s.ProgrammerID 
WHERE s.CopiesSold = (SELECT MIN(CopiesSold) FROM SOFTWARE);

SELECT Course, Fee 
FROM COURSE 
WHERE Fee BETWEEN (SELECT AVG(Fee) - 1000 FROM COURSE) AND (SELECT AVG(Fee) + 1000 FROM COURSE);


SELECT Institute, Course, Fee 
FROM COURSE 
WHERE Fee < (SELECT AVG(Fee) FROM COURSE);


SELECT Institute 
FROM COURSE 
WHERE Fee = (SELECT MAX(Fee) FROM COURSE);


SELECT Institute, Course, Fee 
FROM COURSE 
WHERE Fee = (SELECT MAX(Fee) FROM COURSE);

