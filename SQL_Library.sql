CREATE DATABASE db_library

	CREATE TABLE Library_Branch (
		BranchID INT PRIMARY KEY NOT NULL IDENTITY,
		BranchName VARCHAR(50) NOT NULL,
		BranchAddress VARCHAR(50) NOT NULL
	);

	CREATE TABLE Book_Copies (
		BookID INT NOT NULL CONSTRAINT fk_BookID FOREIGN KEY REFERENCES Books(BookID) ON UPDATE CASCADE ON DELETE CASCADE,
		BranchID INT NOT NULL CONSTRAINT fk_BranchID FOREIGN KEY REFERENCES Library_Branch(BranchID) ON UPDATE CASCADE ON DELETE CASCADE,
		Number_Of_Copies VARCHAR(50) NOT NULL
	);

	CREATE TABLE Books (
		BookID INT PRIMARY KEY NOT NULL IDENTITY,
		Title VARCHAR(50) NOT NULL,
		PublisherName VARCHAR(50) NOT NULL CONSTRAINT fk_PublisherName FOREIGN KEY REFERENCES Publisher(PublisherName) ON UPDATE CASCADE ON DELETE CASCADE 
	);

	CREATE TABLE Book_Authors (
		BookID INT NOT NULL CONSTRAINT fk_BookID FOREIGN KEY REFERENCES Books(BookID) ON UPDATE CASCADE ON DELETE CASCADE,
		AuthorName VARCHAR(50) NOT NULL
	);

	CREATE TABLE Publisher (
		PublisherName VARCHAR(50) PRIMARY KEY NOT NULL,
		PublisherAddress VARCHAR(50) NOT NULL
	);

	CREATE TABLE Borrower (
		CardNo INT PRIMARY KEY NOT NULL IDENTITY,
		BorrowerName VARCHAR(50) NOT NULL,
		BorrowerAddress VARCHAR(50) NOT NULL,
		BorrowerPhone VARCHAR(50) NOT NULL
	);

	CREATE TABLE Book_Loans (
		BookID INT NOT NULL CONSTRAINT fk_BookID FOREIGN KEY REFERENCES Books(BookID) ON UPDATE CASCADE ON DELETE CASCADE,
		BranchID INT NOT NULL CONSTRAINT fk_BranchID FOREIGN KEY REFERENCES Library_Branch(BranchID) ON UPDATE CASCADE ON DELETE CASCADE,
		CardNo INT NOT NULL CONSTRAINT fk_CardNo FOREIGN KEY REFERENCES Borrower(CardNo) ON UPDATE CASCADE ON DELETE CASCADE,
		DateOut VARCHAR(50) NOT NULL,
		DateDue VARCHAR(50) NOT NULL
	);

	
		















	