SELECT s.SoftwareID, s.SoftwareName, s.Language, s.DevelopmentCost, s.SellingCost, s.CopiesSold, p.Name, p.Gender, p.Institute 
FROM SOFTWARE s 
INNER JOIN PROGRAMMER p ON s.ProgrammerID = p.ProgrammerID 
WHERE s.Language = 'dBase' AND p.Gender = 'M' AND p.Institute = (SELECT Institute FROM PROGRAMMER GROUP BY Institute ORDER BY COUNT(*) DESC LIMIT 1);


SELECT LanguageProficiency, COUNT(*) AS NumProgrammers 
FROM PROGRAMMER 
GROUP BY LanguageProficiency 
ORDER BY NumProgrammers DESC 
LIMIT 1;


SELECT MONTHNAME(JoiningDate) AS Month, COUNT(*) AS NumProgrammers 
FROM PROGRAMMER 
GROUP BY MONTH(JoiningDate) 
ORDER BY NumProgrammers DESC 
LIMIT 1;


SELECT YEAR(DateOfBirth) AS BirthYear, COUNT(*) AS NumProgrammers 
FROM PROGRAMMER 
GROUP BY YEAR(DateOfBirth) 
ORDER BY NumProgrammers DESC 
LIMIT 1;

SELECT ProgrammerID, COUNT(*) AS NumPackages 
FROM SOFTWARE 
GROUP BY ProgrammerID 
ORDER BY NumPackages DESC 
LIMIT 1;


SELECT Language, COUNT(*) AS NumPackages 
FROM SOFTWARE 
GROUP BY Language 
ORDER BY NumPackages DESC 
LIMIT 1;

SELECT Course, COUNT(*) AS NumStudents 
FROM PROGRAMMER 
WHERE Institute IN (SELECT Institute FROM COURSE WHERE NumHours < (SELECT AVG(NumHours) FROM COURSE)) 
GROUP BY Institute 
ORDER BY NumStudents;

SELECT Course, COUNT(*) AS NumStudents 
FROM PROGRAMMER 
WHERE Institute IN (SELECT Institute FROM COURSE) 
GROUP BY Institute 
ORDER BY NumStudents DESC 
LIMIT 1;

SELECT Institute, COUNT(*) AS NumStudents 
FROM PROGRAMMER 
GROUP BY Institute 
ORDER BY NumStudents DESC 
LIMIT 1;

SELECT Language, Name, Salary 
FROM PROGRAMMER 
WHERE (Language, Salary) IN (SELECT Language, MAX(Salary) FROM PROGRAMMER GROUP BY Language);


