Create table customers(
id_customer varchar(50) primary key,
first_name varchar(50) not null,
last_name varchar(50) not null,
phone_number varchar(10),
address varchar(500) not null,
email varchar(50) unique not null,
birthday date
);


Create table employees(
id_employee varchar(50) primary key,
first_name varchar(50) not null,
last_name varchar(50) not null,
phone_number varchar(10),
address varchar(500) not null,
email varchar(50) unique not null,
birthday date
);


Create table categories(
id_category int primary key auto_increment,
name_category varchar (50) not null,
description varchar(500)
);


Create table suppliers(
id_supplier int primary key auto_increment,
name_supplier varchar(100) not null,
email varchar(50) not null unique,
phone_number varchar(10),
address varchar(500) not null
);


Create table products(
id_product int primary key auto_increment,
name_product varchar(50) not null,
image_product varchar(1000) not null,
price int default 0 check (price >= 0),
discount int default 0 check (discount >= 0 and discount <= 100),
stock int default 0,
id_category int,
id_supplier int,
constraint fk_category_product foreign key (id_category) references categories (id_category),
constraint fk_supplier_product foreign key (id_supplier) references suppliers (id_supplier),
description varchar(5000) not null
);

Create table orders(
id_order int primary key auto_increment,
created_date datetime default(CURRENT_DATE()),
shipped_date datetime,
status_order varchar(50) default 'waiting',
description varchar(5000),
shipping_address varchar(500) not null,
shipping_city varchar(50) not null,
payment_type varchar(20) default 'cash',
id_customer varchar(50),
id_employee varchar(50),
constraint fk_customer_order foreign key (id_customer) references customers (id_customer),
constraint fk_employee_order foreign key (id_employee) references employees (id_employee),
constraint	check (shipped_date >= created_date),
constraint	check (status_order = 'waiting' or  status_order ='completed' or status_order ='canceled'),
constraint	check (payment_type = 'cash' or payment_type =  'credit card')
);

alter table orders modify created_date datetime default(CURRENT_DATE());
alter table orders add constraint shipped_date  check (shipped_date >= created_date);
alter table orders modify status_order varchar(50) default 'waiting'check (status_order = 'waiting' or  'completed' or 'canceled');
alter table orders modify payment_type varchar(20) default 'cash'; -- check (payment_type = 'cash' or 'credit card');


Create table order_details(
id_order_detal int primary key auto_increment,
id_order int,
id_product int,
constraint fk_order_order_detail foreign key (id_order) references orders (id_order),
constraint fk_product_order_detail foreign key (id_product) references products (id_product)
);



