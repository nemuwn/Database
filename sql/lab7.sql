1
SELECT p.propertyNo, p.city, p.rent, p.staffNo, s.fName, s.lName, s.position1
FROM propertyforrent p, staff s
WHERE p.staffNo=s.staffNo

2
SELECT s.branchNo, s.staffNo, COUNT(p.propertyNo)
FROM staff s, propertyforrent p
WHERE p.staffNo=s.staffNo
GROUP BY s.staffNo

3
SELECT s.branchNo, s.staffNo, COUNT(p.propertyNo), AVG(p.rent), MAX(p.rent), MIN(p.rent)
FROM staff s, propertyforrent p
WHERE p.staffNo=s.staffNo
GROUP BY s.staffNo

4
SELECT b.*, p.*
FROM branch b 
INNER JOIN propertyforrent p 
ON b.city = p.city

5
SELECT b.*, p.*
FROM branch b 
LEFT JOIN propertyforrent p 
ON b.city = p.city

SELECT b.*, p.*
FROM branch b 
right JOIN propertyforrent p 
ON b.city = p.city

left join нь зүүн table-н баруунаас ялгаатай хотын нэрсийг гаргаж ирж байна
RIGHT JOIN нь баруун TABLE-н зүүнээс ялгаатай хотын нэрсийг гаргаж ирж байна

6 
select city from branch
except
SELECT city FROM propertyforrent

7
SELECT city
FROM branch 
intersect 
select city
from propertyforrent	

8
select v.clientNo, c.telNo, p.city, p.rent, s.fName
from (((viewing v
      inner join client1 c on  v.clientNo=c.clientNo and v.comment1="no dining room")
      inner join propertyforrent p on p.propertyNo=v.propertyNo)
      inner join staff s on p.staffNo=s.staffNo)
      
 9
 select r.staffNo, s.fName, s.position1, b.city, b.branchNo
 from (((client1 c
       inner join registration r on c.clientNo=r.clientNo and c.fName="John")
       inner join staff s on r.staffNo=s.staffNo)
       inner join branch b on s.branchNo=b.branchNo)
 
 10
    select c.*
    from (((privateowner pr
          inner join propertyforrent p on pr.ownerNo=p.ownerNo and pr.fName="Tony")
          Inner join viewing v on p.propertyNo=v.propertyNo)
          inner join client1 c on v.clientNo=c.clientNo)
