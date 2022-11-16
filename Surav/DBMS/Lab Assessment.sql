CREATE database student;

CREATE TABLE student(
	sid INT PRIMARY KEY auto_increment,
	student_name VARCHAR (50) NOT NULL,
    phone CHAR(10) UNIQUE,
    gender CHAR(1),
    CHECK (gender IN("m","f","o"))
);

ALTER TABLE student
ADD program VARCHAR(10) NOT NULL
CHECK (program IN("BCIS","BBA","BBA-TT","BBA-BI"));

select * from student;

insert into student values("100","Surav Shakya","9841222200","m","BCIS");
insert into student values("101","Rushma Singh","9841123400","f","BCA");
insert into student values("104","Surav Shakya","9841343420","l","BBS");