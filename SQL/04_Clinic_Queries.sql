-- Q1
SELECT sales_channel, SUM(amount) FROM clinic_sales GROUP BY sales_channel;

-- Q2
SELECT strftime('%Y-%m', sale_date), SUM(amount) FROM clinic_sales GROUP BY strftime('%Y-%m', sale_date);

-- Q3
WITH r AS (
SELECT strftime('%Y-%m', sale_date) m, SUM(amount) rev FROM clinic_sales GROUP BY m
),
e AS (
SELECT strftime('%Y-%m', expense_date) m, SUM(amount) exp FROM expenses GROUP BY m
)
SELECT r.m, rev, exp, (rev-exp) FROM r JOIN e ON r.m=e.m;

-- Q4
SELECT strftime('%Y-%m', sale_date), SUM(amount) rev
FROM clinic_sales
GROUP BY strftime('%Y-%m', sale_date)
ORDER BY rev DESC LIMIT 1;

-- Q5
SELECT strftime('%Y-%m', expense_date), SUM(amount)
FROM expenses
GROUP BY strftime('%Y-%m', expense_date);