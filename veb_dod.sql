CREATE DATABASE veb_dod;
USE veb_dod;

ALTER USER 'new_root'@'localhost' IDENTIFIED WITH mysql_native_password BY '123456';
GRANT ALL PRIVILEGES ON veb_dod.* TO 'new_root'@'localhost';
FLUSH PRIVILEGES;

CREATE TABLE Books(
ID_Book int unsigned primary key not null auto_increment,
NameOfBook text  not null,
Author text  not null,
Genre text not null,
TypeOf text not null,
CountOfPages int not null,
YearOf int not null,
Vydavnytstvo text not null,
ISBN VARCHAR(13) not null
);

INSERT INTO Books (NameOfBook, Author, Genre, TypeOf, CountOfPages , YearOf, Vydavnytstvo, ISBN)
VALUES ('Невеличка драма', 'Валер’ян Підмогильний', 'драма', 'книга', '336', '2023', 'Vivat' ,'9786171701106');

INSERT INTO Books (NameOfBook, Author, Genre, TypeOf, CountOfPages , YearOf, Vydavnytstvo, ISBN)
VALUES ('Інтернат', 'Сергій Жадан', 'фікшн','книга', '380', '2017', 'Meridian Czernowitz' ,'9789669767905');

INSERT INTO Books (NameOfBook, Author, Genre, TypeOf, CountOfPages , YearOf, Vydavnytstvo, ISBN)
VALUES ('Четверте крило', 'Ребекка Ярос', 'фентезі','книга', '528', '2024', 'КСД' ,'9786171504974');

INSERT INTO Books (NameOfBook, Author, Genre, TypeOf, CountOfPages , YearOf, Vydavnytstvo, ISBN)
VALUES ('Ці порожні обітниці', 'Лексі Раян', 'фентезі','книга', '480', '2023', 'РМ' ,'9786178280642');

INSERT INTO Books (NameOfBook, Author, Genre, TypeOf, CountOfPages , YearOf, Vydavnytstvo, ISBN)
VALUES ('Таємна історія', 'Донна Тарт', 'психологічний роман','книга', '560', '2023', 'КСД' ,'9786171500129');

SELECT * FROM Books;

CREATE TABLE Users (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Username VARCHAR(255) NOT NULL,
    Email VARCHAR(255) NOT NULL,
    PasswordHash VARCHAR(255) NOT NULL,
    Admin_id BOOLEAN DEFAULT FALSE 
);

INSERT INTO Users (Username, Email, PasswordHash, Admin_id)
VALUES ('Admin', 'fadmin@gmail.com', '1122334455', TRUE);

INSERT INTO Users (Username, Email, PasswordHash)
VALUES ('Sofia', 'sofia@gmail.com', '1111s2222');

INSERT INTO Users (Username, Email, PasswordHash)
VALUES ('Natalia', 'nata@gmail.com', '1234567');

SELECT * FROM Users;