-- Database & SQL Course, #30 SQL Drill
-- Query 5. For each library branch, retrieve the branch name and the total number of books loaned out from that branch.

USE Libry
GO
SELECT distinct COUNT( BookLoans.DueDate) OVER (PARTITION BY Branches.BranchId) as 'Total Checkouts', Branches.BranchName as 'Branch Name' 
FROM Branches
JOIN BookCopies ON BookCopies.BranchId = Branches.BranchId
JOIN Books ON Books.BookId = BookCopies.BookId
JOIN BookLoans ON Branches.BranchId = BookLoans.BranchId
WHERE DueDate IS NOT NULL
ORDER BY 'Total Checkouts' DESC
GO