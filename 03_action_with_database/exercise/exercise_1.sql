Create table books(
id_book int primary key,
name_book varchar(50) not null,
publishing_house varchar(50) not null,
author varchar(50) not null,
publishing_year year not null,
publishing_amount int not null,
cost double not null,
image varchar(5000) not null,
id_category int,
constraint fk_category_book foreign key (id_category) references categories(id_category)
);


Create table categories(
id_category int primary key,
name_category varchar(50)
);


Create table students(
id_student int primary key,
name_student varchar(50) not null,
date_of_birth date not null,
address varchar(100) not null,
email varchar(50) not null,
phone_number varchar(10) not null,
image varchar(500) not null
);


Create table bills(
id_bill int primary key,
id_student int unique,
constraint fk_student_bill foreign key (id_student) references students(id_student),
date_borrwed date not null,
date_pay date not null
);


Create table bill_details(
id_bill int,
id_book int,
constraint fk_bill_detail foreign key (id_bill) references bills(id_bill),
constraint fk_book_detail foreign key (id_book) references books(id_book)
);


Create table debt_book(
id_student int,
id_book int,
constraint fk_student_debt_book foreign key (id_student) references students(id_student),
constraint fk_book_deft_book foreign key (id_book) references books(id_book)
);


alter table bills modify id_student int check (students.id_studen != debt_book.id_student);

select * from bills inner join bill_details
on bills.id_bill = bill_details.id_bill;

