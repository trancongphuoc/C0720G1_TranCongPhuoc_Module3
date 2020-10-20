create table customers(
id_customer int primary key auto_increment,
fullname varchar(50) not null,
address varchar(50) not null,
email varchar(50) not null unique,
phone varchar(50) not null unique
);

-- create table email_details(
-- id_email int primary key auto_increment,
-- email varchar(50),
-- id_customer int,
-- constraint fk_email_customer foreign key (id_customer) references customers (id_customer)
-- );

create table accounts(
id_account int primary key auto_increment,
account_type varchar(50) not null,
create_day date not null,
balance double not null ,
id_customer int,
constraint fk_id_customer foreign key (id_customer) references customers (id_customer)
);

create table transactions(
id_tran int primary key auto_increment,
create_day date not null,
amounts double not null,
descriptions varchar(1000) not null,
id_account int,
constraint fk_id_account foreign key (id_account) references accounts (id_account)
);

