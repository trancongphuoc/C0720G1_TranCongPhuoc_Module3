-- tạo database
Create database `demo_c0720G1`;
-- tạo table student
use `demo_c0720G1`;
Create table student(
id int ,
name varchar(50),
age int
);
-- thêm data vào table student
insert into student values(1, 'Tứ', 17 );
-- hiển thị data trong table student
select * from student;
-- demo lý thuyết hôm nay
-- sửa table student, chèn thêm cột
Alter table student add column phone varchar(11);
-- SET SQL_SAFE_UPDATES = 0;
-- sửa data trong table student
update student set phone = '0934553423' where id = 1;
-- xóa table student
drop table student;
-- xóa database
drop database `demo_c0720g1`;