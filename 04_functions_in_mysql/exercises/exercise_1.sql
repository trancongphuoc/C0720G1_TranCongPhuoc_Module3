Create table students(
id int primary key auto_increment,
name varchar(50),
age int,
course varchar(50),
cost double
);

Insert into students(name,age,course,cost) values (
'Viet',
19,
'DTVT',
320000
);

select * from students where students.name = 'Huong';
select sum(cost) from students where students.name = 'Huong';
select distinct name from students;

