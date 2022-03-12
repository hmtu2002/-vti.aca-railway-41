create database testing_system;

use testing_system;

#table department

create table department(
  DepartmentID INT NOT NULL AUTO_INCREMENT,
  DepartmentName nvarchar(100),
  primary key(DepartmentID)
  );
  
  -- bai tap 2
  




#table department

create table position (
	PositionID INT NOT NULL AUTO_INCREMENT,
    PositionName	varchar(100),
    primary key(positionID)
);

-- bai tap 3




#table department

create table `account` (
	AccountID 		INT NOT NULL AUTO_INCREMENT,
    Email 			varchar(100),
    Username		varchar(50),
    Fullname		nvarchar(20),
	DepartmentID	int,
    PositionID 		int,
    CreateDate		datetime,
    primary key(accoutID)
);

-- bai tap 4




create table `group` (
	GroupID 	int,
    GroupName	varchar(10),
    CreatorID	int,
    CreateDate	datetime,
	primary key(GroupId)
    );

#Groupaccount
create table Group_account (
	GroupID			TINYINT,
    AccountID		VARCHAR(50),
	JoinDate		datetime
);

#type question
create table Type_question (
	TypeID		int not null auto_increment,
    TypeName	varchar(50)
    );
    
#categoryquestion
create table Categoryquestion (
    CategoryID		int not null auto_increment,
    CategoryName	varchar(50)
    );

#question
create table question (
	QuestionID 	int not null auto_increment,
    Content		varchar(50),
    CategoryID	int not null auto_increment,
    TypeID		int not null auto_increment,
    CreatorID	int,
    CreateDate 	datetime
    );
    
#Answer
create table Answer (
	AnswerID	int not null auto_increment,
    Content		varchar(50),
    QuestionID	int not null auto_increment,
    isCorrect	varchar(10)
    );

#Exam
create table Exam (
	ExamID 		int not null auto_increment,
 	"Code"		varchar(10),
 	Title		varchar(20),
 	CategoryID	int not null auto_increment,
 	Duration 	varchar(5),
 	CreatorID	int,
 	CreateDate	datetime
),
    
#Examquestion
create table Examquestion (
	ExamID		TINYINT,
    QuestionID	TINYINT
    );

    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
