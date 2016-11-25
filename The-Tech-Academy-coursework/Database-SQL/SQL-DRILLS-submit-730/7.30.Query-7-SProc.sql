-- Database & SQL Course, #30 SQL Drill
-- Query 7 - Stored Procedure. For each book authored (or co-authored) by "Stephen King", retrieve the title and the number of copies owned by the library branch whose name is "Central", and create a stored procedure that will execute the queries based on user choice.

USE Libry
GO
CREATE PROCEDURE dbo.pdx_getBooksByAuthor @Author nvarchar(50)
AS
SELECT Title, AuthorName
FROM Books, Authors
WHERE Books.AuthorId = Authors.AuthorId
and AuthorName LIKE '%' + @Author
ORDER BY Title
GO

EXEC dbo.pdx_getBooksByAuthor @Author = 'King'