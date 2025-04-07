use college;

/*
Joins
1. Inner Join  # Common Record from table A and table B
2. Left Outer Join  # Inner Join (common from A and B table) + Fetch any additional records from left table
																	which is not present in Right table
3. Right Outer Join # Inner Join (common from A and B table) + Fetch any additional records from Right table
																	which is not present in left table
4. Full Outer Join  # Inner Join + Left Join + Right Join
*/

create table A(Aid int, Name varchar(10));
insert into A values(1,'sam');
insert into A values(2,'tom');
insert into A values(3,'harry');
insert into A values(4,'kate');
insert into A values(5,'juli');


create table B(Bid int,Name varchar(10),Aid int);
insert into B values(11,'sam',1);
insert into B values(12,'juli',5);
insert into B values(13,'harry',3);
insert into B values(14,'sat',6);
insert into B values(15,'mate',7);

create table C(Cid int, Name varchar(10),Bid int);
insert into C values(21,'Ram',15);
insert into C values(22,'Shyam',12);
insert into C values(23,'Krishna',14);
insert into C values(24,'Hari',13);
insert into C values(25,'Pari',11);

select * from A;
select * from B;
select * from C;
--1. Inner join
select * from A join B on A.Aid = B.Aid;
select A.Aid from A join B on A.Aid = B.Aid;
select * from A join B on A.Aid = B.Aid join C on B.Bid = C.Bid;


--2. Left Join
select * from A left join B on A.Aid= B.Aid;

--3. Right Join
select * from A Right join B on A.Aid = B.Aid;

--4. Full outer Join
select * from A full outer join B on A.Aid= B.Aid;

create table A1(id int);
insert into A1 values(1);
insert into A1 values(1);
insert into A1 values(1);
insert into A1 values(null);

create table B1(id int);
insert into B1 values(1);
insert into B1 values(1);
insert into B1 values(1);
insert into B1 values(1);
insert into B1 values(null);
insert into B1 values(null);

select * from A1;
select * from B1;

select A1.id from A1 join B1 on A1.id = B1.id;
select * from A1 left join B1 on A1.id = B1.id;
select * from A1 Right join B1 on A1.id = B1.id;
select * from A1 full outer join B1 on A1.id = B1.id;

alter table Emp1 alter column email varchar(50);
alter table Emp1 alter column designation varchar(20);

create table Emp1(emp_id int unique not null,emp_name varchar(10) not null,email varchar(10) not null,designation varchar(10) not null);
insert into Emp1 values(11,'izack','izack@gmail.com','Engineer');
insert into Emp1 values(12,'Ganesh','ganesh@gmail.com','Trainee');
insert into Emp1 values(13,'Heena','heena@gmail.com','Junior');
insert into Emp1 values(14,'grace','grace@gmail.com','Officer');
insert into Emp1 values(15,'Mohan','mohan@gmail.com','Manager');
insert into Emp1 values(16,'Rohan','Rohan@gmail.com','Sr.Engg');
insert into Emp1 values(17,'Neha','neha@gmail.com','Ass.Engg');
insert into Emp1 values(18,'Diya','diya@gmail.com','Ass.Manager');

create table Dept1(dept_id int unique not null,dept_name varchar(10) not null,salary int not null, emp_id int unique not null);
insert into Dept1 values(101,'Admin',45000,14);
insert into Dept1 values(102,'Account',35000,12);
insert into Dept1 values(103,'Engg',65000,15);
insert into Dept1 values(104,'IT',75000,11);
insert into Dept1 values(105,'Civil',35000,13);

select * from Emp1;
select * from Dept1;

select * from Emp1 as A join Dept1 as B on A.emp_id= B.emp_id;
select A.emp_name,A.designation, B.dept_name,B.salary from Emp1 as A join Dept1 as B on A.emp_id= B.emp_id;

select A.emp_id,A.emp_name,A.designation from Emp1 as A left join Dept1 as B on A.emp_id= B.emp_id;

select * from Emp1 as A Right join Dept1 as B on A.emp_id= B.emp_id;
select * from Emp1 as A full outer join Dept1 as B on A.emp_id= B.emp_id;

select A.emp_id,emp_name,email,designation,salary from Emp1 as A left join Dept1 as B on A.emp_id = B.emp_id
where B.salary>=35000 order by salary desc;
