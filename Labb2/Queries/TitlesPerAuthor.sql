CREATE VIEW TitlesPerAuthor AS
SELECT CONCAT(Author.[First Name], ' ', Author.[Last Name]) AS Name,
DATEDIFF(year, Author.[Date of Birth], GETDATE()) AS Age,
COUNT(DISTINCT Book.ISBN13) AS Titles,
SUM(Book.Price * Inventory.Num) AS [Stock value]
FROM Author
INNER JOIN Book ON Author.ID = Book.AuthorID
INNER JOIN Inventory ON Book.ISBN13 = Inventory.ISBN13
GROUP BY Author.ID, Author.[First Name], Author.[Last Name], Author.[Date Of Birth]