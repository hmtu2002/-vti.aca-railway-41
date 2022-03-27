-- Question 1: Tạo view có chứa danh sách nhân viên thuộc phòng ban sale
CREATE view danhvien as
SELECT a.*,b.DepartmentName from account a
JOIN department b on a. DepartmentID=b.DepartmentID;

-- Question 2: Tạo view có chứa thông tin các account tham gia vào nhiều group nhất
 create view MAX_acount_in_group as
 select a.*,count(*) from account as a join groupaccount as ga on a.AccountID=ga.AccountID
 group by a.AccountID
having count(*)=(select max(SL) from (
select accountid,count(*) as SL from groupaccount group by AccountID) as gamax);

-- Question 3: Tạo view có chứa câu hỏi có những content quá dài (content quá 300 từ được coi là quá dài) và xóa nó đi
CREATE view ct as 
SELECT * from question WHERE length(content) >10;
drop view ct;

-- Question 4: Tạo view có chứa danh sách các phòng ban có nhiều nhân viên nhất
CREATE VIEW Phong_ban_max AS
    SELECT 
        COUNT(*), Department.*
    FROM
        account AS a
            JOIN
        department AS d ON a.DepartmentID = d.DepartmentID
    GROUP BY a.DepartmentID
    HAVING COUNT(*) = (SELECT 
            MAX(dem)
        FROM
            (SELECT 
                COUNT(*) AS dem
            FROM
                account
            GROUP BY DepartmentID) a);

SELECT max(dem) from(
SELECT COUNT(*) as dem from account GROUP BY DepartmentID)a;



