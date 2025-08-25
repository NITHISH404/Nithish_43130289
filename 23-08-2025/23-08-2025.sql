create database practice;
use practice;
create table table1(
id int not null unique,
firstname varchar(20) not null,
middlename varchar(20),
lastname varchar(20)
 );
insert into table1 (id, firstname, middlename, lastname)
values (3, 'Rahul', 'Kumar', 'Sharma'),
       (4, 'prabha', null, 'Verma');
ALTER TABLE table1
MODIFY firstname varchar(20);
ALTER TABLE table1
MODIFY firstname varchar(20) not null;
desc table1;
alter table table1
add check(id<=5);
select * from table1; 



create database shop;
use shop;
create table catagory(
cid int primary key ,
cname varchar(20) not null
);
insert into catagory values(1,'snacks'),(2,'office'),(3,'kitchen');
select * from catagory;
create table items(
iid int primary key,
iname varchar(30),
cid int not null,
foreign key(cid) references catagory(cid) 
);
insert into items values (1,'lays',1),(2,'kuruke',1),(3,'whiteboard',2),(4,'towel',3);
select * from items ;
insert into items values(5,'washing',5);
update catagory set cid='4' where cname='snacks'; 
alter table items change cid aid int;                          
SET SQL_SAFE_UPDATES = 0;