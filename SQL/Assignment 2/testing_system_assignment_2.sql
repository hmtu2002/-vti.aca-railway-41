DROP DATABASE IF EXISTS testing_system_assignment_2;
CREATE DATABASE testing_system_assignment_2;
use testing_system_assignment_2;

CREATE TABLE Department (
 DepartmentID 		INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
 DepartmentName		NVARCHAR(100)
);

INSERT INTO Department (DepartmentID,DepartmentName) VALUES (1, 'a');
INSERT INTO Department(DepartmentID,DepartmentName) VALUES (2, 'b'); 
INSERT INTO Department(DepartmentID,DepartmentName) VALUES (3, 'c'); 
INSERT INTO Department(DepartmentID,DepartmentName) VALUES (4,'d'); 
INSERT INTO Department(DepartmentID,DepartmentName) VALUES (5,'e');


CREATE TABLE `Position` (
 PositionID 	INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
 PositionName	enum('Dev', 'Test', 'Scrum Master', 'PM')
 );
 INSERT INTO `Position`(PositionID,PositionName) VALUES (1,'h');
 INSERT INTO `Position`(PositionID,PositionName) VALUES (2,'a');
 INSERT INTO `Position`(PositionID,PositionName) VALUES (3,'m');
 INSERT INTO `Position`(PositionID,PositionName) VALUES (4,'t');
 INSERT INTO `Position`(PositionID,PositionName) VALUES (5,'u');
 
 CREATE TABLE `ACCOUNT` (
 AccountID		INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
 Email 			VARCHAR(50) UNIQUE,
 Username		VARCHAR(50) UNIQUE check(length(Username) >=6 ),
 Fullname 		VARCHAR(50),
 DepartmentID 	INT,
 PositionID		INT,
 CreatDate 		DATETIME,
 CONSTRAINT lien_ket_01 FOREIGN KEY (DepartmentID) REFERENCES Department(DepartmentID),
 CONSTRAINT lien_ket_02 FOREIGN KEY (PositionID) REFERENCES `Position`(PositionID)
);	

INSERT INTO `ACCOUNT` (AccountID, Email, Username, Fullname, DepartmentID, PositionID, CreatDate) 
			   VALUES (2,'kho', 'qua','troi',3,4,'2010-12-22');

CREATE TABLE `Group` (
GroupID		INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
GroupName	CHAR (20),
CreatorID	INT,
CreateDate	DATE
);

 
 INSERT INTO `Group`(GroupID,GroupName,CreatorID,CreateDate)
			 VALUES (1,'hm',2,'2010-12-22');
 
CREATE TABLE  Group_account (
	GroupID			tinyint,
    AccountID		VARCHAR(50),
	JoinDate		DATETIME,
    FOREIGN KEY(GroupID) REFERENCES `Group`(GroupID)
);
INSERT INTO Group_account (GroupID,AccountID,JoinDate)
                   VALUES (1,2,'2010-12-22'); 
             
CREATE TABLE  Type_question (
	TypeID		INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    TypeName	CHAR(20)
    );
    
INSERT INTO Type_question (TypeID,TypeName)
				  VALUES (1,'tu');



CREATE TABLE Categoryquestion (
    CategoryID		INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    CategoryName	CHAR(20)
    );
    
INSERT INTO Categoryquestion (CategoryID,CategoryName)
					  VALUES (1,'tuuuuu');

CREATE TABLE Question (
	QuestionID 	INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    Content		VARCHAR(50),
    CategoryID	INT REFERENCES Categoryquestion(CategoryID),
    TypeID		TINYINT REFERENCES Type_question(TypeID),
    CreatorID	TINYINT,
    CreateDate 	DATE
    );
    
INSERT INTO Question (QuestionID,Content,CategoryID,TypeID,CreatorID,CreateDate) 
			  VALUES (1,'tuuuuuuu',2,3,4,'2010-12-22');
    
#Answer
CREATE TABLE Answer (
	AnswerID	INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    Content		VARCHAR(50),
    QuestionID	INT,
    isCorrect	VARCHAR(20)
    );

INSERT INTO Answer (AnswerID,Content,QuestionID,isCorrect)
			VALUES (1,'tuuuuuuuu',2,'backan');
select * from Answer;

#Exam
CREATE TABLE Exam (
	ExamID 		INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
 	`Code`	    VARCHAR(10),
 	Title		VARCHAR(20),
 	CategoryID	INT,
 	Duration 	VARCHAR(5),
 	CreatorID	TINYINT,
 	CreateDate	DATE
);
  INSERT INTO Exam (ExamID,`Code`,Title,CategoryID,Duration,CreatorID,CreateDate)
			VALUES (3,'tuuuuuuuuu','backan',4,5,6,'2010-12-22');

select * from Exam;

#Examquestion
CREATE TABLE Examquestion (
	ExamID		TINYINT,
    QuestionID	TINYINT
    );
INSERT INTO Examquestion (ExamID,QuestionID)
                  VALUES (1,2);
select * from Examquestion;