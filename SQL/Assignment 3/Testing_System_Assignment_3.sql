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
	(1,'manhtu.cau@gmail.com','ha.manhtu','Hà Mạnh Tú', 102, 1001,'2017-3-20'),
    (2,'ducanht1108@gmail.com','anh.tranduc','Trần Đức Anh', 101,1001,'2020-10-20'),
    (3,'manhtucau@gmail.com', 'tu.hamanh', 'Hà Mạnh Tú', 102, 1002,'2020-10-20'),
    (4,'nguyencaohieu.15.06.1996@gmail.com','hieu.nguyencao','Nguyễn Cao Hiếu', 103, 1003,'2021-10-21'),
    (5,'chuongst99@gmail.com','chuong.nguyen','Nguyễn Chương', 104, 1004,'2021-10-21'),
    (6,'nguyenquytruong04@gmail.com','truong.nguyenquy','Nguyễn Quý Trường',100,1002,'2021-10-21'),
    (7,'minhthuan1612@gmail.com','thuan.leminh','Lê Minh Thuận',101,1001,'2021-10-21'),
    (8,'namplc6789@gmail.com','nam.tranvan','Trần Văn Nam', 102, 1002,'2021-10-21'),
    (9,'nguyenduc8696@gmail.com','duc.nguyenhuu','Nguyễn Hữu Đức', 104, 1003,'2022-10-22'),
    (10,'ngohoangminh12111996official@gmail.com','minh.ngohoang','Ngô Hoàng Minh',103,1005,'2022-10-22'),
    (11,'nguyennhi2521998@gmail.com','nhi.nguyenthiphuong','Nguyễn Thị Phương Nhi',104, 1004,'2022-10-23'),
    (12,'quynhziumy@gmail.com','quynh.nguyenthinhu','Nguyễn Thị Như Quỳnh',100, 1002,'2022-10-23'),
    (13,'tuannhdinhtrong1@gmail.com','anh.dinhtrongtuan','Đinh Trọng Tuấn Anh',102, 1003,'2019-10-23'),
    (14,'thanhbuiduc1939@gmail.com','thanh.buiduc','Bùi Đức Thành',104,1000,'2018-10-23'),
    (15,'dangvodich@gmail.com','dang.nguyenhai','Nguyễn Hải Đăng',102,1001,'2022-03-20'),
	(16,'duongvandao@gmail.com','dao.duongvan','Dương Văn Đào',102,1000,'2022-03-20'),
    (17,'duongqua@gmail.com','qua.duong','Dương Quá',102,1004,'2022-03-20'),
    (18,'dangngocbao@gmail.com','bao.dangngoc','Đặng Ngọc Bảo',104,1004,'2022-03-20')
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
    (22,'CLB Bóng Đá',2,'20-03-20'),
    (23,'CLB Chạy',3,'20-03-20'),
    (24,'CLB Phượt',4,'20-03-20'),
    (25,'CLB Tình Nguyện Viên',5,'20-03-20'),
    (26,'CLB Phòng Chống Dịch',1,'20-03-21'),
    (27,'CLB IT',2,'20-03-19'),
    (28,'CLB Dậy Trước 12h',3,'20-03-20'),
    (29,'Tin Học',4,'20-03-20'),
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
(100,'làm quen 1 người bạn mới mỗi tuần',30,1,1000),
(101,'24h làm cún',31,2,1001),
(102,'dạy cách uống nước bằng miệng',32,3,1002),
(103,'yasuo cân 5',33,4,1003),
(104,'cách cầm đũa',34,5,1004),
(105,'cách cầm thìa',35,6,1005),
(106,'cách ngủ mở mắt',36,7,1006),
(107,'cách 10đ môm sql',37,8,1007),
(108,'làm việc tốt mỗi ngày',38,9,1008),
(109,'luyện thói quen đọc sách mỗi ngày',39,10,1009)
;

create table Answer (
	AnswerID	int PRIMARY key,
    Content		varchar(200),
    QuestionID	int,
    isCorrect	varchar(100) null,
    FOREIGN KEY(QuestionID) REFERENCES question(questionID)
    );
INSERT INTO Answer(AnswerID,Content) VALUES 
(1,'thức dậy,vệ sinh,làm việc,học tập day1'),
(2,'thức dậy,vệ sinh,làm việc,học tập day2'),
(3,'thức dậy,vệ sinh,làm việc,học tập day3'),
(4,'thức dậy,vệ sinh,làm việc,học tập day4'),
(5,'thức dậy,vệ sinh,làm việc,học tập day5'),
(6,'thức dậy,vệ sinh,làm việc,học tập day6'),
(7,'thức dậy,vệ sinh,làm việc,học tập day7'),
(8,'thức dậy,vệ sinh,làm việc,học tập day8'),
(9,'thức dậy,vệ sinh,làm việc,học tập day9'),
(10,'thức dậy,vệ sinh,làm việc,học tập day10')
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
('VA000374','Kiểm Tra 1 Tiết','00:45:00','2022-03-20'),
('VA000375','Kiểm Tra 1 Tiết','00:45:00','2022-03-20'),
('VA000376','Kiểm Tra 1 Tiết','00:45:00','2022-03-20'),
('VA000377','Kiểm Tra 1 Tiết','00:45:00','2022-03-20'),
('VA000378','Kiểm Tra 1 Tiết','00:45:00','2022-03-20'),
('VA000330','Kiểm Tra 1 Tiết','00:45:00','2022-03-20'),
('VA000379','Kiểm Tra 1 Tiết','00:45:00','2022-03-20'),
('VA000382','Kiểm Tra 1 Tiết','00:45:00','2022-03-20'),
('VA000384','Kiểm Tra 1 Tiết','00:45:00','2022-03-20'),
('VA000394','Kiểm Tra 1 Tiết','00:45:00','2022-03-20')
;
create table Examquestion (
	ExamID		INT PRIMARY key AUTO_INCREMENT,
    QuestionID	INT,
    FOREIGN KEY (ExamID) REFERENCES Exam(ExamID)
    );
INSERT INTO Examquestion(QuestionID) VALUES 
(1);
SELECT max(length(fullname)) FROM `account`; -- lấy ra tên dài nhất.
-- bài tập 2
SELECT * from department;
-- bài tập 3
SELECT departmentID from department WHERE departmentname='sale';
-- bài tập 4
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
SET fullname= 'Nguyễn Bá Lộc', email='loc.nguyenba@vti.com.vn' WHERE accountID=5;

UPDATE `account`
SET fullname= 'Nguyễn Bá Lộc', email='loc.nguyenba@vti.com.vn' WHERE accountID=5;
SELECT * from `account`;
