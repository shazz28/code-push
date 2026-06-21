CREATE DATABASE yo;

show databases;

use yo;

create table student(
    id int PRIMARY KEY,
    name VARCHAR(50),
    age int NOT NULL
);

insert INTO student VALUES(1,"yo",20);
insert INTO student VALUES(2,"abc",20);
insert INTO student VALUES(3,"def",20);

insert into student values (4,"ghi",21),(5,"jkl",22);

SELECT * FROM student;


create database xyz;

use xyz;

create table employee (
    id int primary key,
    name varchar(50),
    salary int
);

insert into employee VALUES
(1,"adam",25000),
(2,"bob",30000),
(3,"casey",40000);

INSERT INTO employee VALUES (4, 'zeus', DEFAULT);

select * from employee;

ALTER TABLE employee ALTER COLUMN salary SET DEFAULT 25000;

ALTER TABLE employee MODIFY COLUMN salary FLOAT;

alter table employee add column age int check (age >= 18);

update employee SET age = 25;


show tables;
show databases;

create database  IF NOT EXISTS college;

use college;

create table student(
    rollno int PRIMARY KEY,
    name VARCHAR(50),
    marks int NOT NULL
    grade varchar(1),
    city varchar(20)
);

insert into student VALUES
(101,"anil",78,"C","Pune"),
(102,"bhumika",93,"A","Mumbai"),
(103,"chetan",85,"B","Delhi"),
(104,"dhruv",96,"A","Banglore"),
(105,"emanuel",12,"D","Delhi"),
(106,"farah",82,"B","Delhi");