DROP TABLE BOOK2 CASCADE CONSTRAINTS;
DROP TABLE BOOK3 CASCADE CONSTRAINTS;
CREATE TABLE BOOK2 (
	bookId number, 
	bookTitle varchar2(50) NOT NULL, 
	bookAuthor varchar2(30) NOT NULL, 
	bookGenre varchar2(20) NOT NULL,
	bookPrice number NOT NULL,
        PRIMARY KEY(bookId)
); 

CREATE TABLE BOOK3 (
	bookId number,  
	bookQuantity number NOT NULL,
	bookAvailable varchar2(10) NOT NULL,
        PRIMARY KEY(bookId)
); 