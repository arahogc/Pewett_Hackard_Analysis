
--Challenge deliverable one part 1: Create a table with retiring employees titles 
Select e.emp_no, 
 	e.first_name,
 	e.last_name, 
 	ti.title, 
 	ti.from_date, 
	ti.to_date 
Into retired_titles 
From employees as e
Inner join titles as ti 
On (e.emp_no = ti.emp_no)
Where (birth_date BETWEEN '1952-01-01' AND '1955-12-31') 
Order by emp_no; 

-- Use Dictinct with Orderby to remove duplicate rows from retired_titles table 
SELECT DISTINCT ON (rt.emp_no) rt.emp_no,
rt.first_name,
rt.last_name,
rt.title
INTO unique_titles
FROM retired_titles AS rt
ORDER BY emp_no ASC, to_date DESC;

--Count the number of unique titles in unique_titles and put into another table 
Select Count(ut.emp_no),ut.title
INTO retiring_titles
FROM unique_titles as ut
GROUP BY title 
ORDER BY COUNT(title) DESC;

--Select retiring employees that could potentially be mentors 
Select DISTINCT On (e.emp_no) e.emp_no, 
	e.first_name, 
	e.last_name, 
	e.birth_date, 
	de.from_date, 
	de.to_date, 
	ti.title
Into mentorship_eligiblity
From ((employees as e 
Inner join dept_emp as de on e.emp_no = de.emp_no)
Inner join titles as ti on ti.emp_no = e.emp_no)
WHERE (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
AND (de.to_date = '9999-01-01')
ORDER BY emp_no;