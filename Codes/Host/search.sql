CREATE OR REPLACE FUNCTION search(num IN number, name IN varchar2)
RETURN number
  IS

  id BOOK.bookId%TYPE;
  title BOOK.bookTitle%TYPE;
  author BOOK.bookAuthor%TYPE;
  genre BOOK.bookGenre%TYPE;
  price BOOK.bookPrice%TYPE;
  quantity BOOK3.bookQuantity%TYPE;
  available BOOK3.bookAvailable%TYPE;

  CURSOR title_cur is
  SELECT * FROM (( Select book.bookid,bookTitle,bookAuthor,bookGenre,bookPrice from BOOK Inner Join BOOK3 On Book.bookid=Book3.bookid where bookTitle=name) UNION ( Select book2.bookid,bookTitle,bookAuthor,bookGenre,bookPrice from BOOK2 Inner Join BOOK3 On Book2.bookid=Book3.bookid WHERE bookTitle=name));

  CURSOR author_cur is
    SELECT * FROM (( Select book.bookid,bookTitle,bookAuthor,bookGenre,bookPrice from BOOK Inner Join BOOK3 On Book.bookid=Book3.bookid WHERE bookAuthor=name) UNION ( Select book2.bookid,bookTitle,bookAuthor,bookGenre,bookPrice from BOOK2 Inner Join BOOK3 On Book2.bookid=Book3.bookid WHERE bookAuthor=name));

  CURSOR genre_cur is
   SELECT * FROM (( Select book.bookid,bookTitle,bookAuthor,bookGenre,bookPrice from BOOK Inner Join BOOK3 On Book.bookid=Book3.bookid WHERE bookGenre=name) UNION ( Select book2.bookid,bookTitle,bookAuthor,bookGenre,bookPrice from BOOK2 Inner Join BOOK3 On Book2.bookid=Book3.bookid WHERE bookGenre=name));

BEGIN

	if (num = 1) then
	OPEN title_cur;
	LOOP
		FETCH title_cur INTO id,title,author,genre,price;
		EXIT WHEN title_cur%notfound;
		DBMS_OUTPUT.PUT_LINE((id)||' '||(title)||' '||(author)||' '||(genre)||' '||(price)||' '||(quantity)||' '||(available));
	
	END LOOP;
	CLOSE title_cur;

	elsif (num = 2) then
	OPEN author_cur;
	LOOP
		FETCH author_cur INTO id,title,author,genre,price;
		EXIT WHEN author_cur%notfound;
		DBMS_OUTPUT.PUT_LINE((id)||' '||(title)||' '||(author)||' '||(genre)||' '||(price)||' '||(quantity)||' '||(available));
    
	END LOOP;
	CLOSE author_cur;

	elsif (num = 3) then
	OPEN genre_cur;
	LOOP
		FETCH genre_cur INTO id,title,author,genre,price;
		EXIT WHEN genre_cur%notfound;
		DBMS_OUTPUT.PUT_LINE((id)||' '||(title)||' '||(author)||' '||(genre)||' '||(price)||' '||(quantity)||' '||(available));

	END LOOP;
	CLOSE genre_cur;

	else 
		DBMS_OUTPUT.PUT_LINE('Not Found');

	end if;	
	return 0;

END search;
/
