-- Database & SQL Course, #30 SQL Drill
-- Query 6. Retrieve the names, addresses, and number of books checked out for all borrowers who have more than five books checked out.

/* 
QUERY 6a below returns all borrowed books, but Can't figure out how to aggregate number of books, to test if > 5.
Uncommenting any of the additional statements returns error like:
Column 'Borrowers.Address' is invalid in the select list because it is not contained in either an aggregate function or the GROUP BY clause. I've googled this error, think I have an idea of what's going wrong, but don't know how to fix it.  
Tired of beating head against walls, hints gratefully accepted...
*/


-- QUERY 6a
	USE Libry
	GO
	SELECT Borrowers.BorrowerName, Borrowers.Address, BookLoans.BorrowerId, Books.Title, BookLoans.BranchId
	FROM Borrowers, BookLoans, Books
	where BookLoans.BorrowerId = Borrowers.BorrowerId
	and Books.BookId = BookLoans.BookId
	--  and count(Borrowers.BorrowerId) > 5
	--  and sum(Borrowers.BorrowerId) > 5
	 -- group by BorrowerId
	--  where count(Borrowers.BorrowerId) > 5
	--  having count(Borrowers.BorrowerId) > 5
	ORDER BY BorrowerId, Title
	GO

-- Uncommenting lines above with count() group by, having   throws errors:

-- HAVING, GROUP by BorrowerName error:
-- Column 'Borrowers.Address' is invalid in the select list because it is not contained in either an aggregate function or the GROUP BY clause.

-- WHERE error:
-- An aggregate may not appear in the WHERE clause unless it is in a subquery contained in a HAVING clause or a select list, and the column being aggregated is an outer reference.