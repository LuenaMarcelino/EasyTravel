-- ============================================
-- EasyTravel Database - File 1
-- DDL (CREATE TABLE) + DCL (Roles & Permissions)
-- ============================================

-- ============================================
-- DROP TABLES (run this first to start fresh)
-- ============================================
DROP TABLE IF EXISTS taxi_transfers CASCADE;
DROP TABLE IF EXISTS feedback CASCADE;
DROP TABLE IF EXISTS payment CASCADE;
DROP TABLE IF EXISTS booking CASCADE;
DROP TABLE IF EXISTS campaigns CASCADE;
DROP TABLE IF EXISTS holiday_package CASCADE;
DROP TABLE IF EXISTS services CASCADE;
DROP TABLE IF EXISTS flights CASCADE;
DROP TABLE IF EXISTS accommodation CASCADE;
DROP TABLE IF EXISTS customer CASCADE;
DROP TABLE IF EXISTS users CASCADE;
DROP TABLE IF EXISTS role CASCADE;

-- ============================================
-- TABLE 1: role
-- Stores the 3 access levels
-- ============================================
CREATE TABLE role (
    role_id SERIAL PRIMARY KEY,
    role_name VARCHAR(50) NOT NULL UNIQUE
);

-- ============================================
-- TABLE 2: users
-- Represents the "User" entity from ER diagram
-- Linked to role for access control
-- ============================================
CREATE TABLE users (
    user_id SERIAL PRIMARY KEY,
    user_name VARCHAR(100) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    role_id INTEGER NOT NULL,
    CONSTRAINT fk_users_role FOREIGN KEY (role_id) REFERENCES role(role_id)
);

-- ============================================
-- TABLE 3: customer
-- Stores customer business data
-- Linked to users for authentication
-- Includes loyalty program tracking
-- ============================================
CREATE TABLE customer (
    customer_id SERIAL PRIMARY KEY,
    user_id INTEGER NOT NULL,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    account VARCHAR(50) UNIQUE,
    is_loyalty_member BOOLEAN DEFAULT FALSE,
    loyalty_points INTEGER DEFAULT 0,
    CONSTRAINT fk_customer_user FOREIGN KEY (user_id) REFERENCES users(user_id)
);

-- ============================================
-- TABLE 4: accommodation
-- Stores accommodation options
-- ============================================
CREATE TABLE accommodation (
    accommodation_id SERIAL PRIMARY KEY,
    accommodation_type VARCHAR(50) NOT NULL,
    room_type VARCHAR(50),
    base_price DECIMAL(10, 2) NOT NULL,
    amenities TEXT,
    CHECK (base_price >= 0)
);

-- ============================================
-- TABLE 5: holiday_package
-- Stores holiday packages
-- Links to accommodation
-- ============================================
CREATE TABLE holiday_package (
    package_id SERIAL PRIMARY KEY,
    holiday_type VARCHAR(50) NOT NULL,
    base_price DECIMAL(10, 2) NOT NULL,
    description TEXT,
    accommodation_id INTEGER,
    CONSTRAINT fk_package_accommodation FOREIGN KEY (accommodation_id) REFERENCES accommodation(accommodation_id),
    CHECK (base_price >= 0)
);

-- ============================================
-- TABLE 6: flights
-- Stores flight information
-- ============================================
CREATE TABLE flights (
    flight_id SERIAL PRIMARY KEY,
    airline VARCHAR(100) NOT NULL,
    route VARCHAR(200) NOT NULL,
    class_type VARCHAR(50) NOT NULL,
    seat_capacity INTEGER NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    CHECK (seat_capacity > 0),
    CHECK (price >= 0)
);

-- ============================================
-- TABLE 7: services
-- Stores extra services (baggage, tours, etc.)
-- ============================================
CREATE TABLE services (
    service_id SERIAL PRIMARY KEY,
    service_type VARCHAR(100) NOT NULL,
    description TEXT,
    price DECIMAL(10, 2) NOT NULL,
    CHECK (price >= 0)
);

-- ============================================
-- TABLE 8: booking
-- Stores bookings made by customers
-- Links to customer, holiday_package, flights, services
-- ============================================
CREATE TABLE booking (
    booking_id SERIAL PRIMARY KEY,
    customer_id INTEGER NOT NULL,
    package_id INTEGER NOT NULL,
    date DATE NOT NULL DEFAULT CURRENT_DATE,
    status VARCHAR(50) NOT NULL DEFAULT 'Pending',
    total_price DECIMAL(10, 2) NOT NULL,
    flight_id INTEGER,
    service_id INTEGER,
    CONSTRAINT fk_booking_customer FOREIGN KEY (customer_id) REFERENCES customer(customer_id),
    CONSTRAINT fk_booking_package FOREIGN KEY (package_id) REFERENCES holiday_package(package_id),
    CONSTRAINT fk_booking_flight FOREIGN KEY (flight_id) REFERENCES flights(flight_id),
    CONSTRAINT fk_booking_service FOREIGN KEY (service_id) REFERENCES services(service_id),
    CHECK (total_price >= 0),
    CHECK (status IN ('Confirmed', 'Pending', 'Cancelled'))
);

-- ============================================
-- TABLE 9: taxi_transfers
-- Stores taxi transfer options
-- Links to BOTH booking and services
-- ============================================
CREATE TABLE taxi_transfers (
    transfer_id SERIAL PRIMARY KEY,
    transfer_type VARCHAR(50) NOT NULL,
    requests TEXT,
    price DECIMAL(10, 2) NOT NULL,
    booking_id INTEGER,
    service_id INTEGER,
    CONSTRAINT fk_taxi_booking FOREIGN KEY (booking_id) REFERENCES booking(booking_id),
    CONSTRAINT fk_taxi_service FOREIGN KEY (service_id) REFERENCES services(service_id),
    CHECK (price >= 0)
);

-- ============================================
-- TABLE 10: payment
-- Stores payment records for bookings
-- ============================================
CREATE TABLE payment (
    payment_id SERIAL PRIMARY KEY,
    booking_id INTEGER NOT NULL,
    payment_method VARCHAR(50) NOT NULL,
    amount DECIMAL(10, 2) NOT NULL,
    payment_date DATE NOT NULL DEFAULT CURRENT_DATE,
    CONSTRAINT fk_payment_booking FOREIGN KEY (booking_id) REFERENCES booking(booking_id),
    CHECK (amount >= 0),
    CHECK (payment_method IN ('Credit Card', 'Bank Transfer', 'Loyalty Points'))
);

-- ============================================
-- TABLE 11: feedback
-- Stores customer feedback and ratings
-- ============================================
CREATE TABLE feedback (
    feedback_id SERIAL PRIMARY KEY,
    customer_id INTEGER NOT NULL,
    booking_id INTEGER,
    ratings INTEGER NOT NULL,
    comments TEXT,
    feedback_date DATE NOT NULL DEFAULT CURRENT_DATE,
    CONSTRAINT fk_feedback_customer FOREIGN KEY (customer_id) REFERENCES customer(customer_id),
    CONSTRAINT fk_feedback_booking FOREIGN KEY (booking_id) REFERENCES booking(booking_id),
    CHECK (ratings >= 1 AND ratings <= 5)
);

-- ============================================
-- TABLE 12: campaigns
-- Stores promotional campaigns
-- Links to holiday_package
-- ============================================
CREATE TABLE campaigns (
    campaign_id SERIAL PRIMARY KEY,
    campaign_name VARCHAR(100) NOT NULL,
    discounts DECIMAL(5, 2) NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    is_loyalty_exclusive BOOLEAN DEFAULT FALSE,
    package_id INTEGER,
    CONSTRAINT fk_campaign_package FOREIGN KEY (package_id) REFERENCES holiday_package(package_id),
    CHECK (discounts >= 0 AND discounts <= 100),
    CHECK (end_date >= start_date)
);

-- ============================================
-- DCL: CREATE ROLES
-- ============================================
DROP ROLE IF EXISTS admin_role;
DROP ROLE IF EXISTS travel_agent_role;
DROP ROLE IF EXISTS customer_role;

CREATE ROLE admin_role;
CREATE ROLE travel_agent_role;
CREATE ROLE customer_role;

-- ============================================
-- ADMIN: Full CRUD on ALL tables
-- ============================================
GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA public TO admin_role;
GRANT ALL PRIVILEGES ON ALL SEQUENCES IN SCHEMA public TO admin_role;

-- ============================================
-- TRAVEL AGENT:
-- TABLE A (booking, payment)   → CREATE + UPDATE
-- TABLE B (customer, holiday_package, flights) → READ only
-- TABLE C (feedback)           → READ + DELETE
-- ============================================
GRANT SELECT, INSERT, UPDATE ON booking TO travel_agent_role;
GRANT USAGE, SELECT ON SEQUENCE booking_booking_id_seq TO travel_agent_role;
GRANT SELECT, INSERT, UPDATE ON payment TO travel_agent_role;
GRANT USAGE, SELECT ON SEQUENCE payment_payment_id_seq TO travel_agent_role;

GRANT SELECT ON customer TO travel_agent_role;
GRANT SELECT ON holiday_package TO travel_agent_role;
GRANT SELECT ON flights TO travel_agent_role;

GRANT SELECT, DELETE ON feedback TO travel_agent_role;

-- ============================================
-- CUSTOMER:
-- TABLE F (customer)           → UPDATE + READ
-- TABLE G (holiday_package, flights, campaigns, booking) → READ only
-- ============================================
GRANT SELECT, UPDATE ON customer TO customer_role;

GRANT SELECT ON holiday_package TO customer_role;
GRANT SELECT ON flights TO customer_role;
GRANT SELECT ON campaigns TO customer_role;
GRANT SELECT ON booking TO customer_role;
GRANT SELECT ON accommodation TO customer_role;
GRANT SELECT ON services TO customer_role;

GRANT SELECT, INSERT ON feedback TO customer_role;
GRANT USAGE, SELECT ON SEQUENCE feedback_feedback_id_seq TO customer_role;

-- ============================================
-- CREATE DATABASE USERS (uncomment to use)
-- ============================================
-- DROP USER IF EXISTS admin_user;
-- DROP USER IF EXISTS agent_user;
-- DROP USER IF EXISTS cust_user;

-- CREATE USER admin_user WITH PASSWORD 'admin123';
-- CREATE USER agent_user WITH PASSWORD 'agent123';
-- CREATE USER cust_user WITH PASSWORD 'customer123';

-- GRANT admin_role TO admin_user;
-- GRANT travel_agent_role TO agent_user;
-- GRANT customer_role TO cust_user;

-- ============================================
-- End of File 1
-- ============================================
