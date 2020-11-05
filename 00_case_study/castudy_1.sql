Create table positions(
id_position int primary key auto_increment,
name_position varchar(50) not null
);

Create table levels(
id_level int primary key auto_increment,
name_level varchar(50) not null
);

Create table departments(
id_department int primary key auto_increment,
name_department varchar(50) not null
);

Create table employees(
id_employee int primary key auto_increment,
name_employee varchar(50) not null,
date_of_birth date not null,
address varchar(50),
id_card varchar(12) not null unique,
phone_number varchar(10) not null unique,
salary double,
email varchar(50) not null unique
);


Create table customer_types(
id_customer_type int primary key auto_increment,
name_customer_type varchar(50)
);

Create table customers(
id_customer int primary key auto_increment,
name_customer varchar(50) not null,
date_of_birth date not null,
address varchar(50) not null,
id_card varchar(12) not null,
phone_number varchar(10) not null,
email varchar(50) not null
);


Create table rent_types(
id_rent_type int primary key auto_increment,
name_rent_type varchar(50)
);

Create table service_types(
id_service_type int primary key auto_increment,
name_service_type varchar(50)
);

Create table services(
id_service int primary key auto_increment,
name_service varchar(50) not null,
area double not null,
number_of_floor int not null default 1,
number_of_people int not null default 5,
cost double not null,
status varchar(50),
description text
);


Create table contracts(
id_contract int primary key auto_increment,
day_start date not null,
day_end date not null,
deposit double,
total_money double not null
);

Create table services_go_with(
id_sevice_go_with int primary key auto_increment,
name_service_go_with varchar(50),
unit int,
status varchar(50) 
);


Create table contract_details(
int_contract_detail int primary key auto_increment,
amount int
);


alter table employees
add id_position int,
add id_level int,
add id_department int,
add constraint fk_position_employee foreign key (id_position) references positions(id_position),
add constraint fk_level_employee foreign key (id_level) references levels(id_level),
add constraint fk_department_employee foreign key (id_department) references departments(id_department);


alter table customers
add id_customer_type int,
add constraint fk_customer_type foreign key (id_customer_type) references customer_types(id_customer_type);


alter table services
add id_rent_type int,
add id_service_type int,
add constraint fk_rent_type_service foreign key (id_rent_type) references rent_types(id_rent_type),
add constraint fk_service_type foreign key (id_service_type) references service_types(id_service_type);


alter table contracts
add constraint check (day_end >= day_start),
add id_employee int,
add id_customer int,
add id_service int,
add constraint fk_employee_contract foreign key (id_employee) references employees(id_employee),
add constraint fk_customer_contract foreign key (id_customer) references customers(id_customer),
add constraint fk_service_contract foreign key (id_service) references services(id_service); 

alter table contract_details
add id_contract int,
add id_service_go_with int,
add constraint fk_contract_details foreign key (id_contract) references contracts(id_contract),
add constraint fk_service_go_with_contract foreign key (id_service_go_with) references services_go_with(id_service_go_with);



alter table services_go_with
add cost double;



-- Câu 2.
Select * from employees 
where (name_employee like 'H%' or name_employee like 'T%' or name_employee like 'K%') 
and length(name_employee) < 15;

-- Câu 3.
Select * from employees 
where ((year(now()) - year(date_of_birth) > 18)  and (year(now()) - year(date_of_birth) < 50))
and (address in ('Đà Nẵng' , 'Quảng Trị'));

-- Câu 4.
Select customers.name_customer,count(contracts.id_customer) from customers 
join contracts on customers.id_customer = contracts.id_customer
join customer_types on customers.id_customer_type = customer_types.id_customer_type
where customer_types.name_customer_type = 'Diamond'
group by contracts.id_customer
order by  contracts.id_customer desc;

-- Câu 5. !!!!!!!!!!!!!!! Chưa clear
Select customers.id_customer, customers.name_customer, customer_types.name_customer_type, 
contracts.id_contract, services.name_service, contracts.day_start, contracts.day_end, 
(services.cost + sum(contract_details.amount * services_go_with.cost)) as 'total'
from customers
left join customer_types on customers.id_customer_type = customer_types.id_customer_type
left join contracts on customers.id_customer = contracts.id_customer
left join services on contracts.id_service = services.id_service
left join contract_details on contracts.id_contract = contract_details.id_contract
left join services_go_with on contract_details.id_service_go_with = services_go_with.id_service_go_with
group by customers.id_customer 
union
Select customers.id_customer, customers.name_customer, customer_types.name_customer_type, 
contracts.id_contract, services.name_service, contracts.day_start, contracts.day_end, 
sum(services.cost) as 'total'
from customers
join customer_types on customers.id_customer_type = customer_types.id_customer_type
join contracts on customers.id_customer = contracts.id_customer
join services on contracts.id_service = services.id_service
group by customers.id_customer;


-- Câu 6.  !!!!!!!!!!!!!!! ok

Select services.id_service, services.name_service, services.area, services.cost, service_types.name_service_type from services
left join service_types on services.id_service_type = service_types.id_service_type
left join contracts on services.id_service = contracts.id_service
where year(contracts.day_start) < 2019
and contracts.id_service not in (select contracts.id_service from contracts where year(contracts.day_start) > 2019)
group by services.id_service
union
Select services.id_service, services.name_service, services.area, services.cost, service_types.name_service_type from services
left join service_types on services.id_service_type = service_types.id_service_type
left join contracts on services.id_service = contracts.id_service
where  contracts.id_contract <=> null;


-- Câu 7.  !!!!!!!!!!!!!!!!! ok
select contracts.day_start,services.id_service, services.name_service, services.area, services.number_of_people, services.cost, service_types.name_service_type 
from services
join service_types on services.id_service_type = service_types.id_service_type
join contracts on services.id_service = contracts.id_service
where year(contracts.day_start) = 2018 
and contracts.id_service not in (select contracts.id_service from contracts where year(contracts.day_start) = 2019 );


-- Câu 8.!!!!!!!!!!!!!!!!!!!!!!!!!!!


-- Cách 1.
Select distinct customers.name_customer from customers;

-- Cách 2.
select  customers.name_customer from customers
group by customers.name_customer;

-- Cách 3. !!!!!!!!!!!!!!!!!!!!!!1
select customers.name_customer from customers
union
select customers.name_customer from customers;

-- Câu 9.
select month(contracts.day_start) as month ,count(month(contracts.day_start)) as amount from contracts
where year(contracts.day_start) = 2019
group by month(contracts.day_start)
order by month(contracts.day_start);

-- Câu 10
Select contract_details.id_contract,count(contract_details.id_service_go_with) from contract_details
group by contract_details.id_contract;

-- Câu 11.
Select customers.name_customer, services_go_with.name_service_go_with from services_go_with
join contract_details on contract_details.id_service_go_with = services_go_with.id_service_go_with
join contracts on contracts.id_contract = contract_details.id_contract
join customers on customers.id_customer = contracts.id_customer
join customer_types on customer_types.id_customer_type = customers.id_customer_type
where customer_types.name_customer_type = 'Diamond' and customers.address in ('Vinh' , 'Quảng Ngãi');

-- Câu 12. !!!!!!!!!!!!!!!!!!!!!!!!!!!! ok
Select contracts.id_contract, employees.name_employee, customers.name_customer, customers.phone_number, services.name_service,
count(contract_details.id_service_go_with), 
contracts.deposit 
from contracts
left join employees on employees.id_employee = contracts.id_employee
left join customers on customers.id_customer = contracts.id_customer
left join services on services.id_service = contracts.id_service
left join contract_details on contract_details.id_contract = contracts.id_contract
left join services_go_with on services_go_with.id_service_go_with = contract_details.id_service_go_with
where month(contracts.day_start) in ( 10,11,12) and year(contracts.day_start) = 2019
and customers.id_customer not in (select contracts.id_customer from contracts where month(contracts.day_start) in(1,2,3,4,5,6))
group by customers.name_customer;


-- Câu 13. !!!!!!!!!!!!!!!!!!!!!!!!!!!!!! ok
Create view caculate_max as (
Select services_go_with.name_service_go_with as name_, (sum(contract_details.amount)) as total  from services_go_with 
join contract_details on contract_details.id_service_go_with = services_go_with.id_service_go_with
group by contract_details.id_service_go_with) ;


select name_, max(total) as total from caculate_max
group by name_
having (total) in (select max(total) from caculate_max);



-- Câu 14.
Select contracts.id_contract,service_types.name_service_type, services_go_with.name_service_go_with, count(contract_details.id_service_go_with) as count_ from contracts
join services on services.id_service = contracts.id_service
join service_types on service_types.id_service_type = services.id_service_type
join contract_details on contract_details.id_contract = contracts.id_contract
join services_go_with on services_go_with.id_service_go_with = contract_details.id_service_go_with
group by contract_details.id_service_go_with
having count_ = 1;


-- Câu 15.
select employees.id_employee, employees.name_employee, levels.name_level, departments.name_department, employees.phone_number, employees.address from employees
join levels on levels.id_level = employees.id_level
join departments on departments.id_department = employees.id_department
join contracts on contracts.id_employee = employees.id_employee
where  year(contracts.day_start) between 2018 and 2019
group by employees.id_employee
having count(contracts.id_employee) <= 3;

-- Câu 16.
SET SQL_SAFE_UPDATES=0;
delete from employees where employees.id_employee not in (select contracts.id_employee from contracts);


-- Câu 17.

update customers set  customers.id_customer_type = 5
where customers.id_customer_type = 4 and customers.id_customer in
(
select contracts.id_customer from contracts
where contracts.total_money > 5000
);

-- Câu 18. !!!!!!!!!!!!!!!!!!!!!!!!!!!!! chưa
-- SET GLOBAL FOREIGN_KEY_CHECKS = OFF;
delete from customers where customers.id_customer
in (select contracts.id_customer from contracts where year(contracts.day_start) < 2016);

-- Câu 19.

update services_go_with set services_go_with.cost = services_go_with.cost*2 
where services_go_with.id_service_go_with in 
(select contract_details.id_service_go_with from contract_details 
group by contract_details.id_service_go_with
having count(contract_details.id_service_go_with) >= 10);



-- Câu 20. !!!!!!!!!!!!!!!! ok
select customers.id_customer as id, name_customer as name, email, phone_number,date_of_birth, address from customers
 union 
 select employees.id_employee, name_employee, email, phone_number,date_of_birth, address from employees;

-- Câu 21.
Create view V_EMPLOYEES as (
select * from employees where address = 'Hải Châu' 
and employees.id_employee in (select contracts.id_employee from contracts where day_start = '2019-12-12')
);

select * from V_EMPLOYEES;


-- Câu 22.
update V_EMPLOYEES set address = 'Liên Chiểu';

-- Câu 23.
DELIMITER //
Create procedure Sp_1 (id int)

begin

delete from customers where customers.id_customer = id;

end //

DELIMITER ;

call Sp_1(13);


-- Câu 24. chưa

-- Câu 25. chưa 
DELIMITER //
Create trigger Tr_1 after delete  on contracts for each row
begin

select count from contracts;

end //
DELIMITER ;


delete from contracts where id_contract = 25;


























