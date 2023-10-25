create table ME
(
RollNo int,
FirstName varchar(10),
LastName varchar(10),
City varchar(10),
Savings int
)
insert into ME values(11,'Roshan','Bahetwar','kurkheda',1000),(12,'Rakesh','Nema','Tumsar',1300),
(13,'Rahul','Kumar','Gondia',1200),
(14,'Ajay','Kumar','Nagpur',1500),
(15,'Kamal','varma','Raipur',1900);
select * from ME

--1.char size (8000)
declare @var char(8000)
set @var = 'AMIT@123'
print(@var)
print datalength(@var)
print len(@var)

--2. varchar size (8000)
declare @var2 varchar(10)
set @var2='AMIT@123'
print(@var2)
print datalength(@var2)
print len(@var2)

--3.nchar size(4000)
declare @var2 nchar(8000)
set @var2='AMIT@123'
print(@var2)
print datalength(@var2)

--4.nvarchar size (4000)
declare @var2 nvarchar(10)
set @var2='AMIT@123'
print(@var2)
print datalength(@var2)

--5.date and time
select GETDATE();
select SYSDATETIME();
select datename(MONTH,getdate());

--6. create table
create table EMPLOYEE
( EID int,
ENAME VARCHAR(50),
EMP_SAL INT,
EMP_DOJ date
);
select * from EMPLOYEE
insert into EMPLOYEE values(1,'Praveen',2000,'2018-08-01'),
(2,'Amit',4000,'2019-09-13'),
(3,'Sumit',3000,'2018-07-01'),(4,'Rahul',6000,'2017-05-01'),
(5,'Ajay',7000,'2018-08-10');
select * from EMPLOYEE
insert into EMPLOYEE ( ENAME,EMP_DOJ,EMP_SAL,EID) VALUES('Ajit','2013-10-15',3000,6)
select * from EMPLOYEE
insert into EMPLOYEE ( ENAME,EMP_DOJ,EMP_SAL,EID) VALUES('Amar','',8000,7)

--7. SQL clauses
--1. where
select * from EMPLOYEE where ENAME= 'praveen'

--2. oder by ( ascending(ASC) and desending(DESC) order)
select * from EMPLOYEE order by ENAME -- by default ASC
select * from EMPLOYEE order by EID ASC
select * from EMPLOYEE order by EMP_SAL DESC

--8. SQL operator
--A. comparision
select * from EMPLOYEE where EID=7
select * from EMPLOYEE where EID>7
select * from EMPLOYEE where EID<=7
select * from EMPLOYEE where EID<7
select * from EMPLOYEE where EID<>7
select * from EMPLOYEE where EID!=7

--B. logical operator
---1.AND (Like Multiplication)
select * from EMPLOYEE where EID=1 AND EMP_SAL<3000

---2. OR (like Addition)
select * from EMPLOYEE where EID=2 OR EMP_SAL=6500

---3. NOT (like opposite operation)
select * from EMPLOYEE where EID!=2
select * from EMPLOYEE where EMP_SAL!=3000
select * from EMPLOYEE where EID<>7
select * from EMPLOYEE where EID not 5; --syntax error if write 'not' instead of symbol.

--C. Arithmatic operator (+,-,*,/,% ...etc)
select *, SALARY= EMP_SAL+1000 from EMPLOYEE
select *, AnnualPackage= EMP_SAL*12 from EMPLOYEE

--odd record
select * from EMPLOYEE where EID%2=1

--even record
select * from EMPLOYEE where EID%2=0

--employee yearly package
select *,AnnualPackage=EMP_SAL*12 from EMPLOYEE

--combine two column
select*,(cast(EID as varchar) + ' '+ ENAME) as FullName from EMPLOYEE

--D. In and Not In
---IN
select * from EMPLOYEE where EID in (1,4,7)
select * from EMPLOYEE where ENAME in ('amit','sumit','ajit')
---NOT IN
select * from EMPLOYEE where EID not in (1,4,7)
select * from EMPLOYEE where ENAME not in ('amit','sumit','ajit')

--E. BETWEEN AND NOT BETWEEN
select * from EMPLOYEE where EID >=2 and EID <=4
select * from EMPLOYEE where EID between 2 and 4
select * from EMPLOYEE where EID >2 or EID >4
select * from EMPLOYEE where EMP_SAL>2000 and EMP_SAL<5000

--Like
---start with a...
select * from EMPLOYEE where ENAME like 'a%'
select * from EMPLOYEE where EMP_SAL like '3000%'

---end with ...t
select * from EMPLOYEE where ENAME like '%t'
---in between/anywhere...a...
select* from EMPLOYEE where ENAME like '%a%'
---start with A,P,R alphabate
select* from EMPLOYEE where ENAME like '[APR]%'
---not start with A,P,R name
select * from EMPLOYEE where ENAME not like '[APR]%'

---start name from a-g
select* from EMPLOYEE where ENAME like '[a-g]%';
---dont start from name a-g
select* from EMPLOYEE where ENAME not like '[a-g]%';
select* from EMPLOYEE where ENAME like '[^a-g]%';
---want to display second letter start with j
select * from EMPLOYEE where ENAME like '_j%';

---want to display second last letter of name which end ..a.
select * from EMPLOYEE where ENAME like '%a_';
insert into EMPLOYEE values(12,'INDIA',7700,'2020-08-23')
select* from EMPLOYEE where ENAME like '%[N]%';
select * from EMPLOYEE where ENAME like 'R%L';

--CLASS 7.
--SQL Aggregate function
---(AVG(),COUNT(),MIN(),MAX(),SUM())
---1. AVG()

select* from EMPLOYEE
select avg(EMP_SAL) as AvgSAL from EMPLOYEE where EID in (1,5,7);

---2. COUNT()
select count(*) from EMPLOYEE ----without column name
select count(EMP_SAL) as No_of_EMP from EMPLOYEE  ---with column name
select count('scodeen')---o/p =1
select count('1234')+count('1234567')
--Q. calculate those employees whose salary is greater than 3000?
select count(*) as EMPSALCOUNT from EMPLOYEE where EMP_SAL>3000

---3. MIN()
select min(EMP_SAL) as MinValue from EMPLOYEE;
--2nd min value
select min(EMP_SAL) as SMinValue from EMPLOYEE where EMP_SAL>(select Min(EMP_SAL) from EMPLOYEE);
--3rd min value
select min(EMP_SAL) as TMinValue from EMPLOYEE where EMP_SAL>(select Min(EMP_SAL) from EMPLOYEE where EMP_SAL>(select min(EMP_SAL)
from EMPLOYEE));
--4th min value
select min(EMP_SAL) as FMinValue from EMPLOYEE where EMP_SAL>(select Min(EMP_SAL) from EMPLOYEE where EMP_SAL>(select min(EMP_SAL)
from EMPLOYEE where EMP_SAL>(select min(EMP_SAL) from EMPLOYEE)));

---4. MAX()
select* from EMPLOYEE
select* from EMPLOYEE order by EMP_SAL ASC;
select max(EMP_SAL) as MaxValue from EMPLOYEE;
--2nd max value
select max(EMP_SAL) as SMaxValue from EMPLOYEE where EMP_SAL<(select Max(EMP_SAL) from EMPLOYEE);
--3rd max value
select max(EMP_SAL) as TMaxValue from EMPLOYEE where EMP_SAL<(select max(EMP_SAL) from EMPLOYEE where EMP_SAL<(select max(EMP_SAL)
from EMPLOYEE));
--4th max value
select max(EMP_SAL) as FMaxValue from EMPLOYEE where EMP_SAL<(select Max(EMP_SAL) from EMPLOYEE where EMP_SAL<(select max(EMP_SAL)
from EMPLOYEE where EMP_SAL<(select max(EMP_SAL) from EMPLOYEE)));

---5. SUM()
select sum(EMP_SAL) as SumOFSAL from EMPLOYEE;

---6. TOP Value
select top 5 * from EMPLOYEE order by EMP_SAL DESC
select max(EMP_SAL) from EMPLOYEE where EMP_SAL in (1500,2000,4000);
---third max
select max(EMP_SAL) as Thirdmax from EMPLOYEE where EMP_SAL in(select top 3 EMP_SAL from EMPLOYEE order by EMP_SAL ASC);
select max(EMP_SAL) as Thirdmax from EMPLOYEE where EMP_SAL in(select top 3 EMP_SAL from EMPLOYEE order by EMP_SAL DESC);

insert into EMPLOYEE ( ENAME,EMP_DOJ,EMP_SAL,EID) VALUES('Kumar','2013-10-15',4500,20)
insert into EMPLOYEE values(21,'Sundar',6500,'2020-09-25');