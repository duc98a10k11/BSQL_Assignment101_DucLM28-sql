

-------------------- Create DB-----------------
CREATE DATABASE ASSIGNMENT201
use ASSIGNMENT201
GO
--------------------Q1: Create Table-----------------
CREATE TABLE EMPLOYEE(
    EmpNo INT NOT NULL PRIMARY KEY, 
    EmpName VARCHAR(30) NOT NULL,
    BirthDay DATE NOT NULL,
    DeptNo INT NOT NULL,
	MgrNo INT NOT NULL,
	StartDate DATE NOT NULL,
	Salary FLOAT NOT NULL,
	Levell INT NOT NULL CHECK(Levell BETWEEN 1 AND 7),
	Statuss INT NOT NULL CHECK(Statuss BETWEEN 0 AND 2),
	Note VARCHAR(255)
)

CREATE TABLE SKILL(
    SkillNo INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
    SkillName VARCHAR(30) NOT NULL,
    Note VARCHAR(255)
)

CREATE TABLE DEPARTMENT(
    DeptNo INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
    DeptName VARCHAR(30) NOT NULL,
    Note VARCHAR(255)
)

CREATE TABLE EMP_SKILL(
    SkillNo INT,
    EmpNo INT,
	SkillLevel INT NOT NULL CHECK(SkillLevel BETWEEN 1 AND 3),
	RegDate DATE NOT NULL,
	Descriptions VARCHAR(255) NOT NULL,
	FOREIGN KEY (SkillNo) REFERENCES SKILL(SkillNo),
	FOREIGN KEY (EmpNo) REFERENCES EMPLOYEE(EmpNo)
)
--------------------------------------------------------------------

--------------------Q2: Add an Email field to EMPLOYEE-----------------
ALTER TABLE EMPLOYEE
ADD Email VARCHAR(255) UNIQUE;

GO
-------------------- Set value to 0 of MgrNo and Statuss -----------------
ALTER TABLE EMPLOYEE
ADD CONSTRAINT MgrNo 
DEFAULT '0' FOR MgrNo;

GO
ALTER TABLE EMPLOYEE
ADD CONSTRAINT Statuss 
DEFAULT '0' FOR Statuss;
------------------------------------------------------------------------------
GO
-------------------- Q3: Add the FOREIGN KEY constrain -----------------
ALTER TABLE EMPLOYEE
ADD FOREIGN KEY (DeptNo) REFERENCES DEPARTMENT(DeptNo);

GO
-------------------- Remove Descriptions field from EMP_SKILL table -----------------
ALTER TABLE EMP_SKILL 
DROP COLUMN Descriptions;
--------------------------------------------------------------------------------------

-------------------- Q4: Add at least 5 records into each of the created tables. -----------------
