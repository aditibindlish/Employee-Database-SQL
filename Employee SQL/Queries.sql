
-- List the employee number, last name, first name, sex, and salary of each employee.

select e.emp_no, e.last_name, e.first_name, e.sex, s.salary 
from Employees as e
join salaries as s
on (e.emp_no=s.emp_no)



-- List the first name, last name, and hire date for the employees who were hired in 1986.
select first_name, last_name, hire_date 
from Employees 
WHERE hire_date between '01-01-1986' and '12-31-1986';


-- List the manager of each department along with their department number, department name, employee number, last name, and first name.
select dm.dept_no, d.dept_name, dm.emp_no as "Manager Emp No", e.last_name as "Manager Last Name", e.first_name  as "Manager First Name"
From departments as d
join dept_manager as dm
on (d.dept_no =dm.dept_no)
	join employees as e
	on (e.emp_no=dm.emp_no)


-- List the department number for each employee along with that employee’s employee number, last name, first name, and department name.
select  e.emp_no,  e.last_name, e.first_name, d.dept_name, de.dept_no
From employees as e
join dept_emp as de
on (de.emp_no =e.emp_no)
	join departments as d
	on (de.dept_no=d.dept_no)


-- List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
select last_name, first_name, sex
from employees
where  first_name = 'Hercules' and Last_name like 'B%'


-- List each employee in the Sales department, including their employee number, last name, and first name.
select emp_no, last_name, first_name
from employees
where emp_no in
(	select emp_no
	from dept_emp
	where dept_no in
	(	
		select dept_no 
		from departments
		where dept_name = 'Sales'
	)
);


-- List each employee in the Sales and Development departments, including their employee number, 
-- last name, first name, and department name.
select employees.emp_no, employees.last_name, employees.first_name
from dept_emp left join employees 
on dept_emp.emp_no = employees.emp_no
left join departments
on dept_emp.dept_no = departments.dept_no
where departments.dept_name in ('Sales', 'Development')



-- List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).
select last_name, count(last_name) as name_count
from employees
group by last_name
order by name_count desc



