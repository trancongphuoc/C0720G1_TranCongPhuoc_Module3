CREATE DATABASE project;

USE project;

CREATE TABLE product(
id int NOT NULL AUTO_INCREMENT,
name varchar(50),
price double,
description varchar(500),
producer varchar(50),
PRIMARY KEY (id)
);

INSERT INTO product(name, price, description, producer) VALUES ('Xe tăng', 5000, 'Chống đạn', 'Ajain');
INSERT INTO product(name, price, description, producer) VALUES ('M416', 500, 'Súng tự động', 'Loius');




