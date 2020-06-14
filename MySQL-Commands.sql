# To add a user hakan with all privileges
sudo mysql -u root
USE mysql;
CREATE USER 'hakan'@'localhost' IDENTIFIED BY '';
GRANT ALL PRIVILEGES ON *.* TO 'hakan'@'localhost';
UPDATE user SET plugin='auth_socket' WHERE User='hakan';
FLUSH PRIVILEGES;
exit;

sudo systemctl start mysql
/usr/bin/mysql -u root -p
/usr/bin/mysql -u hakan -p

# to get warnings instead of errors
set sql_mode='';

show databases;
CREATE DATABASE <name>;
DROP DATABASE <name>;
USE <db_name>;
SELECT database(); # shows the currently used database
select user();# shows currently logged in user

Numeric Types: INT
String Types: VARCHAR  
	(a Variable-Length String)
  1-255 Chars

CREATE TABLE tablename
  (
	column_name  data_type(len),
  column_name  data_type
  );

CREATE TABLE cats
  (
	name  VARCHAR(100),
	ageINT
  );

SHOW TABLES;
SHOW COLUMNS FROM <tablename>; OR
DESC <tablename>;

DROP TABLE <tablename>;

CREATE TABLE cats
 (
  cat_id INT NOT NULL AUTO_INCREMENT,
  name VARCHAR(100),
  age INT,
  PRIMARY KEY(cat_id)
 );

mysql-ctl cli
 
use cat_app;
 
source first_file.sql
 
DESC cats;
 
 
 
INSERT INTO cats(name, age)
VALUES('Charlie', 17);
 
INSERT INTO cats(name, age)
VALUES('Connie', 10);
 
SELECT * FROM cats;
 
source testing/insert.sql




INSERT INTO cats(name, age) VALUES ('Jetson', 7);
SELECT * FROM cats;

INSERT INTO cats(name, age) VALUES ('Charlie', 10), ('Sadie', 3), ('Lazy Bear', 1);

-- how to insert a string (VARCHAR) value that contains quotations;
-- "This text has 'quotes' in it" or 'This text has "quotes" in it'

SHOW WARNINGS;

CREATE TABLE cats2 ( name VARCHAR(100) NOT NULL, age INT NOT NULL);

CREATE TABLE cats3 ( name VARCHAR(100) DEFAULT 'unnamed', AGE INT DEFAULT 99 );

create table unique_cats (
  cat_id int not null,
  name varchar(100),
  age int,
  primary key (cat_id)
);

create table unique_cats2 (
  cat_id int not null auto_increment,
  name varchar(100),
  age int,
  primary key (cat_id)
);

SELECT * FROM cats WHERE name='Egg'
SELECT * FROM cats WHERE name='egG'  -- where clause does case insensitive search

SELECT cat_id, name, age from cats; # only specified columns

SELECT cat_id FROM cats;

SELECT name, breed FROM cats;

SELECT name, age FROM cats WHERE breed='Tabby';

SELECT cat_id, age FROM cats WHERE cat_id=age;

SELECT * FROM cats WHERE cat_id=age;

select cat_id as id, name from cats; # aliases

SELECT name AS 'cat name', breed AS 'kitty breed' FROM cats;

update cats set breed='Shorthair' where breed='Tabby';

update cats set age=14 where name='Misty';

SELECT * FROM cats WHERE name='Jackson';

UPDATE cats SET name='Jack' WHERE name='Jackson';

SELECT * FROM cats WHERE name='Jackson';
 
SELECT * FROM cats WHERE name='Jack';
 
SELECT * FROM cats WHERE name='Ringo';
 
UPDATE cats SET breed='British Shorthair' WHERE name='Ringo';
 
SELECT * FROM cats WHERE name='Ringo';
 
SELECT * FROM cats;
 
SELECT * FROM cats WHERE breed='Maine Coon';
 
UPDATE cats SET age=12 WHERE breed='Maine Coon';
 
SELECT * FROM cats WHERE breed='Maine Coon';

DELETE FROM cats WHERE name='Egg';

DELETE FROM cats WHERE age=4;

DELETE FROM cats WHERE cat_id=age;

DELETE FROM cats;

create table shirts (
  shirt_id int primary key auto_increment,
  article varchar(100) not null,
  color varchar(100) not null,
  shirt_size varchar(5) not null,
  last_worn int not null
);

INSERT INTO shirts(article, color, shirt_size, last_worn) VALUES
('t-shirt', 'white', 'S', 10),
('t-shirt', 'green', 'S', 200),
('polo shirt', 'black', 'M', 10),
('tank top', 'blue', 'S', 50),
('t-shirt', 'pink', 'S', 0),
('polo shirt', 'red', 'M', 5),
('tank top', 'white', 'S', 200),
('tank top', 'blue', 'M', 15);

insert into shirts(article, color, shirt_size, last_worn) values ('polo shirt', 'purple', 'M', 50)

alter table shirts modify shirt_size varchar(5)
update shirts set color='off white', shirt_size='XS' where color='white'

SELECT article, color FROM shirts;
 
SELECT * FROM shirts WHERE shirt_size='M';
 
SELECT article, color, shirt_size, last_worn FROM shirts WHERE shirt_size='M';

UPDATE shirts SET shirt_size='L' WHERE article='polo shirt';

UPDATE shirts SET last_worn=0 WHERE last_worn=15;

UPDATE shirts SET color='off white', shirt_size='XS' WHERE color='white';

DELETE FROM shirts WHERE last_worn>=200;

DELETE FROM shirts WHERE article='tank top';

DELETE FROM shirts;

DROP TABLE shirts;

source file_name.sql

select * from shirts where last_worn>=200
delete from shirts where last_worn>=200

-- STRING FUNCTIONS

select author_fname, author_lname from books

select concat(author_fname, ' ', author_lname) from books

select concat(author_fname, ' ', author_lname) as 'full name' from books

select author_fname as first, author_lname as last,
concat(author_fname, ' ', author_lname) as full from books

select concat_ws('-', title, author_fname, author_lname) as result from books

select substring('Hello world', 1, 4) -- Hell
select substring('Hello world', 7)  -- world
select substring('Hello world', -3)  -- rld
select substring(title, 1, 10) as short_title from books
select
	concat(
		substring(title, 1, 10),
		'...'
	)
  as short_title
from books

select replace('Hello World', 'Hell', '%$#@')
select replace('HellO World', 'o', '*') -- HellO W*rld -> case sensitive replacement
select replace('cheese bread coffee milk', ' ', ' and ');

select replace(title, 'e', '3') from books

select
 substring(
		replace(title, 'e', '3'),
  1,
  10
 )
 as 'weird_string'
from books

select
	concat(
		substr(
			replace(title, 'e', '3'),
      1,
      10
  ),
  '...'
 ) as 'shortened title'
from books


select reverse('hello world')
select reverse(author_fname) from books
select concat(author_fname, reverse(author_fname)) from books

select char_length('Hello World')
select author_lname, char_length(author_lname) as 'lenght' from books

-- The REPLACE() function, as well as the other string functions, only change the query output,
-- they don't affect the actual data in the database.

select
	concat(
		author_fname,
    ' is ',
    char_length(author_fname),
    ' characters long'
 ) as 'title'
from books

select upper('Hello World')
select lower('Hello World')

select
 concat(
		'My favorite book is ',
		upper(title)
	) as 'favorite'
from books;


SELECT
  UPPER(
    CONCAT(
      author_fname,
      ' ',
      author_lname)
    ) AS 'full name in caps'
FROM books;


select upper(reverse("Why does my cat look at me with such hatred?"))


select
  replace(title, ' ', '->') as 'new_title'
from books;

select
  author_lname as forwards,
  reverse(author_lname) as backwards
from books;

select
	upper(
		concat(author_fname, ' ', author_lname)
 ) as 'full name in caps'
from books;


select
	concat(title, ' was released ', released_year)
  as 'description'
from books

select
	title,
  char_length(title) as 'characters count'
from books

select
	concat(title, '...') as 'short title',
  concat(author_lname, ',', author_fname) as 'author',
  concat(stock_quantity, ' in stock') as 'quantity'
from books

-- REDIFINING OUR SELECTIONS
select distinct released_year from books

select distinct author_lname from books  -- 2 authors with lname Harris
-- what about distinct full name?
-- way # 1
select distinct
  concat(author_fname, ' ', author_lname)
  as 'author'
from books
-- way # 2
select distinct author_fname as 'firstname', author_lname as 'lastname' from books

-- sorting our results -> ORDER BY --> ascending by default
select author_lname from books order by author_lname
select title from books order by title  asc --
select title from books order by title desc
select * from books order by released_year desc  -- list the latest book to oldest books
select title, author_fname, author_lname from books order by author_fname asc
select title, author_fname, author_lname from books order by 2 asc  -- 2 refers to author_fname
select author_fname, author_lname from books order by author_lname, author_fname

-- LIMIT our results; mostly used with order by
select title, released_year from books order by released_year desc limit 5
select title, released_year from books order by released_year desc limit 0,5  -- start from 0.th book, pick 5 books
select title from books limit 5, 18383939292  -- start index 5 (6.th book), all the way to the end
SELECT * FROM tbl LIMIT 95,18446744073709551615

-- LIKE
WHERE author_fname LIKE '%da%'  -- % is wildcard, case insensitive
select title, author_fname from books where author_fname like '%da%'
select title, author_fname from books where author_fname like 'da%'
select title, author_fname, stock_quantity from books where stock_quantity like '____'
select title, author_fname, stock_quantity from books where stock_quantity>=1000 AND stock_quantity<=9999
-- what if i am searching for a book title that has a % or _ in it?
select title, author_fname, stock_quantity from books where title like '%\%%'
select title, author_fname, stock_quantity from books where title like '%\_%'


-- EXERCISES: DISTICT, ORDER BY, LIMIT and LIKE
select title from books where title like '%stories%'
select title, pages from books order by pages desc limit 1
select concat(title, '-', released_year) as summary from books order by released_year desc limit 3
select
  title,
  author_lname
from books
where author_lname like '% %'

select
  title,
  released_year,
  stock_quantity
from books
order by stock_quantity asc limit 3

select
  title,
  author_lname
from books
order by author_lname, title

select
  upper(
	concat(
		'My favorite author is ',
        author_fname,
        ' ',
        author_lname
    )
   ) as 'yell'
from books


-- AGGREGATE FUNCTIONS
select count(*) from books
select count(author_fname) from books
select count(distinct author_fname, author_lname) from books
select count(*) from books where title like '%the%'

-- If you are using MySQL 5.7+ or even 8+, you can get error code 1055
-- on some queries with GROUP BY without specifying an aggregate function on one of the columns, for example:
SELECT title, author_lname FROM books GROUP BY author_lname;
-- The error means that MySQL does not know which rows to return as some author_lname's have several rows with different books.
-- In the previous versions of MySQL, the DB just returned the first or any other random row available.
-- However, in newer versions of MySQL this behaviour was deprecated by default in favour of the SQL/92 and SQL/99 standards.
-- Those standards require that the query must have some way of utilizing all rows for the grouped column, for example by counting them as in:
SELECT author_lname, COUNT(*) FROM books GROUP BY author_lname;
-- This article can clarify it further for you: https://gabi.dev/2016/03/03/group-by-are-you-sure-you-know-it/


SELECT @@GLOBAL.sql_mode;
-- ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION
SET @@GLOBAL.sql_mode = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION'

-- /etc/mysql/my.cnf
sudo service mysql restart

select title, author_lname from books group by author_lname
select author_fname, count(*) from books group by author_fname
select author_fname, author_lname, count(*) as '# of books published' from books group by author_fname, author_lname
select author_fname, author_lname from books group by author_lname
select author_fname, author_lname, count(*) from books group by author_lname, author_fname
select released_year, count(*) from books group by released_year
select released_year, count(*) as 'book count' from books group by released_year
-- below returns blob
select concat('In ', released_year, ' ', count(*), ' book(s) released') from books group by released_year

-- MIN & MAX -- without GROUP BY
select min(released_year) from books
select max(pages) from books
-- get the title of longest book
  select title, pages from books where pages=max(pages)   -- doesnt work
  select title, pages from books where pages=(select max(pages) from books)  -- via subquery works, 2 queries executed
  -- OR
  select title, pages from books order by pages desc limit 1  -- one query executed

-- MIN & MAX -- with GROUP BY
  -- find the year each author published their first book
  select author_fname, author_lname, min(released_year) from books group by author_fname, author_lname

  -- find the longest page count for each author
  select author_fname, author_lname, max(pages) from books group by author_fname, author_lname
    -- OR
    select
    concat(author_fname, ' ', author_lname) as author,
      max(pages) as 'longest book'
    from books group by author_fname, author_lname

-- SUM -- without GROUP BY
    -- sum all pages in the entire database
    select sum(pages) from books

-- SUM -- with GROUP BY
    -- sum all the pages each author has written
    select author_fname, author_lname, sum(pages) from books group by author_fname, author_lname

-- AVG -- without GROUP BY
   -- calculate the avarage pages from all books
   select avg(pages) from books
 -- calculate the average released year across all books
  select avg(released_year) from books

-- AVG -- with GROUP BY
  -- calculate avg stock quantity for the books released in the same year
  select released_year, avg(stock_quantity) from books group by released_year
  -- calculate avg pages written by every unique author
  select author_fname, author_lname, avg(pages) from books group by author_fname, author_lname

-- CHALLANGES :  GROUP BY, COUNT, MIN & MAX, SUM, AVG
  -- print the number of books in the database
  select count(*) from books

  -- print how many books were released in each year
  select released_year, count(*) from books group by released_year

  -- print the total number of books in stock
  select sum(stock_quantity) from books

  -- find the average released year for each author
  select author_fname, author_lname, avg(released_year) from books group by author_fname, author_lname

  -- find the full name of the author who wrote the longest book
  select concat(author_fname, ' ',author_lname) as 'fullname', pages from books order by pages desc limit 1

  select released_year as 'year', count(*) as '# books', avg(pages) as 'avg pages' from books group by released_year

-- DATA TYPES
  -- CHAR vs. VARCHAR
    -- We use CHAR when we are %100 sure that text has a fixed length (i,e, state abbriviations NY, AZ etc)
    CREATE TABLE dogs (name CHAR(5), breed VARCHAR(10));
    INSERT INTO dogs (name, breed) VALUES ('bob', 'beagle');
    INSERT INTO dogs (name, breed) VALUES ('robby', 'corgi');
    INSERT INTO dogs (name, breed) VALUES ('Princess Jane', 'Retriever');
    SELECT * FROM dogs;
    INSERT INTO dogs (name, breed) VALUES ('Princess Jane', 'Retrievesadfdsafdasfsafr');
    SELECT * FROM dogs;

  -- INT vs. DECIMAL
    -- DECIMAL(MAX_DIGITS, NUM_OF_DIGITS_AFTER_DECIMAL)
      -- Decimal(5,2) i.e. max 999.99
      CREATE TABLE items(price DECIMAL(5,2));
      INSERT INTO items(price) VALUES(7);
      INSERT INTO items(price) VALUES(7987654);  --> 999.99 max number
      INSERT INTO items(price) VALUES(34.88);
      INSERT INTO items(price) VALUES(298.9999);  -- rounded up to 299.00
      INSERT INTO items(price) VALUES(1.9999);    -- rounded up to 2.00
      SELECT * FROM items;

  -- DECIMAL vs FLOAT & DOUBLE
    -- The DECIMAL data type is fixed-point type and calculations are exact
    -- The FLOAT and DOUBLE data types are floating-point types and calculations are approximate
      -- The FLOAT and DOUBLE store larger numbers using less memory space at the cost of precision
      -- FLOAT takes 4 bytes and precision issues is ~7 digits
      -- DOUBLE takes 8 bytes and precision issues is ~15 digits
          CREATE TABLE thingies (price FLOAT);
          INSERT INTO thingies(price) VALUES (88.45);
          SELECT * FROM thingies;
          INSERT INTO thingies(price) VALUES (8877.45);
          SELECT * FROM thingies;
          INSERT INTO thingies(price) VALUES (8877665544.45);  --> totally broken when stored
          SELECT * FROM thingies

  -- DATES & TIMES
    -- DATE: Values with a Date But No time; YYYY-MM-DD
    -- TIME: with a time but no DATE; HH:MM:SS Format
    -- DATETIME: YYYY-MM-DD HH:MM:SS format
    create table people (
      name varchar(100),
        birthdate date,
        birthtime time,
        birthdt datetime
    )

    INSERT INTO people (name, birthdate, birthtime, birthdt)
    VALUES('Padma', '1983-11-11', '10:07:35', '1983-11-11 10:07:35');

    INSERT INTO people (name, birthdate, birthtime, birthdt)
    VALUES('Larry', '1943-12-25', '04:10:42', '1943-12-25 04:10:42');

    --CURDATE() - gives current date
    --CURTIME() - gives current time
    --NOW() - gives current date time
      select curdate()
      select curtime()
      select now()

      insert into people(name, birthdate, birthtime, birthdt) values
      ('Microwave', curdate(), curtime(), now())
    -- DATE & TIME functions
    select name, birthdate, day(birthdate) from people     --> day -> 23
    select name, birthdate, dayname(birthdate) from people --> dayname -> fri
    select name, birthdate, dayofyear(birthdate) from people
    select name, birthdate, monthname(birthdt) from people

    select
      concat(
        monthname(birthdt),
            ' ',
            day(birthdt),
            'st ', --> how about 0th, 1st, 2nd, 3rd suffixes?
            year(birthdt)
      )
    from people

      -- instead of the above partially functioning concat,
      -- use DATEFORMAT
      select date_format(birthdt, '%M %D %Y') from people
      select date_format(birthdt, '%e/%c/%Y at %h:%m') from people

  -- DATE ARITHMETIC
    -- DATEDIFF
        select name, datediff(now(), birthdt) as 'num of days' from people

    -- DATE_ADD / DATE_SUB
        select name, date_add(birthdt, interval 1 month) from people
        select name, birthdt + interval 1 month from people
        select name, date_sub(birthdt, interval 1 month) from people
        select name, birthdt - interval 1 month from people

        select name, birthdt, birthdt + interval 1 month - interval 2 hour from people

  -- DATETIME and TIMESTAMP Data Types
     -- The DATETIME type is used for values that contain both date and time parts.
     -- MySQL retrieves and displays DATETIME values in 'YYYY-MM-DD hh:mm:ss' format.
     -- The supported range is '1000-01-01 00:00:00' to '9999-12-31 23:59:59'.
     -- The TIMESTAMP data type is used for values that contain both date and time parts.
     -- TIMESTAMP has a range of '1970-01-01 00:00:01' UTC to '2038-01-19 03:14:07' UTC.
     -- TIMESTAMP uses less space then DATETIME in db
     create table comments (
	      content varchar(100),
        created_at timestamp default now()
      )
      insert into comments(content) values('lol, funny article')
      insert into comments(content) values('this is interesting')

     create table comments2 (
	      content varchar(100),
        created_at timestamp default now(),
        changed_at timestamp default now() on update current_timestamp  --> current_timestamp / now()
      )
    insert into comments2(content) values('Cool!')
    insert into comments2(content) values('Interesting!')
    select * from comments2
    update comments2 set content='I love this!' where content='Interesting!'
    select * from comments2
    -- ??? How to replace love with like?

-- EXERCISES DATA_TYPES
   -- char vs varchar
   -- int vs decimal
   -- decimal vs float & double
   -- dates and times
   -- 	date
   -- 	time
   -- 	datetime
   -- datetime functions
   -- 	select curdate()
   -- 	select curtime()
   -- 	select now()
   -- 	date_format()

   -- 	date_add() + interval
   -- 	date_sub() + interval

   -- datetime vs timestamp datatypes
   --      create table comments2 (
   -- 	      content varchar(100),
    --        created_at datatype default now(),
     --       changed_at datatype default now() on update now()  --> current_timestamp / now()
    --      )
create table inventories (
	id int not null primary key auto_increment,
	item_name  varchar(255) not null,
  price decimal(8,2) not null default 0.0,
  quantity int not null default 0
)

select dayofweek(now())
select date_format(now(), '%w')  --> Day of the week (0=Sunday..6=Saturday)
select date_format(now(), '%W')  --> Weekday name (Sunday..Saturday)
select date_format(now(), '%m/%d/%Y')
select date_format(now(), '%M %D at %l:%i %p')

create table tweets (
	  username varchar(20) not null primary key, --> Would prevent multiple tweets by the same user!
    content varchar(140) not null,
    created_at datetime not null default now()
)
insert into tweets(content, username) VALUES ('Hello world!', 'hakaniemi')

create table tweets (
	username varchar(20) not null,  --> multiple tweets by the same user is allowed
  content varchar(140) not null,
  created_at datetime not null default now()
)

insert into tweets(content, username) VALUES ('First tweet', 'hakaniemi')
insert into tweets(content, username) VALUES ('Second tweet', 'hakaniemi')

-- LOGICAL OPERATORS
  -- NOT EQUAL (!=)
    select title, released_year from books where released_year!=2017
    select title, released_year from books where author_lname!='Harris'
  -- NOT LIKE
    select title, released_year from books where title not like '%the%'
    SELECT title FROM books WHERE title NOT LIKE 'W%';
  -- GREATER THAN
    select * from books where released_year > 2000 order by released_year
  -- GREATER THAN OR EQUAL TO
    select * from books where released_year >= 2000 order by released_year
    select title, stock_quantity from books where stock_quantity >= 100 order by stock_quantity desc
  -- LESS THAN
    select * from books where released_year < 2000 order by released_year
  -- LESS THAN OR EQUAL TO
    select * from books where released_year <= 2000 order by released_year
  -- AND (&&)
    select * from books where author_fname='Dave' and author_lname='Eggers' and released_year > 2010 order by released_year desc
    select title, author_fname, author_lname, released_year from books where released_year >= 2004 and released_year <= 2015 order by released_year desc
      select title, author_fname, author_lname, released_year from books where released_year between 2004 and 2015 order by released_year desc
  -- OR(||)
    select title, author_fname, author_lname, stock_quantity from books where author_lname='Eggers' or released_year > 2010 or stock_quantity > 100 order by title asc
  -- header BETWEEN min AND max
  -- header NOT BETWEEN min AND max
    select title, author_fname, author_lname, released_year from books where released_year between 2004 and 2015 order by released_year desc
    select title, author_fname, author_lname, released_year from books where released_year not between 2004 and 2015 order by released_year desc
    -- Note: if header is NOT of the same type as min or max, cast them all to the same data type using CAST(header as data_type)
    select * from people where birthdate between cast('1980-01-01' as date) and cast('2000-01-01' as date)
  -- CAST(header as data_type)
    select cast('2020-05-31' as date)
    select * from people where birthdate between cast('1980-01-01' as date) and cast('2000-01-01' as date)
  -- IN
  SELECT title, author_lname FROM books WHERE author_lname='Carver' OR author_lname='Lahiri' OR author_lname='Smith'
  SELECT title, author_lname FROM books WHERE author_lname In ('Carver','Lahiri','Smith')
  -- NOT IN
  SELECT title, author_lname FROM books WHERE author_lname not in ('Carver','Lahiri','Smith')
  SELECT * FROM books WHERE released_year >= 2000 and author_lname not in ('Carver','Lahiri','Smith') order by released_year desc

  SELECT title, released_year FROM books
    WHERE released_year >= 2000
    AND released_year NOT IN (2000,2002,2004,2006,2008,2010,2012,2014,2016) ORDER BY released_year DESC;
  -- OR;
    SELECT title, released_year FROM books
    WHERE released_year >= 2000 AND
    released_year % 2 != 0;
  -- CASE
    SELECT title, released_year,
       CASE
         WHEN released_year >= 2000 THEN 'Modern Lit'
         ELSE '20th Century Lit'
       END AS GENRE
    FROM books order by released_year desc;

    SELECT title, stock_quantity,
    CASE
        WHEN stock_quantity BETWEEN 0 AND 50 THEN '*'
        WHEN stock_quantity BETWEEN 51 AND 100 THEN '**'
        ELSE '***'
    END AS STOCK
    FROM books;

    SELECT title, stock_quantity,
      CASE
          WHEN stock_quantity <= 50 THEN '*'
          WHEN stock_quantity <= 100 THEN '**'
          ELSE '***'
      END AS STOCK
    FROM books;

-- EXERCISES: LOGICAL OPERATORS
  -- 	!=,
  -- 	not like,
  -- 	>, <, <=, >=,
  -- 	and (&&),
  -- 	or (||),
  -- 	between, cast,
  -- 	in,
  -- 	not in,
  -- 	case
  --

  -- Select all books written b4 1980 non inclusive
  select * from books where released_year < 1980

  -- select all the books written by Eggers or Chabon
  select * from books where author_lname in ('Eggers', 'Chabon')

  -- select all books written by Lahiri, published after 2000
  select * from books where author_lname = 'Lahiri' and released_year > 2000

  -- select all books where page count is between 100 and 200
  select * from books where pages between 100 and 200

  -- select all books where author_lname starts with a 'C' or an 'S'
  select * from books where author_lname = 'C%' or author_lname = 'S%'  --> Wrong
  select * from books where author_lname like 'C%' or author_lname like 'S%' --> OK

  -- If title contains 'stories' -> 'short stories'
  -- If title is 'just kids' or 'A Heartbreaking Work of Staggering Genius' -> memoir
  -- everything else -> novel
  select title, author_fname, author_lname,
    case
      when title like '%stories%' then 'Short Stories'
      when title in ('just kids', 'A Heartbreaking Work of Staggering Genius') then 'Memoir'
      else 'Novel'
      end as 'TYPE'
  from books

  -- Bonus exercise
  select author_fname, author_lname,
	case
		when count(*) = 0 then 'no books'
        when count(*) = 1 then '1 book'
        else concat(count(*), ' books')
    end as count
  from books group by author_fname, author_lname

-- DATA RELATIONSHIP BASICS
  -- One to One Relationship :
      -- i.e. Customers - CustomerDetails
        -- one customer row is associated with one customer details row
  -- One to Many Relationship
      -- i.e.  a Book vs. Reviews
        -- a book has many reviews
        -- a review has only one book
  -- Many to Many Relationship
      -- i.e. books vs authors
        -- books can have many authors
        -- authors can have many books

-- One to Many Relationship : foreign key
  -- i.e. a customer & orders
  create table customers (
	  id int primary key auto_increment,
    first_name varchar(100) not null,
    last_name varchar(100) not null,
    email varchar(100) not null
  )

  create table orders(
    id int primary key auto_increment,
    order_date date not null,
    amount decimal(8,2) not null default 0.00,
    customer_id int not null,
    foreign key(customer_id) references customers(id)
  )

  INSERT INTO customers (first_name, last_name, email) 
  VALUES ('Boy', 'George', 'george@gmail.com'),
        ('George', 'Michael', 'gm@gmail.com'),
        ('David', 'Bowie', 'david@gmail.com'),
        ('Blue', 'Steele', 'blue@gmail.com'),
        ('Bette', 'Davis', 'bette@aol.com');

  INSERT INTO orders (order_date, amount, customer_id)
  VALUES ('2016/02/10', 99.99, 1),
        ('2017/11/11', 35.50, 1),
        ('2014/12/12', 800.67, 2),
        ('2015/01/03', 12.50, 2),
        ('1999/04/11', 450.25, 5);

  -- How to select all orders made by 'Boy George'?
    -- a 2 step process
    select id from customers where first_name='Boy' and last_name='George'  --> returns id 1
    select * from orders where customer_id=1
    -- another 2 step process using subquery
    select * from orders where customer_id=(select id from customers where first_name='Boy' and last_name='George')

    -- implicit cross join; combining every customer with every order
    select * from customers, orders

    -- implicit inner join; using cross join with a condition; combining every customer with every order
    select * from customers, orders where customers.id = orders.customer_id
      -- explicit inner join
      select * from customers inner join orders on customers.id = orders.customer_id

    -- implicit inner join;
    select first_name, last_name, order_date, amount from customers, orders where customers.id = orders.customer_id

    -- explicit inner join using JOIN <table> ON <condition> (preferred)
    select first_name, last_name, order_date, amount from customers inner join orders on customers.id = orders.customer_id

    -- can use ordering/functions/operators/groups on the joint table
    select first_name, last_name, order_date, amount from customers join orders on customers.id = orders.customer_id order by amount
      -- Find the customer that spent the most money in first_name, last_name, total_spent
      select
        first_name,
        last_name,
        sum(amount) as 'total_spent'
      from customers
      join orders on customers.id = orders.customer_id
      group by orders.customer_id
        order by total_spent desc limit 1

  -- LEFT JOIN
    -- Select everything from table A (e.g. customers), along with any matching records in table B (e.g. orders)
    select * from customers left join orders on customers.id = orders.customer_id
    select first_name, last_name, order_date, amount from customers left join orders on customers.id = orders.customer_id
    -- When to use a left join?
      -- For example, when we want to know users that did not place any order
      select
        first_name,
        last_name,
        ifnull(sum(amount), 0) as total_spent
      from customers
      left join orders on customers.id = orders.customer_id
      group by orders.customer_id
      order by total_spent desc

  -- RIGHT JOIN
    -- Select everything from B (e.g. orders), along with any matching records in A (e.g. customer)
    select * from customers right join orders on customers.id = orders.customer_id

  -- ON DELETE CASCADE
    -- If we have a foreign key relationship when we delete a parent (e.g. a customer),
    -- the children (e.g. orders) are also deleted automatically
      create table customers (
      id int primary key auto_increment,
        first_name varchar(100) not null,
        last_name varchar(100) not null,
        email varchar(100) not null
      )

      create table orders(
        id int primary key auto_increment,
          order_date date,
          amount decimal(8,2) not null default 0.00,
          customer_id int,
          foreign key(customer_id) references customers(id) on delete cascade
      )

  -- Q: Are left & right joins the same if we swap the tables A and B: Yes
    SELECT * FROM customers
    LEFT JOIN orders
        ON customers.id = orders.customer_id;
    -- the same as;
    SELECT * FROM orders
    RIGHT JOIN customers
        ON customers.id = orders.customer_id;

    SELECT * FROM orders
    LEFT JOIN customers
        ON customers.id = orders.customer_id;
    -- the same as;
    SELECT * FROM customers
    RIGHT JOIN orders
        ON customers.id = orders.customer_id;

-- EXERCISES: 1 to Many : Joints
create table students (
	id int not null primary key auto_increment,
  first_name varchar(100) not null,
  last_name varchar(100) not null
)

create table papers (
  id int not null primary key auto_increment,
  title varchar(255) not null,
  grade int default 0,
  student_id int not null,
  foreign key(student_id) references students(id) on delete cascade
)

INSERT INTO students (first_name, last_name) VALUES
('Caleb', 'Celebi'),
('Samantha', 'Fox'),
('Raj', 'George'),
('Carlos', 'Carrera'),
('Lisa', 'Huston');

INSERT INTO papers (student_id, title, grade ) VALUES
(1, 'My First Book Report', 60),
(1, 'My Second Book Report', 75),
(2, 'Russian Lit Through The Ages', 94),
(2, 'De Montaigne and The Art of The Essay', 98),
(4, 'Borges and Magical Realism', 89);

-- list papers with their students in the format first_name, title, grade. Ordered in grade in descending order
select first_name, title, grade from students
inner join papers on students.id = papers.student_id
order by grade desc

-- list ALL students with their papers if any, if no paper then show null in paper's fields
select first_name, title, grade from students
left join papers on students.id = papers.student_id

-- list ALL students with their papers if any, if no paper then show MISSING in title and 0 in grade. Ordered in grade in descending order
select first_name, ifnull(title, 'MISSING') as 'title', ifnull(grade, 0.00) as 'grade' from students
left join papers on students.id = papers.student_id
order by grade desc

-- What does this do ???
  -- It picks random entries from grouped tables and if the grade is not null it shows it as it is, otherwise it shows 0.00
select first_name, last_name,
	ifnull(grade, 0.00) as 'grade'
from students left join papers on students.id = papers.student_id
group by students.id

-- This wont work
select first_name, last_name, avg(grade) as 'average' from (
	select first_name, last_name, ifnull(grade, 0.00) as 'grade' from
    students left join papers on students.id = papers.student_id
	group by student.id
)
-- but this works
select first_name, last_name, ifnull(avg(grade), 0) as 'average'
from students left join papers on students.id = papers.student_id
group by students.id
order by average desc


-- This didn't work
select first_name, last_name, ifnull(avg(grade), 0) as 'average',
	case
		when average >= 75 then 'PASSING'
        else 'FAILING'
    end as 'passing_status'
from students left join papers on students.id = papers.student_id
group by students.id
order by average desc
-- but this works
select first_name, last_name, ifnull(avg(grade), 0) as 'average',
	case
      when avg(grade) is null then 'FAILING'
      when avg(grade) >= 75 then 'PASSING'
      else 'FAILING'
    end as 'passing_status'
from students left join papers on students.id = papers.student_id
group by students.id
order by average desc

-- MANY:MANY relationships
-- examples: Books vs. Authors, Blog Post vs. Tags, Students vs. Classes
create table reviewers (
	  id int not null primary key auto_increment,
    first_name varchar(100) not null,
    last_name varchar(100) not null
)

create table series (
	  id int not null primary key auto_increment,
    title varchar(255) not null,
    released_year year(4) not null,
    genre varchar(100) not null
)

INSERT INTO reviewers (first_name, last_name) VALUES
    ('Thomas', 'Stoneman'),
    ('Wyatt', 'Skaggs'),
    ('Kimbra', 'Masters'),
    ('Domingo', 'Cortes'),
    ('Colt', 'Steele'),
    ('Pinkie', 'Petit'),
    ('Marlon', 'Crafford');

INSERT INTO series (title, released_year, genre) VALUES
    ('Archer', 2009, 'Animation'),
    ('Arrested Development', 2003, 'Comedy'),
    ("Bob's Burgers", 2011, 'Animation'),
    ('Bojack Horseman', 2014, 'Animation'),
    ("Breaking Bad", 2008, 'Drama'),
    ('Curb Your Enthusiasm', 2000, 'Comedy'),
    ("Fargo", 2014, 'Drama'),
    ('Freaks and Geeks', 1999, 'Comedy'),
    ('General Hospital', 1963, 'Drama'),
    ('Halt and Catch Fire', 2014, 'Drama'),
    ('Malcolm In The Middle', 2000, 'Comedy'),
    ('Pushing Daisies', 2007, 'Comedy'),
    ('Seinfeld', 1989, 'Comedy'),
    ('Stranger Things', 2016, 'Drama');

create table reviews (
	  id int not null primary key auto_increment,
    rating decimal(2,1) not null,
    series_id int not null,
    reviewer_id int not null,
    constraint FK_ReviewsSeries foreign key(series_id) references series(id),
    constraint FK_ReviewsReviewers foreign key(reviewer_id) references reviewers(id)
)

INSERT INTO reviews(series_id, reviewer_id, rating) VALUES
    (1,1,8.0),(1,2,7.5),(1,3,8.5),(1,4,7.7),(1,5,8.9),
    (2,1,8.1),(2,4,6.0),(2,3,8.0),(2,6,8.4),(2,5,9.9),
    (3,1,7.0),(3,6,7.5),(3,4,8.0),(3,3,7.1),(3,5,8.0),
    (4,1,7.5),(4,3,7.8),(4,4,8.3),(4,2,7.6),(4,5,8.5),
    (5,1,9.5),(5,3,9.0),(5,4,9.1),(5,2,9.3),(5,5,9.9),
    (6,2,6.5),(6,3,7.8),(6,4,8.8),(6,2,8.4),(6,5,9.1),
    (7,2,9.1),(7,5,9.7),
    (8,4,8.5),(8,2,7.8),(8,6,8.8),(8,5,9.3),
    (9,2,5.5),(9,3,6.8),(9,4,5.8),(9,6,4.3),(9,5,4.5),
    (10,5,9.9),
    (13,3,8.0),(13,4,7.2),
    (14,2,8.5),(14,3,8.9),(14,4,8.9);

-- Many to Many : Reviewers, Series and Reviews Example : Exercises
-- Exercise 1 :
    -- title, rating where:
		-- title is the series title
        -- rating is the given rating of the series
select title, rating
from series inner join reviews
	on reviews.series_id = series.id

-- Exercise 2:
	-- title, avg_rating
		-- if a series has no reviews then do not include it
select title, avg(rating) as avg_rating
from series inner join reviews on series.id = reviews.series_id
group by series.id
order by avg_rating asc

-- Exercise 3:
	-- first_name, last_name, rating
select first_name, last_name, rating
from reviewers inner join reviews
	on reviewers.id = reviews.reviewer_id

-- Exercise 4:
	-- unreviewed_series
		-- Malcolm In The Middle
    -- Pushing Daisies
select title as 'unreviewed_series'
from series left join reviews
	on series.id = reviews.series_id
where rating is null

-- Exercise 5:
	-- genre, avg_rating
select
	genre,
    round(avg(rating), 2) as 'avg_rating'
from series inner join reviews
	on series.id = reviews.series_id
group by genre


-- Exercise 6: Version 1
	-- first_name, last_name, COUNT, MIN, MAX, AVG, STATUS
select
	first_name,
    last_name,
	case
		when rating is null then 0
        else count(rating)
  end as 'COUNT',
  case
		when rating is null then 0.0
    else min(rating)
  end as 'MIN',
  case
		when rating is null then 0.0
    else max(rating)
  end as 'MAX',
  case
		when rating is null then 0.0
    else avg(rating)
  end as 'AVG',
  case
		when rating is null then 'INACTIVE'
    else 'ACTIVE'
  end as 'STATUS'
from reviewers left join reviews
	on reviewers.id = reviews.reviewer_id
group by reviewers.id

-- Exercise 6: Version 2
	-- first_name, last_name, COUNT, MIN, MAX, AVG, STATUS
SELECT first_name,
       last_name,
       Count(rating)                               AS COUNT,  --> COUNT(null) yields 0
       Ifnull(Min(rating), 0)                      AS MIN,
       Ifnull(Max(rating), 0)                      AS MAX,
       Round(Ifnull(Avg(rating), 0), 2)            AS AVG,
       IF(Count(rating) > 0, 'ACTIVE', 'INACTIVE') AS STATUS
FROM   reviewers 
       LEFT JOIN reviews
              ON reviewers.id = reviews.reviewer_id
GROUP  BY reviewers.id;

-- EXERCISE 6 - Reviewer Stats With POWER USERS
SELECT first_name,
       last_name,
       Count(rating)                    AS COUNT,
       Ifnull(Min(rating), 0)           AS MIN,
       Ifnull(Max(rating), 0)           AS MAX,
       Round(Ifnull(Avg(rating), 0), 2) AS AVG,
       CASE
         WHEN Count(rating) >= 10 THEN 'POWER USER'
         WHEN Count(rating) > 0 THEN 'ACTIVE'
         ELSE 'INACTIVE'
       end                              AS STATUS
FROM   reviewers
       LEFT JOIN reviews
              ON reviewers.id = reviews.reviewer_id
GROUP  BY reviewers.id;

-- EXERCISE 7: Many to Many : Reviewer, Series and Reviews
  -- title, arting and reviewer
  select
    title,
    rating,
    concat(first_name, ' ', last_name) as 'reviewer'
  from series inner join reviews
    on series.id = reviews.series_id
  inner join reviewers
    on reviews.reviewer_id = reviewers.id
  order by title asc

-- SECTION: INSTAGRAM DB CLONE
  -- Tables
      -- Users
      -- Photos
      -- Comments
      -- Likes
      -- Hashtags
      -- Followers/Followees
create table users (
	  id integer not null primary key auto_increment,
    username varchar(255) not null unique,
    created_at datetime default now()
)

create table photos (
	  id int not null primary key auto_increment,
    image_url varchar(255) not null,
    user_id int not null,
    created_at datetime default now() not null,
    constraint PhotosUsers foreign key(user_id) references users(id) on delete cascade
)

create table comments (
    id int not null primary key auto_increment,
    comment_text varchar(255) not null,
    user_id int not null,
    photo_id int not null,
    created_at datetime default now() not null,
    constraint CommentsUsers  foreign key(user_id) references users(id) on delete cascade,
    constraint CommentsPhotos foreign key(photo_id) references photos(id) on delete cascade
)

create table likes (
	  user_id int not null,
    photo_id int not null,
    created_at datetime default now() not null,
    constraint LikesUsers  foreign key(user_id)  references users(id) on delete cascade,
    constraint LikesPhotos foreign key(photo_id) references photos(id) on delete cascade,
    primary key(user_id, photo_id)  --> ensures that user_id and photo_id pair is unique
)

create table follows (
	  follower_id int not null,
    followee_id int not null,
    created_at datetime default now(),
    constraint FollowsUsersFollowerID foreign key(follower_id) references users(id) on delete cascade,
    constraint FollowsUsersFolloweeID foreign key(followee_id) references users(id) on delete cascade,
    primary key(follower_id, followee_id) --> ensures that follower_id and followee_id pair is unique
)

create table tags (
	  id int not null primary key auto_increment,
    tag_name varchar(255) not null unique,
    created_at datetime default now() not null
)

create table photo_tags (
	  photo_id int not null,
    tag_id int not null,
    constraint Photo_TagsPhotos foreign key(photo_id) references photos(id) on delete cascade,
    constraint Photo_TagsTags   foreign key(tag_id) references tags(id) on delete cascade,
    primary key(photo_id, tag_id)
)

-- Exercise 1:
-- To reward, find the oldest 5 users
select username from users order by created_at asc limit 5

-- Exercise 2:
-- Q: What day of the week do most users register on?
select
  date_format(created_at, '%W') as 'DAY',
	count(*) as 'TOTAL'
from users
group by DAY
order by TOTAL desc

-- Exercise 3:
-- Q: Find the users who have never posted a photo
select username
from users left join photos
	on users.id = photos.user_id
where image_url is null

-- Exercise 4:
-- Q: Who has got the most likes on a single photo?
-- Sub Q: Which photo got the most likes?

    -- Sub Q: Which photo got the most likes?
    select
      photos.id as 'photo_id',
      photos.image_url,
        photos.user_id,
        count(*) as 'num_likes'
    from photos inner join likes
      on photos.id = likes.photo_id
    group by photos.id
    order by num_likes desc

    -- a. Yields wrong result
    -- # image_url, username, num_likes
    -- 'https://jarret.name', 'Alexandro35', '48'
    select
        image_url,
        users.username,
        count(*) as 'num_likes'
    from likes inner join photos
      on likes.photo_id = photos.id
    inner join users
      on likes.user_id = users.id
    group by photos.id
    order by num_likes desc limit 1

    -- b. Is this working? NO!
    -- # username, id, image_url, num_likes
    -- 'Alexandro35', '145', 'https://jarret.name', '48'
    select
        users.username,
        photos.id,
        photos.image_url,
        count(*) as 'num_likes'
    from photos inner join likes
      on photos.id = likes.photo_id
    inner join users
      on likes.user_id = users.id
    group by photos.id
    order by num_likes desc limit 1

    -- c. Correct solution
    -- # image_url, username, num_Likes
    -- 'Zack_Kemmer93', 'https://jarret.name', '48'
	select
          users.username,
          photos.image_url,
          count(*) as 'num_likes'
  from photos inner join likes
		  on photos.id = likes.photo_id
	inner join users
		  on users.id = photos.user_id
	group by photos.id
      order by num_likes desc

-- Exercise 5:
-- Q: How many times does an average user post a photo?
   -- Sub Q: What is the average number of photos for all users?
      -- total num of photos / total num of users
select  (select count(*) from photos)
/ (select count(*) from users) as 'avg'

-- Exercise 6:
-- Q: What are the top 5 most commonly used hashtags?
  -- Sub Q: What are the top 5 most commonly used hashtag ids?
      select tag_id, count(*) as 'num_photos'
      from photo_tags
      group by tag_id
      order by num_photos desc limit 5

    select
      photo_tags.tag_id,
      tags.tag_name,
      count(*) as 'num_photos'
    from photo_tags inner join tags
    on photo_tags.tag_id = tags.id
      group by tag_id
      order by num_photos desc limit 5

-- Exercise 7:
-- Q: Finding Bots : Find users who have liked every single photo on the site
-- Sub Q1: Group all the users based on their likes
-- Sub Q2: Count all the rows in sub Q1 tables

    -- Sub Q1: Group all the users based on their likes
    select *
    from users inner join likes
      on users.id = likes.user_id
    group by users.id

    -- Sub Q2: Count all the rows in sub Q1 tables
    -- note: each user can like a photo once
    select
      users.username,
        count(*) as 'num_photos'
    from users inner join likes
      on users.id = likes.user_id
    group by users.id

  select
	    users.username,
      count(*) as 'num_photos'
  from users inner join likes
	    on users.id = likes.user_id
  group by users.id
      having num_photos = (select count(*) from photos)

-- TRIGGERS
  -- Triggers are SQL statements that are run automatically
  -- when a specific table has changed
  -- Syntax:
    create trigger trigger_name
      trigger_time trigger_event on table_name for each row
      begin
        ...
      end;

  -- where:
  -- trigger_time   trigger_event on  table_name
  --  BEFORE          INSERT            photos
  --  AFTER           UPDATE            users
  --                  DELETE

  -- use cases for triggers:
  -- 1. Validating data in the table
    -- i.e. age >= 18 before an insert into users
    delimiter $$
    create trigger must_be_adult
      before insert on users for each row
      begin
        if new.age < 18
        then
            signal sqlstate '45000'  --> a generic state representing unhandled user defined exception
            set message_text = 'Must be an adult';
        end if;
      end;
    $$
    delimiter;

    create table users (
        username varchar(100) unique not null,
        age int not null
    )

    -- i.e. Preventing self follows on instagram
      delimiter $$
      create trigger cannot_follow_oneself
        before insert on follows for each row
        begin
          if new.follower_id = new.followee_id
          then
              signal sqlstate '45000'
              set message_text = 'Cannot follow oneself';
          end if;
        end;
      $$
      delimiter ;

  -- 2. Manipulating/Creating/Deleting other tables relative to your trigger table
    -- i.e. if we have instagram data, where a person can follow another,
    -- it might be useful when somebody unfollow someone;
        -- right after a follow is deleted, we are going to create
        -- some new row in unfollows
      delimiter $$
      create trigger capture_unfollows
        after delete on follows for each row
        begin
            insert into unfollows(follower_id, followee_id) values
              (old.follower_id, old.followee_id);
        end;
      $$
      delimiter ;

-- MANAGE TRIGGERS
show triggers;
drop trigger cannot_follow_oneself
-- triggers can make debugging hard!!