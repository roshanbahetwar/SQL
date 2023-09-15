truncate table study;
select * from study
insert into study values(103,'Ganesh','Mech.engg',45500,'Nagpur'),
						(102,'Mohan','Civil',65000,'Pune')
update study set name = 'Sneha';
update study set Dept = 'ETX';
alter table study add Email varchar(20);
update study set Email = 'roshan@gmail.com' where Email is null;
update study set Email = 'sneha@gmail.com' where name = 'Sneha';
update study set Email = 'ganesh@gmail.com' where id = 103;
update study set Email = 'mohan@gmail.com' where city = 'pune';
alter table study add Roll int,address varchar(10);
update study set Roll = 15
alter table study alter column Roll varchar(10);
update study set Roll = 10
alter table study drop column address;
alter table study alter column salary int;
select * from INFORMATION_SCHEMA.COLUMNS where TABLE_NAME = 'study';
alter table study alter column Roll int;

--rename

sp_rename 'study.name','first_name';
select * from study;
sp_rename 'study.Roll','Roll_no'

sp_rename 'study','new_study';
select * from new_study;