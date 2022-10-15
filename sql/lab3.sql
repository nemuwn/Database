1.
SELECT *
FROM staff
WHERE position1="Manager" OR position1="Supervisor"

2.
SELECT *
FROM staff
WHERE sex="F"

π * σ staff = sex = F

3
SELECT *
FROM propertyforrent
WHERE rooms BETWEEN 3 AND 5

4
SELECT *
FROM propertyforrent
WHERE rent>450 OR city="London"

5
SELECT city, ownerNo, rent
FROM propertyforrent
WHERE staffNo!=" "

6 
SELECT *
FROM staff
WHERE salary>20000 AND sex="M"

7
SELECT *
FROM propertyforrent
WHERE rent BETWEEN 400 AND 600 AND city="Glasgow"

8
SELECT *
FROM propertyforrent 
WHERE city="London" OR rooms=4

9
SELECT *
FROM staff
WHERE DOB<"1970-1-1" AND position1="Assistant"

10
SELECT *
FROM viewing 
WHERE viewDate BETWEEN "2004-05-1" AND "2004-05-31" 

11
SELECT *
FROM staff
WHERE branchNo="B007" OR position1="Manager"

12
SELECT *
FROM propertyforrent
WHERE city="Aberdeen"

13 
SELECT staffNo, clientNo
FROM registration 

14 
SELECT staffNo, propertyNo, rent, ownerNo
FROM propertyforrent
WHERE rooms=3

15 
SELECT *
FROM staff
WHERE sex="F" AND (salary>20000 OR branchNo="B007") 

16 
SELECT clientNo, viewDate
FROM viewing
WHERE comment1="no dining room"

17
SELECT clientNo, branchNo, dateJoined
FROM registration
WHERE staffNo="SG37"

18
SELECT staffNo, fName, lName, position1, salary, salary/2 AS halfMonthSalary
FROM staff

19
SELECT propertyNo, ownerNo, rent, rent*0.95 AS saleRent
FROM propertyforrent
WHERE rooms=4 AND type1="Flat"

20
UPDATE staff SET
position1="Manager", salary=salary*1.1
WHERE staffNo="SL41"

