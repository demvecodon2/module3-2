create database codegym_management;
use codegym_management;
create table jame(
                     usename varchar(100) primary key unique,
                     password varchar(50)
);
insert into jame(usename, password) VALUES ('cunn','123'),
                                           ('chunglh','123'),
                                           ('hoanghh','123'),
                                           ('dungd','123'),
                                           ('huynhtd','123'),
                                           ('hainm','123'),
                                           ('namtv','123'),
                                           ('hieuvm','123'),
                                           ('kynx','123'),
                                           ('vulm','123');
create table class(
                      id int primary key auto_increment,
                      name  varchar(100)
);
insert into class(name)values ('c1121g1'),
                              ('c1221g1'),
                              ('a0821i1'),
                              ('a0921i1');
create table room(
                     id int primary key auto_increment,
                     name  varchar (100),
                     class_id int,
                     foreign key(class_id) references class(id)
);
insert into room (name, class_id) VALUES ('ken',1),
                                         ('jam',1),
                                         ('ada',2),
                                         ('jimmy',2);
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
insert into student(name, gender, birtday, email, point, usename, class_id) VALUES
 ('nguyen ngoc cu','1','1981-12-12','cunn@gmail.com','8','cunn','1'),
 ('le hai chung','1','1981-12-12','chunglh@gmail.com','5','chunglh','1'),
 ('hoang huu hoan','1','1990-12-12','dungd@gmail.com','6','hoanghh','2'),
 ('dau dung','1','1987-12-12','dungd@gmail.com','8','dungd','1'),
 ('ta dinh huynh','1','1981-12-12','hunhtd@gmail.com','9','huynhtd','2'),
 ('nguyen minh hai','1','1981-12-12','hainm@gmail.com','8','hainm','1'),
 ('tran van nam','1','1989-12-12','namtv@gmail.com','5','namtv','1'),
 ('vo minh hieu','1','1981-12-12','hieuvm@gmail.com','3','hieuvm','1'),
 ('le xuan ky','1','1981-12-12','kylx@gmail.com','7','kynx','1'),
 ('le minh vu','1','1981-12-12','cunn@gmail.com','8','vulm','1'),
 ('nguyen van a','1','1981-12-12','cunn@gmail.com',null,null,null),
 ('tran van b','1','1981-12-12','tvb@gmail.com',null,null,null);
 create table instructor (
                            id int primary key auto_increment,
                            name varchar(100),
                            birtday date,
                            salary decimal
);
insert into instructor(name, birtday, salary) VALUES ('tran van chanh','1985-02-03','100'),
                                                     ('tran minh chien','1985-02-03','200'),
                                                     ('vu van tien','1985-02-03','300'),
                                                     ('tran van nam','1989-12-12','100');
create table instructor_class(
    instructor_id int,
    class_id int,
    start_time datetime,
    primary key (instructor_id,class_id),
    foreign key (instructor_id)references instructor(id),
    foreign key (class_id)references class(id)
);
insert into instructor_class(instructor_id, class_id, start_time) VALUES (1,1,null),
                                                                         (1,2,null),
                                                                         (1,3,null),
                                                                         (2,1,null),
                                                                         (2,2,null),
                                                                         (2,3,null);
select  s.id as student_id,s.name as student_name, s.gender, s.birtday, s.email, s.point, c.name as class_name
from student as s left join  class c on s.class_id = c.id;
select * from student where name like 'nguyen minh hai';
select * from student where name like 'nguyen %';
select * from student where name like '% hai' or name like'% huynh';
select * from student where point >5;
select * from student where point in (4,6,8);
select  point , count(*) as student_count from student group by point order by point;
select point , count(*) as student_count from student where student.point >5 group by point order by point ;
select point , count(*) as student_count from student where student.point >5 group by point having count(*) >=2 order by point;
select s.id as student_id,s.name as student_name,s.gender,s.birtday, s.email, s.point, c.name as class_name
from student as s join class as c on s.class_id = c.id
where c.name = 'c1121g1'
order by s.point desc
# order by s.point asc
;
select s.id as student_id ,s.name as student_name, s.gender,s.birtday,s.email,s.point,c.name as class_name
from student as s left join class c on c.id = s.class_id
where s.name  like 'nguyen minh hai';
select s.id as student_id ,s.name as student_name, s.gender,s.birtday,s.email,s.point,c.name as class_name
from student as s left join class c on c.id = s.class_id
where s.name  like '%hai' or s.name like'%huynh';
select s.id as studen_id ,s.name as student_name, s.gender,s.birtday,s.email,s.point,c.name as class_name
from student as s left join class c on c.id = s.class_id
where s.name like '%nguyen%';
select s.id as student_id , s.name as student_name, s.gender,s.birtday,s.email,s.point,c.name as class_name
from student as s left join class c on c.id = s.class_id
where point >5 order by point;
select class.name as class_name, count(student.id) as student_count
from student join class on student.class_id = class.id
where student.point > 5 group by  class.name having count(student.id) >= 2;

select s.id as studennt_id, s.name as student_name, s.gender,s.birtday,s.email,s.point,c.name as class_name
from student s left join class c on c.id = s.class_id
where point >5 order by point;

select c.name as class_name,count(s.id) as student_count
from class c join student s on c.id = s.class_id
group by  c.id, c.name;

# tính điểm cao nhất mỗi lớp
select  c.name as class_name,max(s.point) as max_point
from class c join student s on c.id = s.class_id
group by  c.id, c.name;
# trung bình moi lơps
select c.name as class_name,avg(s.point) as average_point
from class c join student s on c.id = s.class_id
group by  c.id, c.name;
# ngày sinh của học vien va giảng vien
select name,birtday
from instructor union
select name,birtday
from student;
# 3 điêm cao nhat
select name,point
from student
order by point desc
limit 3;
#  Lấy ra các học viên có điểm số là cao nhất của trung tâm.
select name,point
from student
where point = (select max(point) from student);
# giảng vien chưa dạy
select i.name,i.birtday
from instructor i left join instructor_class ic on i.id = ic.instructor_id
where  ic.class_id is null;






