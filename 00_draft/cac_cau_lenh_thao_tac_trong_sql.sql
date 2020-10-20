-- Thao tác với DATABASE:
CREATE DATABASE name_database; -- TẠO DATABASE.
SHOW DATABASES; -- HIỂN THỊ TOÀN BỘ DATABASE.
DROP DATABASE name_database; -- XÓA DATABASE.
USE name_database; -- SỬ DỤNG DATABASE.


-- Thao tác với TABLE:
SHOW TABLES; -- HIỂN THỊ TOÀN BỘ TABLE.
CREATE TABLE name_table; -- TẠO TABLE.
SELECT * FROM name_table; -- LẤY DỮ LIỆU TRONG TABLE. 
RENAME TABLE old_name to new_name; -- ĐỔI TÊN TABLE.
ALTER TABLE old_name RENAME AS new_name; -- ĐỔI TÊN TABLE.
DROP TABLE name_table; -- XÓA TABLE.

-- Thao tác với cột và hàng:
DESC name_table; -- HIỂN THỊ CÁC COLUMN TRONG TABLE.
SHOW COLUMNS FROM name_table; -- HIỂN THỊ CÁC COLUMN TRONG TABLE.
UPDATE name_table SET name_table = "new_info" WHERE name_table = "old_info"; -- ĐỔI TÊN COLUMN.
SELECT * FROM name_table WHERE name_column = "data" order by name_column2; -- LẤY DỮ LIỆU TRONG COLUMN.
INSERT INTO name_table VALUES('abc','xyz','...'); -- THÊM DỮ LIỆU VÀO BẢNG.
DELETE FROM name_table; -- XÓA DỮ LIỆU TRONG BẢNG.
DELETE FROM name_table where name_column = "data"; -- XÓA DỮ LIỆU TRONG BẢNG CÓ ĐIỀU KIỆN.
UPDATE name_table SET name_column= "new_data" WHERE name_column2 = "data"; -- CẬP NHẬT DỮ LIỆU TRONG COLUMN.
