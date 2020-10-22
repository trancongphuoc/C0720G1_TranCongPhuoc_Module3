Create database 03_practice_1;
Use 03_practice_1;

Create table product_lines(
id_product_line int primary key auto_increment,
text_description varchar(500),
html_description varchar(500),
image varchar(500)
);


Create table products(
id_product int primary key auto_increment,
name_product varchar(50),
scale_product int,
vendor_product varchar(50),
description_product varchar(500),
quantityln_stock int,
buy_price double,
msrp double,
id_product_line int,
constraint fk_product_line_product foreign key (id_product_line) references product_lines(id_product_line)
);
select * from products;
select * from product_lines;
select id_product, name_product, buy_price, quantityln_stock from products
where buy_price > 56.76 and quantityln_stock > 10;

select id_product, name_product, buy_price, quantityln_stock, product_lines.id_product_line from products
inner join product_lines
on products.id_product_line = product_lines.id_product_line;