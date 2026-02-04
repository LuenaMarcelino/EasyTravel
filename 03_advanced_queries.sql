-- ============================================
-- EasyTravel Database - File 3
-- Advanced Queries, Views, and TCL
-- ============================================

-- ============================================
-- QUERY 1: INNER JOIN
-- Show all confirmed bookings with customer
-- name and holiday type
-- ============================================
SELECT 
    b.booking_id,
    c.name AS customer_name,
    hp.holiday_type,
    b.date AS booking_date,
    b.total_price,
    b.status
FROM booking b
INNER JOIN customer c ON b.customer_id = c.customer_id
INNER JOIN holiday_package hp ON b.package_id = hp.package_id
WHERE b.status = 'Confirmed'
ORDER BY b.total_price DESC;

-- ============================================
-- QUERY 2: LEFT JOIN
-- Show ALL customers even if they have no
-- bookings. Uses COALESCE to handle NULLs
-- ============================================
SELECT 
    c.name AS customer_name,
    c.email,
    c.is_loyalty_member,
    COUNT(b.booking_id) AS total_bookings,
    COALESCE(SUM(b.total_price), 0) AS total_spent
FROM customer c
LEFT JOIN booking b ON c.customer_id = b.customer_id
GROUP BY c.customer_id, c.name, c.email, c.is_loyalty_member
ORDER BY total_spent DESC;

-- ============================================
-- QUERY 3: CASE Statement
-- Categorise customers into loyalty tiers
-- based on their loyalty points
-- ============================================
SELECT 
    c.name AS customer_name,
    c.loyalty_points,
    CASE 
        WHEN c.loyalty_points >= 7000 THEN 'Platinum'
        WHEN c.loyalty_points >= 5000 THEN 'Gold'
        WHEN c.loyalty_points >= 3000 THEN 'Silver'
        WHEN c.loyalty_points >= 1 THEN 'Bronze'
        ELSE 'Non-Member'
    END AS loyalty_tier,
    CASE 
        WHEN c.is_loyalty_member = TRUE THEN 'Yes'
        ELSE 'No'
    END AS is_member
FROM customer c
ORDER BY c.loyalty_points DESC;

-- ============================================
-- QUERY 4: Aggregations - MIN, MAX, AVG, SUM, COUNT
-- Revenue analysis by holiday type
-- Shows all 5 aggregate functions together
-- ============================================
SELECT 
    hp.holiday_type,
    COUNT(b.booking_id) AS total_bookings,
    MIN(b.total_price) AS min_price,
    MAX(b.total_price) AS max_price,
    ROUND(AVG(b.total_price), 2) AS avg_price,
    SUM(b.total_price) AS total_revenue
FROM holiday_package hp
INNER JOIN booking b ON hp.package_id = b.package_id
WHERE b.status = 'Confirmed'
GROUP BY hp.holiday_type
ORDER BY total_revenue DESC;

-- ============================================
-- QUERY 5: Multiple JOINs
-- Full booking details joining 5 tables
-- customer, holiday_package, accommodation,
-- flights, services
-- ============================================
SELECT 
    b.booking_id,
    c.name AS customer_name,
    hp.holiday_type,
    a.accommodation_type,
    a.room_type,
    f.airline,
    f.route,
    f.class_type,
    s.service_type,
    s.price AS service_price,
    b.date AS booking_date,
    b.status,
    b.total_price
FROM booking b
INNER JOIN customer c ON b.customer_id = c.customer_id
INNER JOIN holiday_package hp ON b.package_id = hp.package_id
LEFT JOIN accommodation a ON hp.accommodation_id = a.accommodation_id
LEFT JOIN flights f ON b.flight_id = f.flight_id
LEFT JOIN services s ON b.service_id = s.service_id
ORDER BY b.booking_id;

-- ============================================
-- VIEW 1: v_customer_booking_summary
-- Saves the customer booking summary as a view
-- Manager can use this for quick reporting
-- ============================================
CREATE VIEW v_customer_booking_summary AS
SELECT 
    c.customer_id,
    c.name,
    c.email,
    c.is_loyalty_member,
    c.loyalty_points,
    COUNT(b.booking_id) AS total_bookings,
    SUM(CASE WHEN b.status = 'Confirmed' THEN 1 ELSE 0 END) AS confirmed,
    SUM(CASE WHEN b.status = 'Pending' THEN 1 ELSE 0 END) AS pending,
    SUM(CASE WHEN b.status = 'Cancelled' THEN 1 ELSE 0 END) AS cancelled,
    COALESCE(SUM(CASE WHEN b.status = 'Confirmed' THEN b.total_price ELSE 0 END), 0) AS total_spent
FROM customer c
LEFT JOIN booking b ON c.customer_id = b.customer_id
GROUP BY c.customer_id, c.name, c.email, c.is_loyalty_member, c.loyalty_points;

-- Use the view
SELECT * FROM v_customer_booking_summary ORDER BY total_spent DESC;

-- ============================================
-- VIEW 2: v_revenue_by_holiday_type
-- Revenue report by holiday type
-- Uses MIN, MAX, AVG, SUM, COUNT
-- ============================================
CREATE VIEW v_revenue_by_holiday_type AS
SELECT 
    hp.holiday_type,
    COUNT(b.booking_id) AS total_bookings,
    MIN(b.total_price) AS min_price,
    MAX(b.total_price) AS max_price,
    ROUND(AVG(b.total_price), 2) AS avg_price,
    SUM(b.total_price) AS total_revenue
FROM holiday_package hp
INNER JOIN booking b ON hp.package_id = b.package_id
WHERE b.status = 'Confirmed'
GROUP BY hp.holiday_type;

-- Use the view
SELECT * FROM v_revenue_by_holiday_type ORDER BY total_revenue DESC;

-- ============================================
-- VIEW 3: v_campaign_details
-- Shows campaigns with their package info
-- and the discounted price calculation
-- ============================================
CREATE VIEW v_campaign_details AS
SELECT 
    c.campaign_id,
    c.campaign_name,
    c.discounts,
    c.start_date,
    c.end_date,
    c.is_loyalty_exclusive,
    hp.package_id,
    hp.holiday_type,
    hp.base_price AS original_price,
    ROUND(hp.base_price * (1 - c.discounts / 100), 2) AS discounted_price
FROM campaigns c
INNER JOIN holiday_package hp ON c.package_id = hp.package_id;

-- Use the view
SELECT * FROM v_campaign_details ORDER BY discounted_price ASC;

-- ============================================
-- QUERY 9: TCL - COMMIT Example
-- Insert a new booking then COMMIT
-- This makes the change permanent
-- ============================================
BEGIN;

INSERT INTO booking (customer_id, package_id, date, status, total_price, flight_id, service_id)
VALUES (1, 2, '2025-03-01', 'Pending', 1100.00, 3, 6);

-- Verify the new booking
SELECT * FROM booking WHERE booking_id = (SELECT MAX(booking_id) FROM booking);

COMMIT;

-- After COMMIT, data is saved permanently
-- Even if you close DBeaver, this row stays

-- ============================================
-- QUERY 10: TCL - ROLLBACK Example
-- Update a customer loyalty points then ROLLBACK
-- This shows the change is NOT saved
-- ============================================
BEGIN;

-- Change loyalty points to 99999
UPDATE customer SET loyalty_points = 99999 WHERE customer_id = 1;

-- Show the change happened
SELECT customer_id, name, loyalty_points FROM customer WHERE customer_id = 1;

-- ROLLBACK - undo the change!
ROLLBACK;

-- Show that points are back to original value
SELECT customer_id, name, loyalty_points FROM customer WHERE customer_id = 1;

-- ============================================
-- End of File 3
-- ============================================
