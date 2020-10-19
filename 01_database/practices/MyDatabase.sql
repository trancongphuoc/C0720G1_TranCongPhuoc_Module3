-- Create database `my_database`;
use `my_database`;
Create table `Products`(
Id int,
Name nvarchar(50),
ImageUrl nvarchar(1000),
Price int,
Discount int,
Stock int,
CategoryId int,
SupplierIordersproductsd int,
Description nvarchar(50)
);

Create table `Orders`(
Id int,
CreateDate datetime,
ShippedDate datetime,
Status varchar(50),
Description nvarchar(50),
ShippingAdress nvarchar(500),
ShippingCity nvarchar(50),
PaymentType varchar(20),
CustomerId varchar(50),
EmployeeId varchar(50)
);
