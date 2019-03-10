CREATE DATABASE db_library
USE [db_library]


	CREATE TABLE Library_Branch (
		BranchID INT PRIMARY KEY NOT NULL IDENTITY (1,1),
		BranchName VARCHAR(50) NOT NULL,
		BranchAddress VARCHAR(50) NOT NULL
	);

	SELECT * FROM Library_Branch

	CREATE TABLE Publisher (
		PublisherID INT PRIMARY KEY NOT NULL IDENTITY (1,1),
		PublisherName VARCHAR(50) NOT NULL,
		PublisherAddress VARCHAR(50) NOT NULL,
		PublisherPhone VARCHAR(50) NOT NULL
	);

	SELECT * FROM Publisher

	CREATE TABLE Books (
		BookID INT PRIMARY KEY NOT NULL IDENTITY (1,1),
		Title VARCHAR(50) NOT NULL,
		BookPublisher INT NOT NULL CONSTRAINT FK_Publisher_ID FOREIGN KEY REFERENCES Publisher(PublisherID) ON UPDATE CASCADE ON DELETE CASCADE
	);

	SELECT * FROM Books

	CREATE TABLE Book_Copies (
		BookID INT NOT NULL CONSTRAINT FK_Book_ID FOREIGN KEY REFERENCES Books(BookID) ON UPDATE CASCADE ON DELETE CASCADE,
		BranchID INT NOT NULL CONSTRAINT FK_Branch_ID FOREIGN KEY REFERENCES Library_Branch(BranchID) ON UPDATE CASCADE ON DELETE CASCADE,
		Number_Of_Copies INT NOT NULL
	);

	SELECT * FROM Book_Copies

	CREATE TABLE Book_Authors (
		BookID INT NOT NULL CONSTRAINT FK_Book2_ID FOREIGN KEY REFERENCES Books(BookID) ON UPDATE CASCADE ON DELETE CASCADE,
		AuthorName VARCHAR(50) NOT NULL
	);

	SELECT * FROM Book_Authors

	CREATE TABLE Borrower (
		CardNo INT PRIMARY KEY NOT NULL IDENTITY (1,1),
		BorrowerName VARCHAR(50) NOT NULL,
		BorrowerAddress VARCHAR(50) NOT NULL,
		BorrowerPhone VARCHAR(50) NOT NULL
	);

	SELECT * FROM Borrower

	CREATE TABLE Book_Loans (
		BookID INT NOT NULL CONSTRAINT FK_Book3_ID FOREIGN KEY REFERENCES Books(BookID) ON UPDATE CASCADE ON DELETE CASCADE,
		CardNo INT NOT NULL CONSTRAINT FK_CardNo FOREIGN KEY REFERENCES Borrower(CardNo) ON UPDATE CASCADE ON DELETE CASCADE,
		BranchID INT NOT NULL CONSTRAINT FK_Branch2_ID FOREIGN KEY REFERENCES Library_Branch(BranchID) ON UPDATE CASCADE ON DELETE CASCADE,
		DateOut VARCHAR(50) NOT NULL,
		DateDue VARCHAR(50) NOT NULL
	);

	SELECT * FROM Book_Loans

	/*Tables are functioning correctly */

	/*Begin Population*/


	INSERT INTO Library_Branch
		(BranchName,BranchAddress)
		VALUES 
		('Sharpstone', '123 E Way'),
		('Central', '123 W Way'),
		('Beaverton', '123 N Way'),
		('Hillsboro', '123 S Way')
	;

	SELECT * FROM Library_Branch

	INSERT INTO Publisher
	(PublisherName, PublisherAddress, PublisherPhone)
	VALUES
	('Wolfsong','8404 North Old York Ave. Bethel Park, PA 15102','(868) 812-9910'),
	('Pearson PLC','1 Pleasant St. Lincolnton, NC 28092','(959) 726-5498'),
	('Reed Elsevier PLC & Reed Elsevier NV','9877 Hill Court Tuscaloosa, AL 35405','(585) 936-5894'),
	('The Woodbridge Company Ltd.','2 East Fairway Street Soddy Daisy, TN 37379','(997) 964-3658'),
	('Bertelsmann AG','822 Old Albany Court Altoona, PA 16601','(800) 353-4767'),
	('Wolters Kluwer','145 South Academy Rd. Southfield, MI 48076','(609) 869-8711'),
	('Lagardère','246 Princess St. Salisbury, MD 21801','(808) 631-6405'),
	('Grupo Planeta','8698 Old Shadow Brook St. Bergenfield, NJ 07621','(338) 738-7997'),
	('Springer Nature','9712 Birchpond Ave. Mount Prospect, IL 60056','(689) 595-6962'),
	('Scholastic','8239 East Foxrun St. Chicopee, MA 01020','(232) 746-5205'),
	('Apollo Global Management LLC','65 St Margarets Drive Hope Mills, NC 28348','(889) 423-6688'),
	('Wiley','40 Rockville Ave. Farmingdale, NY 11735','(456) 880-1529'),
	('News Corp','7850 E. Bay Meadows Ave. Los Angeles, CA 90008','(710) 862-3426'),
	('Apax and Omers Capital Partners','9398 S. Buckingham Ave. Elmont, NY 11003','(765) 216-5360'),
	('Houghton Mifflin Harcourt Co.','628 North Tarkiln Hill St. Media, PA 19063','(546) 387-0979'),
	('Verlagsgruppe Georg von Holtzbrinck','9 Walnut Street Coraopolis, PA 15108','(946) 238-3801'),
	('Informa PLC','402 West Tower Dr. West Warwick, RI 02893','(818) 786-2915'),
	('Oxford University','664 Silver Spear Lane Mount Holly, NJ 08060','(308) 452-2104'),
	('Kodansha Ltd.','559 Beacon St. Florence, SC 29501','(347) 475-7000'),
	('Hitotsubashi Group','9493 Grove Rd. Melrose, MA 02176','(938) 391-3770'),
	('Viking Press','54 Armstrong Street Grosse Pointe, MI 48236','(612) 820-7594'),
	('Doubleday','1 Shub Farm Lane Danbury, CT 06810','(873) 555-9537')
;

SELECT * FROM Publisher

	INSERT INTO Borrower
		(BorrowerName,BorrowerAddress,BorrowerPhone)
		VALUES
		('Sharar Hazan','7954 S. Pennsylvania Ave. Maineville, OH 45039','(694) 455-9269'),
		('Detlef Sohrab','9027 N. Meadow Rd. Allison Park, PA 15101','(459) 716-0537'),
		('Germano Zekharyah','86 Johnson Drive Portage, IN 46368','(900) 524-1807'),
		('Fotis Sif','814 Mayfair Street Middle River, MD 21220','(829) 385-9695'),
		('Giacinto Marianna','8010 Buttonwood St. Annapolis, MD 21401','(519) 871-2465'),
		('Peio Lev','886 Arlington Lane Dorchester Center, MA 02124','(362) 319-9222'),
		('Annas Vicente','5 Addison Lane Matawan, NJ 07747','(854) 744-5768'),
		('Olek Vivek','9 Chapel Court Taylors, SC 29687','(679) 495-4737'),
		('Blake Gotting','35 SW 89th Ave','(503) 250-1130')
	;

	SELECT * FROM Borrower

	INSERT INTO Books
		(Title,BookPublisher)
		VALUES
		('The Lost Tribe',1),
		('In Search of Lost Time',2),
		('Don Quixote',3),
		('Ulysses',4),
		('The Great Gatsby',5),
		('Moby Dick',6),
		('Hamlet',7),
		('War and Peace',8),
		('The Odyssey',9),
		('One Hundred Years of Solitude',10),
		('The Divine Comedy',11),
		('The Brothers Karamazov',12),
		('Madame Bovary',13),
		('The Adventures of Huckleberry Finn',14),
		('The Iliad',15),
		('Lolita',16),
		('Crime and Punishment',17),
		('Alices Adventures in Wonderland',18),
		('Wuthering Heights',19),
		('Pride and Prejudice',20),
		('It',21),
		('The Stand',22)
	;

	SELECT * FROM Books

	INSERT INTO Book_Copies 
		(BookID, BranchID, Number_Of_Copies)
		VALUES
		(1,1,5),
		(1,2,5),
		(1,3,5),
		(1,4,5),
		(2,1,5),
		(2,2,5),
		(2,3,5),
		(2,4,5),
		(3,1,5),
		(3,2,5),
		(3,3,5),
		(3,4,5),
		(4,1,5),
		(4,2,5),
		(4,3,5),
		(4,4,5),
		(5,1,5),
		(5,2,5),
		(5,3,5),
		(5,4,5),
		(6,1,5),
		(6,2,5),
		(6,3,5),
		(6,4,5),
		(7,1,5),
		(7,2,5),
		(7,3,5),
		(7,4,5),
		(10,1,5),
		(10,2,5),
		(10,3,5),
		(10,4,5),
		(11,1,5),
		(11,2,5),
		(11,3,5),
		(11,4,5),
		(12,1,5),
		(12,2,5),
		(12,3,5),
		(12,4,5),
		(13,1,5),
		(13,2,5),
		(13,3,5),
		(13,4,5),
		(14,1,5),
		(14,2,5),
		(14,3,5),
		(14,4,5),
		(15,1,5),
		(15,2,5),
		(15,3,5),
		(15,4,5),
		(16,1,5),
		(16,2,5),
		(16,3,5),
		(16,4,5),
		(17,1,5),
		(17,2,5),
		(17,3,5),
		(17,4,5),
		(18,1,5),
		(18,2,5),
		(18,3,5),
		(18,4,5),
		(19,1,5),
		(19,2,5),
		(19,3,5),
		(19,4,5),
		(20,1,5),
		(20,2,5),
		(20,3,5),
		(20,4,5),
		(21,1,5),
		(21,2,5),
		(21,3,5),
		(21,4,5),
		(22,1,5),
		(22,2,5),
		(22,3,5),
		(22,4,5)		
	;

	SELECT * FROM Book_Copies

	INSERT INTO Book_Authors
		(BookID, AuthorName)
		VALUES
		(1,'Edward Marriott'),
		(2,'Marcel Proust'),
		(3,'Miguel de Cervantes'),
		(4,'James Joyce'),
		(5,'F. Scott Fitzgerald'),
		(6,'Herman Melville'),
		(7,'William Shakespeare'),
		(8,'Leo Tolstoy'),
		(9,'Homer'),
		(10,'Gabriel Garcia Marquez'),
		(11,'Dante Alighieri'),
		(12,'Fyodor Dostoyevsky'),
		(13,'Gustave Flaubert'),
		(14,'Mark Twain'),
		(15,'Homer'),
		(16,'Vladimir Nabokov'),
		(17,'Fyodor Dostoyevsky'),
		(18,'Lewis Carroll'),
		(19,'Emily Brontë'),
		(20,'Jane Austen'),
		(21,'Stephen King'),
		(22,'Stephen King')

	;

	SELECT * FROM Book_Authors

	INSERT INTO Book_Loans
		(BookID,BranchID,CardNo,DateOut,DateDue)
		VALUES
		(1,1,1,'2019-04-03','2019-11-29'),
		(1,2,2,'2019-04-03','2019-11-29'),
		(1,3,3,'2019-04-03','2019-11-29'),
		(1,4,4,'2019-04-03','2019-11-29'),
		(2,1,5,'2019-04-03','2019-11-29'),
		(2,2,6,'2019-04-03','2019-11-29'),
		(2,3,7,'2019-04-03','2019-11-29'),
		(2,4,8,'2019-04-03','2019-11-29'),
		(3,1,1,'2019-04-03','2019-11-29'),
		(3,2,2,'2019-04-03','2019-11-29'),
		(3,3,3,'2019-04-03','2019-11-29'),
		(3,4,4,'2019-04-03','2019-11-29'),
		(4,1,5,'2019-04-03','2019-11-29'),
		(4,2,6,'2019-04-03','2019-11-29'),
		(4,3,7,'2019-04-03','2019-11-29'),
		(4,4,8,'2019-04-03','2019-11-29'),
		(5,1,1,'2019-04-03','2019-11-29'),
		(5,2,2,'2019-04-03','2019-11-29'),
		(5,3,3,'2019-04-03','2019-11-29'),
		(5,4,4,'2019-04-03','2019-11-29'),
		(6,1,5,'2019-04-03','2019-11-29'),
		(6,2,6,'2019-04-03','2019-11-29'),
		(6,3,7,'2019-04-03','2019-11-29'),
		(6,4,8,'2019-04-03','2019-11-29'),
		(7,1,1,'2019-04-03','2019-11-29'),
		(7,2,2,'2019-04-03','2019-11-29'),
		(7,3,3,'2019-04-03','2019-11-29'),
		(7,4,4,'2019-04-03','2019-11-29'),
		(8,1,5,'2019-04-03','2019-11-29'),
		(8,2,6,'2019-04-03','2019-11-29'),
		(8,3,7,'2019-04-03','2019-11-29'),
		(8,4,8,'2019-04-03','2019-11-29'),
		(9,1,1,'2019-04-03','2019-11-29'),
		(9,2,2,'2019-04-03','2019-11-29'),
		(9,3,3,'2019-04-03','2019-11-29'),
		(9,4,4,'2019-04-03','2019-11-29'),
		(10,1,5,'2019-04-03','2019-11-29'),
		(10,2,6,'2019-04-03','2019-11-29'),
		(10,3,7,'2019-04-03','2019-11-29'),
		(10,4,8,'2019-04-03','2019-11-29'),
		(11,1,1,'2019-04-03','2019-11-29'),
		(11,2,2,'2019-04-03','2019-11-29'),
		(11,3,3,'2019-04-03','2019-11-29'),
		(11,4,4,'2019-04-03','2019-11-29'),
		(12,1,5,'2019-04-03','2019-11-29'),
		(12,2,6,'2019-04-03','2019-11-29'),
		(12,3,7,'2019-04-03','2019-11-29'),
		(12,4,8,'2019-04-03','2019-11-29'),
		(13,1,1,'2019-04-03','2019-11-29'),
		(13,2,2,'2019-04-03','2019-11-29'),
		(13,3,3,'2019-04-03','2019-11-29'),
		(13,4,4,'2019-04-03','2019-11-29'),
		(14,1,5,'2019-04-03','2019-11-29'),
		(14,2,6,'2019-04-03','2019-11-29'),
		(14,3,7,'2019-04-03','2019-11-29'),
		(14,4,8,'2019-04-03','2019-11-29'),
		(15,1,1,'2019-04-03','2019-11-29'),
		(15,2,2,'2019-04-03','2019-11-29'),
		(15,3,3,'2019-04-03','2019-11-29'),
		(15,4,4,'2019-04-03','2019-11-29'),
		(16,1,5,'2019-04-03','2019-11-29'),
		(16,2,6,'2019-04-03','2019-11-29'),
		(16,3,7,'2019-04-03','2019-11-29'),
		(16,4,8,'2019-04-03','2019-11-29'),
		(17,1,1,'2019-04-03','2019-11-29'),
		(17,2,2,'2019-04-03','2019-11-29'),
		(17,3,3,'2019-04-03','2019-11-29'),
		(17,4,4,'2019-04-03','2019-11-29'),
		(18,1,5,'2019-04-03','2019-11-29'),
		(18,2,6,'2019-04-03','2019-11-29'),
		(18,3,7,'2019-04-03','2019-11-29'),
		(18,4,8,'2019-04-03','2019-11-29'),
		(19,1,1,'2019-04-03','2019-11-29'),
		(19,2,2,'2019-04-03','2019-11-29'),
		(19,3,3,'2019-04-03','2019-11-29'),
		(19,4,4,'2019-04-03','2019-11-29'),
		(20,1,5,'2019-04-03','2019-11-29'),
		(20,2,6,'2019-04-03','2019-11-29'),
		(20,3,7,'2019-04-03','2019-11-29'),
		(20,4,8,'2019-04-03','2019-11-29'),
		(21,1,1,'2019-04-03','2019-11-29'),
		(21,2,2,'2019-04-03','2019-11-29'),
		(21,3,3,'2019-04-03','2019-11-29'),
		(21,4,4,'2019-04-03','2019-11-29'),
		(22,1,5,'2019-04-03','2019-11-29'),
		(22,2,6,'2019-04-03','2019-11-29'),
		(22,3,7,'2019-04-03','2019-11-29'),
		(22,4,8,'2019-04-03','2019-11-29')
	;

	CREATE PROCEDURE Drill_1
	AS
	SELECT Book_Copies.Number_Of_Copies, Library_Branch.BranchName, Books.Title
		FROM Book_Copies
		INNER JOIN Library_Branch ON Library_branch.BranchID = Book_Copies.BranchID
		INNER JOIN Books ON Books.BookID = Book_Copies.BookID
		WHERE Library_Branch.BranchName = 'Sharpstone' AND Books.Title = 'The Lost Tribe'

	CREATE PROCEDURE Drill 2
	AS
	SELECT
	
	











	