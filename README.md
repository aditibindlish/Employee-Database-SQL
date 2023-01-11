# Employee-Database-SQL
## Background

### As a new data engineer at Pewlett Hackard (a fictional company), taken up a research project about people whom the company employed during the 1980s and 1990s. All that remains of the employee database from that period are six CSV files.

### For this project, designed tables to hold the data from the CSV files, imported the CSV files into a SQL database, and then answer some questions about the data. That is, performed data modeling, data engineering, and data analysis, respectively.

### Created a new repository, and cloned it on system. Folder Employee SQL consistes of .png file for ERD, .sql files for schema and queries


### Data Modeling
Inspected the CSV files to understand the relationships between various tables. 
- Two tables had just primary keys : Titles wirh title_id as pk, Departments and dept_no as pk
- Employees tables had emp_no as PK and Emp_title_id as fk from titles table
- Salaries table had emp_no as pk and fk both, from Employees table
- Depy_Emp table had two columns both as FKs from Employees table and Departments table, defined a composite key as PK in this table
- Dept_Manager had two columns both as FKs from Employees table and Departments table, also defined a composite key as PK in this table

Based on above, an Entity Relationship Diagram of the tables was sketched. To create the sketch, web tool - QuickDBD was used.


### Data Engineering
Used the above modelling and available information, created a table schema for each of the six CSV files, ensuring the following as below:

CREATE TABLE Departments (
    Dept_No VARCHAR(30) NOT NULL, 
    Dept_Name VARCHAR(30) NOT NULL,
    PRIMARY KEY (Dept_No)
);

CREATE TABLE Titles (
    Title_Id VARCHAR(30) NOT NULL, 
    Title VARCHAR(30) NOT NULL,
    PRIMARY KEY (Title_Id)
);


CREATE TABLE Employees(
    Emp_No INTEGER NOT NULL,
    Emp_title_id VARCHAR(10) NOT NULL, 
    FOREIGN KEY (Emp_title_id) REFERENCES Titles(Title_Id),
    Birth_Date DATE NOT NULL,
    First_Name VARCHAR(50) NOT NULL,
    Last_Name VARCHAR(50) NOT NULL,
    Sex VARCHAR(1) NOT NULL,
    Hire_Date DATE NOT NULL,
    PRIMARY KEY (Emp_No)
);


CREATE TABLE Dept_Emp (
    Emp_No INTEGER NOT NULL, 
    Dept_No VARCHAR(30) NOT NULL,
    FOREIGN KEY (Dept_No) REFERENCES Departments(Dept_No),
    Foreign KEY (Emp_No) REFERENCES Employees(Emp_No),
    PRIMARY KEY(Emp_No,Dept_No)
);


CREATE TABLE Salaries (
    Emp_No INTEGER NOT NULL, 
    FOREIGN KEY (Emp_No) REFERENCES Employees(Emp_No),
    Salary INTEGER NOT NULL,
    PRIMARY KEY (Emp_No)
);



CREATE TABLE Dept_Manager(
    Dept_No VARCHAR(30) NOT NULL,
      FOREIGN KEY (Dept_No) REFERENCES Departments(Dept_No),
      Emp_No INTEGER NOT NULL,
      FOREIGN KEY (Emp_No) REFERENCES Employees(Emp_No),
     PRIMARY KEY (Dept_No, Emp_No)
);
 

-- drop table salaries
-- select * from dept_emp
-- delete from employees




#### The following was ensured while creating schema

- specified the data types, primary keys, foreign keys, and other constraints.
- Created a composite key wherre necessar to identify a row in a unique way
- Imported each CSV file into its corresponding SQL table in the order of table creation so that relationships are satified and dont return errors while loading data.


### Data Analysis
Following queries were answered:
- Listed the employee number, last name, first name, sex, and salary of each employee.

        select e.emp_no, e.last_name, e.first_name, e.sex, s.salary 
        from Employees as e
        join salaries as s
        on (e.emp_no=s.emp_no)

- Listed the first name, last name, and hire date for the employees who were hired in 1986.

        select first_name, last_name, hire_date 
        from Employees 
        WHERE hire_date between '01-01-1986' and '12-31-1986';

- Listed the manager of each department along with their department number, department name, employee number, last name, and first name.

        select dm.dept_no, d.dept_name, dm.emp_no as "Manager Emp No", e.last_name as "Manager Last Name", e.first_name  as "Manager First Name"
        From departments as d
        join dept_manager as dm
        on (d.dept_no =dm.dept_no)
            join employees as e
            on (e.emp_no=dm.emp_no)

- Listed the department number for each employee along with that employee’s employee number, last name, first name, and department name.

        select  e.emp_no,  e.last_name, e.first_name, d.dept_name, de.dept_no
        From employees as e
        join dept_emp as de
        on (de.emp_no =e.emp_no)
            join departments as d
            on (de.dept_no=d.dept_no)

- Listed first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.

        select last_name, first_name, sex
        from employees
        where  first_name = 'Hercules' and Last_name like 'B%'


- Listed each employee in the Sales department, including their employee number, last name, and first name.

        select emp_no, last_name, first_name
        from employees
        where emp_no in
        (    select emp_no
            from dept_emp
            where dept_no in
            (    
                select dept_no 
                from departments
                where dept_name = 'Sales'
            )
        );

- Listed each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.

        select employees.emp_no, employees.last_name, employees.first_name
        from dept_emp left join employees 
        on dept_emp.emp_no = employees.emp_no
        left join departments
        on dept_emp.dept_no = departments.dept_no
        where departments.dept_name in ('Sales', 'Development')

- Listed the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).

        select last_name, count(last_name) as name_count
        from employees
        group by last_name
        order by name_count desc
