CREATE OR REPLACE PROCEDURE addMember(
		name in MEMBER.memberName%TYPE,
		address in MEMBER.memberAddress%TYPE,
		phone in MEMBER.memberPhone%TYPE,
		password in MEMBER.memberPassword%TYPE
		)
		IS
		id1 main_MEMBER.memberid%TYPE;
		id2 main_MEMBER.memberid%TYPE;
		id3 main_MEMBER.memberid%TYPE;
		name2 main_MEMBER.memberName%TYPE;
		address2 main_MEMBER.memberAddress%TYPE;
		phone2 main_MEMBER.memberPhone%TYPE;
		password2 main_MEMBER.memberPassword%TYPE;
		rcv main_MEMBER.receivedBook%TYPE;

		cursor cur is
		select memberId,memberName,memberAddress,memberPhone,memberPassword,receivedBook from main_member where memberAddress='Mirpur' OR memberaddress='Tejgaon';
		cursor cur2 is
		select memberId,memberName,memberAddress,memberPhone,memberPassword,receivedBook from main_member where memberAddress!='Mirpur' and memberaddress!='Tejgaon';
BEGIN
  select seqAddMember.nextval into id2 from dual;
INSERT INTO main_MEMBER (memberId,memberName,memberAddress,memberPhone,memberPassword,receivedBook) VALUES (id2,name,address,phone,password,'NO');
     
    open cur;
	loop
	fetch cur into id1,name2,address2,phone2,password2,rcv;
	EXIT WHEN cur%notfound;
	if(id1=id2)then
	INSERT INTO MEMBER1 (memberId,memberName,memberAddress,memberPhone,memberPassword,receivedBook) VALUES (id1,name2,address2,phone2,password2,rcv);
    end if;
	end loop;
	close cur;
	open cur2;
	loop
	fetch cur2 into id3,name2,address2,phone2,password2,rcv;
	EXIT WHEN cur2%notfound;
	if(id3=id2)then
	INSERT INTO MEMBER2@Site2  (memberId,memberName,memberAddress,memberPhone,memberPassword,receivedBook) VALUES (id3,name2,address2,phone2,password2,rcv);
    end if;
	end loop;
	close cur2;
	
	Commit;	
END addMember;
/