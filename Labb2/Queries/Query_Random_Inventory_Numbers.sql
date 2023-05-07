-- Insert random values for Store IDs, ISBN13, and amount of books
INSERT INTO HannesHedberg.dbo.Inventory (StoreID, ISBN13, Num)
SELECT 
  ABS(CHECKSUM(NEWID())) % 5 + 1 AS StoreID, -- generates a random number between 1 and 5
  ISBN13, -- use the ISBN13 from the Book table
  ABS(CHECKSUM(NEWID())) % 20 + 1 AS Amount -- generates a random number between 1 and 20
FROM HannesHedberg.dbo.Book