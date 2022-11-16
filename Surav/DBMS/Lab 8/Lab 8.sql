-- no.1
CREATE TABLE employee_audit(
	id int primary key auto_increment,
    emp_id int,
    foreign key(emp_id) references employees(employee_id),
    last_name varchar(30),
    action_ varchar(30) not null,
    change_date datetime
);

-- no.2
DELIMITER $$
CREATE TRIGGER trigger_insert 
	after insert 
		on employees for each row 
        begin
			insert into employee_audit
            set emp_id = new.employee_id,
				last_name=new.last_name,
                action_="insert",
                change_date=(select now());           
        end;
$$

select * from employees;

-- inserting in employee table
insert into employees
values(400,"hari","sharma","hari.sharma@example.com","9841222222","2001-01-15","2","25000","101","9",current_date());

-- no.3
DELIMITER $$
CREATE TRIGGER trigger_delete
	after delete 
		on employees for each row 
        begin
			insert into employee_audit
            set emp_id = OLD.employee_id,
				last_name=OLD.last_name,
                action_="delete",
                change_date=(select now());           
        end;
$$

-- deleting in employee table
delete from employees
where employee_id = 100;