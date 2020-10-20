Create table customers(
id_customer int primary key auto_increment,
name_customer varchar(50) not null,
last_name varchar(50) not null,
first_name varchar(50) not null,
phone_number varchar(10) not null,
address_line1 varchar(50) not null,
address_line2 varchar(50),
city varchar(50) not null,
state varchar(50) not null,
id_postal varchar(15) not null,
country varchar(50) not null,
credit_limit double,
id_employee int,
constraint fk_id_employee_customer foreign key (id_employee) references employees (id_employee)
);

Create table orders(
id_order int primary key auto_increment,
order_day date not null,
required_day date not null,
shipped_day date,
status varchar(15) not null,
comments text,
quantity_ordered int not null,
price_each double not null,
id_customer int,
constraint fk_id_customer foreign key(id_customer) references customers (id_customer)
);

Create table orders_details(
id_order int,
id_product varchar(15),
constraint fk_id_order foreign key(id_order) references orders (id_order),
constraint fk_id_product foreign key(id_product) references products (id_product)
);

Create table payments(
id_check varchar(50) primary key,
payment_day date not null,
amount double not null,
id_customer int,
constraint fk_id_customer_payment foreign key (id_customer) references customers (id_customer)
);

Create table products(
id_product varchar(15) primary key,
name_product varchar(70) not null,
scale_product varchar(10) not null,
vendor_product varchar(50) not null,
descriptiom_product text not null,
quanitityln_stock int not null,
buy_price double not null,
msrp double not null,
id_product_line varchar(50),
constraint fk_id_product_line foreign key (id_product_line) references product_lines (id_product_line)
);

Create table product_lines(
id_product_line varchar(50) primary key,
text_description text not null,
image varchar(1000)
);

Create table employees(
id_employee int  primary key auto_increment,
last_name varchar(50) not null,
first_name varchar(50) not null,
email varchar(100) not null,
job_title varchar(50) not null,
report_to int,
constraint fk_id_employee foreign key (report_to) references employees (id_employee),
id_office varchar(10),
constraint fk_id_office foreign key (id_office) references offices (id_office)
);

Create table offices(
id_office varchar(10) primary key,
city varchar(50) not null,
phone varchar(10) not null,
address_line1 varchar(50) not null,
address_line2 varchar(50),
state varchar(50),
country varchar(50) not null,
id_postal varchar(15) not null
);

