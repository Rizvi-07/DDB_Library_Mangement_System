DROP TABLE Main_MEMBER CASCADE CONSTRAINTS;

CREATE TABLE main_MEMBER (
	memberId number, 
	memberName varchar2(20) NOT NULL, 
	memberAddress varchar2(30), 
	memberPhone number(11), 
	memberRegDate date default (sysdate) NOT NULL,
	memberPassword varchar2(10),
	receivedBook varchar2(10),
	expiredDate date,
        PRIMARY KEY(memberId)
); 