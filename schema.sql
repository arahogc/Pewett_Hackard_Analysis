--Creating tables for PH-EmployeeDB
Create Table departments(
	dept_no VARCHAR(4) NOT NULL,
	dept_name Varchar(40) NOT NUll, 
	PRIMARY KEY (dept_no),
	UNIQUE (dept_name)
); 

Create Table employees(
	emp_no INT NOT NULL, 
	birth_date Date NOT NULL, 
	first_name VARCHAR NOT NULL, 
	last_name VARCHAR NOT NULL, 
	gender VARCHAR NOT NULL, 
	hire_date DATE NOT NULL,
	PRIMARY KEY (emp_no)
);

Create Table dept_manager(
	dept_no Varchar(4) Not Null, 
	emp_no Int Not Null, 
	from_date Date Not Null, 
	to_date Date Not Null, 
	Foreign Key (emp_no) References employees (emp_no), 
	Foreign Key (dept_no) References departments (dept_no), 
	Primary Key (emp_no, dept_no)
); 

Create Table salaries (
	emp_no Int Not Null, 
	salary Int Not Null, 
	from_date Date Not Null, 
	to_date Date Not null, 
	Foreign Key (emp_no) References employees (emp_no),
	Primary Key (emp_no)
); 

Create Table dept_emp (
	emp_no Int Not Null, 
	dept_no Varchar(4) Not Null, 
	from_date Date Not Null, 
	to_date Date Not null, 
	Foreign Key (emp_no) References employees (emp_no), 
	Foreign Key (dept_no) References departments (dept_no), 
	Primary Key (emp_no, dept_no)
);

--Had issues using code below when uploading the data had to change code
Create Table titles (
	emp_no Int Not Null, 
	title Varchar Not Null, 
	from_date Date Not Null, 
	to_date Date Not Null, 
	Foreign Key (emp_no) References employees (emp_no), 
	Primary Key (emp_no)
); 

--Updated code inorder to upload corresponding csv data 
CREATE TABLE titles (
  emp_no INT NOT NULL,
  title VARCHAR(50) NOT NULL,
  from_date DATE NOT NULL,
  to_date DATE,
  FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
  PRIMARY KEY (emp_no, title, from_date)
);
Select * From departments; 