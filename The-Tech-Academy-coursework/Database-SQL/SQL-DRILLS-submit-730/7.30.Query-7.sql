-- Database & SQL Course, #30 SQL Drill
-- Query 7. For each book authored (or co-authored) by "Stephen King", retrieve the title and the number of copies owned by the library branch whose name is "Central".

USE Libry
GO
SELECT Title, AuthorName
FROM Books, Authors
WHERE Books.AuthorId = Authors.AuthorId
AND AuthorName LIKE '%King'
ORDER BY Title