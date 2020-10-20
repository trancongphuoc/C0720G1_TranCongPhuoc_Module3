-- create database `test`;
create table `table_table`(
id int(11) auto_increment,
last_mane varchar(50) ,
first_name char(30),
birthday date,
constraint contacts_pk primary key (id) 
);

insert into `table_table` values(
3,
'tran',
'cong phuoc',
19/10/2000
);

alter table `table_table` add age int; 
alter table `table_table` modify age double;
alter table `table_table` drop age;
alter table `table_table` change column last_mane full_name varchar(50);
alter table `table_table` rename to tablee;