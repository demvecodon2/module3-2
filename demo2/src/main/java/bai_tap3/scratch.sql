create database quan_ly_codegym;
use quan_ly_codegym;
create table account(
                        id_account int primary key auto_increment,
                        account_name varchar(50),
                        password varchar(50)

);
create table student_code(
    id_students int primary key auto_increment,
    name varchar(100),
    birtday date,
    sex varchar(10),
    email varchar(50),
    point int,
    id_account int,
    id_class int,
    foreign key (id_class) references class(id_class),
    foreign key (id_account)references account(id_account)
);

create table class(
    id_class int primary key auto_increment,
    classroom varchar(20),
    id_lecturer int,
    foreign key (id_lecturer) references lecturer(id_lecturer)
);
create table lecturer(
    id_lecturer int primary key auto_increment,
    name varchar(100),
    birtday date,
    wage  decimal,
    id_account int,
    foreign key (id_account) references account(id_account)

);