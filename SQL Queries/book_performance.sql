SELECT *
FROM books;

-- Do higher-rated books actually sell more?
SELECT
	CASE
		WHEN book_average_rating >= 4.0 THEN 'High Rating'
        WHEN book_average_rating >= 3.0 THEN 'Medium Rating'
        ELSE 'Low Rating'
	END AS rating_group,
    COUNT(*) AS total_books,
    ROUND(AVG(gross_sales), 2) AS avg_sales
FROM books
GROUP BY rating_group
ORDER BY avg_sales DESC;

-- What are the top-performing books overall?
SELECT 
	book_name, 
    author,
    genre,
    gross_sales
FROM books
ORDER BY gross_sales DESC
limit 10;
