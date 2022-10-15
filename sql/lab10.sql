1
SELECT h.city, h.hotelName, r.bed, r.price
FROM hotel h, room r
WHERE h.hotelNo=r.hotelNo
ORDER BY r.price 

2
SELECT *
FROM hotel h, room r
WHERE (r.price BETWEEN 100 AND 300) AND h.hotelNo=r.HotelNo

3
SELECT h.*, COUNT(r.roomNo)
FROM hotel h, room r
WHERE h.hotelNo=r.hotelNo
GROUP BY r.hotelNo 
ORDER BY COUNT(r.roomNo) DESC
LIMIT 1


4
SELECT  COUNT(r.roomNo), MIN(r.price), MAX(r.price), AVG(r.price)
FROM hotel h, room r
WHERE h.hotelNo=r.hotelNo
GROUP BY r.hotelNo

5
SELECT h.*, r.*
FROM hotel h, room r, booking b, guest g
WHERE h.hotelNo=r.hotelNo AND b.hotelNo=h.hotelNo AND r.roomNo=b.roomNo AND g.guestNo=b.guestNo AND guestName="Mark"

6
SELECT r.roomNo, r.bed, r.price, g.guestName, g.phoneNumber, h.city, h.hotelName
FROM room r, guest g, hotel h, booking b
WHERE (NOW() BETWEEN b.dateFrom AND b.dateTo) AND h.hotelNo=r.hotelNo AND b.hotelNo=h.hotelNo AND r.roomNo=b.roomNo AND g.guestNo=b.guestNo

7
SELECT DATEDIFF(dateFrom, dateTo)
FROM booking 
WHERE NOW() BETWEEN dateFrom AND dateTo

8
SELECT r.*, COUNT(b.roomNo)
FROM booking b, room r
WHERE r.roomNo=b.roomNo 
GROUP BY b.roomNo
ORDER BY COUNT(b.roomNo) DESC
LIMIT 1

9               
SELECT r.hotelno, r.roomno, r.bed, r.price
FROM room r, hotel h
WHERE r.hotelno = h.hotelno AND roomno NOT IN (SELECT roomno
					        FROM booking b, hotel h
						WHERE (NOW() BETWEEN b.dateFrom AND dateTo) AND b.hotelno=h.hotelno  AND r.price>300)

10
SELECT g.guestNo, g.guestName, b.hotelNo, h.city, b.roomNo, r.price, DATEDIFF(b.dateFrom, b.dateTo)
FROM booking b, room r, guest g, hotel h
WHERE h.hotelNo=r.hotelNo AND b.hotelNo=h.hotelNo AND r.roomNo=b.roomNo AND g.guestNo=b.guestNo
ORDER BY DATEDIFF(b.dateFrom, b.dateTo)
LIMIT 1
