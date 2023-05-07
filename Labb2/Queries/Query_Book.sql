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
(9780048231391, 'The Silmarillion', 'English', 14, '1977-09-15', 203),

-- George R.R. Martin
(9780553103540, 'A Game of Thrones', 'English', 20.99, '1996-08-01', 204),
(9780553108033, 'A Clash of Kings', 'English', 22.99, '1999-02-02', 204),
(9780553588484, 'A Storm of Swords', 'English', 24.99, '2000-10-31', 204),
(9780553573428, 'A Feast for Crows', 'English', 23.99, '2005-11-08', 204),
(9780553801477, 'A Dance with Dragons', 'English', 26.99, '2011-07-12', 204),
(9781524796280, 'Fire and Blood', 'English', 22.99, '2018-11-20', 204),

-- Stephen Edwin King
(9780670024896, 'The Shining', 'English', 12, '1977-01-28', 205),
(9780670813025, 'The Stand', 'English', 14, '1978-10-03', 205),
(9780307743664, 'Carrie', 'English', 10, '1974-04-05', 205),
(9780670239192, 'The Dead Zone', 'English', 11, '1979-08-08', 205),
(9780451161352, 'The Dark Tower: The Gunslinger', 'English', 12, '1982-06-10', 205),
(9780451160522, 'Firestarter', 'English', 11, '1980-09-29', 205),
(9780451167316, 'Pet Sematary', 'English', 12, '1983-11-14', 205),
(9780451160447, 'Christine', 'English', 10, '1983-04-29', 205),
(9780451184962, 'The Tommyknockers', 'English', 13, '1987-11-10', 205),
(9780451180230, 'Misery', 'English', 11, '1987-06-08', 205),
(9780451169518, 'It', 'English', 14, '1986-09-15', 205),
(9780451179283, 'The Dark Tower II: The Drawing of the Three', 'English', 12, '1987-05-01', 205),
(9780451169525, 'The Dark Tower III: The Waste Lands', 'English', 13, '1991-08-27', 205),
(9780451188465, 'The Dark Tower IV: Wizard and Glass', 'English', 14, '1997-11-04', 205),
(9780684805350, 'Bag of Bones', 'English', 14, '1998-09-22', 205),
(9780671024239, 'Hearts in Atlantis', 'English', 11, '1999-09-14', 205),
(9780743203633, 'Dreamcatcher', 'English', 13, '2001-03-20', 205),
(9781416516934, 'The Dark Tower V: Wolves of the Calla', 'English', 15, '2003-11-04', 205),
(9780743254557, 'The Dark Tower VI: Song of Susannah', 'English', 15, '2004-06-08', 205),
(9780743292337, 'The Dark Tower VII: The Dark Tower', 'English', 17, '2004-09-21', 205);


SELECT CONCAT('$ ', Price) AS [Price with Currency]
FROM Book;