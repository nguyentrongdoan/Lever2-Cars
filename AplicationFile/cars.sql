create database cars_sell;
use cars_sell;

create table customers(
    customerNumber int not null ,
    customerName varchar(50) not null ,
    contactFirstName varchar(50)not null ,
    contactLastName varchar(50)not null ,
    phone varchar(50)not null ,
    addressLine1 varchar(50)not null ,
    addressLine2 varchar(50),
    city varchar(50)not null ,
    state varchar(50)not null ,
    postalCode varchar(15)not null ,
    country varchar(50)not null,
    creditLimit float ,
    primary key (customerNumber)
);
create table productsLine(
    productsLine varchar(50)not null primary key ,
    textDescription text,
    image varchar(300)
);
create table products(
    productCode varchar(15)not null primary key ,
    productName varchar(75)not null ,
    productScale varchar(10)not null,
    productVendor varchar(50)not null ,
    productDescription text not null ,
    quantityInStock int not null ,
    buyPrice float not null ,
    MSRP float not null
);
create table orders(
    ordersNumber int not null primary key ,
    orderDate date not null ,
    requiredDate date not null ,
    shippedDate date ,
    status varchar(15)not null ,
    comments text,
    quantityOrdered int not null ,
    priceEach float not null
);
create table payments(
    customerNumber int not null ,
    checkNumber varchar(50) not null ,
    paymentDate date not null ,
    amount float not null
);
create table employees(
    employeesNumber int not null ,
    lastName varchar(50) not null ,
    firstName varchar(50) not null ,
    email varchar(100)not null ,
    jobTitle varchar(50)not null ,
    primary key (employeesNumber)
);
create table offices(
    officeCode varchar(10)not null primary key ,
    city varchar(50)not null ,
    phone varchar(50)not null ,
    addressLine1 varchar(50)not null ,
    addressLine2 varchar(50),
    state varchar(50)not null ,
    country varchar(50)not null ,
    postalCode varchar(15)not null
);
alter table orders add customerNumber int;
alter table orders add foreign key (customerNumber)references customers(customerNumber);
alter table payments add primary key (checkNumber);
alter table payments add foreign key (customerNumber)references customers(customerNumber);
create table orderDetails (
    orderNumber int not null primary key ,
    productCode varchar(15)not null
);
alter table orderDetails add foreign key (orderNumber)references orders(ordersNumber);
alter table orderDetails add foreign key (productCode)references products(productCode);
alter table products add productLine varchar(50) not null ;
alter table products add foreign key (productLine)references productsLine(productsLine);
alter table payments add salesRepEmployeeNumber int not null ;
alter table payments add foreign key (salesRepEmployeeNumber)references employees(employeesNumber);
alter table payments add foreign key (salesRepEmployeeNumber)references customers(customerNumber);
alter table employees add reportTo int not null ;
alter table employees add foreign key (reportTo)references customers(customerNumber);
alter table customers add officeCode varchar(10)not null ;
alter table customers add foreign key (officeCode)references offices(officeCode);
select * from customers;
select * from offices;