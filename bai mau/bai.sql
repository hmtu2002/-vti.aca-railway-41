/*
-- create and use database
*/
drop DATABASE bai_mau;
create database bai_mau;
use bai_mau;

/*
-- create tables
*/
create table department(
	department_id int primary key,
    department_name varchar(50)
);
create table `position`(
	position_id int primary key,
    position_name enum('Dev', 'Test', 'Scrum Master', 'PM')
);
create table `account`(
	account_id int primary key,
    email varchar(50) unique key,
    username varchar(30) not null,
    fullname varchar(100) not null,
    department_id int,
    position_id int,
    create_date date default (date(now())),
    foreign key (department_id) references department(department_id),
    foreign key (position_id) references `position`(position_id)
);
create table `group`(
	group_id int primary key,
    group_name varchar(50),
    creator_id int,
    create_date date default (date(now())),
    foreign key (creator_id) references `account`(account_id)
);
create table group_account(
	group_account int primary key,
	group_id int,
    account_id int,
    join_date date default (date(now())),
    foreign key (group_id) references `group`(group_id),
    foreign key (account_id) references `account`(account_id)
);
create table type_question(
	type_id int primary key auto_increment,
    type_name enum('Essay', 'Multiple-Choice')
);
create table category_question(
	category_id int primary key auto_increment,
    category_name varchar(50)
);
create table question(
	question_id int primary key auto_increment,
    content varchar(1000) not null,
    category_id int,
    type_id int,
    creator_id int,
    create_date date default (date(now())),
    foreign key (category_id) references category_question(category_id),
    foreign key (type_id) references type_question(type_id),
    foreign key (creator_id) references `account`(account_id)
);
create table answer(
	answer_id int primary key auto_increment,
    content varchar(1000) not null,
    question_id int,
    is_correct boolean,
    foreign key (question_id) references question(question_id)
);
create table exam(
	exam_id int primary key auto_increment,
    `code` varchar(20) not null,
    title varchar(50),
    category_id int,
    duration time,
    creator_id int,
    create_date date default (date(now())),
    foreign key (category_id) references category_question(category_id),
    foreign key (creator_id) references `account`(account_id)
);
create table exam_question(
	exam_question_id int primary key,
    exam_id int,
    question_id int,
    foreign key (exam_id) references exam(exam_id),
    foreign key (question_id) references question(question_id)
);

/*
-- create data for tables
*/
insert into department(department_id, department_name) values
	(1, 'Sale'),
    (2, 'IT'),
    (3, 'HR'),
    (4, 'Marketing')
;
insert into `position`(position_id, position_name) values
	(100, 'Dev'),
    (101, 'Test'),
    (102, 'Scrum Master'),
    (103, 'PM')
;
insert into `account`(account_id, email, username, fullname, department_id, position_id) values 
	(1000, 'ducanht1108@gmail.com', 'anh.tranduc', 'Tr???n ?????c Anh', 1, 100),
    (1001, 'manhtu.cau@gmail.com', 'tu.hamanh', 'H?? M???nh T??', 1, 101),
    (1002, 'nguyencaohieu.15.06.1996@gmail.com','hieu.nguyencao','Nguy???n Cao Hi???u', 1, 102),
    (1003, 'chuongst99@gmail.com','chuong.nguyen','Nguy???n Ch????ng', 1, 103),
    (1004, 'nguyenquytruong04@gmail.com','truong.nguyenquy','Nguy???n Qu?? Tr?????ng', 2, 100),
    (1005, 'minhthuan1612@gmail.com','thuan.leminh','L?? Minh Thu???n', 2, 101),
    (1006, 'namplc6789@gmail.com','nam.tranvan','Tr???n V??n Nam', 2, 102),
    (1007, 'nguyenduc8696@gmail.com','duc.nguyenhuu','Nguy???n H???u ?????c', 2, 103),
    (1008, 'ngohoangminh12111996official@gmail.com','minh.ngohoang','Ng?? Ho??ng Minh', 3, 100),
    (1009, 'nguyennhi2521998@gmail.com','nhi.nguyenthiphuong','Nguy???n Th??? Ph????ng Nhi', 3, 101),
    (1010, 'quynhziumy@gmail.com','quynh.nguyenthinhu','Nguy???n Th??? Nh?? Qu???nh', 3, 102),
    (1011, 'tuannhdinhtrong1@gmail.com','anh.dinhtrongtuan','??inh Tr???ng Tu???n Anh', 4, 103),
    (1012, 'thanhbuiduc1939@gmail.com','thanh.buiduc','B??i ?????c Th??nh', 4, 100),
    (1013, 'dangvodich@gmail.com','dang.nguyenhai','Nguy???n H???i ????ng', 4, 101),
	(1014, 'duongvandao@gmail.com','dao.duongvan','D????ng V??n ????o', 4, 102),
    (1015, 'duongqua@gmail.com','qua.duong','D????ng Qu??', 3, 103),
    (1016, 'dangngocbao@gmail.com','bao.dangngoc','?????ng Ng???c B???o', 1, 100)
;
insert into `group`(group_id, group_name, creator_id, create_date) values
	(200, 'CLB B??ng ????', 1000, '2019-12-19'),
    (201, 'CLB Li??n minh Huy???n tho???i', 1001, '2019-12-20'),
    (202, 'CLB Freefire', 1002, '2022-03-16'),
    (203, 'CLB Tin h???c', 1003, '2018-01-27'),
    (204, 'CLB Ti???ng Anh', 1004, '2020-01-01'),
    (205, 'CLB Ti???ng Nh???t', 1005, '2021-02-05'),
    (206, 'HR Team', 1006, '2017-01-27'),
    (207, 'IT Team', 1007, '2019-04-04'),
    (208, 'Sale Team', 1008, '2020-05-18'),
    (209, 'Marketing Team', 1009, '2021-08-09'),
    (210, 'Dev Team', 1010, '2021-06-07')
;
insert into question(question_id, content) values
	(10000, 'c??u h???i: not null ngh??a l?? g??'),
    (10001, 'c??u h???i: primary key c?? ???????c ph??p nh???p null kh??ng'),
    (10002, '?????c ??i???m n??o d?????i ????y ????ng v???i primary key'),
    (10003, '?????c ??i???m n??o d?????i ????y ????ng v???i unique key')
;
insert into answer values
	(20000, 'Kh??ng ???????c ph??p b??? tr???ng data', 10000, true),
    (20001, '???????c ph??p b??? tr???ng data', 10000, false),
    (20002, 'Kh??ng ???????c', 10001, true),
    (20003, '???????c', 10001, false),
    (20004, '???????c ph??p null v?? ???????c ph??p tr??ng nhau', 10002, false),
    (20005, '???????c ph??p null v?? kh??ng ???????c ph??p tr??ng nhau', 10002, false),
    (20006, 'Kh??ng ???????c ph??p null v?? ???????c ph??p tr??ng nhau', 10002, false),
    (20007, 'Kh??ng ???????c ph??p null v?? kh??ng ???????c ph??p tr??ng nhau', 10002, true),
    (20008, '???????c ph??p null v?? ???????c ph??p tr??ng nhau', 10003, false),
    (20009, '???????c ph??p null v?? kh??ng ???????c ph??p tr??ng nhau', 10003, true),
    (20010, 'Kh??ng ???????c ph??p null v?? ???????c ph??p tr??ng nhau', 10003, false),
    (20011, 'Kh??ng ???????c ph??p null v?? kh??ng ???????c ph??p tr??ng nhau', 10003, false)
;

insert into exam(`code`, duration, create_date) values 
	('VA000374', '01:00:00', '2019-12-19') ,
    ('VA000481', '01:00:00', '2019-04-04') ,
    ('VA000545', '01:00:01', '2017-01-27') ,
    ('VA000775', '00:59:59', '2020-05-18') 
;


SELECT * from `account` WHERE length(fullname)=(SELECT max(length(fullname)) FROM `account`); 

SELECT * from `account` WHERE length(fullname) = (select max(length(fullname)) from `account` where department_ID=3) and department_ID=3;


SELECT max(length(fullname)) FROM `account`;


SELECT * from question;


UPDATE `account` set fullname='nguyen ba loc' , email = 'nguyenbaloc@gmail.com' where account_id = 1005;

INSERT into `group`(group_id) values (5);

SELECT * from department  INNER JOIN account on department.Department_ID = account.Account_ID;

SELECT * from department;


SELECT A.FullName, A.Email, P.PositionName
FROM `Account` A
INNER JOIN Position P ON A.PositionID = P.PositionID
WHERE P.PositionName = 'Dev';


