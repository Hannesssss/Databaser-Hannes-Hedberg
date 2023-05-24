-- Drop the existing view
DROP VIEW IF EXISTS TitlesPerAuthor;

GO

-- Recreate the view with the updated query
CREATE VIEW TitlesPerAuthor AS
SELECT CONCAT(Author.[First Name], ' ', Author.[Last Name]) AS Name,
DATEDIFF(year, Author.[Date of Birth], GETDATE()) AS Age,
COUNT(DISTINCT Book.ISBN13) AS Titles,
CONCAT('$', FORMAT(SUM(Book.Price * Inventory.Num), 'N2')) AS [Stock value]
FROM Author
INNER JOIN Book ON Author.AuthorID = Book.AuthorID
INNER JOIN Inventory ON Book.ISBN13 = Inventory.ISBN13
GROUP BY Author.[First Name], Author.[Last Name], Author.[Date of Birth];