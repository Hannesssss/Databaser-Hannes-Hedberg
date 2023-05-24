-- Databaser Labb 1 - Hannes Hedberg

-- Uppgifterna (1-10) kommer att behålla sin beskrivning på Svenska. Men alla kommentarer, förklaringar etc sker på Engelska.


DROP TABLE SuccessfulMissions; -- First lets drops the existing "SuccessfulMissions" table, so that it can be run multiple times.


/*
Uppgift 1:

Använd ”select into” för att ta ut kolumnerna ’Spacecraft’, ’Launch date’, 
’Carrier rocket’, ’Operator’, samt ’Mission type’ för alla lyckade uppdrag 
(Successful outcome) och sätt in i en ny tabell med namn ”SuccessfulMissions”.
*/


Select						-- Selects the following columns, using [] when its more than one word
						
	Spacecraft,				-- Spacecraft
	[Launch date],			-- Launch date
	[Carrier rocket],		-- Carrier rocket
	Operator,				-- Operator
	[Mission type]			-- Mission type

Into						-- Put this info into a new table

	SuccessfulMissions		-- New table name

From						-- Specifies where "Select" should look for the columns specifed above

	dbo.MoonMissions		-- filename of the table

Where						-- Query will only return the rows where the value of the column Outcome is equal to the string 'Successful'.

	Outcome = 'Successful';


GO							-- Onwards!


/*
Uppgift 2:

I kolumnen ’Operator’ har det smugit sig in ett eller flera mellanslag före
operatörens namn skriv en query som uppdaterar ”SuccessfulMissions” och tar
bort mellanslagen kring operatör.
*/


UPDATE SuccessfulMissions			-- Update lets us change or update a table we have created

SET									-- SET keyword is used to assign the modified value back to the Operator column in the table.
	Operator = LTRIM(Operator)		-- LTRIM function is used to remove any leading spaces from the Operator column values in a SQL query. 


GO									-- To infinity and beyond!


/*
Uppgift 2.5 (VG):

I ett flertal fall har värden i kolumnen ’Spacecraft’ ett alternativt namn som står
inom parantes, t.ex: ”Pioneer 0 (Able I)”. Skriv en query som uppdaterar
”SuccessfulMissions” på ett sådant sätt att alla värden i kolumnen ’Spacecraft’
endast innehåller originalnamnet, dvs ta bort alla paranteser och deras
innehåll. Ex: ”Pioneer 0 (Able I)” => ”Pioneer 0”.
*/


UPDATE SuccessfulMissions															-- This UPDATE statement modifies the Spacecraft column of the SuccessfulMissions table, removing any text inside parentheses in the Spacecraft column.
SET 
	Spacecraft = SUBSTRING(Spacecraft, 1, CHARINDEX('(', Spacecraft + '(') - 1)		-- SUBSTRING function extracts a portion of the Spacecraft string, starting at the first character/position 1 and ending at the position of the opening parenthesis character ( minus 1. 
																					-- The CHARINDEX function is used to locate the position of the opening parenthesis within the Spacecraft string. 
																					-- + '(' is used to add an opening parenthesis at the end of the string in case there are none, to avoid a potential error in the CHARINDEX function. Ensures postive value.
WHERE																				

		Spacecraft LIKE '%(%';														-- The WHERE clause limits the update to only the rows where the Spacecraft column contains parentheses.

GO																					-- Charge!


/*
Uppgift 3: 

Skriv en select query som tar ut, grupperar, samt sorterar på kolumnerna
’Operator’ och ’Mission type’ från ”SuccessfulMissions”. Som en tredje kolumn
’Mission count’ i resultatet vill vi ha antal uppdrag av varje operatör och typ. Ta
bara med de grupper som har fler än ett (>1) uppdrag av samma typ och
operatör.
*/


Select							

	Operator,					
	[Mission type]				

From							-- These are taken from the SuccessfulMissions table we created
	
	SuccessfulMissions

Group by						-- Selects the "Operator" and "Mission type" columns, then groups the data by both "Operator" and "Mission type" using the GROUP BY. 	
	Operator,
	[Mission type]

HAVING COUNT(*) > 1				-- HAVING is used to filter the results to only show groups where the count of records in that group is greater than 1.

Order by						-- Results are sorted by "Operator" and "Mission type" using the ORDER BY clause.
	Operator,
	[Mission type]


GO								-- This way!


/*
Uppgift 4: 

Ta ut samtliga rader och kolumner från tabellen ”Users”, men slå ihop
’Firstname’ och ’Lastname’ till en ny kolumn ’Name’, samt lägg till en extra
kolumn ’Gender’ som du ger värdet ’Female’ för alla användare vars näst sista
siffra i personnumret är jämn, och värdet ’Male’ för de användare där siffran är
udda. Sätt in resultatet i en ny tabell ”NewUsers”.
*/

DROP TABLE NewUsers;										 -- Drops the table "NewUsers" so that this query can be executed without receiving the error stating such a file already exists.  

SELECT *,													 -- Selects all columns from the table, and creates a new column called 'Name' using the CONCAT

	CONCAT(Firstname, ' ', Lastname) as 'Name',				 -- Concatenates the values in the 'Firstname' and 'Lastname' columns, separated by a space, to create the full name of the person. The 'as' keyword is used to give the new column a name.

CASE														 -- Basically an If statement, evaluates a set of conditions and returns a value if a condition is true, otherwise it returns another value.

	WHEN SUBSTRING(ID, LEN(ID) - 1, 1) % 2 = 0 THEN 'Female' -- Evaluates if the second to last digit of the ID column is even or odd, and returns "Female" if it is even and "Male" if it is odd.
		ELSE 'Male'

END as 'Gender'												 -- Result is returned as a new column called "Gender".

INTO														 -- Which gets inserted into the NewUsers table

NewUsers

FROM Users;


GO															 -- Lets keep going!


/*
Uppgift 5:

Skriv en query som returnerar en tabell med alla användarnamn i ”NewUsers”
som inte är unika i den första kolumnen, och antalet gånger de är duplicerade i
den andra kolumnen.
*/

SELECT
	UserName,								-- Selects two columns from the Users table
	COUNT(*) as 'Duplicate count'			-- Counts the number of rows that have the same value in the UserName column, grouping the results by each unique value in that column.

FROM										-- From the Users table
	Users

GROUP BY									-- Specifies that the results should be grouped by the UserName column. 
	UserName

HAVING										-- Filters the results to only show groups that have a count greater than 1.
	COUNT(*) > 1;

												
-- NOTE This isnt specifed in the lab, but wanted to do a quick check on the amount of duplicate usernames below:

SELECT								-- Displays the amount of duplicate usernames
	Name, COUNT(*) AS Count

FROM 
	NewUsers

GROUP BY 
	Name

ORDER BY 
	Count DESC;


GO									-- Moving on!


/*
Uppgift 6:

Skriv en följd av queries som uppdaterar de användare med dubblerade
användarnamn som du fann ovan, så att alla användare får ett unikt
användarnamn. D.v.s du kan hitta på nya användarnamn för de användarna, så
länge du ser till att alla i ”NewUsers” har unika värden på ’Username’.
*/


UPDATE						
	NewUsers				-- Updates the NewUsers table
SET							-- Sets the UserName field to the specifed value
	UserName = 'Felb'		-- Temporary username based on their old one, in this scenario Im assuming they can update it later at some point.
WHERE
	ID = '880706-3713';		-- Location: row 39, felber duplicate


UPDATE						-- Repeating the steps above
	NewUsers
SET
	UserName = 'Sig'		-- temp username
WHERE
	ID = '630303-4894';		-- Location: row 17, sigpet duplicate


UPDATE
	NewUsers				-- Repeating the steps above
SET
	UserName = 'Sigp'		-- temp username
WHERE
	ID = '811008-5301';		-- Location: row 34, sigpet duplicate


GO							-- Still more to go!


/*
Uppgift 7:

Skapa en query som tar bort alla kvinnor födda före 1970 från ”NewUsers”.
*/





DELETE FROM NewUsers
WHERE Gender = 'Female' AND SUBSTRING(ID, 1, 2) < '70';

GO									-- It just keeps on going!


/*
Uppgift 8:

Lägg till en ny användare i tabellen ”NewUsers”.
*/


INSERT INTO							-- Inserts data into the "NewUsers" table. The columns that data will be inserted into are listed within the parentheses after the table name
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

VALUES								-- Inserts a new row of data into the "NewUsers" table. Values are specifed for each column in the table.
	(	
		'621103-6969',				-- id
		'steam',					-- username
		'HalfLife3',				-- password
		'Gabe ',					-- Firstname
		'Newell',					-- Lastname
		'alyx@gmail.com',			-- Email
		'425-889-9642',				-- Phone, yes that is the support number to steam
		'Gabe Newell',				-- Name
		'Male'						-- Gender
	);


GO									-- Go go!


/*
Uppgift 8.5 (VG):

Skriv en query som returnerar två kolumner ’gender’ och ’avarage age’, och två
rader där ena raden visar medelåldern för män, och andra raden visar
medelåldern på kvinnor för alla användare i tabellen ”NewUsers”
*/


SELECT
	Gender,
	AVG(DATEDIFF(YEAR, CAST(LEFT(ID, 2) AS VARCHAR)+'0101', GETDATE())) AS 'Average age' -- Calculates the average age of a group of people based on their IDs. Converts the first two characters of each ID to a string representing the year of birth 
																						 -- Uses DATEDIFF function to calculate the number of years between that year and the current year. 
																						 --	Age is then averaged across all people in the group, and the result is labeled as 'Average age'.

FROM
	NewUsers

GROUP BY
	Gender;

GO																						-- Nearly there!


/*
Uppgift 9:

Skriv en query som selectar ut alla (77) produkter i company.products
Dessa ska visas i 4 kolumner:

Id – produktens id
Product – produktens namn
Supplier – namnet på företaget som leverar produkten
Category – namnet på kategorin som produkten tillhör
*/


SELECT						
	p.Id, 						-- Select the Id column from the company.products table and display it
	p.ProductName AS Product, 	-- Select the ProductName column from the company.products table and rename it as 'Product', 'Supplier' and 'Category'
	s.CompanyName AS Supplier, 	
	c.CategoryName AS Category	

FROM 
	company.products p											-- Select the company.products table and alias it as 'p'
	INNER JOIN company.suppliers s ON p.SupplierId = s.Id		-- Performs an inner join between the products table (aka "p") and the suppliers table (aka "s") on the SupplierId column in the products table matching the Id column in the *suppliers* table.
	INNER JOIN company.categories c ON p.CategoryId = c.Id;		-- Performs an inner join but for *categories*


GO																-- Much joins, such woaw


/*
Uppgift 10:

Skriv en query som listar antal anställda i var och en av de fyra regionerna i
tabellen company.regions
*/


SELECT
    reg.RegionDescription AS Region,                        -- Selects the region description and renames the column as 'Region'
    COUNT(DISTINCT emp.Id) AS "Number of Employees"        -- Counts the number of distinct employees in each region and renames the column as 'Number of Employees'
FROM
    company.employees emp                                  -- Specifies the employees table and assigns it an alias 'emp'
    INNER JOIN company.employee_territory et               -- Joins the employee_territory table
        ON emp.Id = et.EmployeeId
    INNER JOIN company.territories terr                    -- Joins the territories table
        ON et.TerritoryId = terr.Id
    INNER JOIN company.regions reg                         -- Joins the regions table
        ON terr.RegionId = reg.Id
GROUP BY
    reg.RegionDescription;                                 -- Groups the result set by the region description


GO

                                            

-- Join me in the last bit!


/*
Uppgift 10.5 (VG):

Vi har tidigare kollat på one-to-many och many-to-many joins. Det finns även
det som brukar kallas för self-join, när en tabell joinar mot sig själv.
Använd en self-join för att lista alla (9) anställda och deras närmsta chef.
De anställda ska visas i tre kolumner:

Id – Den anställdes id.
Name – Den anställdes titel och fullständiga namn (ex: Dr. Andrew Fuller)
Reports to – Närmsta chefens titel och fullständiga namn.

I de fall ReportsTo-kolumnen i company.employer är NULL, visa ’Nobody!’
*/


SELECT 
    emp.Id AS Id,																						-- Select the employee ID, then name it Id for easier access. 
    emp.TitleOfCourtesy + ' ' + emp.FirstName + ' ' + emp.LastName AS Name,								-- Combine the employee title, first name, and last name columns to get the employee's full name
    ISNULL(sup.TitleOfCourtesy + ' ' + sup.FirstName + ' ' + sup.LastName, 'Nobody!') AS 'Reports to'	-- Combine the supervisor's title, first name, and last name columns to get the supervisor's full name, and replace NULL values with 'Nobody!'
FROM 
    company.employees emp																				-- Select data from the employees table
LEFT JOIN 
    company.employees sup																				-- Join the employees table to itself using the ReportsTo column to find each employee's supervisor
ON 
    emp.ReportsTo = sup.Id																				-- Match the ReportsTo column of each employee to the Id column of their supervisor
ORDER BY 
    emp.Id;																								-- Sort the results by employee ID