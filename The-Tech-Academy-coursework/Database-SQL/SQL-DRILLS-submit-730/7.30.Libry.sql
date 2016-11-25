USE MASTER
GO

IF EXISTS (SELECT * FROM sys.sysdatabases WHERE name = 'Libry')
DROP DATABASE Libry
GO

CREATE DATABASE Libry
GO

USE Libry
GO

--  ------------------------ Publishers  x6  
CREATE TABLE Publishers
(PublisherId INT PRIMARY KEY IDENTITY(1,1),
 PublisherName nvarchar(200) NOT NULL, 
 Address nvarchar(200) NOT NULL, 
 Phone nvarchar(50) NOT NULL
)
INSERT INTO Publishers VALUES('Cotillion Press','35 Brim Hill, London, England, NW3 4AW, UK','44 20 7946 0455')
INSERT INTO Publishers VALUES('Moof Press','123 Side St, Portland, OR, 97123, USA','1 503 456 7890')
INSERT INTO Publishers VALUES('Full Press','67 Wide St., Galesburg, IL, 61402, USA','1 309 343 7890')
INSERT INTO Publishers VALUES('Headbutt Press','44 Rail Way, Glasgow, Scotland, GL3 2AW, UK','44 141 496 0499')
INSERT INTO Publishers VALUES('Vanity Press','790 Upper Blvd., Dowsing Creek, KY 30688, USA','1 312 456 7890')
INSERT INTO Publishers VALUES('O''Ribble Press','1427 East 60th Street, Chicago, IL, 60637, USA','1 312 486 7890')
GO

--  ------------------------ Authors  x12
CREATE TABLE Authors
(AuthorId INT PRIMARY KEY IDENTITY(1,1),
AuthorName nvarchar(200) NOT NULL
)
INSERT INTO Authors VALUES('George Takei')
INSERT INTO Authors VALUES('Harriet Swindon')
INSERT INTO Authors VALUES('Adam Zoon')
INSERT INTO Authors VALUES('Diana Wood')
INSERT INTO Authors VALUES('Bruce Dickinson')
INSERT INTO Authors VALUES('Kevin Pilchard')
INSERT INTO Authors VALUES('Edward Veranda')
INSERT INTO Authors VALUES('Brenda Yarks')
INSERT INTO Authors VALUES('Niles O''Magaruagh')
INSERT INTO Authors VALUES('Ian Raleigh')
INSERT INTO Authors VALUES('Charlie Xeno')
INSERT INTO Authors VALUES('Stephen King')
GO


--  ------------------------ Books  x24
CREATE TABLE Books
(BookId INT PRIMARY KEY IDENTITY(1,1),
 Title nvarchar(200) NOT NULL,
 AuthorId INT NOT NULL,
 PublisherId INT NOT NULL
 )
ALTER TABLE Books
ADD CONSTRAINT FK_AuthorId FOREIGN KEY (AuthorId)
    REFERENCES Authors (AuthorId)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
    CONSTRAINT FK_PublisherId FOREIGN KEY (PublisherId)
    REFERENCES Publishers (PublisherId)
    ON DELETE CASCADE
    ON UPDATE CASCADE
INSERT INTO Books VALUES('The Lost Tribe',1,1)
INSERT INTO Books VALUES('The King''s Ransom',1,1)
INSERT INTO Books VALUES('Citizen Wayne',2,1)
INSERT INTO Books VALUES('Dirty Larry',2,1)
INSERT INTO Books VALUES('Apple Pie, Volume 1',3,2)
INSERT INTO Books VALUES('Apple Pie, Volume 2',3,2)
INSERT INTO Books VALUES('Apple Pie, Volume 3',4,2)
INSERT INTO Books VALUES('Apple Pie, Volume 4',4,2)
INSERT INTO Books VALUES('Movie Collectibles',5,3)
INSERT INTO Books VALUES('Collectible Neckties',5,3)
INSERT INTO Books VALUES('Singer KR495 Owners Manual',5,3)
INSERT INTO Books VALUES('Oot Ma Way, Wee Scunners',6,4)
INSERT INTO Books VALUES('Clyde Moon',6,4)
INSERT INTO Books VALUES('Mastering jFoo',7,5)
INSERT INTO Books VALUES('Restful Design Patterns',7,5) -- #15 not checked out anywhere
INSERT INTO Books VALUES('Basket Weaving Projects',8,1)
INSERT INTO Books VALUES('Complete Guide to Knitting',8,1)
INSERT INTO Books VALUES('Spy Games',9,3)
INSERT INTO Books VALUES('The Higgins Affair',9,3)
INSERT INTO Books VALUES('More Cowbell Baby!',10,3)
INSERT INTO Books VALUES('Fit As A Fiddle',11,4)
INSERT INTO Books VALUES('Eating for Dummies',11,4)
INSERT INTO Books VALUES('The Shining',12,6)
INSERT INTO Books VALUES('Salem''s Lot',12,6)
GO


--  ------------------------ Branches  x4
CREATE TABLE Branches
(BranchId INT PRIMARY KEY IDENTITY(1,1),
 BranchName nvarchar(200) NOT NULL,
 Address nvarchar(200)
)
INSERT INTO Branches VALUES('Central','2-4 High Street')
INSERT INTO Branches VALUES('North','567 Upton Road')
INSERT INTO Branches VALUES('South','765 Downton Street')
INSERT INTO Branches VALUES('Sharpstown','909 Bindery Way')
GO

--  ------------------------ BookCopies x84
CREATE TABLE BookCopies
(BookId INT NOT NULL,
 BranchId INT NOT NULL, 
 NumCopies INT NOT NULL
)
ALTER TABLE BookCopies
ADD CONSTRAINT FK_BookCopiesBookId FOREIGN KEY (BookId)
    REFERENCES Books (BookId)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
    CONSTRAINT FK_BookCopiesBranchId FOREIGN KEY (BranchId)
    REFERENCES Branches (BranchId)
    ON DELETE CASCADE
    ON UPDATE CASCADE
-- +++++ inserts below +++++

--  ------------------------ Borrowers  x12
CREATE TABLE Borrowers
(BorrowerId INT PRIMARY KEY IDENTITY(1,1), 
BorrowerName nvarchar(200) NOT NULL,
Address nvarchar(200), 
Phone nvarchar(50)
)
INSERT INTO Borrowers VALUES('Adam Smith', '123 Sunrise Ave','212-345-4001')
INSERT INTO Borrowers VALUES('Brian Ferry','234 Morning Street','212-345-4002')
INSERT INTO Borrowers VALUES('Carlinda Jones','456 Noon Lane','312-345-4003')
INSERT INTO Borrowers VALUES('David Jones','567 Afternoon Blvd','412-345-4004')
INSERT INTO Borrowers VALUES('Frank Tikkey', '678 Evening Ave','512-345-4005')
INSERT INTO Borrowers VALUES('Gina Sands','789 Sunset Street','612-345-4006')
INSERT INTO Borrowers VALUES('Larry O''Malley','890 Gloaming Way','712-345-4007')
INSERT INTO Borrowers VALUES('Linda Lewis','363 Northern Street','722-345-3308')
INSERT INTO Borrowers VALUES('Kyle Lewis','363 Northern Street','722-345-3309')  
INSERT INTO Borrowers VALUES('Mike Randall','474 Eastern Blvd','934-345-4408') -- #10
INSERT INTO Borrowers VALUES('Paul Simmons','585 Southern Street','345-345-5508') -- nothing checked out.
INSERT INTO Borrowers VALUES('Steve Vincent','272 Western Blvd','587-345-6608')  -- nothing checked out.

--  ------------------------ BookLoans  x 52
CREATE TABLE BookLoans
(BookId INT NOT NULL,
 BranchId INT NOT NULL,
 BorrowerId INT NOT NULL, 
 DateOut DATE, 
 DueDate DATE
)
ALTER TABLE BookLoans
ADD CONSTRAINT FK_BookLoansId FOREIGN KEY (BookId)
    REFERENCES Books (BookId)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
    CONSTRAINT FK_BranchId FOREIGN KEY (BranchId)
    REFERENCES Branches (BranchId)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
    CONSTRAINT FK_BorrowerId FOREIGN KEY (BorrowerId)
    REFERENCES Borrowers (BorrowerId)
    ON DELETE CASCADE
    ON UPDATE CASCADE
GO
-- +++++ INSERTS below +++++



-- >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>  INSERTS  <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
-- >>> BookCopies x84 ++
-- >>> BookLoans  x52


-- >>> BookCopies x84++

-- Central Branch
-- Values:  BookId, BranchId, NumCopies
INSERT INTO BookCopies VALUES(1, 1, 10)
INSERT INTO BookCopies VALUES(2, 1, 10)
INSERT INTO BookCopies VALUES(3, 1, 10)
INSERT INTO BookCopies VALUES(4, 1, 10)
INSERT INTO BookCopies VALUES(5, 1, 10)
INSERT INTO BookCopies VALUES(6, 1, 10)
INSERT INTO BookCopies VALUES(7, 1, 10)
INSERT INTO BookCopies VALUES(8, 1, 10)
INSERT INTO BookCopies VALUES(9, 1, 10)
INSERT INTO BookCopies VALUES(10, 1, 10)
INSERT INTO BookCopies VALUES(11, 1, 10)
INSERT INTO BookCopies VALUES(12, 1, 10)
INSERT INTO BookCopies VALUES(13, 1, 10)
INSERT INTO BookCopies VALUES(14, 1, 10)
INSERT INTO BookCopies VALUES(15, 1, 10)
INSERT INTO BookCopies VALUES(16, 1, 10)
INSERT INTO BookCopies VALUES(17, 1, 10)
INSERT INTO BookCopies VALUES(18, 1, 10)
INSERT INTO BookCopies VALUES(19, 1, 10)
INSERT INTO BookCopies VALUES(20, 1, 10)
INSERT INTO BookCopies VALUES(21, 1, 10)
INSERT INTO BookCopies VALUES(22, 1, 10)
INSERT INTO BookCopies VALUES(23, 1, 10)
INSERT INTO BookCopies VALUES(24, 1, 10)

-- North Branch
-- Values:  BookId, BranchId, NumCopies
INSERT INTO BookCopies VALUES(1, 2, 8)
INSERT INTO BookCopies VALUES(2, 2, 8)
INSERT INTO BookCopies VALUES(3, 2, 8)
INSERT INTO BookCopies VALUES(4, 2, 8)
INSERT INTO BookCopies VALUES(5, 2, 8)
INSERT INTO BookCopies VALUES(6, 2, 8)
INSERT INTO BookCopies VALUES(7, 2, 8)
INSERT INTO BookCopies VALUES(8, 2, 8)
INSERT INTO BookCopies VALUES(9, 2, 8)
INSERT INTO BookCopies VALUES(10, 2, 8)
INSERT INTO BookCopies VALUES(11, 2, 8)
INSERT INTO BookCopies VALUES(12, 2, 8)
INSERT INTO BookCopies VALUES(13, 2, 8)
INSERT INTO BookCopies VALUES(14, 2, 8)
INSERT INTO BookCopies VALUES(15, 2, 8)
INSERT INTO BookCopies VALUES(16, 2, 8)
INSERT INTO BookCopies VALUES(17, 2, 8)
INSERT INTO BookCopies VALUES(18, 2, 8)
INSERT INTO BookCopies VALUES(19, 2, 8)
INSERT INTO BookCopies VALUES(20, 2, 8)
INSERT INTO BookCopies VALUES(21, 2, 8)
INSERT INTO BookCopies VALUES(22, 2, 8)
INSERT INTO BookCopies VALUES(23, 2, 8)
INSERT INTO BookCopies VALUES(24, 2, 8)


-- South Branch
-- Values:  BookId, BranchId, NumCopies
INSERT INTO BookCopies VALUES(1, 3, 8)
INSERT INTO BookCopies VALUES(2, 3, 8)
INSERT INTO BookCopies VALUES(3, 3, 8)
INSERT INTO BookCopies VALUES(4, 3, 8)
INSERT INTO BookCopies VALUES(5, 3, 8)
INSERT INTO BookCopies VALUES(6, 3, 8)
INSERT INTO BookCopies VALUES(7, 3, 8)
INSERT INTO BookCopies VALUES(8, 3, 8)
INSERT INTO BookCopies VALUES(9, 3, 8)
INSERT INTO BookCopies VALUES(10, 3, 8)
INSERT INTO BookCopies VALUES(11, 3, 8)
INSERT INTO BookCopies VALUES(12, 3, 8)
INSERT INTO BookCopies VALUES(13, 3, 8)
INSERT INTO BookCopies VALUES(14, 3, 8)
INSERT INTO BookCopies VALUES(15, 3, 8)
INSERT INTO BookCopies VALUES(16, 3, 8)
INSERT INTO BookCopies VALUES(17, 3, 8)
INSERT INTO BookCopies VALUES(18, 3, 8)
INSERT INTO BookCopies VALUES(19, 3, 8)
INSERT INTO BookCopies VALUES(20, 3, 8)
INSERT INTO BookCopies VALUES(21, 3, 8)
INSERT INTO BookCopies VALUES(22, 3, 8)
INSERT INTO BookCopies VALUES(23, 3, 8)
INSERT INTO BookCopies VALUES(24, 3, 8)


-- Sharpstown Branch
-- Values:  BookId, BranchId, NumCopies
INSERT INTO BookCopies VALUES(1, 4, 6)
INSERT INTO BookCopies VALUES(2, 4, 6)
INSERT INTO BookCopies VALUES(3, 4, 6)
INSERT INTO BookCopies VALUES(4, 4, 6)
INSERT INTO BookCopies VALUES(5, 4, 6)
INSERT INTO BookCopies VALUES(6, 4, 6)
INSERT INTO BookCopies VALUES(7, 4, 6)
INSERT INTO BookCopies VALUES(8, 4, 6)
INSERT INTO BookCopies VALUES(9, 4, 6)
INSERT INTO BookCopies VALUES(10, 4, 6)
INSERT INTO BookCopies VALUES(11, 4, 6)
INSERT INTO BookCopies VALUES(12, 4, 6)
INSERT INTO BookCopies VALUES(13, 4, 6)
INSERT INTO BookCopies VALUES(14, 4, 6)
INSERT INTO BookCopies VALUES(15, 4, 6)
INSERT INTO BookCopies VALUES(16, 4, 6)
INSERT INTO BookCopies VALUES(17, 4, 6)
INSERT INTO BookCopies VALUES(18, 4, 6)
INSERT INTO BookCopies VALUES(19, 4, 6)
INSERT INTO BookCopies VALUES(20, 4, 6)
INSERT INTO BookCopies VALUES(21, 4, 6)
INSERT INTO BookCopies VALUES(22, 4, 6)
INSERT INTO BookCopies VALUES(23, 4, 6)
INSERT INTO BookCopies VALUES(24, 4, 6)
GO





-- >>> BookLoans  x52

-- Central Branch x13		BookId  BranchId  BorrowerId   DateOut   DueDate
INSERT INTO BookLoans VALUES( '1','1','1','2016-06-08','2016-07-08')
INSERT INTO BookLoans VALUES( '2','1','1','2016-06-19','2016-07-19')
INSERT INTO BookLoans VALUES( '4','1','1','2016-06-30','2016-07-30')
INSERT INTO BookLoans VALUES( '6','1','2','2016-06-30','2016-07-30')
INSERT INTO BookLoans VALUES( '7','1','2','2016-06-21','2016-07-21')
INSERT INTO BookLoans VALUES( '8','1','2','2016-06-30','2016-07-30')
INSERT INTO BookLoans VALUES('10','1','3','2016-06-30','2016-07-30')
INSERT INTO BookLoans VALUES('12','1','4','2016-06-30','2016-07-30')
INSERT INTO BookLoans VALUES('14','1','4','2016-06-08','2016-07-08')
INSERT INTO BookLoans VALUES('16','1','5','2016-06-22','2016-07-22')
INSERT INTO BookLoans VALUES('18','1','5','2016-06-23','2016-07-23')
INSERT INTO BookLoans VALUES('20','1','6','2016-06-24','2016-07-24')
INSERT INTO BookLoans VALUES('22','1','6','2016-06-30','2016-07-30')
INSERT INTO BookLoans VALUES('21','1','6','2016-06-30','2016-07-30')


-- North Branch x13	    BookId  BranchId  BorrowerId   DateOut   DueDate
INSERT INTO BookLoans VALUES( '3','2','3','2016-06-20','2016-07-20')
INSERT INTO BookLoans VALUES( '6','2','4','2016-06-20','2016-07-20')
INSERT INTO BookLoans VALUES( '7','2','4','2016-06-20','2016-07-20')
INSERT INTO BookLoans VALUES('10','2','5','2016-06-08','2016-07-08')
INSERT INTO BookLoans VALUES('14','2','6','2016-06-20','2016-07-20')
INSERT INTO BookLoans VALUES('16','2','6','2016-06-20','2016-07-20')
INSERT INTO BookLoans VALUES('18','2','7','2016-06-20','2016-07-20')
INSERT INTO BookLoans VALUES('19','2','7','2016-06-20','2016-07-20')
INSERT INTO BookLoans VALUES('20','2','8','2016-06-20','2016-07-20')
INSERT INTO BookLoans VALUES('21','2','8','2016-06-20','2016-07-20')
INSERT INTO BookLoans VALUES('23','2','9','2016-06-20','2016-07-20')


-- South Branch x13 	 BookId  BranchId  BorrowerId   DateOut   DueDate
INSERT INTO BookLoans VALUES('2','3','10','2016-06-08','2016-07-08')
INSERT INTO BookLoans VALUES('5','3','10','2016-06-12','2016-07-12')
INSERT INTO BookLoans VALUES('6','3','10','2016-06-12','2016-07-12')
INSERT INTO BookLoans VALUES( '11','3','3','2016-06-12','2016-07-12')
INSERT INTO BookLoans VALUES('12','3','3','2016-06-12','2016-07-12')
INSERT INTO BookLoans VALUES('13','3','6','2016-06-12','2016-07-12')
INSERT INTO BookLoans VALUES('16','3','7','2016-06-12','2016-07-12')
INSERT INTO BookLoans VALUES('17','3','9','2016-06-12','2016-07-12')
INSERT INTO BookLoans VALUES('18','3','9','2016-06-12','2016-07-12')
INSERT INTO BookLoans VALUES('19','3','10','2016-06-12','2016-07-12')
INSERT INTO BookLoans VALUES('20','3','9','2016-06-08','2016-07-08')
INSERT INTO BookLoans VALUES('20','3','9','2016-06-12','2016-07-12')
INSERT INTO BookLoans VALUES('22','3','9','2016-06-20','2016-07-20')
INSERT INTO BookLoans VALUES('22','3','6','2016-06-20','2016-07-20')
INSERT INTO BookLoans VALUES('24','3','9','2016-06-12','2016-07-12')


-- Sharpstown Branch x13	    BookId  BranchId  BorrowerId   DateOut   DueDate
INSERT INTO BookLoans VALUES('4','4','7','2016-06-08','2016-07-08')
INSERT INTO BookLoans VALUES('16','4','10','2016-06-14','2016-07-14')
INSERT INTO BookLoans VALUES('17','4','10','2016-06-14','2016-07-14')
INSERT INTO BookLoans VALUES( '8','4','5','2016-06-08','2016-07-08')
INSERT INTO BookLoans VALUES('15','4','3','2016-06-14','2016-07-14')
INSERT INTO BookLoans VALUES('14','4','6','2016-06-14','2016-07-14')
INSERT INTO BookLoans VALUES('19','4','7','2016-06-14','2016-07-14')
INSERT INTO BookLoans VALUES('13','4','9','2016-06-14','2016-07-14')
INSERT INTO BookLoans VALUES('14','4','9','2016-06-14','2016-07-14')
INSERT INTO BookLoans VALUES('19','4','8','2016-06-14','2016-07-14')
INSERT INTO BookLoans VALUES('21','4','9','2016-06-14','2016-07-14')
INSERT INTO BookLoans VALUES('24','4','2','2016-06-14','2016-07-14')
INSERT INTO BookLoans VALUES('24','4','4','2016-06-14','2016-07-14')