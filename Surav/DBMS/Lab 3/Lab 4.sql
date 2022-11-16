CREATE DATABASE customer_db;
USE customer_db;

-- create table customers
DROP TABLE IF exists customers;
CREATE TABLE customers(
	customer_id INT PRIMARY KEY auto_increment,
    first_name VARCHAR(30) NOT NULL,
    last_name VARCHAR(30) NOT NULL,
    address VARCHAR(30) NOT NULL,
    email VARCHAR(30) NOT NULL unique,
    phone char(10) unique not null,
    gender char(1) not null,
    check (gender in("m","f","o"))
);

-- create table orders
CREATE TABLE orders(
	order_id int primary key auto_increment,
    customer_id int,
    foreign key(customer_id) references customers(customer_id),
    order_date date not null,
    required_date date not null,
    shipped_date date
);

-- create table suppliers
CREATE TABLE suppliers(
	supplier_id int not null primary key auto_increment,
    company_name varchar(45) not null,
    contact_name varchar(45) not null,
    phone char(10) not null unique
);

-- create table products
CREATE TABLE products(
	product_id int primary key not null auto_increment,
    product_name varchar(50) not null,
    unit_price float(6,2) not null,
    unit_in_stock smallint not null,
    supplier_id int,
    foreign key(supplier_id) references suppliers(supplier_id)
);

-- create table order_details
CREATE TABLE order_details(
	order_id int not null,
    foreign key(order_id) references orders(order_id),
    product_id int not null,
    foreign key(product_id) references products(product_id),
    quality smallint not null
);

-- insert value in table customer
INSERT INTO customers VALUES("101", "Surav", "Shakya", "Kohity", "surav01@gmail.com", "9841222234", "m");
INSERT INTO customers VALUES("102", "Rushma", "Singh", "Khumaltar", "rushma02@gmail.com", "9841253234", "f");
INSERT INTO customers VALUES("103", "Rajat", "Joshi", "Baneshwor", "rajat03@gmail.com", "9841532234", "m");
INSERT INTO customers VALUES("104", "Shruti", "Kunwar", "Old-Baneshwor", "shruti04@gmail.com", "9841234234", "f");
INSERT INTO customers VALUES("105", "Neha", "Shakya", "Imadol", "neha05@gmail.com", "9841627334", "f");

-- insert value in table orders
INSERT INTO orders VALUES("ord_001", "101", "2022-05-22", "2022-05-23");
INSERT INTO orders VALUES("ord_002", "102", "2022-05-26", "2022-05-28");
INSERT INTO orders VALUES("ord_003", "103", "2022-05-29", "2022-05-31");
INSERT INTO orders VALUES("ord_004", "104", "2022-06-01", "2022-06-03");
INSERT INTO orders VALUES("ord_005", "105", "2022-06-04", "2022-06-06");

