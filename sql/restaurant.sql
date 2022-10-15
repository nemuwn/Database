CREATE TABLE staff(
staffID VARCHAR(5),
branchID VARCHAR(5),
fName VARCHAR(15),
lName VARCHAR(15),
sex VARCHAR(5),
position1 VARCHAR(10),
salary INT,
DOB DATE,
PRIMARY KEY(staffID),
FOREIGN KEY (branchID) REFERENCES branch(branchID)
);
INSERT INTO staff(staffID, branchID, fName, lName, sex, position1, salary, DOB)
VALUES("S001", "Br001", "Hulan", "Dorjsaihan", "F", "Manager", 900, "1975-10-1"),
("S002", "Br006", "Robert", "Williams", "M", "Waiter", 400, "1990-5-6"),
("S003", "Br001", "Mary ", "James", "F", "Manager", 700, "1980-12-15"),
("S004", "Br002", "Okabe", "Rintarou", "M", "Dishwasher", 200, "1995-2-26"),
("S005", "Br003", "Misheel", "Bat", "F", "waiter", 800, "1980-4-1"),
("S006", "Br005", "John", "Hurley", "M", "Cook", 600, "1989-7-18"),
("S007", "Br004", "Ann", "West", "F", "Bartender", 500, "1992-8-3"),
("S008", "Br001", "Temuulen", "Dorj", "M", "Cook", 600, "1977-11-5"),
("S009", "Br003", "Elizabeth", "Smith", "F", "Waiter", 400, "2000-1-5"),
("S010", "Br006", "Allan", "Taylor", "M", "Chef", 800, "1971-6-20");


CREATE TABLE branch(
branchID VARCHAR(5),
street VARCHAR(25),
city VARCHAR(25),
telNo VARCHAR(20),
PRIMARY KEY(branchID)
);
INSERT INTO branch(branchID, street, city, telNo)
VALUES("Br001","Tokyo street","Ulaanbaatar","777576"),
("Br002", "Higashiyama", "Kyoto", "777879"),
("Br003", "ER 10", "Erdenet", "797778"),
("Br004", "9th Manhattan", "New York", "757637"),
("Br005", "Carnaby ", "London", "767529"),
("Br006", "St. George", "Florida", "777211");


CREATE TABLE menu(
hoolID VARCHAR(5),
hoolName VARCHAR(25),
description VARCHAR(50),
price INT, 
PRIMARY KEY(hoolID)
);
INSERT INTO menu(hoolID, hoolName, description,  price)
VALUES("H01", "Burger", "", 10),
("H02", "Budaatai shul", "Uhriin mahtai budaatai shul", 25),
("H03", "Tsuivan", "Uhriin mahtai, baitsaa, undugtei tsuivan", 20),
("H04", "Sharsan tahia", "", 16),
("H05", "Goimontoi huurga", "", 8),
("H06", "Sarmistai talh", "Huvsgur siirtei sarmistai talh", 8),
("H07", "pizza", "bbq pizza", 15),
("H08", "Steak", "", 30),
("H09", "Ramen", "", 20),
("H10", "Sushi", "", 35);



CREATE TABLE rating(
hoolID VARCHAR(5),
rating INT,
comment1 VARCHAR(25),
PRIMARY KEY(hoolID)
);
INSERT INTO rating(hoolID, rating, comment1)
VALUES("H01", 9, ""),
("H02", 7, ""),
("H03", 10, "Mash ih amttai baisan"),
("H04", 10, "Chanartai baisan"),
("H05", 5, ""),
("H06", 7, ""),
("H07", 6, "taaruuhan amttai baisan"),
("H08", 8, ""),
("H09", 9, ""),
("H10", 10, "");

CREATE TABLE shiree(
shireeNo VARCHAR(5),
suudal INT,
branchID VARCHAR(5),
staffID VARCHAR(5)
PRIMARY KEY(shireeNo),
FOREIGN KEY (branchID) REFERENCES branch(branchID)
FOREIGN KEY (staffID) REFERENCES staff(staffID)
);
INSERT INTO shiree(shireeNo, suudal, branchID, staffID)
VALUES("Sh001", 5, "Br001", "S002"),
("Sh002", 2, "Br002", "S009"),
("Sh003", 4, "Br003", "S005"),
("Sh004", 8, "Br004", "S002"),
("Sh005", 2, "Br005", "S005"),
("Sh006", 5, "Br006", "S009"),
("Sh007", 4, "Br001", "S002"),
("Sh008", 4, "Br002", "S005");


CREATE TABLE orders(
orderID VARCHAR(5),
hoolID VARCHAR(5),
shireeNo VARCHAR(5),
orderDate DATE,
branchID VARCHAR(5),
PRIMARY KEY(orderID),
FOREIGN KEY (branchID) REFERENCES branch(branchID),
FOREIGN KEY (shireeNo) REFERENCES shiree(shireeNo),
FOREIGN KEY (hoolID) REFERENCES menu(hoolID)
);
INSERT INTO orders(orderID, hoolID, shireeNo, orderDate, branchID)
VALUES("OR01", "H02", "Sh002", "2021-5-28", "Br002"),
("OR02", "H10", "Sh001", "2021-4-5", "Br001"),
("OR03", "H08", "Sh003", "2021-5-22", "Br003"),
("OR04", "H09", "Sh004", "2021-5-15", "Br004"),
("OR05", "H06", "Sh005", "2021-2-8", "Br005"),
("OR06", "H03", "Sh005", "2021-1-21", "Br005"),
("OR07", "H02", "Sh007", "2021-5-20", "Br001"),
("OR08", "H05", "Sh006", "2021-2-18", "Br006");

CREATE TABLE RegisteredCustomers(
customerID VARCHAR(5),
fName VARCHAR(15),
lName VARCHAR(15),
sex VARCHAR(5),
telNo VARCHAR(20),
hymdral FLOAT
);
INSERT INTO RegisteredCustomers(customerID, fName, lName, sex, telNo, hymdral)
VALUES("C001", "Jargalmaa", "Battur", "F", "95991010", 0.90),
("C002", "Boldsaihan", "Baasanjav", "M", "99102644", 0.60),
("C003", "Hulan", "Myangan-Erdene", "F", "96052108", 0.95),
("C004", "Bilguun", "Naranbaatar", "M", "99091455", 0.50),
("C005", "Suvd", "Javhlan", "F", "95915052", 0.20);



1. "95991010 dugaartai burtgel hiisen customeriin ner ovog hymdraliig gargana uu"
SELECT fName, lName, hymdral 
FROM registeredCustomers
WHERE telNo = "99091455"

2. "10 ratingtei hoolnuudin үнийг нь эрэмбэлж гаргана уу"

SELECT m.hoolName, r.rating, m.price
FROM menu m, rating r
WHERE m.hoolID = r.hoolID AND r.rating = 10
GROUP BY m.price
ORDER BY m.price DESC

3. "2021-5-22nii udur zahialsan hoolnii ner, description, shireeg hariutsaj baisan ajiltni neriig haruulna uu"

CREATE VIEW query3 AS 
SELECT m.hoolName, m.description, sh.shireeNo, s.fName, o.orderDate
FROM menu m, shiree sh, staff s, orders o
WHERE o.hoolID = m.hoolID AND sh.staffID = s.staffID AND sh.shireeNo = o.shireeNo AND o.orderDate = "2021-5-22"


4. "shine zahialga nemeh"

INSERT INTO orders(orderID, hoolID, shireeNo, orderDate, branchID) 
           VALUES("OR09", (SELECT hoolID FROM menu WHERE hoolName = "Sharsan tahia"), "Sh006", NOW(), "Br006");   
               
               
5. "OR05 id-tai zahialgiig tsutslah"

DELETE FROM orders WHERE orderID = "OR05"
   
   
6. "10 ratingtei hoolnii uniig 15%iar nem"

UPDATE menu 
SET price = price *1.15
WHERE hoolID IN (SELECT hoolID 
                  FROM rating
                  WHERE rating = 10)


SELECT m.hoolName, r.comment1
FROM menu m, rating r
WHERE  r.hoolID = m.hoolID AND r.rating = 10