SELECT * FROM 05_exercise_1.products;

use 05_exercise_1;


-- Bước 3.
SELECT * FROM products WHERE product_code = 'PD_05';
alter table products add index idx_product_code(product_code);
EXPLAIN SELECT * FROM products WHERE product_code = 'PD-05';

alter table products drop index idx_product_code;



-- Bước 4.
Create view view_product as  
select product_code, product_name, product_price, product_status from products;

select * from view_product;

drop view view_product;


-- Bước 5
-- Câu 1.
DELIMITER //
Create procedure select_info_product()

begin

select * from products;

end //

DELIMITER ;

call select_info_product();

-- Câu 2.
DELIMITER //

Create procedure add_new_product(
in product_code varchar(50), 
product_name varchar(50), 
product_price double,
product_amount int,
product_description varchar(400),
product_status varchar(50) )

begin

insert into products(product_code,product_name,product_price,product_amount,product_description,product_status) 
values (product_code,product_name,product_price,product_amount,product_description,product_status);

end //

DELIMITER ;

call add_new_product('PD_07', 'Xe bọc thép', '2500', '7', 'abcd', 'dbca');


-- Câu 3.
DELIMITER //

Create procedure set_product(
in id int, 
product_code varchar(50), 
product_name varchar(50), 
product_price double,
product_amount int,
product_description varchar(400),
product_status varchar(50) )

begin

update products set products.product_code = product_code where products.id = id;
update products set products.product_name = product_name where products.id = id;
update products set products.product_price = product_price where products.id = id;
update products set products.product_amount = product_amount where products.id = id;
update products set products.product_description = product_description where products.id = id;
update products set products.product_status = product_status where products.id = id;

end //

DELIMITER ;

call set_product('7', 'PD_07', 'Xe tăng', '2500', '7', 'abcd', 'dbca');

DELIMITER //
DROP PROCEDURE IF EXISTS `set_product`//



-- Câu 4.
DELIMITER //

Create procedure del_product(in id int)

begin

delete from products where products.id = id;

end //

DELIMITER ;

call del_product('9');















