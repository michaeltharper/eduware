-- Database & SQL Course, #30 SQL Drill
-- Query 3. Retrieve the names of all borrowers who do not have any books checked out.

USE Libry
GO
SELECT BorrowerName as 'Borrowers with no check-outs'
FROM Borrowers
LEFT JOIN BookLoans ON Borrowers.BorrowerId = BookLoans.BorrowerId
WHERE BookId IS NULL
ORDER BY BorrowerName
GO