DELETE FROM HannesHedberg.dbo.Book

INSERT INTO HannesHedberg.dbo.Book (ISBN13, Title, Language, Price, [Date Released], AuthorID)
VALUES 
--J.K Rowling
(9780747532743, 'Harry Potter and the Philosopher''s Stone', 'English', 11, '1997-06-26', 201),
(9780747538493, 'Harry Potter and the Chamber of Secrets', 'English', 11, '1998-07-02', 201),
(9780747542155, 'Harry Potter and the Prisoner of Azkaban', 'English', 13, '1999-07-08', 201),
(9780747546245, 'Harry Potter and the Goblet of Fire', 'English', 15, '2000-07-08', 201),
(9780747551003, 'Harry Potter and the Order of Phoenix', 'English', 15, '2003-06-21', 201),
(9780747581086, 'Harry Potter and the Half-Blood Prince', 'English', 15, '2005-07-16', 201),
(9780545010221, 'Harry Potter and the Deathly Hallows', 'English', 17, '2007-07-21', 201),

-- H.P Lovecraft
(9780870540370, 'At the Mountains of Madness', 'English', 12, '1936-02-22', 202),
(9780575081574, 'The Call of Cthulhu and Other Weird Stories', 'English', 10, '1928-08-20', 202),
(9780812981484, 'The Complete Fiction of H.P. Lovecraft', 'English', 25, '2014-10-13', 202),
(9780345422063, 'The Dreams in the Witch House and Other Weird Stories', 'English', 11, '1933-07-24', 202),
(9780812974417, 'At the Mountains of Madness and Other Tales of Terror', 'English', 18, '2005-10-11', 202),
(9780141187068, 'The Call of Cthulhu and Other Stories', 'English', 9, '1999-09-30', 202),
(9780142180038, 'The Shadow Over Innsmouth and Other Stories of Horror', 'English', 14, '2013-06-25', 202),

-- R.R Tolkien
(9780007118359, 'The Hobbit', 'English', 12, '1937-09-21', 203),
(9780395082567, 'The Lord of the Rings: The Fellowship of the Ring', 'English', 15, '1954-07-29', 203),
(9780395082581, 'The Lord of the Rings: The Two Towers', 'English', 16, '1954-11-11', 203),
(9780395082543, 'The Lord of the Rings: The Return of the King', 'English', 17, '1955-10-20', 203),
(9780048231391, 'The Silmarillion', 'English', 14, '1977-09-15', 203);

SELECT CONCAT('$ ', Price) AS [Price with Currency]
FROM Book;