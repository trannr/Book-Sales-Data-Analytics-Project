SELECT *
FROM books;

-- How does pricing impact sales performance?
SELECT 
	CASE
		WHEN sale_price > 20 THEN 'High Price'
        WHEN sale_price >= 10 THEN 'Medium Price'
        ELSE 'Low Price'
	END AS pricing, 
    COUNT(*) AS total_books,
    ROUND(AVG(gross_sales), 2) AS avg_sales
FROM books
GROUP BY pricing
ORDER BY avg_sales DESC;

-- Do higher-priced books generate more total revenue?
SELECT 
	CASE
		WHEN sale_price > 20 THEN 'High Price'
        WHEN sale_price >= 10 THEN 'Medium Price'
        ELSE 'Low Price'
	END AS pricing, 
    COUNT(*) AS total_books,
    ROUND(SUM(gross_sales), 2) AS total_sales,
    ROUND(SUM(gross_sales) * 100 / (SELECT SUM(gross_sales) FROM books), 0) AS percent_of_total,
    CONCAT(ROUND(SUM(gross_sales) * 100 / (SELECT SUM(gross_sales) FROM books), 0), '%') AS percent_display
FROM books
GROUP BY pricing
ORDER BY total_sales DESC;
