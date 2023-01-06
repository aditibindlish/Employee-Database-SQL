# Employee-Database-SQL
##Background
###As a new data engineer at Pewlett Hackard (a fictional company), taken up a research project about people whom the company employed during the 1980s and 1990s. All that remains of the employee database from that period are six CSV files.

###For this project, designed tables to hold the data from the CSV files, imported the CSV files into a SQL database, and then answer some questions about the data. That is, performed data modeling, data engineering, and data analysis, respectively.

###Steps:
Created a new repository, and cloneed it on system.


###Data Modeling
Inspected the CSV files, sketched an Entity Relationship Diagram of the tables. To create the sketch, used a web tool - QuickDBD

###Data Engineering
Used the provided information to create a table schema for each of the six CSV files, ensuring the following:

-specify the data types, primary keys, foreign keys, and other constraints.

-Created a composite key wherre necessary, which takes two primary keys to uniquely identify a row.
-Imported each CSV file into its corresponding SQL table.


###Data Analysis
Following queries were answered:
-Listed the employee number, last name, first name, sex, and salary of each employee.

-Listed the first name, last name, and hire date for the employees who were hired in 1986.

-Listed the manager of each department along with their department number, department name, employee number, last name, and first name.

-Listed the department number for each employee along with that employee’s employee number, last name, first name, and department name.

--Listed first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.

--Listed each employee in the Sales department, including their employee number, last name, and first name.

--Listed each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.

--Listed the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).
