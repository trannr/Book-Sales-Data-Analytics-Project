SELECT * 
FROM books;

-- Which genres are driving the most revenue?
SELECT 
	genre, 
    SUM(gross_sales) AS total_revenue,
	CONCAT('$', FORMAT(SUM(gross_sales), 2)) AS formatted_revenue
FROM books
GROUP BY genre
ORDER BY total_revenue desc
;

-- Which genre performs best per book?
SELECT 
	genre,
    AVG(gross_sales) AS average_sales,
    CONCAT('$', FORMAT(AVG(gross_sales), 2)) AS formatted_revenue
FROM books
GROUP BY genre
ORDER BY average_sales DESC
;

-- Which genre has the highest average rating?
SELECT 
	genre,
    ROUND(AVG(book_average_rating), 2) AS average_rating
FROM books
GROUP BY genre
ORDER BY average_rating DESC
;

-- Which genre has the most engaged audience?
SELECT 
	genre,
    SUM(book_ratings_count) AS engagement
FROM books
GROUP BY genre
ORDER BY engagement DESC
;

-- How many books are there in each genre?
SELECT 
	genre, 
	COUNT(genre)
FROM books
GROUP BY genre
ORDER BY COUNT(genre) DESC;
