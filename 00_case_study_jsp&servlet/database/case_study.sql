CREATE DATABASE 00_case_study_jsp_and_servlet;

USE 00_case_study_jsp_and_servlet;


-- Tạo bảng EMPLOYEE...1
CREATE TABLE employee(
employee_id INT AUTO_INCREMENT NOT NULL,
employee_name VARCHAR(50) NOT NULL,
employee_birthday DATE  NOT NULL,
employee_id_card varchar(50)  NOT NULL,
employee_phone VARCHAR(50)  NOT NULL,
employee_salary DOUBLE  NOT NULL,
employee_email VARCHAR(50),
employee_address VARCHAR(50),
position_id INT NOT NULL,
education_degree_id INT NOT NULL,
division_id INT NOT NULL,
username VARCHAR(255),
PRIMARY KEY (employee_id)
);

-- Tạo bảng POSITION...2
CREATE TABLE positions(
position_id INT AUTO_INCREMENT NOT NULL,
position_name VARCHAR(50)  NOT NULL,
PRIMARY KEY (position_id)
);

--  Tạo bảng EDUCATION_DEGREE...3
CREATE TABLE education_degree(
education_degree_id INT AUTO_INCREMENT  NOT NULL,
education_degree_name VARCHAR(50)  NOT NULL,
PRIMARY KEY (education_degree_id)
);

-- Tạo bảng DEVITION...4
CREATE TABLE division(
division_id INT AUTO_INCREMENT  NOT NULL,
division_name VARCHAR(50)  NOT NULL,
PRIMARY KEY (division_id)
);


-- Tạo bảng USER...5
CREATE TABLE user(
username VARCHAR(255)  NOT NULL,
password VARCHAR(255) NOT NULL,
PRIMARY KEY (username)
);

-- Tạo bảng ROLE...6
CREATE TABLE role(
role_id INT AUTO_INCREMENT  NOT NULL,
role_name VARCHAR(255) NOT NULL,
PRIMARY KEY (role_id)
);

-- Tạo bảng USER_ROLE...7
CREATE TABLE user_role(
username VARCHAR(255) NOT NULL,
role_id INT NOT NULL
);

-- Tạo bảng CUSTOMER...8
CREATE TABLE customer(
customer_id INT AUTO_INCREMENT  NOT NULL,
customer_name VARCHAR(50) NOT NULL,
customer_birthday DATE NOT NULL,
customer_gender BIT(1) NOT NULL,
customer_id_card VARCHAR(50) NOT NULL,
customer_phone VARCHAR(50) NOT NULL,
customer_email VARCHAR(50),
customer_address VARCHAR(50),
customer_type_id INT NOT NULL,
PRIMARY KEY (customer_id)
);

-- Tạo bảng CUSTOMER_TYPE...9
CREATE TABLE customer_type(
customer_type_id INT AUTO_INCREMENT  NOT NULL,
customer_type_name VARCHAR(50) NOT NULL,
PRIMARY KEY(customer_type_id)
);

-- Tạo bảng SERVICE...10
CREATE TABLE service(
service_id INT AUTO_INCREMENT  NOT NULL,
service_name VARCHAR(50) NOT NULL,
service_area DOUBLE NOT NULL,
service_cost DOUBLE NOT NULL,
service_max_people INT,
standard_room VARCHAR(50),
description VARCHAR(50),
pool_area DOUBLE,
number_of_floor INT NOT NULL,
service_type_id INT NOT NULL,
rent_type_id INT NOT NULL,
PRIMARY KEY (service_id)
);

-- Tạo bảng SERVICE_TYPE...11
CREATE TABLE service_type(
service_type_id INT AUTO_INCREMENT  NOT NULL,
service_type_name VARCHAR(50) NOT NULL,
PRIMARY KEY (service_type_id)
);

-- Tạo bảng RENT_TYPE...12
CREATE TABLE rent_type(
rent_type_id INT AUTO_INCREMENT  NOT NULL,
rent_type_name VARCHAR(50) NOT NULL,
rent_type_cost DOUBLE,
PRIMARY KEY (rent_type_id)
);

-- Tạo bảng ATTACH_SERVICE...13
CREATE TABLE attach_service(
attach_service_id INT AUTO_INCREMENT  NOT NULL,
attach_service_name VARCHAR(50) NOT NULL,
attach_service_cost DOUBLE NOT NULL,
attach_service_unit INT NOT NULL,
attach_service_status VARCHAR(50),
PRIMARY KEY (attach_service_id)
);

-- Tạo bảng CONTRACT...14
CREATE TABLE contract(
contract_id INT AUTO_INCREMENT  NOT NULL,
contract_start_date DATE NOT NULL,
contract_end_date DATE NOT NULL,
contract_deposit DOUBLE NOT NULL,
contract_total_money DOUBLE NOT NULL,
customer_id INT NOT NULL,
employee_id INT NOT NULL,
service_id INT NOT NULL,
PRIMARY KEY (contract_id)
);

-- Tạo bảng CONTRACT_DETAIL...15
CREATE TABLE contract_detail(
contract_detail_id INT AUTO_INCREMENT  NOT NULL,
quanity INT NOT NULL,
contract_id INT NOT NULL,
attach_service_id INT,
PRIMARY KEY (contract_detail_id)
);

-- ---------------------------------------------------------------------------------------------------------------------------------------

-- Tạo khóa ngoại cho bảng EMPLOYEE...
ALTER TABLE employee
ADD CONSTRAINT fk_positons_employee FOREIGN KEY (position_id) REFERENCES positions(position_id),
ADD CONSTRAINT fk_education_degree_employee FOREIGN KEY (education_degree_id) REFERENCES education_degree(education_degree_id),
ADD CONSTRAINT fk_division_employee FOREIGN KEY (division_id) REFERENCES division(division_id),
ADD CONSTRAINT fk_user_employee FOREIGN KEY (username) REFERENCES user(username);

-- Tạo khóa ngoại cho bảng CUSTOMER...
ALTER TABLE customer
ADD CONSTRAINT fk_customer_type_customer FOREIGN KEY (customer_type_id) REFERENCES customer_type(customer_type_id);

-- Tạo khóa ngoại cho bảng USER_ROLE...
ALTER TABLE user_role
ADD CONSTRAINT fk_user_user_role FOREIGN KEY (username) REFERENCES user(username),
ADD CONSTRAINT fk_role_user_role FOREIGN KEY (role_id) REFERENCES role(role_id);

-- Tạo khóa ngoại cho bảng SERVICE...
ALTER TABLE service
ADD CONSTRAINT fk_service_type_service FOREIGN KEY (service_type_id) REFERENCES service_type(service_type_id),
ADD CONSTRAINT fk_rent_type_service FOREIGN KEY (rent_type_id) REFERENCES rent_type(rent_type_id);

-- Tạo khóa ngoài cho bảng CONTRACT...
ALTER TABLE contract
ADD CONSTRAINT fk_employee_contract FOREIGN KEY (employee_id) REFERENCES employee(employee_id),
ADD CONSTRAINT fk_customer_contract FOREIGN KEY (customer_id) REFERENCES customer(customer_id),
ADD CONSTRAINT fk_service_contract FOREIGN KEY (service_id) REFERENCES service(service_id);

-- Tạo khóa ngoại cho bảng CONTRACT_DETAIL...
ALTER TABLE contract_detail
ADD CONSTRAINT fk_contract_contract_detail FOREIGN KEY (contract_id) REFERENCES contract(contract_id),
ADD CONSTRAINT fk_attach_service_contract_detail FOREIGN KEY (attach_service_id) REFERENCES attach_service(attach_service_id);

-- ---------------------------------------------------------------------------------------------------------------------------------------






