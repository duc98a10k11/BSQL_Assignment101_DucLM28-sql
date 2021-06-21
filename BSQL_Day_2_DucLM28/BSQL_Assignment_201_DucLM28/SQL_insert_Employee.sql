Insert into dbo.EMPLOYEE(EmpNo, EmpName, BirthDay, DeptNo, MgrNo, StartDate, 
Salary, Levell, Statuss, Note, Email)
values
(1,'chien', convert(datetime,'18-06-12 10:34:09 PM',5), 1, 0, 
convert(datetime,'18-06-00 10:34:09 PM',5),
30, 1, 0, 'essy', 'chien@gmail.com'),

(2,'hai', convert(datetime,'20-07-00 10:34:09 PM',5), 2, 0, 
convert(datetime,'18-06-12 10:34:09 PM',5), 
40, 6, 0, 'hard', 'hai@gmail.com'),

(3,'long', convert(datetime,'19-08-00 10:34:09 PM',5), 3, 0, 
convert(datetime,'20-08-20 10:40:09 PM',5), 
60, 4, 0, 'essy', 'long@gmail.com'),

(4,'yen', convert(datetime,'01-01-00 10:34:09 PM',5), 4, 0, 
convert(datetime,'19-10-20 12:40:09 AM',5),
70, 5, 0, 'hard', 'yen@gmail.com'),

(5,'hoai', convert(datetime,'01-01-00 10:34:09 PM',5), 5, 0, 
convert(datetime,'15-02-20 11:40:09 AM',5),
50, 2, 0, 'hard', 'hoai@gmail.com');

IF EXISTS (
	SELECT name 
		FROM sys.databases 
		WHERE name = N'ASSIGNMENT202'
)
DROP DATABASE ASSIGNMENT202

