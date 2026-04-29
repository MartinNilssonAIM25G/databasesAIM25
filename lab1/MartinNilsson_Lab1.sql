SELECT Spacecraft, [Launch date], [Carrier rocket], Operator, [Mission type]
INTO SuccessfulMissions
FROM MoonMissions
WHERE Outcome = 'Successful';

GO

UPDATE SuccessfulMissions
SET Operator = LTRIM(Operator)

GO

UPDATE SuccessfulMissions
SET Spacecraft = RTRIM(
    CASE
        WHEN CHARINDEX('(', Spacecraft) > 0
        THEN LEFT(Spacecraft, CHARINDEX('(', Spacecraft) -1)
        ELSE Spacecraft
    END    
)

GO

SELECT Operator, [Mission type], COUNT(*) as [Mission count]
FROM SuccessfulMissions
GROUP BY Operator, [Mission type]
HAVING COUNT(*) > 1
ORDER BY Operator, [Mission count]

GO

SELECT ID, UserName, Password, Firstname + ' ' + LastName AS Name, Email, Phone,
    CASE 
        WHEN SUBSTRING
        (ID, 10, 1) % 2 = 0 THEN 'Female'
        ELSE 'Male'
    END AS Gender
INTO NewUsers
FROM Users

GO

SELECT UserName, COUNT(*) AS Duplicate
FROM NewUsers
GROUP BY UserName
HAVING COUNT(*) > 1

GO

UPDATE NewUsers 
SET UserName = 'febe89' 
WHERE ID = '890701-1480'

UPDATE NewUsers 
SET UserName = 'sipe63' 
WHERE ID = '630303-4894'

UPDATE NewUsers 
SET UserName = 'sipe81' 
WHERE ID = '811008-5301'

GO

DELETE FROM NewUsers
WHERE Gender = 'Female' AND CAST(SUBSTRING(ID, 1, 2) AS int) < 70

GO

INSERT INTO NewUsers
VALUES
    ('990101-0000', 'kersta', 'ef00665150ab4158a0cc3951c3db0335', 'Kerrai Starshine', 'Kerrai.Starshine@gmail.com', '070-000099', 'Male')

GO

SELECT Gender, AVG(DATEDIFF(DAY, 
    CAST(
        CASE
            WHEN CAST(SUBSTRING(ID, 1, 2) AS INT) <=25
            THEN '20' + SUBSTRING(ID, 1, 6)
            ELSE '19' + SUBSTRING(ID, 1, 6)
        END
    AS DATE), GETDATE())) / 365.25 AS [average age]
FROM NewUsers
GROUP BY Gender

GO

SELECT p.Id, p.ProductName, s.CompanyName, c.CategoryName
FROM company.products p
    JOIN company.suppliers s ON (p.SupplierId = s.Id)
    JOIN company.categories c ON (p.CategoryId = c.Id)

GO

SELECT r.RegionDescription, COUNT(DISTINCT e.Id) AS [Employee count]
FROM company.regions r
    JOIN company.territories t ON r.Id = t.RegionId
    JOIN company.employee_territory et ON t.Id = et.TerritoryId
    JOIN company.employees e ON et.EmployeeId = e.Id
GROUP BY r.Id, r.RegionDescription

GO

select e.Id, e.TitleOfCourtesy + ' ' + e.FirstName + ' ' + e.LastName AS Name,
    CASE 
        WHEN e.ReportsTo IS NULL
        THEN 'Nobody!’'
        ELSE chef.TitleOfCourtesy + ' ' + chef.FirstName + ' ' + chef.LastName
    END AS [Reports to]
from company.employees e
    LEFT JOIN company.employees chef ON e.ReportsTo = chef.Id