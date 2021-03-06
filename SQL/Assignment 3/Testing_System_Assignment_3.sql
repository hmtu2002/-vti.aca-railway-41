drop DATABASE Testing_System_Assignment_3;
create database Testing_System_Assignment_3;

use Testing_System_Assignment_3;

#table department

create table department(
  DepartmentID INT AUTO_INCREMENT,
  DepartmentName VARCHAR(100),
  primary key(DepartmentID)
  );
INSERT INTO Department (DepartmentID,DepartmentName) VALUES (100,'Sale');
INSERT INTO Department (DepartmentID,DepartmentName) VALUES (101,'IT');
INSERT INTO Department (DepartmentID,DepartmentName) VALUES (102,'HR');
INSERT INTO Department (DepartmentID,DepartmentName) VALUES (103,'Marketing');
INSERT INTO Department (DepartmentID,DepartmentName) VALUES (104,'Sale');
INSERT INTO Department (DepartmentID,DepartmentName) VALUES (105,'IT');
INSERT INTO Department (DepartmentID,DepartmentName) VALUES (106,'HR');
INSERT INTO Department (DepartmentID,DepartmentName) VALUES (107,'Marketing');
INSERT INTO Department (DepartmentID,DepartmentName) VALUES (108,'IT');
INSERT INTO Department (DepartmentID,DepartmentName) VALUES (109,'Sale');
SELECT * from department;


create table `position`(
	PositionID      INT PRIMARY key AUTO_INCREMENT,
    PositionName	ENUM('Dev','Test','Scrum Master', 'PM')
);

INSERT INTO `position` (PositionID,PositionName) VALUES (1000,'Dev');
INSERT INTO `position` (PositionID,PositionName) VALUES (1001,'Test');
INSERT INTO `position` (PositionID,PositionName) VALUES (1002,'Scrum Master');
INSERT INTO `position` (PositionID,PositionName) VALUES (1003,'PM');
INSERT INTO `position` (PositionID,PositionName) VALUES (1004,'Dev');
INSERT INTO `position` (PositionID,PositionName) VALUES (1005,'Test');
INSERT INTO `position` (PositionID,PositionName) VALUES (1006,'Scrum Master');
INSERT INTO `position` (PositionID,PositionName) VALUES (1007,'PM');
INSERT INTO `position` (PositionID,PositionName) VALUES (1008,'Dev');
INSERT INTO `position` (PositionID,PositionName) VALUES (1009,'PM');

create table `account` (
	AccountID 		INT  AUTO_INCREMENT,
    Email 			varchar(100) unique key,
    Username		varchar(50) NOT NULL,
    Fullname		varchar(100) NOT NULL,
	DepartmentID	int,
    PositionID 		int,
    CreateDate		DATE DEFAULT (DATE(now())),
    primary key(AccountID),
	Foreign Key(DepartmentID) REFERENCES department(DepartmentID),
    Foreign Key(PositionID) REFERENCES `position`(PositionID)
);
INSERT INTO `account` (AccountID,Email,Username,Fullname,DepartmentID,PositionID,CreateDate) VALUES 
	(1,'manhtu.cau@gmail.com','ha.manhtu','H?? M???nh T??', 102, 1001,'2017-3-20'),
    (2,'ducanht1108@gmail.com','anh.tranduc','Tr???n ?????c Anh', 101,1001,'2020-10-20'),
    (3,'manhtucau@gmail.com', 'tu.hamanh', 'H?? M???nh T??', 102, 1002,'2020-10-20'),
    (4,'nguyencaohieu.15.06.1996@gmail.com','hieu.nguyencao','Nguy???n Cao Hi???u', 103, 1003,'2021-10-21'),
    (5,'chuongst99@gmail.com','chuong.nguyen','Nguy???n Ch????ng', 104, 1004,'2021-10-21'),
    (6,'nguyenquytruong04@gmail.com','truong.nguyenquy','Nguy???n Qu?? Tr?????ng',100,1002,'2021-10-21'),
    (7,'minhthuan1612@gmail.com','thuan.leminh','L?? Minh Thu???n',101,1001,'2021-10-21'),
    (8,'namplc6789@gmail.com','nam.tranvan','Tr???n V??n Nam', 102, 1002,'2021-10-21'),
    (9,'nguyenduc8696@gmail.com','duc.nguyenhuu','Nguy???n H???u ?????c', 104, 1003,'2022-10-22'),
    (10,'ngohoangminh12111996official@gmail.com','minh.ngohoang','Ng?? Ho??ng Minh',103,1005,'2022-10-22'),
    (11,'nguyennhi2521998@gmail.com','nhi.nguyenthiphuong','Nguy???n Th??? Ph????ng Nhi',104, 1004,'2022-10-23'),
    (12,'quynhziumy@gmail.com','quynh.nguyenthinhu','Nguy???n Th??? Nh?? Qu???nh',100, 1002,'2022-10-23'),
    (13,'tuannhdinhtrong1@gmail.com','anh.dinhtrongtuan','??inh Tr???ng Tu???n Anh',102, 1003,'2019-10-23'),
    (14,'thanhbuiduc1939@gmail.com','thanh.buiduc','B??i ?????c Th??nh',104,1000,'2018-10-23'),
    (15,'dangvodich@gmail.com','dang.nguyenhai','Nguy???n H???i ????ng',102,1001,'2022-03-20'),
	(16,'duongvandao@gmail.com','dao.duongvan','D????ng V??n ????o',102,1000,'2022-03-20'),
    (17,'duongqua@gmail.com','qua.duong','D????ng Qu??',102,1004,'2022-03-20'),
    (18,'dangngocbao@gmail.com','bao.dangngoc','?????ng Ng???c B???o',104,1004,'2022-03-20')
    ;



create table `group` (
	GroupID 	INT,
    GroupName	varchar(100),
    CreatorID	int,
    CreateDate	date DEFAULT(DATE(now())),
	primary key(GroupId),
    FOREIGN KEY (CreatorID) REFERENCES `account`(AccountID)
    );
    INSERT INTO `group` (GroupID,GroupName,CreatorID,CreateDate) VALUES 
    (21,'CLB LOL',1,'20-03-20'),
    (22,'CLB B??ng ????',2,'20-03-20'),
    (23,'CLB Ch???y',3,'20-03-20'),
    (24,'CLB Ph?????t',4,'20-03-20'),
    (25,'CLB T??nh Nguy???n Vi??n',5,'20-03-20'),
    (26,'CLB Ph??ng Ch???ng D???ch',1,'20-03-21'),
    (27,'CLB IT',2,'20-03-19'),
    (28,'CLB D???y Tr?????c 12h',3,'20-03-20'),
    (29,'Tin H???c',4,'20-03-20'),
    (30,'CLB Rw41',5,'20-03-20')
    ;
    
create table Group_account (
	GroupID			INT PRIMARY key,
    AccountID		INT,
	JoinDate		date,
    Foreign Key(GroupID) REFERENCES `group`(GroupID)
);
INSERT INTO Group_account (GroupID) VALUES 
									(21);

create table Type_question (
	TypeID		int PRIMARY key,
    TypeName	ENUM('Essay', 'Multiple-Choice')
    );
INSERT INTO Type_question(TypeID,TypeName) VALUES 
	(1,'Essay'),
    (2,'Multiple-Choice'),
    (3,'Essay'),
    (4,'Multiple-Choice'),
    (5,'Essay'),
    (6,'Multiple-Choice'),
    (7,'Essay'),
    (8,'Multiple-Choice'),
    (9,'Essay'),
    (10,'Multiple-Choice')
;

create table Categoryquestion (
    CategoryID		int auto_increment,
    CategoryName	varchar(50),
    PRIMARY KEY(CategoryID)
    );
 INSERT INTO Categoryquestion(CategoryID,CategoryName) VALUES 
(30,'CategoryName1'),
(31,'CategoryName2'),
(32,'CategoryName3'),
(33,'CategoryName4'),
(34,'CategoryName5'),
(35,'CategoryName6'),
(36,'CategoryName7'),
(37,'CategoryName8'),
(38,'CategoryName9'),
(39,'CategoryName10')
;
 
create table question (
	QuestionID 	int  auto_increment,
    Content		varchar(1000),
    CategoryID	int,
    TypeID		int,
    CreatorID	int,
    CreateDate 	date default (date(now())),
    PRIMARY key(QuestionID),
    FOREIGN KEY(CategoryID) REFERENCES Categoryquestion(CategoryID),
    FOREIGN KEY(TypeID) REFERENCES Type_question(TypeID),
    FOREIGN KEY(CreatorID) REFERENCES `position`(positionID)
    );
    select * from question;
INSERT INTO question(QuestionID,Content,CategoryID,TypeID,CreatorID) VALUES 
(100,'l??m quen 1 ng?????i b???n m???i m???i tu???n',30,1,1000),
(101,'24h l??m c??n',31,2,1001),
(102,'d???y c??ch u???ng n?????c b???ng mi???ng',32,3,1002),
(103,'yasuo c??n 5',33,4,1003),
(104,'c??ch c???m ????a',34,5,1004),
(105,'c??ch c???m th??a',35,6,1005),
(106,'c??ch ng??? m??? m???t',36,7,1006),
(107,'c??ch 10?? m??m sql',37,8,1007),
(108,'l??m vi???c t???t m???i ng??y',38,9,1008),
(109,'luy???n th??i quen ?????c s??ch m???i ng??y',39,10,1009)
;

create table Answer (
	AnswerID	int PRIMARY key,
    Content		varchar(200),
    QuestionID	int,
    isCorrect	varchar(100) null,
    FOREIGN KEY(QuestionID) REFERENCES question(questionID)
    );
INSERT INTO Answer(AnswerID,Content) VALUES 
(1,'th???c d???y,v??? sinh,l??m vi???c,h???c t???p day1'),
(2,'th???c d???y,v??? sinh,l??m vi???c,h???c t???p day2'),
(3,'th???c d???y,v??? sinh,l??m vi???c,h???c t???p day3'),
(4,'th???c d???y,v??? sinh,l??m vi???c,h???c t???p day4'),
(5,'th???c d???y,v??? sinh,l??m vi???c,h???c t???p day5'),
(6,'th???c d???y,v??? sinh,l??m vi???c,h???c t???p day6'),
(7,'th???c d???y,v??? sinh,l??m vi???c,h???c t???p day7'),
(8,'th???c d???y,v??? sinh,l??m vi???c,h???c t???p day8'),
(9,'th???c d???y,v??? sinh,l??m vi???c,h???c t???p day9'),
(10,'th???c d???y,v??? sinh,l??m vi???c,h???c t???p day10')
;

create table Exam (
	ExamID 		int PRIMARY key AUTO_INCREMENT,
	`code`		VARCHAR(20) not null,
    title		VARCHAR(50),
    categoryID 	INT,
    duration	TIME,
    creatorID	INT,
    createdate	date default (date(now())),
    FOREIGN KEY (categoryID) REFERENCES question(CategoryID),
    FOREIGN KEY (creatorID) REFERENCES `account`(accountID)
    );
INSERT INTO Exam(`code`,title,duration,createdate) VALUES 
('VA000374','Ki???m Tra 1 Ti???t','00:45:00','2022-03-20'),
('VA000375','Ki???m Tra 1 Ti???t','00:45:00','2022-03-20'),
('VA000376','Ki???m Tra 1 Ti???t','00:45:00','2022-03-20'),
('VA000377','Ki???m Tra 1 Ti???t','00:45:00','2022-03-20'),
('VA000378','Ki???m Tra 1 Ti???t','00:45:00','2022-03-20'),
('VA000330','Ki???m Tra 1 Ti???t','00:45:00','2022-03-20'),
('VA000379','Ki???m Tra 1 Ti???t','00:45:00','2022-03-20'),
('VA000382','Ki???m Tra 1 Ti???t','00:45:00','2022-03-20'),
('VA000384','Ki???m Tra 1 Ti???t','00:45:00','2022-03-20'),
('VA000394','Ki???m Tra 1 Ti???t','00:45:00','2022-03-20')
;
create table Examquestion (
	ExamID		INT PRIMARY key AUTO_INCREMENT,
    QuestionID	INT,
    FOREIGN KEY (ExamID) REFERENCES Exam(ExamID)
    );
INSERT INTO Examquestion(QuestionID) VALUES 
(1);
SELECT max(length(fullname)) FROM `account`; -- l???y ra t??n d??i nh???t.
-- b??i t???p 2
SELECT * from department;
-- b??i t???p 3
SELECT departmentID from department WHERE departmentname='sale';
-- b??i t???p 4
SELECT * from `account` WHERE length(fullname);
SELECT * from `account` WHERE length(fullname)=(select max(length(fullname)) from `account`);
-- bai tap 5 
SELECT * from `account` WHERE length(fullname)=(select max(length(fullname)) from `account` WHERE departmentID=103) and departmentID=103;
-- bai tap 6 
SELECT groupName from `group` WHERE CreateDate>=2019-12-20;

-- bai tap 7
SELECT * from question;
SELECT questionID from question where  questionID>=4;

-- bai tap 14
UPDATE `account`
SET fullname= 'Nguy???n B?? L???c', email='loc.nguyenba@vti.com.vn' WHERE accountID=5;

UPDATE `account`
SET fullname= 'Nguy???n B?? L???c', email='loc.nguyenba@vti.com.vn' WHERE accountID=5;
SELECT * from `account`;
