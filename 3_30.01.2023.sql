select * from new_employee;
--1. Aggregate function
--Min,Max,Avg,sum

select min(Salary) as MinSalary from new_employee;
select MAX(salary) as Maxsalary from new_employee;
select AVG(salary) as AvgSalary from new_employee;
select SUM(salary) as sumsalary from new_employee;
select top 5 salary from new_employee order by salary desc;

--Count
select COUNT(salary) from new_employee;
select COUNT(Dept) as C_Dept from new_employee;
select count(*) from new_employee;

--Distinct
select distinct(dept) from new_employee;
select distinct(salary) from new_employee;
select count (distinct(dept)) as CDistinct from new_employee;
sp_rename 'new_employee.Loc','City';
select city,sum(salary) as TSalary from new_employee group by City 
having sum(salary)>=20000 order by TSalary desc;

--Top
select top 3 salary from new_employee;
select top 3* from new_employee;

select * from MyEmployee
select city,max(salary) as MaxSalary from MyEmployee group by City;
select city,min(salary) as Minsalary from MyEmployee group by City;
select city, sum(salary) as SumSalary from MyEmployee group by City;
select City, COUNT(City) as cc from MyEmployee group by City;
select * from MyEmployee
select city, count(Emp_id) as No_of_Employee from MyEmployee where city in ('pune','mumbai','kurkheda') 
															 group by City order by No_of_Employee desc
select city, count(Emp_id) as No_of_Employee from MyEmployee group by City order by count(Emp_id) desc
use College;

select * from MyEmployee;
select city, count(Emp_id) from MyEmployee group by City having count(Emp_id) >=2;

select city, AVG(salary) as avgsal from MyEmployee group by city having avg(Salary)>=30000;
select city,count(salary) as DS from MyEmployee group by city having COUNT(salary)>1

---1.Primary Key -----> In Primary Key Duplicate and Null Value Restricted

create table R1(id int primary key,name varchar(10));

insert into R1 values(1,'Roshan');
insert into R1 values(2,'Ganesh');---- in PK constraints Not allowed Duplicate value
insert into R1 values(null,'Mohan');  ---in PK constraints null value not allowed
select * from R1
select * from INFORMATION_SCHEMA.COLUMNS where TABLE_NAME= 'R1'

--2.Unique -----> in unique constraints duplicate values not allowed (Duplicate Value Restricted)

create table R2(id int unique,name varchar(10));
insert into R2 values(1,'Sneha');
insert into R2 values(1,'Roshan');   --in unique constraints duplicate values not allowed (Duplicate Value Restricted)
insert into R2 values(null,'Ajay');
select * from R2

--3. Not Null------> Null value Restricted

create table R3(id int,name varchar(10) not null);
insert into R3 values(1,'Roshan');
insert into R3 values(2,null);   --in Not Null constraints not allowed null value

create table R4(id int primary key,name varchar(10) unique not null);

insert into R4 values(1,'Kumar');
insert into R4 values(1,'Roshan'); ---Pk not allowed duplicate value
insert into R4 values (2,'Roshan');
insert into R4 values(3,'Roshan');----unique, constraints not allowed duplicate
insert into R4 values(4,null); ---not null, constraints not allowed null values
insert into R4 values(4,'Sharad');
insert into R4 values(3,'Sneha')
select * from R4;

--4. Check  ---> Check Condition
create table R5(id int,marks int check(marks>40));

insert into R5 values(1,45);
insert into R5 values(2,30);
select * from R5;
create table R6(id int,Gender Varchar(10) check(Gender = 'M' or Gender = 'F'));

insert into R6 values(1, 'F');
insert into R6 values(2, 'Male');
select * from R6;
update R6 set id = 2 where Gender= 'M';

--5. Default ----> Set Default Value by Default constraints
create table R7(id int, city varchar(10) default 'Nagpur');

insert into R7 values(1,'Mumbai');
insert into R7 values(2,default);
insert into R7 (id) values(3);
insert into R7 values(1,'');
select * from R7;
update R7 set city = default where id = 4;

--6. Auto Increment (identity)

create table R8(id int identity, name varchar(10));
insert into R8 values('Roshan');
insert into R8 values('Asha');
insert into R8 values('Sneha');
insert into R8 values('Ganesh');
insert into R8 values('Mohan');
select * from R8;

create table R9(id int identity(100,10), name varchar(10));
insert into R9 values('Roshan');
insert into R9 values('Asha');
insert into R9 values('Sneha');
insert into R9 values('Ganesh');
insert into R9 values('Mohan');
select * from R9;

--7. Foreign Key

create table department(DID int primary key identity, Dept varchar(10));
insert into department values('Civil');
insert into department values('Mech');
insert into department values('ETX');
insert into department values('IT');
insert into department values('ELE');
select * from department;

create table student(S_ID int, name varchar(10), DID int foreign key references department(DID));
select * from student;
insert into student values(101,'Roshan',3);
insert into student values(102,'Sneha',1);
insert into student values(103,'Mona',4);
insert into student values(104,'Asha',5);
insert into student values(105,'Komal',2);
insert into student values(106,'Ganesh',4);

--Set Operator
--1. Union   --> Not allow Duplicate 
--2. Union All  ---> All Record
--3. Intersect --> Common Record
--4. Except/Minus

create table set1(id int, sname varchar(10));
insert into set1 values(1,'A');
insert into set1 values(2,'B');
insert into set1 values(3,'C');
insert into set1 values(4,'D');
insert into set1 values(4,'T');

create table set2(id int, sname varchar(10));
insert into set2 values(4,'D');
insert into set2 values(5,'E');
insert into set2 values(6,'F');
insert into set2 values(7,'G');
insert into set2 values(8,'H');
select* from set1
select* from set2

select * from set1 union select * from set2;
select * from set1 union all select * from set2;
select * from set1 intersect select * from set2;
select * from set1 except select * from set2;   -- Record in Set1 Not in Set2
select * from set2 except select * from set1;   -- Record in Set2 Not in Set1