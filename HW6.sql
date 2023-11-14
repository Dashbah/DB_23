SELECT DISTINCT b.name, b.author
    FROM book b;

SELECT name, num_of_pages
FROM book
WHERE num_of_pages = (SELECT MAX(num_of_pages) FROM book);

SELECT author , count(*) as num_of_books
FROM book
GROUP BY author
    HAVING Count(*) >= 2;
-- было мало книг, поэтому 5 поменяли на 2

-- В каких книгах более чем в два раза больше страниц, чем среднее количество страниц для всех книг?
SELECT name, num_of_pages
FROM book
WHERE num_of_pages > 2 * (SELECT AVG(num_of_pages) FROM Book);

-- Какие категории содержат подкатегории?
SELECT DISTINCT mother_category_id
FROM Category
WHERE category.mother_category_id IS NOT NULL;

-- У какого автора написано максимальное количество книг?
SELECT Author, COUNT(*) AS BooksWritten
FROM Book
GROUP BY Author
ORDER BY BooksWritten DESC
LIMIT 1;

-- Какие читатели забронировали все книги, написанные "Марком Твеном"?
SELECT R.name, R.surname
FROM Reader R
WHERE NOT EXISTS (
    SELECT B.isbn
    FROM Book B
    WHERE B.Author = 'Марк Твен'
    EXCEPT
    SELECT Br.reader_reader_id
    FROM booking Br
    WHERE Br.reader_reader_id = R.reader_id
);

-- Какие книги имеют более одной копии?
SELECT B.name
FROM Book B
JOIN bookcopy C ON B.isbn = C.book_isbn
GROUP BY B.isbn, B.name
HAVING COUNT(*) > 1;

-- ТОП 10 самых старых книг
SELECT name, year
FROM Book
ORDER BY year
LIMIT 10;


