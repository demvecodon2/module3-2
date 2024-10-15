CREATE DATABASE library;
USE library;

CREATE TABLE category (
                          id_category INT PRIMARY KEY AUTO_INCREMENT,
                          name VARCHAR(100)
);

CREATE TABLE authors (
                         id_authors INT PRIMARY KEY AUTO_INCREMENT,
                         name VARCHAR(100)
);

CREATE TABLE books (
                       id_books INT PRIMARY KEY AUTO_INCREMENT,
                       title VARCHAR(100),
                       page_size INT,
                       id_category INT,
                       id_authors INT,
                       FOREIGN KEY (id_category) REFERENCES category(id_category),
                       FOREIGN KEY (id_authors) REFERENCES authors(id_authors)
);

CREATE TABLE students (
                          id_students INT PRIMARY KEY AUTO_INCREMENT,
                          name VARCHAR(100),
                          birthday DATE,
                          class_name VARCHAR(50)
);

CREATE TABLE borrows (
                         id_students INT,
                         id_books INT,
                         borrow_date DATETIME,
                         return_date DATETIME,
                         PRIMARY KEY (id_students, id_books),
                         FOREIGN KEY (id_students) REFERENCES students(id_students),
                         FOREIGN KEY (id_books) REFERENCES books(id_books)
);
