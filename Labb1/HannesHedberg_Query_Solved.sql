/*
Removes women born before 1970
*/

DELETE FROM NewUsers
WHERE Gender = 'Female' AND SUBSTRING(ID, 1, 2) < '70';

GO									-- It just keeps on going!

/*
No longer displays more employees than there is in total
*/


SELECT
    reg.RegionDescription AS Region,                        -- Selects the region description and renames the column as 'Region'
    COUNT(*) AS "Number of Employees"                       -- Counts the number of employees in each region and renames the column as 'Number of Employees'
FROM
    company.employees emp                                   -- Specifies the employees table and assigns it an alias 'emp'
    INNER JOIN company.employee_territory et                -- Joins the employee_territory table
        ON emp.Id = et.EmployeeId
    INNER JOIN company.territories terr                     -- Joins the territories table
        ON et.TerritoryId = terr.Id
    INNER JOIN company.regions reg                          -- Joins the regions table
        ON terr.RegionId = reg.Id
GROUP BY
    reg.RegionDescription;                                 -- Groups the result set by the region description	
	
GO