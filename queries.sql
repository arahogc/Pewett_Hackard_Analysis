-- Retirement eligibility
Select first_name, last_name 
From employees
Where (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');

--Number of employees retiring 
Select Count(first_name)
From employees 
Where (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');

--Make new table for retiring employees
Select first_name, last_name 
Into retirement_info
From employees
Where (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');
--Need to add info to retirement table
Drop table retirement_info;

-- Create new table for retiring employees
SELECT emp_no, first_name, last_name
INTO retirement_info
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');
-- Check the table
SELECT * FROM retirement_info;

--Joining departments and dept_manager tables 
Select departments.dept_name, 
	dept_manager.emp_no, 
	dept_manager.from_date, 
	dept_manager.to_date 
From departments
Inner join dept_manager
On departments.dept_no = dept_manager.dept_no; 

--Joining retirement and dept_emp tables using left join (left = retirement
--right = dept_emp)
Select retirement_info.emp_no, 
	retirement_info.first_name, 
	retirement_info.last_name, 
	dept_emp.to_date
From retirement_info
Left join dept_emp
On retirement_info.emp_no = dept_emp.emp_no; 

--Practice with shortened names 
--Select ri.emp_no, 
	--ri.first_name, 
	--ri.last_name, 
	--de.to_date 
--From retirement_info as ri 
--Left join dept_emp as de 
--On ri.emp_no = de.emp_no; 

--Use left join for ri and de tables and create a new table 
Select ri.emp_no, 
	ri.first_name, 
	ri.last_name, 
	de.to_date
Into current_emp 
From retirement_info as ri 
Left join dept_emp as de 
On ri.emp_no = de.emp_no
Where de.to_date = ('9999-01-01')