SELECT DISTINCT r.surname
FROM Reader r
WHERE r.address LIKE '%Москва%';


SELECT DISTINCT b.author, b.name AS title
FROM Booking bk
JOIN Reader r ON bk.Reader_reader_id = r.reader_id
JOIN BookCopy bc ON bk.booking_id = bc.Booking_booking_id
JOIN Book b ON bc.Book_ISBN = b.ISBN
WHERE r.name = 'Иван' AND r.surname = 'Иванов';

SELECT DISTINCT b.ISBN
FROM Book b
JOIN Category c ON b.Category_category_id = c.category_id
WHERE c.name = 'Горы'
AND b.ISBN NOT IN (
    SELECT DISTINCT b2.ISBN
    FROM Book b2
    JOIN Category c2 ON b2.Category_category_id = c2.category_id
    WHERE c2.name = 'Путешествия'
);

SELECT DISTINCT r.surname AS LastName, r.name AS FirstName
FROM Booking bk
JOIN Reader r ON bk.Reader_reader_id = r.reader_id
WHERE bk.returned = 1;

