CREATE TABLE customers(
   id INT AUTO_INCREMENT PRIMARY KEY,
   name VARCHAR(40),
   address VARCHAR(255),
   email VARCHAR(255)
);

CREATE TABLE orders(
   id INT AUTO_INCREMENT,
   staff VARCHAR(50),
   PRIMARY KEY(id),
   customer_id INT, FOREIGN KEY (customer_id) REFERENCES customers(id)
);

insert into customers value(1,'teo','da nang','teosake@gmail.com');
insert into orders(staff, customer_id) value('abc',1);
DElete from `orders` where id = 2;

SELECT * FROM test_create_foreign_key.orders;
