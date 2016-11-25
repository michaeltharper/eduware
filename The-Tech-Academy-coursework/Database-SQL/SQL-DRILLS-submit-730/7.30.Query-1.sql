-- Database & SQL Course, #30 SQL Drill
-- Query 1. How many copies of the book titled The Lost Tribe are 
-- owned by the library branch whose name is 'Sharpstown'?

USE Libry
GO
SELECT Books.Title, Branches.BranchName AS 'Branch Name', BookCopies.NumCopies AS Copies
FROM Books 
JOIN BookCopies ON BookCopies.BookId = Books.BookId
JOIN Branches ON Branches.BranchId = BookCopies.BranchId
WHERE Books.Title = 'The Lost Tribe' and BranchName = 'Sharpstown'
GO