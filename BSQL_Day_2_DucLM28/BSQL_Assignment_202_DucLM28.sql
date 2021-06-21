
CREATE DATABASE ASSIGNMENT202
use ASSIGNMENT202

----------------------1: create table Trainee and insert value---------------------

CREATE TABLE Trainee(
TraineeID INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
Full_Name VARCHAR(255) NOT NULL,
Birth_Date DATE NOT NULL,
Gender VARCHAR(255) NOT NULL CHECK (Gender IN ('MALE', 'FEMALE')),
ET_IQ INT NOT NULL CHECK (ET_IQ BETWEEN 0 AND 20),
ET_Gmath INT NOT NULL CHECK (ET_Gmath BETWEEN 0 AND 20),
ET_English INT NOT NULL CHECK (ET_English BETWEEN 0 AND 50),
Training_Class VARCHAR(255) NOT NULL,
Evaluation_Notes VARCHAR(255)

);

INSERT INTO dbo.Trainee(Full_Name, Birth_Date, Gender, ET_IQ, ET_Gmath, 
ET_English, Training_Class, Evaluation_Notes)
VALUES
('HOAI', convert(datetime,'01-01-00 00:00:00 AM',5), 'FEMALE', 15, 19, 18, 'CL07', 'GOOD'),
('CHIEN', convert(datetime,'20-07-00 00:00:00 AM',5), 'MALE', 18, 20, 18, 'CL07', 'GOOD'),
('YEN', convert(datetime,'15-04-00 00:00:00 AM',5), 'FEMALE', 18, 20, 18, 'CL07', 'GOOD'),
('LONG', convert(datetime,'14-06-00 00:00:00 AM',5), 'MALE', 5, 12, 13, 'CL06', 'GOOD'),
('HOANG', convert(datetime,'08-09-00 00:00:00 AM',5), 'MALE', 4, 9, 10, 'CL06', 'GOOD'),
('HAI', convert(datetime,'10-12-00 00:00:00 AM',5), 'MALE', 10, 6, 6, 'CL03', 'GOOD'),
('VAN', convert(datetime,'15-11-00 00:00:00 AM',5), 'FEMALE', 5, 6, 5, 'CL04', 'GOOD'),
('ANH', convert(datetime,'18-08-00 00:00:00 AM',5), 'FEMALE', 12, 4, 3, 'CL03', 'GOOD'),
('MIEN', convert(datetime,'19-07-00 00:00:00 AM',5), 'FEMALE', 9, 12, 18, 'CL04', 'GOOD'),
('LAN', convert(datetime,'22-01-00 00:00:00 AM',5), 'FEMALE', 5, 9, 9, 'CL04', 'GOOD');

--------------------------------------------------------------------
----------------------2: Add Fsoft_Account field to Trainee table---------------------
-----idea: gán Fsoft_Account Null, sau đó chèn 10 giá trị vào table Trainee và drop constraint NULL
-----tiếp theo gán lại Fsoft_Account là UNIQUE and NOT NULL------

ALTER TABLE Trainee
ADD Fsoft_Account INT NULL;

UPDATE Trainee
SET Fsoft_Account = '111'
WHERE TraineeID = 1;

UPDATE Trainee
SET Fsoft_Account = '112'
WHERE TraineeID = 2;

UPDATE Trainee
SET Fsoft_Account = '113'
WHERE TraineeID = 3;

UPDATE Trainee
SET Fsoft_Account = '114'
WHERE TraineeID = 4;

UPDATE Trainee
SET Fsoft_Account = '115'
WHERE TraineeID = 5;

UPDATE Trainee
SET Fsoft_Account = '116'
WHERE TraineeID = 6;

UPDATE Trainee
SET Fsoft_Account = '117'
WHERE TraineeID = 7;

UPDATE Trainee
SET Fsoft_Account = '118'
WHERE TraineeID = 8;

UPDATE Trainee
SET Fsoft_Account = '119'
WHERE TraineeID = 9;

UPDATE Trainee
SET Fsoft_Account = '120'
WHERE TraineeID = 10;

ALTER TABLE Trainee
ADD UNIQUE (Fsoft_Account);

ALTER TABLE Trainee
DROP CONSTRAINT [UQ__Trainee__A424B3C4315FBD09];

ALTER TABLE Trainee
ALTER COLUMN Fsoft_Account INT NOT NULL;

-----------------------------------------------
----------------------3: create view---------------------

CREATE VIEW view_ETPassedTrainees
AS
SELECT *
FROM Trainee 
WHERE (ET_IQ + ET_Gmath) >= 20
AND ET_IQ >= 8
AND ET_Gmath >= 8
AND ET_English >= 18

--------------------4: Trainees passed the entry test, group birth months---------

SELECT Full_Name, DATEPART(MONTH, Birth_Date) AS Birth_Month
FROM view_ET_Passed_Trainees
GROUP BY Full_Name, DATEPART(MONTH, Birth_Date)


--------------------5: Show age, longest name and basic information----------------------

SELECT TOP 1 *,LEN(Full_Name) LengthOfName, 
DATEDIFF(hour,Birth_Date,GETDATE())/8766 AS AGE
FROM Trainee 
ORDER BY LengthOfName DESC, Full_Name ASC;



