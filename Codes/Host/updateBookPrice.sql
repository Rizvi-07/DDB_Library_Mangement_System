CREATE OR REPLACE FUNCTION search(num IN number, price2 IN number)
RETURN number
  IS

  id BOOK.bookId%TYPE;
  title BOOK.bookTitle%TYPE;
  author BOOK.bookAuthor%TYPE;
  genre BOOK.bookGenre%TYPE;
  price BOOK.bookPrice%TYPE;
  quantity BOOK3.bookQuantity%TYPE;
  available BOOK3.bookAvailable%TYPE;



BEGIN


   
	update main_book
	set bookPrice=price2
	where bookid=num;
    SELECT * into id,title,author,genre,price FROM (( Select * from BOOK UNION Select * from  BOOK2 )) where bookid=num;
    if(price2<100 and price<100) then
	update book
	set bookPrice=price2
	where bookid=num;
	elsif(price2<100 and price>100) then
	delete from book2
	where bookid=num;
	INSERT into book(bookid,booktitle,bookauthor,bookgenre,bookprice) values (id,title,author,genre,price2);
	elsif(price2>100 and price<100) then
	delete from book
	where bookid=num;
	INSERT into book2(bookid,booktitle,bookauthor,bookgenre,bookprice) values (id,title,author,genre,price2);
	elsif (price2>100 and price>100) then
	update book2
	set bookPrice=price2
	where bookid=num;
	return 0;
    end if;
     
	

	

	return 0;

END search;
/
