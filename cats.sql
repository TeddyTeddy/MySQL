drop table if exists cats;

create table cats (
  cat_id int not null auto_increment,
  name varchar(100),
  breed varchar(100),
  age int,
  primary key (cat_id)
);

desc cats;

INSERT INTO cats(name, breed, age)
VALUES ('Ringo', 'Tabby', 4),
	   ('Cindy', 'Maine Coon', 10),
       ('Dumbledore', 'Maine Coon', 11),
       ('Egg', 'Persian', 4),
       ('Misty', 'Tabby', 13),
       ('George Michael', 'Ragdoll', 9),
       ('Jackson', 'Sphynx', 7);
       
select * from cats;

select cat_id as id from cats;

update cats set breed='Short Hair' where breed='Tabby';
update cats set age=14 where name='Misty';

select * from cats where name='Jackson';
update cats set name='Jack'  where name='Jackson';

select * from cats where name='Ringo';
update cats set breed='British Shorthair' where name='Ringo';

select * from cats where breed='Maine Coon';
update cats set age=12 where breed='Maine Coon';

select * from cats where name='Egg';
delete from cats where name='Egg';

select * from cats where age=4;
delete from cats where age=4;

select * from cats where age=cat_id;
delete from cats where age=cat_id;

delete from cats;