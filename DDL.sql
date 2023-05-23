CREATE DATABASE Library_System ;
drop database Library_System;
CREATE TABLE _User(
    user_id INT IDENTITY(1,1) PRIMARY KEY,
    user_type VARCHAR(20),
    user_name VARCHAR(20),
    user_password VARCHAR(20),
    email VARCHAR(50),
    phone_number VARCHAR(20), 
    address VARCHAR(20));
CREATE TABLE student(
  student_id INT IDENTITY(1,1) PRIMARY KEY foreign key   references _User(user_id), 
  university VARCHAR(50),
  faculty VARCHAR(50),
  specialization VARCHAR(50));


CREATE TABLE Authentication_system(
    login_id INT IDENTITY(1,1) PRIMARY KEY,
    admin_id INT foreign key references _User(user_id), 
    user_name VARCHAR(20),
    user_password VARCHAR(20));


CREATE TABLE Item(
   item_id INT IDENTITY(1,1) PRIMARY KEY,
   item_name VARCHAR(50),
   item_type VARCHAR(20) DEFAULT 'Book', 
   publisher_name VARCHAR(50),
   author_name VARCHAR(50),
   author_id Int,
   _language VARCHAR(20) DEFAULT 'English',
   category VARCHAR(20),
   _year INT,
   price INT,
   available VARCHAR(3) check(available = 'yes' or available = 'no'),
   number_of_copies INT);

   drop table Item
CREATE TABLE Purchase(
    purchase_id INT IDENTITY(1,1) PRIMARY KEY,
    purchase_Date DATE,
    item_id INT foreign key references Item(item_id),
    author_id INT foreign key references _User(user_id), 
    buyer_id INT foreign key references _User(user_id));

drop table Purchase

CREATE TABLE Comment(
  comment_id INT IDENTITY(1,1) PRIMARY KEY,
  content VARCHAR(100),
  commenter_id INT foreign key references _User(user_id),
  item_id INT foreign key references Item(item_id));

INSERT INTO _User (user_type, user_name, user_password, email, phone_number, address)
VALUES 
('admin', 'john_doe', 'password123', 'john_doe@gmail.com', '1234567890', '123 Main St'),
('customer', 'jane_smith', 'password456', 'jane_smith@gmail.com', '0987654321', '456 Oak Ave'),
('customer', 'bob_jones', 'password789', 'bob_jones@gmail.com', '5555555555', '789 Maple St'),
('admin', 'susan_li', 'passwordabc', 'susan_li@gmail.com', '1112223333', '321 Elm St'),
('customer', 'sam_wang', 'passworddef', 'sam_wang@gmail.com', '4444444444', '555 Pine St'),
('customer', 'amy_nguyen', 'passwordxyz', 'amy_nguyen@gmail.com', '7777777777', '999 Oak St'),
('admin', 'jimmy_smith', 'password123', 'jimmy_smith@gmail.com', '2223334444', '111 Maple Ave'),
('customer', 'emily_zhang', 'password456', 'emily_zhang@gmail.com', '6666666666', '222 Oak Ave');

UPDATE _User
SET user_type='author'
WHERE user_name='emily_zhang'
 
select *from _User
INSERT INTO student ( university, faculty, specialization)
VALUES 
( 'University of Cairo', 'Faculty of Engineering', 'Computer Science'),
( 'University of Helwan', 'Faculty of Business', 'Marketing'),
( 'University of AinShams', 'Faculty of Science', 'Biology'),
( 'University of Assiut', 'Faculty of Arts', 'History'),
( 'University of AUC', 'Faculty of Science', 'Chemistry'),
( 'University of BUE', 'Faculty of Business', 'Accounting'),
( 'University of GUC', 'Faculty of Engineering', 'Civil Engineering'),
( 'University of Cairo', 'Faculty of Arts', 'English Literature');

INSERT INTO Authentication_system (admin_id, user_name, user_password)
VALUES 
(1, 'Ahmed', 'password1'),
(1, 'Mostafa', 'password2'),
(2, 'Abdelrahman', 'password3'),
(2, 'Amr', 'password4'),
(3, 'Youssef', 'password5'),
(4, 'Abdelrahman', 'password6'),
(5, 'Ali', 'password7'),
(6, 'Yasser', 'password8');

INSERT INTO Item (item_name, item_type, publisher_name, author_name, author_id, _language, category, _year, price, available, number_of_copies)
VALUES 
('The Great Gatsby', 'Book', 'Scribner', 'F. Scott Fitzgerald', 1, 'English', 'Fiction', 1925, 10, 'yes', 5),
('To Kill a Mockingbird', 'Book', 'J. B. Lippincott & Co.', 'Harper Lee', 2, 'English', 'Fiction', 1960, 12, 'yes', 3),
('The Lord of the Rings', 'Book', 'Allen & Unwin', 'J. R. R. Tolkien', 3, 'English', 'Fantasy', 1954, 15, 'yes', 4),
('1984', 'Book', 'Secker & Warburg', 'George Orwell', 4, 'English', 'Fiction', 1949, 8, 'yes', 6),
('The Catcher in the Rye', 'Book', 'Little, Brown and Company', 'J. D. Salinger', 5, 'English', 'Fiction', 1951, 10, 'yes', 2),
('Pride and Prejudice', 'Book', 'T. Egerton', 'Jane Austen', 6, 'English', 'Romance', 1813, 7, 'yes', 4),
('One Hundred Years of Solitude', 'Book', 'Harper & Row', 'Gabriel García Márquez', 7, 'Spanish', 'Magical Realism', 1967, 20, 'yes', 3),
('The Picture of Dorian Gray', 'Book', 'Lippincott''s Monthly Magazine', 'Oscar Wilde', 8, 'English', 'Fiction', 1890, 6, 'yes', 2);
select*from Item
UPDATE Item
SET author_id=7
WHERE item_name='The Picture of Dorian Gray'
INSERT INTO Purchase (purchase_Date, item_id, author_id, buyer_id)
VALUES 
('2015-01-02', 1, 1, 2), 
('2016-02-02', 2, 2, 3), 
('2017-03-03', 3, 3, 4), 
('2018-04-04', 4, 4, 5),
('2019-05-05', 5, 5, 6), 
('2020-06-06', 6, 6, 7), 
('2021-07-07', 7, 7, 8), 
('2022-08-08', 8, 8, 1);

INSERT INTO Comment (content, commenter_id, item_id)
VALUES 
('Great book!', 2, 1),
('I loved this!', 3, 2),
('One of my favorites', 4, 3),
('A classic', 5, 4),
('Highly recommended', 6, 5),
('Couldn''t put it down', 7, 6),
('A must-read', 8, 7),
('Absolutely brilliant', 1, 8);




select * from _User
select*from Item
select*from Purchase
select*from Comment