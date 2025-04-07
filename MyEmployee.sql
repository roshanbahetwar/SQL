create table MyEmployee
(Emp_id int,
Emp_name varchar(20),
Gender varchar(10),
Salary int,
City varchar(10),Dpt_id int)

insert into MyEmployee values (100,'izack','Male',25000,'usa',2),
(101,'grace','Male',22000,'usa',1),
(102,'Neha','Female',47000,'Nagpur',2),
(103,'Ajay','Male',35000,'Pune',47),
(105,'Asha','Female',20000,'Wardha',5),
(106,'Ganesh','Male',23000,'Pune',3),
(107,'Dinesh','Male',25000,'Mumbai',6),
(108,'Sandip','Male',34000,'Mumbai',4),
(109,'suman','Female',35000,'Pune',7),
(110,'Heena','Female',15000,'usa',2)

select * from MyEmployee
update MyEmployee set Dpt_id=4 where Emp_id=103;
select city, sum(Salary) as TSATC from MyEmployee group by city;

select city, sum(salary) as Total_salary from MyEmployee group by city
having sum (salary)>= 20000;

select City, count(Emp_name) from MyEmployee group by City order by count(Emp_name)

select city, sum(salary) as Total_salary from MyEmployee where city in ('Nagpur','Pune', 'mumbai') group by city
having sum (salary)>= 50000;

select * from MyEmployee
select * from MyDepartment

--- Views in SQL---
create table MyDepartment
(Id int, Dept_Name varchar(20))

insert into MyDepartment values (1,'Accounts'),(2,'HR'),(3,'Administration'),(4,'Sale');

create view VW_emp
as
select * from MyEmployee as A
inner join MyDepartment as B on A.Dpt_id = B.Id;

select * from VW_emp

create view VW1
as
select A.*, B.Dept_Name from MyEmployee as A
inner join MyDepartment as B on A.Dpt_id = B.Id;

select * from vw1
select * from vw2
select * from vw3

create view vw2
as
select A.Emp_id,A.Emp_name, A.Gender,A.City,B.id,B.Dept_Name from MyEmployee as A
inner join MyDepartment as B on A.Dpt_id = B.Id;


create view vw3
as
select A.*, B.Dept_Name from MyEmployee as A
inner join MyDepartment as B on A.Dpt_id = B.Id
where Dept_Name = 'HR';

SP_HELPTEXT VW3;

ALTER view vw3
as
select A.*, B.Dept_Name from MyEmployee as A
inner join MyDepartment as B on A.Dpt_id = B.Id
where Dept_Name = 'HR' or Dept_Name = 'sale';

create view vw4
as
select * from MyEmployee;

select * from vw4;

insert into vw4 values( 111,'gauri','female',40000,'usa',1);
delete from vw4 where Emp_id = 111;
update vw4 set salary = 45000 where Emp_id = 110;

---subquery

select * from MyEmployee 
where Emp_id in ( select Emp_id from MyEmployee where Salary>=30000);


select Emp_name,Gender,salary, city from MyEmployee
where Emp_id in 
(select Emp_id from myemployee where city = 'usa');

update MyEmployee set Salary = salary + 5000
where Emp_id in
(select Emp_id from MyEmployee where City = 'usa');

update MyEmployee set Gender = 'Female'
where Emp_name in ( select Emp_name from MyEmployee where Emp_name = 'Gauri');

select * from MyEmployee order by Salary desc
select * from MyDepartment

select* from vw3
where Dpt_id in
(select id from MyDepartment where Dept_Name = 'sale')
order by Dpt_id;

select max(Salary) as msal from MyEmployee where salary <(select max(Salary) from MyEmployee
where Salary<(select max(salary) from MyEmployee));

select top 5 *, salary as T5SAL from myemployee order by Salary desc;

select max(salary) as Msal from myemployee where salary in (select top 3  salary from MyEmployee order by salary desc);

select * from MyEmployee where Dpt_id =
(select id from MyDepartment where Dept_Name = 'HR');

select * from MyEmployee
where Salary< any
(select salary from MyEmployee where Emp_name = 'izack' or Emp_name = 'Neha');

select * from MyEmployee
where Salary< all
(select salary from MyEmployee where Emp_name = 'izack' or Emp_name = 'Neha');      --( izack = 30000, Neha = 47000)

---alter command --

---for rename of table and database
--for table :- execute sp_rename ' ', ' ' ;
-- for Database :- execute sp_renamedb ' ', ' '; 

execute sp_rename 'MyEmployees','MyEmployee';

select * from MyDepartment
alter table Mydepartment add Designation varchar(20);--for coloum add in table

update MyDepartment set Designation = 'AE' where id = 1;
update MyDepartment set Designation = 'JE' where id = 2;

alter table MyDepartment drop column Designation; --for delete column from table

---Self contained and Co-Related Sub-Query---

select * from MyEmployee
select * from MyDepartment

---self contained query
select * from MyEmployee
where Dpt_id in
(select id from MyDepartment where Dept_Name = 'HR');

--Co-Related query
select * from MyEmployee as A
where A.Dpt_id in
(select B.Id from MyDepartment as B where Gender = 'Male');

--select * from MyEmployee where Gender = 'male';

select * from MyEmployee as A
where A.Dpt_id in
(select B.id from MyDepartment as B where Gender = 'female');

--select * from MyEmployee where Gender = 'female';

select * from MyEmployee
select * from MyDepartment

---select into statements--- for create backup

select * into Employee_backup from MyEmployee;

select Emp_id,Emp_name into Employee_backup from MyEmployee;

select * from Employee_backup
drop table Employee_backup

select A.*,B.Dept_Name into Employee_backup from MyEmployee as A
inner join MyDepartment as B on A.Dpt_id = B.id;

select * from Employee_backup where City = 'usa';

select * into Employee_backup from MyEmployee where 1<>1;

--insert into select statements---(insert A table into table B,(should be same column with same data type))

select * from LMEL;
select * from EMPLOYEE;

truncate table LMEL;

insert into LMEL select * from EMPLOYEE;
insert into LMEL(EName,EMP_SAL) select ENAME,EMP_SAL from EMPLOYEE;

drop table LMEL;

execute sp_rename 'MyEmployee','Practice-2022'
execute sp_rename 'Practice-2022','MyEmployee'

--------Commands--------
--Delete   :- only selected data delete from table
--Truncate :-All data delete from table
--Drop     :- complete table delete

---Stored Procedure---
select * from MyEmployee

--store procedure example
create procedure spget
as 
begin
select Emp_name,gender from myemployee
end;
execute spget;

--store procedure with single parameter
create procedure spget1
@Emp_id int
as
begin
select * from MyEmployee where Emp_id = @Emp_id
end;

execute spget1 102;

--store procedure with multiple parameter
create procedure spget2
@Emp_id int,
@Emp_name varchar (20)
as
begin
select * from MyEmployee where Emp_id = @Emp_id and Emp_name = @Emp_name
end;

drop procedure spget2

execute spget2 100,izack;

--Alter command with encryption
sp_helptext spget2;

alter procedure spget2
@Emp_id int,
@Emp_name varchar (20)
with encryption
as
begin
select * from MyEmployee where Emp_id = @Emp_id and Emp_name = @Emp_name
end;

alter procedure spget2
@Emp_id int,
@Emp_name varchar (20)
as
begin
select Emp_name, Gender,Salary from MyEmployee where Emp_id = @Emp_id and Emp_name = @Emp_name
end;

execute spget2 102,neha;

sp_helptext spget2




