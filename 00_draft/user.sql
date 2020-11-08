CREATE DATABASE demo;
USE demo;

create table users (
 id  int(3) NOT NULL AUTO_INCREMENT,
 name varchar(120) NOT NULL,
 email varchar(220) NOT NULL,
 country varchar(120),
 PRIMARY KEY (id)
);

insert into users(name, email, country) values('Minh','minh@codegym.vn','Viet Nam');
insert into users(name, email, country) values('Kante','kante@che.uk','Kenia');

DELIMITER $$

CREATE PROCEDURE get_user_by_id(IN user_id INT)

BEGIN

    SELECT users.name, users.email, users.country

    FROM users

    where users.id = user_id;

    END$$

DELIMITER ;


DELIMITER $$

CREATE PROCEDURE insert_user(

IN user_name varchar(50),

IN user_email varchar(50),

IN user_country varchar(50)

)

BEGIN

    INSERT INTO users(name, email, country) VALUES(user_name, user_email, user_country);

    END$$

DELIMITER ;


-- HIEN THI DANH SACH USER
DELIMITER //

CREATE PROCEDURE select_user()

BEGIN

   SELECT * from users;
   END //

DELIMITER ;

call select_user();


-- SUA THONG TIN USER
DELIMITER //

CREATE PROCEDURE update_user(id int, name varchar(50), email varchar(50), country varchar(50))

BEGIN

  update users set users.name = name , users.email = email, users.country = country where users.id = id;

END //

DELIMITER ;

call update_user(1, 'Minh', 'minh@codegym.vn', 'Han Quoc');


-- XOA USER

DELIMITER //

CREATE PROCEDURE delete_user(id int)

BEGIN

  delete from users where users.id = id;

END //

DELIMITER ;

call delete_user(12);








create table Permision(

id int(11) primary key auto_increment,

name varchar(50)

);

 

create table User_Permision(

permision_id int(11),

user_id int(11)

);


insert into Permision(name) values('add');

insert into Permision(name) values('edit');

insert into Permision(name) values('delete');

insert into Permision(name) values('view');