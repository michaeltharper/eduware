-- Database & SQL Course, #30 SQL Drill
-- Query 2. How many copies of the book titled The Lost Tribe are owned by each library branch?

USE Libry
GO
SELECT Books.Title, Branches.BranchName AS 'Branch Name', BookCopies.NumCopies AS Copies
FROM Books 
JOIN BookCopies ON BookCopies.BookId = Books.BookId
JOIN Branches ON Branches.BranchId = BookCopies.BranchId
WHERE Books.Title = 'The Lost Tribe'
GO