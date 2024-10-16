CREATE DATABASE quan_ly_codegym;
USE quan_ly_codegym;

create table jame (
                         account_name varchar(50) primary key ,
                         password varchar(50) not null
);

create table instructor (
                          id int primary key auto_increment,
                          name varchar(100),
                          birthday date,
                          salary decimal
);

create table class (
                       id int primary key auto_increment,
                       classroom varchar(20),
                       id_room int,
                       foreign key (id_room) references room(id)
);

create table student (
                              id int primary key auto_increment,
                              name varchar(100),
                              birthday date,
                              gender varchar(10),
                              email varchar(50),
                              point int,
                              account_name varchar(50) unique ,
                              id_class int,
                              foreign key (id) references class(id),
                              foreign key (account_name) references jame(account_name)
);
create table room(
    id int primary key auto_increment,
    name varchar(50)
);
create table teach (
    start_time datetime,
    return_time datetime,
    id_class int,
    id_instructor int,
    primary key (id_class,id_instructor),
    foreign key(id_class) references class(id),
    foreign key (id_instructor)references instructor(id)
)
