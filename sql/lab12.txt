1 "Бүртгэлийн хүснэгтээс хэн хэнтэй ажилласныг нэг өгүүлбэрээр буюу 1 баганад оруулж харуулна уу. Жишээ: L.Julie 1 sariin 2-nd London-n salbart K.John-toi ajiljee."

SELECT CONCAT(SUBSTRING(s.lName, 1,1), ".", s.fName, " ", MONTH(r.dateJoined), " sariin ", DAY(r.dateJoined), "-nd ", b.city, "-n salbart ", SUBSTRING(c.lName, 1, 1), ".", c.fName, "-tai ajiljee") AS uguulber
FROM staff s, branch b, client1 c, registration r
WHERE s.staffNo=r.staffNo AND b.branchNo=r.branchNo AND c.clientNo=r.clientNo

2 "StaffInfo хүснэгт үүсгэнэ үү. staffNo, fullName, position, branchAddress, propCount, clientCount гэсэн багануудтай. Хүснэгтэнд query ашиглан өгөгдөл оруулна уу" 

CREATE TABLE StaffInfo AS
SELECT s.staffNo, CONCAT(s.fName, " ", s.lName) AS fullName, s.position1, CONCAT(b.street, " ", b.city, b.postcode) AS branchAddress, COUNT(p.propertyNo) AS propCount, COUNT(r.clientNo) AS staffCount
FROM staff s, propertyforrent p, branch b, registration r
WHERE s.staffNo=p.staffNo AND b.branchNo=s.branchNo AND r.staffNo=s.staffNo
GROUP BY r.staffNo


3 "B003 салбарын хариуцан ажиллаж байгаа үл хөдлөх хөрөнгийн үнийг 15%-аар нэмэгдүүлнэ үү. "

UPDATE propertyforrent
SET rent = rent *1.15
WHERE branchNo="B003"


4 "Tony Shaw-н үл хөдлөх хөрөнгийн үнийг 400, ажилтны дугаарыг SA9 болгоно уу"

UPDATE propertyforrent
SET rent=400, staffNo="SA9"
WHERE ownerNo IN (SELECT ownerNo 
                  FROM privateowner
                  WHERE fName="Tony" AND lName="Shaw")

5 "Үл хөдлөх хөрөнгийн үнийг 15%-аар нэмэгдүүлнэ үү"

UPDATE propertyforrent
SET rent=rent*1.15


6 "Бүртгэлийн хүснэгтэд 4-р сард бүртгэсэн мэдээллийг 5-н сар болгож өөрчилнө үү. DATE_ADD функцийг ашиглана уу "

UPDATE registration
SET dateJoined = DATE_ADD(dateJoined, INTERVAL 1 MONTH)
WHERE dateJoined LIKE "%-04-%"


7 " Үл хөдлөх хөрөнгийн нөөц хүснэгтээс хариуцах ажилтангүй мэдээллийг устгана уу. "

CREATE TABLE property_backup
AS (SELECT *
    FROM propertyforrent)

DELETE FROM property_backup
WHERE staffNo IS NULL 


8 "Үл хөдлөх хөрөнгийн нөөц хүснэгтээс 16 Argyll St гудамжинд байрладаг, House төрлийнорон сууцны мэдээллийг устгана уу. "

DELETE FROM property_backup
WHERE city="16 Argyll St" AND type1="House"


1 "Зочид буудлын захиалгын мэдээллийг нэг өгүүлбэрт оруулж харуул. Жишээ: Бат "Улаанбаатар" зочид буудлын 45000 үнэтэй "VIP" өрөөнд 2020-10-01-нд буудаллажээ. "

SELECT CONCAT(g.guestName, " ", h.hotelName, " zochid buudliin ", r.price, " unetei ", r.bed, " uruund ", b.dateFrom, "-nd buudallajee")  AS uguulber
FROM guest g, hotel h, room r, booking b
WHERE h.hotelNo=b.hotelNo AND b.guestNo=g.guestNo AND r.roomNo=b.roomNo AND r.hotelNo=h.hotelNo


2 "Зочид буудлуудын хамгийн хямд үнэтэй, шууд захиалах боломжтой өрөөнүүдиййн мэдээллийг шүүж харуулна уу"

SELECT r.hotelNo, r.roomNo, r.bed, r.price
FROM room r, hotel h
WHERE r.hotelNo = h.hotelNo AND roomNo NOT IN (SELECT roomNo
					        FROM booking b, hotel h
						WHERE (NOW() BETWEEN b.dateFrom AND dateTo))
						GROUP BY r.price
						ORDER BY r.price


3"Хамгийн цөөн тоогоор захиалга авсан зочид буудлын өрөөний мэдээллийг үнийг нь өсөхөөр эрэмбэлж гаргана уу." 

SELECT r.*, COUNT(b.roomNo)
FROM booking b, room r
WHERE r.roomNo=b.roomNo 
GROUP BY b.roomNo
ORDER BY COUNT(b.roomNo) ASC, price ASC


 

4 "Зочид буудал бүрийн сүүлийн 3 сарын хугацаанд буудалласан зочдын мэдээллийг харуу"

SELECT g.*, b.dateFrom
FROM guest g, booking b
WHERE (b.dateFrom >= DATE_ADD(NOW(), INTERVAL -3 MONTH)) AND g.guestNo=b.guestNo


5 "Зочид буудал бүрт хамгийн олон удаа буудалласан 1, 1 зочны мэдээллийг харуулна уу"

SELECT b.hotelNo, b.guestNo, COUNT(b.guestNo), g.guestName, g.guestAdress, g.phoneNumber
FROM booking b, guest g
WHERE b.guestNo=g.guestNo
GROUP BY b.guestNo
ORDER BY COUNT(b.guestNo) DESC, b.hotelNo             

 

6 "Зочид буудлын нөөц хүснэгт үүсгэж мэдээллийг хуулж оруулах query бичнэ үү."

CREATE TABLE hotel_backup
AS (SELECT *
    FROM hotel)


7" HotelInformation гэсэн хүснэгт үүсгэж query-ээр тохирох өгөгдлүүдийг оруулна уу. HotelInformation(HotelNo, HotelName, RoomCount, MaxPrice, MinPrice, AvgPrice, City) "

CREATE TABLE HotelInformation AS 
SELECT h.hotelNo, h.hotelName, COUNT(r.hotelNo) AS roomCount, MAX(r.price) AS maxPrice,  MIN(r.price) AS minPrice, AVG(r.price) AS avgPrice, h.city
FROM hotel h, room r 
WHERE h.hotelNo=r.hotelNo
GROUP BY h.hotelNo                    


8 "Үл хөдлөх хөрөнгийн нөөц хүснэгтээс 16 Argyll St гудамжинд байрладаг, House төрлийн орон сууцны мэдээллийг устгана уу. "

UPDATE room
SET price = price * 0.2
WHERE hotelNo IN (SELECT hotelNo 
                  FROM hotel
                  WHERE hotelName = "Shangrila")

