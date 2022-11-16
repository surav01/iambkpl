SET NAMES 'utf8' COLLATE 'utf8_general_ci';
create database if not exists customer_db;
use customer_db;

CREATE TABLE address (
    address_id INT PRIMARY KEY,
    street VARCHAR(100),
    city VARCHAR(50) NOT NULL,
    province VARCHAR(50) NOT NULL,
    country CHAR(2) NOT NULL
);

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    first_name VARCHAR(30),
    last_name VARCHAR(30) NOT NULL,
    email VARCHAR(50) NOT NULL UNIQUE,
    phone CHAR(10) NOT NULL,
    gender CHAR(1),
    address_id INT,
    CHECK (gender IN ('M' , 'F', 'O')),
    FOREIGN KEY (address_id) REFERENCES address (address_id)
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    order_date DATETIME NOT NULL,
    required_date DATETIME NULL,
    shipped_date DATETIME,
    FOREIGN KEY (customer_id) REFERENCES customers (customer_id)
);

CREATE TABLE suppliers (
    supplier_id INT PRIMARY KEY,
    company_name VARCHAR(100) NOT NULL,
    contact_name VARCHAR(45) NOT NULL,
    phone CHAR(10) NOT NULL UNIQUE
);
    
CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(45) NOT NULL,
    unit_price FLOAT(7 , 2 ) NOT NULL,
    unit_in_stock SMALLINT NOT NULL,
    supplier_id INT,
    FOREIGN KEY (supplier_id) REFERENCES suppliers (supplier_id)
);
    
CREATE TABLE order_detail (
    order_detail_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT,
    product_id INT,
    quantity SMALLINT NOT NULL,
    FOREIGN KEY (order_id) REFERENCES orders (order_id),
    FOREIGN KEY (product_id) REFERENCES products (product_id)
);
    
    
    /*inserting data into ADDRESS table*/
	insert into address
	values (601, "Devkota Sadak", "Kathmandu", "Province 3", "NP"),
     (602, "Ram Chandra Marg", "Kathmandu", "Province 3", "NP"),
     (603, "Mitranagar Tole", "Ghorahi", "Province 5", "NP"),
     (604, NULL, "Tulsipur", "Province 5", "NP"),
     (605, NULL, "Damak", "Province 1", "NP"),
     (606, NULL, "Biratnagar", "Province 1", "NP"),
     (607, NULL, "Dharan", "Province 1", "NP"),
     (608, NULL, "Gaur", "Province 2", "NP"),
     (609, NULL, "Birgunj", "Province 2", "NP"),
     (610, NULL, "Malangawa", "Province 2", "NP"),
     (611, "Pulchwok", "Lalitpur", "Province 3", "NP"),
     (612, "Naya Thimi", "Bhaktapur", "Province 3", "NP"),
     (613, NULL, "Pokhara", "Gandaki", "NP"),
     (614, NULL, "Baglung", "Gandaki", "NP"),
     (615, NULL, "Gorkha", "Gandaki", "NP"),
     (616, NULL, "Birendranagar", "Karnali", "NP"),
     (617, NULL, "Sinja", "Karnali", "NP"),
     (618, NULL, "Shuklaphanta", "Sudurpaschim", "NP"),
     (619, NULL, "Dhangadhi", "Sudurpaschim", "NP"),
     (620, NULL, "Lamki Chuha", "Sudurpaschim", "NP");
    
   /*inserting data into CUSTOMERS table*/
   insert into customers 
	values(101,'Alex','Khanal','alex@example.com','9161782179','M',613),
	(102,'Anil','Budhathoki','anil@example.com','9166654160','M',613),
	(103,'Anisha','Buda','anisha@example.com','9110099775','F',605),
	(104,'Anjana','Banjade','anjana@example.com','9174162495','F',607),
	(105,'Anup','Karki','anup@example.com','9110626931','M',606),
	(106,'Astha','Rijal','astha@example.com','9029080806','F',606),
	(107,'Ayush','KC','ayush@example.com','9089010895','M',619),
	(108,'Babita','Shrestha','babita@example.com','9145667866','F',617),
	(109,'Beepul','Thapa Magar','beepul@example.com','9022817657','M',603),
	(110,'Bishnu','K.C.','bishnu@example.com','9083989826','M',612),
	(111,'Bishwas','Tripathi','bishwas@example.com','9127719738','M',610),
	(112,'Chetan','Kharel','chetan@example.com','9156436155','M',607),
	(113,'Diamond','Nath','diamond@example.com','9050817394','M',609),
	(114,'Gaurav','Prasai','gaurav@example.com','9084318027','M',605),
	(115,'Jenish','Maharjan','jenish@example.com','9125081761','M',611),
	(116,'Kalyan','Thapaliya','kalyan@example.com','9049211063','M',617),
	(117,'KhimDevi','Gurung','khimdevi@example.com','9028275002','F',618),
	(118,'Komal','Neupane','komal@example.com','9088128812','F',611),
	(119,'Manav','Gohlyan','manav@example.com','9133149534','M',601),
	(120,'Manish','Chaudhary','manish@example.com','9122329102','M',612),
	(121,'Nabaraj','Magar','nabaraj@example.com','9013610758','M',613),
	(122,'Navaraj','B.K.','navaraj@example.com','9071129341','M',620),
	(123,'Nidesh','Shakya','nidesh@example.com','9181094963','M',615),
	(124,'Nischal','Sharma','nischal@example.com','9059116816','M',612),
	(125,'Pankaj','Thapa','pankaj@example.com','9033952635','M',620),
	(126,'Piyush','Manandhar','piyush@example.com','9000829831','M',603),
	(127,'Prabin','Karki','prabin@example.com','9113622589','M',613),
	(128,'Pramod','Adhikari','pramod@example.com','9102806083','M',613),
	(129,'Pratyush','Adhikari','pratyush@example.com','9139645476','M',609),
	(130,'Rejish','Shrestha','rejish@example.com','9147342039','M',616),
	(131,'Ritu','Ayer','ritu@example.com','9151361596','F',613),
	(132,'Sijan','Bhattarai','sijan@example.com','9179307060','M',603),
	(133,'Subigya','Pyakurel','subigya@example.com','9082668749','F',620),
	(134,'Sujan','Gajurel','sujan@example.com','9056187001','M',609),
	(135,'Ujen','Khadka','ujen@example.com','9091558380','M',602);



/*inserting data into SUPPLIERS table*/
insert into suppliers
values(301,'TAMRAKAR MOBILE','Rohan Shrestha','144055945'),
(302,'THE MOBILE STORE','Rashmi Neupane','144501994'),
(303,'IMS PVT LTD','Sameer Magar','144117448'),
(304,'V MOBILE SHOWROOM','Abhishek Sharma','144843821'),
(305,'RIJALCO MOBILE HOUSE','Anita Pradhan','144081243'),
(306,'STUPA MOBILE CENTER','Susmita Dangi','144921205'),
(307,'CALL MOBILITY','Dinesh Bogati','144023494'),
(308,'MOBILE WORLD CAPITAL','Seema Dahal','144956804'),
(309,'SMART MOBILE CENTRE','Tara Adhikari','144827541'),
(310,'TELE CARE PVT LTD','Sudeep Pokhrel','144692257'),
(311,'iHUB','Ashok Sigdel','144150647'),
(312,'KITES MOBILE','Mohamad Ansari','144884846'),
(313,'GURU KRIPA MOBILE SHOP','Bibas Basnet','144104171'),
(314,'TALK TO ME','Rajesh Rauniyar','144246986'),
(315,'GONGBU MOBILE CENTER','Hari Khanal','144428441');

/*inserting data into PRODUCTS table*/
insert into products
values (401,'SAMSUNG',19000.00,72,NULL),
(402,'NOKIA',12000.00,272,306),
(403,'LENOVO',16000.00,241,305),
(404,'ACER',46000.00,264,307),
(405,'DELL',19000.00,279,NULL),
(406,'HUWAEI',39000.00,178,NULL),
(407,'APPLE',44000.00,55,310),
(408,'GOOGLE',44000.00,144,315),
(409,'HTC',36000.00,87,NULL),
(410,'HONOR',36000.00,137,NULL),
(411,'INTEX',41000.00,276,315),
(412,'LAVA',12000.00,112,308),
(413,'MICROSOFT',17000.00,277,NULL),
(414,'PANASONIC',17000.00,230,NULL),
(415,'SONY',33000.00,89,303),
(416,'TECHNO',16000.00,234,314),
(417,'XIAOMI',37000.00,179,304),
(418,'ZTE',13000.00,190,301),
(419,'XOLO',33000.00,138,311),
(420,'VIVO',28000.00,189,308),
(421,'SPICE',32000.00,106,309),
(422,'ONE PLUS',11000.00,222,305),
(423,'MOTOROLA',38000.00,173,NULL),
(424,'MICROMAX',34000.00,151,NULL),
(425,'HP',39000.00,84,311);

/*inserting data into ORDERS table*/
insert into orders 
values (201,128,'2015-08-28','2015-09-14','2015-09-07'),
(202,125,'2018-06-27','2018-07-13','2018-07-07'),
(203,127,'2014-10-17','2014-10-26','2014-10-21'),
(204,134,'2011-01-03','2011-01-13','2011-01-08'),
(205,120,'2018-12-14','2019-01-03','2018-12-28'),
(206,110,'2011-02-17','2011-03-09','2011-03-04'),
(207,110,'2016-06-07','2016-06-17','2016-06-12'),
(208,124,'2014-08-06','2014-08-20','2014-08-15'),
(209,122,'2016-09-12','2016-09-18',NULL),
(210,107,'2016-04-26','2016-05-05','2016-04-28'),
(211,113,'2014-12-06','2014-12-14','2014-12-07'),
(212,120,'2018-05-27','2018-06-05','2018-05-30'),
(213,131,'2012-02-07','2012-02-15',NULL),
(214,105,'2013-03-03','2013-03-08',NULL),
(215,124,'2015-11-13','2015-11-18',NULL),
(216,121,'2010-08-09','2010-08-17',NULL),
(217,128,'2010-03-14','2010-03-30','2010-03-25'),
(218,134,'2012-01-24','2012-01-31','2012-01-26'),
(219,129,'2012-11-25','2012-12-09',NULL),
(220,101,'2017-02-16','2017-02-21',NULL),
(221,105,'2016-07-23','2016-08-06','2016-07-30'),
(222,115,'2010-02-10','2010-02-19','2010-02-12'),
(223,130,'2011-08-09','2011-08-17','2011-08-12'),
(224,114,'2011-05-21','2011-06-01','2011-05-27'),
(225,123,'2018-10-01','2018-10-09','2018-10-03'),
(226,128,'2019-06-25','2019-07-13',NULL),
(227,125,'2013-09-11','2013-10-01','2013-09-24'),
(228,108,'2017-04-15','2017-04-23','2017-04-16'),
(229,103,'2018-01-21','2018-02-05','2018-01-30'),
(230,128,'2019-01-31','2019-02-13','2019-02-07'),
(231,112,'2017-03-18','2017-04-07','2017-03-31'),
(232,128,'2014-04-24','2014-05-06','2014-04-30'),
(233,102,'2011-11-19','2011-12-05',NULL),
(234,103,'2018-05-12','2018-05-21','2018-05-14'),
(235,104,'2018-12-04','2018-12-16','2018-12-11'),
(236,101,'2017-08-15','2017-09-01','2017-08-26'),
(237,110,'2019-05-16','2019-06-04','2019-05-28'),
(238,108,'2013-01-03','2013-01-09',NULL),
(239,113,'2010-07-06','2010-07-13',NULL),
(240,113,'2011-10-23','2011-11-01','2011-10-27'),
(241,118,'2016-10-17','2016-11-02','2016-10-28'),
(242,128,'2017-08-11','2017-08-22','2017-08-16'),
(243,111,'2011-07-04','2011-07-16',NULL),
(244,113,'2014-06-26','2014-07-02','2014-06-27'),
(245,127,'2018-11-16','2018-11-30','2018-11-25'),
(246,103,'2014-06-05','2014-06-12',NULL),
(247,119,'2011-03-07','2011-03-23','2011-03-18'),
(248,125,'2011-10-12','2011-10-28',NULL),
(249,128,'2018-08-15','2018-08-20',NULL),
(250,129,'2011-12-09','2011-12-24','2011-12-17');

/*inserting data into ORDER_DETAILS table*/
insert into order_detail
values (501,205,408,10),
(502,201,402,34),
(503,235,417,15),
(504,241,407,47),
(505,228,412,11),
(506,223,409,15),
(507,212,423,22),
(508,237,417,34),
(509,201,404,35),
(510,235,417,21),
(511,203,413,35),
(512,203,406,16),
(513,235,411,30),
(514,206,411,30),
(515,240,416,22),
(516,239,407,38),
(517,230,424,10),
(518,245,422,41),
(519,244,416,16),
(520,212,415,13),
(521,206,420,29),
(522,206,423,28),
(523,242,408,29),
(524,227,406,13),
(525,231,420,42),
(526,228,422,46),
(527,230,402,45),
(528,202,401,33),
(529,249,413,22),
(530,235,401,33),
(531,232,412,28),
(532,217,425,41),
(533,239,420,17),
(534,201,415,42),
(535,243,419,9),
(536,224,414,28),
(537,242,414,8),
(538,203,425,17),
(539,230,413,30),
(540,215,416,49),
(541,215,401,50),
(542,230,409,26),
(543,212,405,39),
(544,218,425,15),
(545,211,402,11),
(546,210,414,17),
(547,206,411,40),
(548,222,417,50),
(549,213,406,42),
(550,247,402,21);