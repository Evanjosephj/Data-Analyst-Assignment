-- Q1
SELECT b.user_id, b.room_no
FROM bookings b
JOIN (
    SELECT user_id, MAX(booking_date) AS last_date
    FROM bookings
    GROUP BY user_id
) latest
ON b.user_id = latest.user_id AND b.booking_date = latest.last_date;

-- Q2
SELECT bc.booking_id,
SUM(bc.item_quantity * i.item_rate) AS total_bill
FROM booking_commercials bc
JOIN items i ON bc.item_id = i.item_id
WHERE bc.bill_date >= '2021-11-01' AND bc.bill_date < '2021-12-01'
GROUP BY bc.booking_id;

-- Q3
SELECT bc.bill_id,
SUM(bc.item_quantity * i.item_rate) AS bill_amount
FROM booking_commercials bc
JOIN items i ON bc.item_id = i.item_id
WHERE bc.bill_date >= '2021-10-01' AND bc.bill_date < '2021-11-01'
GROUP BY bc.bill_id
HAVING bill_amount > 1000;

-- Q4
WITH temp AS (
SELECT strftime('%Y-%m', bill_date) AS month,
i.item_name,
SUM(bc.item_quantity) AS qty,
RANK() OVER (PARTITION BY strftime('%Y-%m', bill_date) ORDER BY SUM(bc.item_quantity) DESC) r1,
RANK() OVER (PARTITION BY strftime('%Y-%m', bill_date) ORDER BY SUM(bc.item_quantity)) r2
FROM booking_commercials bc
JOIN items i ON bc.item_id = i.item_id
GROUP BY month, i.item_name
)
SELECT month,
MAX(CASE WHEN r1=1 THEN item_name END) AS most,
MAX(CASE WHEN r2=1 THEN item_name END) AS least
FROM temp GROUP BY month;

-- Q5
WITH t AS (
SELECT strftime('%Y-%m', bill_date) AS month,
b.user_id,
bc.bill_id,
SUM(bc.item_quantity * i.item_rate) AS amount
FROM booking_commercials bc
JOIN items i ON bc.item_id=i.item_id
JOIN bookings b ON bc.booking_id=b.booking_id
GROUP BY month, b.user_id, bc.bill_id
),
r AS (
SELECT *, DENSE_RANK() OVER (PARTITION BY month ORDER BY amount DESC) rnk FROM t
)
SELECT * FROM r WHERE rnk=2;