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
 
