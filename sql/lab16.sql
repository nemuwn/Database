jointoi 3 
subq 3  ANY ALL 
CREATE VIEW group1 AS 
SELECT s.staffNo, COUNT(p.propertyNo), s.branchNo
FROM propertyforrent p, staff s
WHERE s.staffNo=p.staffNo AND s.branchNo="B007"
GROUP BY s.staffNo

CREATE VIEW group2 AS 
SELECT s.branchNo, s.staffNo, COUNT(*)
FROM staff s, propertyforrent p
WHERE p.staffNo = s.staffNo
GROUP BY s.branchNo, s.staffNo
ORDER BY s.branchNo, s.staffNo 


CREATE VIEW join1 AS 
SELECT staffNo, fName, lName, Position1
FROM staff s 
JOIN branch B ON s.branchNo = b.branchNo
WHERE Position1 = 'Assistant' AND city = 'Glasgow'  

CREATE VIEW join2 AS 
SELECT v.clientNo, c.telNo, p.city, p.rent, s.fName
FROM (((viewing v
      INNER JOIN client1 c ON  v.clientNo=c.clientNo AND v.comment1="too small")
      INNER JOIN propertyforrent p ON p.propertyNo=v.propertyNo)
      INNER JOIN staff s ON p.staffNo=s.staffNo)


CREATE VIEW join3 AS 
SELECT b.*, p.*
FROM branch b 
LEFT JOIN propertyforrent p 
ON b.city = p.city
WHERE p.type1 = "Flat"

CREATE VIEW subq1 AS 
SELECT staffNo, fName, lName, position1, salary
FROM staff
WHERE salary > ALL(SELECT salary
           	   FROM staff
           	   WHERE branchNo = 'B003')
           	   
CREATE VIEW subq2 AS
SELECT propertyNo, street, city, postcode, type1, rooms, rent
FROM PropertyForRent
WHERE staffNo IN (SELECT staffNo
         	  FROM Staff
         	  WHERE branchNo = (SELECT branchNo
         			    FROM Branch
         			    WHERE street = '163 Main St'))
           	   
CREATE VIEW subq3 AS 
SELECT staffNo, fName, lName, position1,
      (salary - (SELECT AVG(salary) FROM staff)) AS salylga
FROM staff
WHERE salary > (SELECT AVG(salary) FROM staff)