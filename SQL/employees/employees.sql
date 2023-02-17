--use employees

drop table if exists employees;

create table employees
(
emp_id int identity,
emp_lastname varchar(50) not null,
emp_firstname varchar(50) not null,
emp_salary int not null check (emp_salary >= 0),
emp_hiredate date not null,
emp_manager_id int
);

alter table employees
	add constraint pk_emp primary key (emp_id),
	constraint fk_emp foreign key (emp_manager_id) references employees(emp_id);

INSERT INTO employees
(emp_manager_id,emp_lastname,emp_firstname,emp_salary,emp_hiredate)
VALUES
(NULL,'Holems', 'Cathy' ,100000, '2010-01-09'),
(NULL,'Nguyen', 'Caitlin' ,100000, '2010-01-09'),
( 1, 'Mannheim', 'Luc', 87500, '2017-06-17'),
( 2, 'Kipré', 'Abdou' ,42800 ,'2017-10-09'),
( 2, 'Martin', 'Valérie', 39500, '2018-03-30'),
( 1, 'Slezak', 'Daniel', 75000 ,'2011-09-09'),
( 5, 'Bahl', 'Tarik', 60000, '2014-04-08'),
( 5, 'Armanetti', 'Michaël', 60000, '2014-05-06'),
( 5, 'Goldman' ,'Estelle', 55000, '2016-04-20'),
( 5, 'Durand', 'Gabriel', 55000 ,'2016-12-02'),
( 8, 'Morel', 'Audrey', 46500, '2012-07-01'),
( 8, 'Carpentier', 'Guillaume', 58500, '2010-02-03'),
( 9, 'Lefebvre', 'Hugo', 42000, '2015-10-11'),
( 9, 'Sharif', 'Sonia', 54500, '2011-01-23'),
( 15, 'Fournier', 'Sabrina', 42000, '2017-10-27'),
( 5, 'Bower', 'Sarah', 49500, '2018-05-22'),
( 8, 'Dimario', 'Jordan' ,32500, '2019-06-30'),
( 9, 'Macdowel', 'Cindy', 32500, '2019-11-04');