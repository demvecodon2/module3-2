create database codegym_management;
use codegym_management;
create table jame(
                     usename varchar(100) primary key unique,
                     password varchar(50)
);
create table class(
                      id int primary key auto_increment,
                      name  varchar(100)
);
create table room(
                     id int primary key auto_increment,
                     name  varchar (100),
                     class_id int,
                     foreign key(class_id) references class(id)
);
create table student(
                        id int primary key auto_increment,
                        name varchar(100),
                        gender varchar(20),
                        birtday date,
                        email varchar(100),
                        point int,
                        usename varchar(100)unique,
                        class_id int,
                        foreign key (usename) references jame(usename),
                        foreign key (class_id) references class(id)
);
create table instructor (
                            id int primary key auto_increment,
                            name varchar(100),
                            birtday date,
                            salary decimal
);
create table instructor_class(
                                 instructor_id int,
                                 class_id int,
                                 start date,
                                 primary key(instructor_id,class_id),
                                 foreign key(instructor_id) references instructor(id),
                                 foreign key(class_id) references class (id)
);
