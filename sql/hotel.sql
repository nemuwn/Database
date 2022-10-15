
CREATE TABLE hotel(
hotelNo VARCHAR(4),
hotelName VARCHAR(20),
city VARCHAR(20),
PRIMARY KEY (hotelNo)
); 
INSERT INTO Hotel(hotelNo, hotelName, city)
VALUES("A01", "Sakura", "Tokyo"),
("A02", "Hyatt", "Paris"),
("A03", "Shangrila", "Ulanbaatar"),
("A04", "Phoenix", "New york"),
("A05", "Latham", "Berlin"); 


CREATE TABLE room(
roomNo VARCHAR(5),
hotelNo VARCHAR(4),
bed INT,
price INT,
PRIMARY KEY(roomNo),
FOREIGN KEY (hotelno) REFERENCES hotel(hotelno)
); 
INSERT INTO room(roomNo, hotelNo, bed, price)
VALUES("R01","A01", 3, 160),
("R02", "A01", 5, 250),
("R03", "A01", 2, 110),
("R04", "A02", 4, 180),
("R05", "A02", 2, 120),
("R06", "A02", 3, 160),
("R07", "A02", 1, 100),
("R08", "A03", 3, 170),
("R09", "A03", 2, 150),
("R10", "A03", 8, 300),
("R11", "A04", 2, 180),
("R12", "A04", 3, 200),
("R13", "A04", 2, 180),
("R14", "A05", 1, 100),
("R15", "A05", 3, 180),
("R16", "A05", 4, 210);



CREATE TABLE booking(
hotelNo VARCHAR(4),
roomNo VARCHAR(5),
guestNo VARCHAR(10),
dateFrom DATE,
dateTo DATE,
PRIMARY KEY(hotelNo, guestNo, dateFrom),
FOREIGN KEY (guestNo) REFERENCES guest(guestNo)
);
INSERT INTO booking(hotelNo, roomNo, guestNo, dateFrom, dateTo)
VALUES("A01", "R01", "G01", "2019-12-1",  "2019-12-6"),
("A01", "R02", "G02", "2020-8-11",  "2020-8-16"),
("A01", "R03", "G03", "2019-9-02",  "2019-9-2"),
("A02", "R04", "G04", "2020-12-26",  "2020-12-29"),
("A02", "R05", "G02", "2019-4-1",  "2019-4-8"),
("A02", "R06", "G05", "2019-12-1",  "2019-12-6"),
("A03", "R08", "G06", "2021-4-8",  "2021-4-15"),
("A03", "R09", "G07", "2021-3-25",  "2021-3-30"),
("A03", "R10", "G08", "2020-12-11",  "2020-12-16"),
("A04", "R11", "G09", "2021-5-13",  "2021-5-20"),
("A04", "R12", "G10", "2020-3-26",  "2020-3-29"),
("A04", "R13", "G02", "2019-2-13",  "2019-2-20"),
("A05", "R14", "G01", "2021-2-21",  "2021-2-23"),
("A05", "R15", "G03", "2021-5-13",  "2021-5-20"),
("A05", "R16", "G07", "2020-5-20",  "2020-5-29"),
("A05", "R02", "G10", "2021-2-22",  "2021-2-29");




CREATE TABLE guest(
guestNo VARCHAR(10),
guestName VARCHAR(20),
guestAdress VARCHAR(30),
phoneNumber VARCHAR(10),
PRIMARY KEY(guestNo)
); 
INSERT INTO guest(guestNo, guestName, guestAdress, phoneNumber)
VALUES("G01", "Mark", "12 Evergreen", "9507-1738"),
("G02", "Angelina", "13 Evergreen", "9892-1738"),
("G03", "Angie", "11 st Borgar", "9522-1489"),
("G04", "Kurumi", "6 Nakano", "9562-1372"),
("G05", "Misheel", "7 Evergreen", "9247-1483"),
("G06", "Sofia", "2 aaa", "9093-1038"),
("G07", "Mia", "16 Ueno", "9534-1533"),
("G08", "Anujin", "18 Aberdeen", "9727-1388"),
("G09", "Bishrelt", "21 Glasgow", "9507-1738"),
("G10", "Bob", "23 High", "9507-1738"); 



