
DROP TABLE SuccessfulMissions;

Select						
						
	Spacecraft,				
	[Launch date],			
	[Carrier rocket],		
	Operator,				
	[Mission type]			

Into						

	SuccessfulMissions		

From						

	dbo.MoonMissions	

Where						

	Outcome = 'Successful';


GO							



UPDATE SuccessfulMissions	

SET									
	Operator = LTRIM(Operator)		


GO							

UPDATE SuccessfulMissions															
SET 
	Spacecraft = SUBSTRING(Spacecraft, 1, CHARINDEX('(', Spacecraft + '(') - 1)
																				
																					
WHERE																				

		Spacecraft LIKE '%(%';														

GO													


Select							

	Operator,					
	[Mission type]				

From							
	
	SuccessfulMissions

Group by						 	
	Operator,
	[Mission type]

HAVING COUNT(*) > 1				

Order by						
	[Mission type]


GO							


DROP TABLE NewUsers;										   

SELECT *,													 

	CONCAT(Firstname, ' ', Lastname) as 'Name',				 

CASE														

	WHEN SUBSTRING(ID, LEN(ID) - 1, 1) % 2 = 0 THEN 'Female' 
		ELSE 'Male'

END as 'Gender'												

INTO														

NewUsers

FROM Users;


GO														


SELECT
	UserName,								
	COUNT(*) as 'Duplicate count'		

FROM										
	Users

GROUP BY									
	UserName

HAVING										
	COUNT(*) > 1;

												


SELECT								
	Name, COUNT(*) AS Count

FROM 
	NewUsers

GROUP BY 
	Name

ORDER BY 
	Count DESC;


GO								


UPDATE						
	NewUsers				
SET							
	UserName = 'Felb'		
WHERE
	ID = '880706-3713';		


UPDATE						
	NewUsers
SET
	UserName = 'Sig'		
WHERE
	ID = '630303-4894';		


UPDATE
	NewUsers				
SET
	UserName = 'Sigp'		
WHERE
	ID = '811008-5301';		


GO							


DELETE FROM							 
	NewUsers
WHERE
    SUBSTRING(ID, 1, 2) >= '70'		
    AND Gender = 'Female';			
									


GO									


INSERT INTO							
	NewUsers(
		ID,
		UserName,
		Password,
		FirstName,
		LastName,
		Email,
		Phone,
		Name,
		Gender
	)

VALUES								
	(	
		'621103-6969',				
		'steam',				
		'HalfLife3',			
		'Gabe ',					
		'Newell',					
		'alyx@gmail.com',		
		'425-889-9642',				
		'Gabe Newell',				
		'Male'						
	);


GO									


SELECT
	Gender,
	AVG(DATEDIFF(YEAR, CAST(LEFT(ID, 2) AS VARCHAR)+'0101', GETDATE())) AS 'Average age' 
																						 
																						 

FROM
	NewUsers

GROUP BY
	Gender;

GO																						


SELECT						
	p.Id, 						
	p.ProductName AS Product, 	
	s.CompanyName AS Supplier, 	
	c.CategoryName AS Category	

FROM 
	company.products p											
	INNER JOIN company.suppliers s ON p.SupplierId = s.Id		
	INNER JOIN company.categories c ON p.CategoryId = c.Id;		


GO																


SELECT
	reg.RegionDescription AS Region,										
	COUNT(*) AS "Number of Employees"										
FROM
	company.employees emp													
	INNER JOIN company.employee_territory et ON emp.Id = et.EmployeeId		
	INNER JOIN company.territories terr ON et.TerritoryId = terr.Id			
	INNER JOIN company.regions reg ON terr.RegionId = reg.Id				
GROUP BY
	RegionId,																
	RegionDescription;														


GO																			


SELECT 
    emp.Id AS Id,																						
    emp.TitleOfCourtesy + ' ' + emp.FirstName + ' ' + emp.LastName AS Name,								
    ISNULL(sup.TitleOfCourtesy + ' ' + sup.FirstName + ' ' + sup.LastName, 'Nobody!') AS 'Reports to'	
FROM 
    company.employees emp																				
LEFT JOIN 
    company.employees sup																				
ON 
    emp.ReportsTo = sup.Id																				
ORDER BY 
    emp.Id;																							