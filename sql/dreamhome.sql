CREATE TABLE Branch(
branchNo VARCHAR(20),
street VARCHAR(25),
city VARCHAR(20),
postcode VARCHAR(20)
);
INSERT INTO Branch(branchNo, street, city, postcode)
VALUES("B005","22 Deer Rd","London","SW1 4EH"),
("B007", "16 Argyll St", "Aberdeen", "AB2 3SU"),
("B003", "163 Main St", "Glasgow", "G11 9QX"),
("B004", "32 Manse Rd", "Bristol", "Bs99 1NZ"),
("B002", "56 Clover Dr", "London", "NW10 6EU");


CREATE TABLE Staff (
staffNo VARCHAR(5),
fName VARCHAR(10),
IName VARCHAR(10),
position1 VARCHAR(15),
sex VARCHAR(5),
DOB DATE,
salary INT,
branchNo VARCHAR(10)
);
INSERT INTO Staff(staffNo, fName, IName, position1, sex, DOB, salary, branchNo)
VALUES("SL21", "John", "White", "Manager", "M", "1945-10-1", 30000, "B005"),
("SG37", "Ann", "Beech", "Assistant", "F", "1960-11-10", 12000, "B003"),
("SG14", "David", "Ford", "Supervisor", "M", "1958-03-24", 18000, "B003"),
("SA9", "Mary", "Howe", "Assistant", "F", "1970-02-19", 9000, "B007"),
("SG5", "Susan", "Brand", "Manager", "F", "1940-06-03", 24000, "B003"),
("SL41", "Julie", "Lee", "Assistant", "F", "1965-06-13", 9000, "B005");


CREATE TABLE PropertyForRent(
propertyNo VARCHAR(5),
street VARCHAR(20),
city VARCHAR(20),
postcode VARCHAR(20),
type1 VARCHAR(20),
rooms INT,
rent INT,
ownerNo VARCHAR(10),
staffNo VARCHAR(5),
branchNo VARCHAR(10)
);
INSERT INTO PropertyForRent(propertyNo, street, city, postcode, type1, rooms, rent, ownerNo, staffNo, branchNo)
VALUES ("PA14", "16 Holhead", "Aberdeen", "AB7 5SU", "House", 6, 650, "CO46", "SA9","B007"),
("PL94", "6 Argyll St", "London", "NW2", "Flat", 4, 400, "CO87", "SL41","B005"),
("PG4", "6 Lawrence St", "Glasgow", "G11 9QX", "Flat", 3, 350, "CO40", " ","B003"),
("PG36", "2 Manor Rd", "Glasgow", "G32 4QX", "Flat", 3, 375, "CO93", "SG37","B003"),
("PG21", "18 Dale Rd", "Glasgow", "G12", "House", 5, 600, "CO87", "SG37","B003"),
("PG16", "5 Novar Dr", "Glasgow", "G12 9QX", "Flat", 4, 450, "CO93", "SG14","B003");

CREATE TABLE Client1(
clientNo VARCHAR(5),
fName VARCHAR(10),
IName VARCHAR(10),
telNo VARCHAR(20),
prefType VARCHAR(10),
maxRent INT
);
INSERT INTO Client1(clientNo, fName, IName, telNo, prefType, maxRent)
VALUES("CR76","John","Kay","0207-774-5632", "Flat", 425),
("CR56","Aline","Stewart","0141-848-1825", "Flat", 350),
("CR74","Mike","Ritchie","01475-392178", "House", 750),
("CR62","Mary","Tregear","01224-196720", "Flat", 600);


CREATE TABLE PrivateOwner(
ownerNo VARCHAR(5),
fName VARCHAR(10),
IName VARCHAR(10),
address VARCHAR(30),
telNo VARCHAR(20)
);
INSERT INTO PrivateOwner(ownerNo, fName, IName, address, telNo)
VALUES("CO46","Joe","`privateowner``privateowner`Keogh","2 Fergus Dr, Aberdeen AB2 7SX","01224-861212"),
("CO87","Carol","Farrel","6 Achray St, Glasgow G32 9DX","0141-357-7419"),
("CO40","Tina","Murphy","63 Well St, Glasgow G42","0141-943-1728"),
("CO93","Tony","Shaw","12 Park Pl, Glasgow G4 0QR","0141-225-7025");


CREATE TABLE Viewing(
clientNo VARCHAR(5),
propertyNo VARCHAR(5),
viewDate DATE,
comment1 VARCHAR(25)
);
INSERT INTO Viewing (clientNo,propertyNo,viewDate,comment1)
VALUES("CR56","PA14","1904-05-24","too small"),
("CR76","PG4","1904-04-20","too remote"),
("CR56","PG4","1904-05-26"," "),
("CR62","PA14","1904-05-14","no dining room"),
("CR56","PG36","1904-04-28"," ");


CREATE TABLE Registration(
clientNo VARCHAR(5),
branchNo VARCHAR(5),
staffNo VARCHAR(5),
dateJoined DATE
);
INSERT INTO Registration (clientNo,branchNo,staffNo,dateJoined)
VALUES("CR76","B005","SL41","1904-01-02"),
("CR56","B003","SG37","1903-04-03"),
("CR74","B003","SG37","1902-11-16"),
("CR62","B007","SA9","1903-03-07");



