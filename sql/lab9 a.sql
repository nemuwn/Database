CREATE TABLE Professional(
ProfessionId VARCHAR(10),
pName VARCHAR(20)
);
INSERT INTO Professional(ProfessionId, pName)
VALUES("A11", "Heregleenii math"),
("A12", "Program hangamj"),
("A13", "Computer Uhaan"),
("A14", "Medeelliin system"),
("A15", "Medeelliin technology");


CREATE TABLE Student(
oyutanId VARCHAR(20),
ProfessionId VARCHAR(10),
ovog VARCHAR(20),
ner VARCHAR(20),
sex VARCHAR(5),
BD DATE,
dateJoined DATE
);
INSERT INTO Student(oyutanId, ProfessionId, ovog, ner, sex, BD, dateJoined)
VALUES("18b1num0001", "A12", "Dorj", "Bat", "M", "2002-10-1", "2018-8-30" ),
("19b1num0002", "A13", "Oyun", "Bilguun", "M", "2002-2-13", "2019-8-29"),
("18b1num0003", "A14", "Boldbaatar", "Anujin", "F", "2003-1-1", "2018-8-29"),
("19b1num0004", "A12", "Erdenbat", "Misheel", "F", "2003-4-5", "2019-8-28"),
("18b1num0115", "A11", "Gansuh", "Jargalmaa", "F", "2003-2-17", "2018-8-31"),
("19b1num0116", "A15", "Ganzorig", "Javhlan", "M", "2003-6-19", "2019-8-28"),
("18b1num0117", "A13", "Odgerel", "Dulguun", "M", "2003-11-25", "2018-8-29"),
("19b1num0118", "A12", "Myagmar", "Saruul", "F", "2002-11-10", "2019-8-30");

CREATE TABLE Lesson(
LessonId VARCHAR(10), 
lessonName VARCHAR(20)
);
INSERT INTO Lesson(LessonId, LessonName)
VALUES("Math601", "Ahisan tuvshnii algebr1"),
("ICSI202", "Ugugdliin butets"),
("ICSI208", "Suljeenii undes"),
("ICSI301", "Web programchlal"),
("ASCO0101", "Sanhuu burtgeliin undes"),
("ICSI441", "Java technology");


CREATE TABLE LessonRelation(
ProfessionId VARCHAR(10), 
LessonId VARCHAR(10)
);
INSERT INTO LessonRelation(ProfessionId, LessonId)
VALUES("A11", "Math601"),
("A12", "ICSI441"),
("A15", "ICSI441"),
("A15", "ICSI208"),
("A14", "ICSI208"),
("A14", "ASCO0101"),
("A13", "ICSI202"),
("A13", "ICSI208" ),
("A12", "ICSI301"),
("A12", "ICSI202" );

CREATE TABLE ChosenLesson(
oyutanId VARCHAR(20), 
LessonId VARCHAR(10),
cDate date,
uliral varchar(10),
yavtsSH int, 
uliralSH int
);
INSERT INTO ChosenLesson(oyutanId, LessonId, cDate, uliral, yavtsSH, uliralSH)
VALUES("19b1num0002", "ICSI441", "2019-1-1", "namar", 30, 30),
("19b1num0116", "ICSI441", "2020-1-1", "namar", 9, 15),
("19b1num0002", "ICSI202", "2021-1-1", "namar", 29, 30),
("18b1num0003", "ICSI301", "2021-1-1", "namar", 20, 26),
("18b1num0115", "ICSI208", "2019-1-1", "havar", 0, 0),
("19b1num0004", "ASCO0101", "2021-1-1", "namar", 12, 15),
("18b1num0001", "ICSI301", "2019-1-1", "namar", 30, 30),
("18b1num0115", "ICSI208", "2020-1-1", "namar", 20, 29),
("19b1num0004", "ICSI301", "2020-1-1", "namar", 10, 15),
("19b1num0118", "Math601", "2020-1-1", "namar", 12, 13),
("18b1num0001", "ASCO0101", "2019-1-1", "namar", 20, 23),
("19b1num0002", "Math601", "2020-1-1", "namar", 20, 15);



