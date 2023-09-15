select * from Emp1;
select * from Dept1;
select * from Emp1 cross join Dept1;

create table study1(name varchar(10), dept varchar(10));
insert into study1 values('A','entc');
insert into study1 values('B','mech');
insert into study1 values('C','civil');
insert into study1 values('D','entc');
insert into study1 values('E','mech');

select * from study1 as T1, study1 as T2 where T1.dept=T2.dept;

create table M(id int, name varchar(10), manager_id int);
insert into M values(1,'Roshan',4);
insert into M values(2,'Ajay',1);
insert into M values(3,'Sneha',5);
insert into M values(4,'Neha',2);
insert into M values(5,'Amol',null);

select * from M;

select A.name as Employee, B.name as Manager from M as A inner join M as B 
on A.manager_id = B.id;


--Date Functions

select getdate() as Today;    --yyyy-mm-dd  hh:ss:ms
select getdate()-1 as YesterDay;   -- previous date
select getdate()+1 as Next_Day;	 --Next date

--1. datediff   (03 nos agrument requirement)

select DATEDIFF(yy,'1993-10-17',getdate());
select DATEDIFF(MM,'1993-10-17',getdate());

Create table Account_details (
ACCT_NUMBER int primary key identity(11112881,1),
ACCT_NAME varchar(20),
ACCT_OPEN_DATE date,
BRANCH Varchar(20))

insert into Account_details values ('Shubham','2015/12/09','MUMBAI')
insert into Account_details values ('Rihan','2016/01/12','Jaipur')
insert into Account_details values ('Sheetal','2017/08/11','GOA')
insert into Account_details values ('Priyanka','2017/01/01','Chennai')
insert into Account_details values ('Manik','2015/01/08','Agra')
insert into Account_details values ('Veena','2021/01/01','Patna')
insert into Account_details values ('Rohan','2019/07/01','Pune')
insert into Account_details values ('Laxmi',GETDATE(),'rohatak')
insert into Account_details values ('Jinal',GETDATE(),'Indore')

select * from Account_details

select*, DATEDIFF(YY,ACCT_OPEN_DATE,GETDATE()) as Acc_Open_Years from Account_details;

select *, datediff(YY,ACCT_OPEN_DATE,getdate()) from Account_details;

--2. dateadd   (03 nos agrument requirement)

select DATEADD(YY,15,getdate());
select *, DATEADD(YY,20,ACCT_OPEN_DATE) as New_Date from Account_details;
select *,DATEADD(MM,10,ACCT_OPEN_DATE) as New_Date from Account_details;

--3. datepart (02 nos agrument requirement)

select DATEPART(YY,getdate());
select *, datepart(YY,ACCT_OPEN_DATE) as Part_Year from Account_details;

---subquery

select * from MyEmployee order by salary desc;
select max(salary) from MyEmployee where Salary<(select max(salary) from MyEmployee);
select * from MyEmployee where Salary<(select max(salary) from MyEmployee);

Create Table customer(C_ID varchar(5) primary key ,CNAME varchar(20),Loc varchar(20))


insert into customer values('C1','AMIT','PUNE')
insert into customer values('C2','Sumit','Delhi')
insert into customer values('C3','varun','Mumbai')
insert into customer values('C4','snehal','Latur')
insert into customer values('C5','Raj','Sangli')
insert into customer values('C6','Mohit','Satara')

select * from customer

create table orders(OID int primary key, CID varchar(5),groceries varchar(20))

insert into orders values(1,'C2','almonds')
insert into orders values(2,'C3','deo')
insert into orders values(3,'C1','milk')
insert into orders values(4,'C2','soap') 
insert into orders values(5,'C4','dishes')
insert into orders values(6,'C2','rice')

select * from orders
select * from customer

select * from customer where exists (select * from orders where customer.C_ID = orders.CID);
select * from customer where not exists (select * from orders where customer.C_ID = orders.CID);


--1. ROW_NUMBER()

select *, ROW_NUMBER() over(order by salary desc) as RowId from MyEmployee;

--2. DENSE_RANK()

select *, DENSE_RANK() over(order by salary desc) as RowId from MyEmployee;
--2 nd max salary
with new_table as
(select*, DENSE_RANK() over(order by salary desc) as Row_id from new_employee)
select * from new_table where Row_id = 2;

--3. RANK()
select*, RANK() over (order by salary desc) as Row_id from new_employee;
select *, RANK() over(order by salary desc) as RowId from MyEmployee;

-- For DenseRank---fetch 2nd max salary ( Denserank with Desc order to find 2nd maximum salary)
with new_table as
(select *,DENSE_RANK() over(order by salary desc) as RowId from MyEmployee)
select * from new_table where RowId = 2;

---fetch 4 th min salary( Denserank with Asc order to find minimum salary)

with new_table as
(select *, DENSE_RANK() over (order by salary) as new_sal from MyEmployee)   
select * from new_table where new_sal = 4;

-- for RowNumber
with ABC as
(select *,ROW_NUMBER() over(order by salary desc)as RowID from MyEmployee)
select * from ABC where RowId = 5;

-- For DenseRank---fetch 2nd max salary city wise
select * from MyEmployee;
with new_table as
(select *,DENSE_RANK() over(partition by city order by salary desc) as RowId from MyEmployee)
select * from new_table where RowId = 2;

---NULL Test

create table NULL_TEST(NID int, EMP_NAME varchar(20),Manager varchar(20))

insert into NULL_TEST values (1,'Piya','Sohan')
insert into NULL_TEST values (2,'kate',NULL)
insert into NULL_TEST values (3,'meera','aman')
insert into NULL_TEST values (4,'amit',NULL)
insert into NULL_TEST values (5,'sumit','Kiran')

select * from NULL_TEST
select *, ISNULL(Manager,'No Manager') as New_Manager from NULL_TEST;

create table G (M1 int,M2 int);

insert into G values(40,50);
insert into G values(60,null);
insert into G values(null,80);

select *,ISNULL(M1,0) as No_Null from G;

select *, case
			when manager is null then 'No Manager'
			else
			Manager
			end as New_column
			from NULL_TEST;

select *, case
			when manager is null then 'OK'
			else
			manager
			end as OK1
			from NULL_TEST;

select*, case
			when M1 is null then M2
			when M2 is null then M1
			else
			M1+M2
			end as Add_M1M2
			from G;

alter table Null_test add Salary int;
select * from NULL_TEST;

update NULL_TEST set Salary = case
							when NID = 1 then 45000
							when NID = 2 then 15400
							when NID = 3 then 26500
							when NID = 4 then 34000
							else 65000
							end
select * from MyEmployee;
select upper(Emp_name) from MyEmployee;

update MyEmployee set Emp_name = UPPER(Emp_name);

select lower(Emp_name) from MyEmployee;