drop table borrowBook cascade constraints;



create table borrowBook@site2(
	memberId number,
	bookId number,
	receiveDay date default (sysdate) NOT NULL,
	expiredDay date default (sysdate + 7) NOT NULL
);




