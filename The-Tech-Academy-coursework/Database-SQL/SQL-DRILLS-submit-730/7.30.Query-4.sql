-- Database & SQL Course, #30 SQL Drill
-- Query 4. For each book that is loaned out from the "Sharpstown" branch and whose DueDate is today, retrieve the book title, the borrower's name, and the borrower's address.

USE Libry
GO
SELECT Books.Title, Borrowers.BorrowerName, Borrowers.Address, BookLoans.DueDate
FROM Books
JOIN BookLoans ON Books.BookId = BookLoans.BookId
JOIN Borrowers ON BookLoans.BorrowerId = Borrowers.BorrowerId
WHERE  DueDate = '2016-07-08' and BranchID = 4
ORDER BY Title
GO