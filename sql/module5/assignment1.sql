SELECT Language, Name, Salary 
FROM PROGRAMMER 
WHERE (Language, Salary) IN (SELECT Language, MAX(Salary) FROM PROGRAMMER GROUP BY Language);


SELECT p1.Name, p1.Salary, p1.LanguageProficiency, p1.DateOfBirth, p1.JoiningDate, p2.Name AS SameSalaryPerson, p2.LanguageProficiency AS SameSalaryPersonLanguageProficiency 
FROM PROGRAMMER p1, PROGRAMMER p2 
WHERE p1.Salary = p2.Salary AND p1.ProgrammerID < p2.ProgrammerID;


SELECT p1.Name, p1.JoiningDate, p2.Name AS SameJoiningDatePerson, p2.JoiningDate AS SameJoiningDate 
FROM PROGRAMMER p1, PROGRAMMER p2 
WHERE p1.JoiningDate = p2.JoiningDate AND p1.ProgrammerID < p2.ProgrammerID;

SELECT p1.Name, p1.LanguageProficiency, p2.Name AS SameProf2Person 
FROM PROGRAMMER p1, PROGRAMMER p2 
WHERE p1.Prof2 = p2.Prof2 AND p1.ProgrammerID < p2.ProgrammerID;


SELECT COUNT(*) AS NumPackages, p.Institute 
FROM SOFTWARE s 
INNER JOIN PROGRAMMER p ON s.ProgrammerID = p.ProgrammerID 
WHERE s.DevelopmentCost = (SELECT MIN(DevelopmentCost) FROM SOFTWARE) 
GROUP BY p.ProgrammerID;
