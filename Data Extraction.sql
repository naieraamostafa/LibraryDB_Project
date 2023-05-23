
--what is the most interesting book 'title' that has maximum number of buyers
SELECT TOP 1 i.item_name AS book_title
FROM Item AS i
INNER JOIN Purchase AS p ON i.item_id = p.item_id
WHERE i.item_type = 'Book'
GROUP BY i.item_id, i.item_name
ORDER BY COUNT(p.buyer_id) DESC;

--2-what was the book 'title' that hadn't any buyers last month
SELECT i.item_name
FROM Item i
LEFT JOIN Purchase p ON i.item_id = p.item_id
WHERE MONTH(p.purchase_Date) != 8 OR YEAR(p.purchase_Date) != 2022 OR p.purchase_Date IS NULL;

--3-what is the number of authors whose books hadn't any buyers during last month
SELECT count(author_name)
FROM Item i
LEFT JOIN Purchase p ON i.item_id = p.item_id
WHERE MONTH(p.purchase_Date) != 8 OR YEAR(p.purchase_Date) != 2022 OR p.purchase_Date IS NULL;

--4-who are the authors who didn't upload any books yet

SELECT user_name
FROM _User
LEFT JOIN Item ON _User.user_id = Item.author_id
WHERE Item.item_id IS NULL


--5-what is the category with minimum number of books

SELECT TOP 1 category, COUNT(*) AS book_count
FROM Item
WHERE item_type = 'Book'
GROUP BY category
ORDER BY book_count ASC;



