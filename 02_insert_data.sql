-- ============================================
-- EasyTravel Database - File 2
-- DML: INSERT DATA into all 12 tables
-- ============================================

-- ============================================
-- INSERT: role (3 rows)
-- ============================================
INSERT INTO role (role_name) VALUES
('Admin'),
('Travel Agent'),
('Customer');

-- ============================================
-- INSERT: users (33 rows)
-- role_id 1 = Admin, 2 = Travel Agent, 3 = Customer
-- ============================================
INSERT INTO users (user_name, password, role_id) VALUES
('admin_john', 'hashed_pw_123', 1),
('admin_sarah', 'hashed_pw_456', 1),
('agent_mike', 'hashed_pw_789', 2),
('agent_lisa', 'hashed_pw_101', 2),
('agent_tom', 'hashed_pw_102', 2),
('agent_emma', 'hashed_pw_103', 2),
('agent_david', 'hashed_pw_104', 2),
('cust_alice', 'hashed_pw_201', 3),
('cust_bob', 'hashed_pw_202', 3),
('cust_charlie', 'hashed_pw_203', 3),
('cust_diana', 'hashed_pw_204', 3),
('cust_edward', 'hashed_pw_205', 3),
('cust_fiona', 'hashed_pw_206', 3),
('cust_george', 'hashed_pw_207', 3),
('cust_hannah', 'hashed_pw_208', 3),
('cust_ian', 'hashed_pw_209', 3),
('cust_julia', 'hashed_pw_210', 3),
('cust_kevin', 'hashed_pw_211', 3),
('cust_laura', 'hashed_pw_212', 3),
('cust_mark', 'hashed_pw_213', 3),
('cust_nancy', 'hashed_pw_214', 3),
('cust_oliver', 'hashed_pw_215', 3),
('cust_patricia', 'hashed_pw_216', 3),
('cust_quinn', 'hashed_pw_217', 3),
('cust_rachel', 'hashed_pw_218', 3),
('cust_steve', 'hashed_pw_219', 3),
('cust_tina', 'hashed_pw_220', 3),
('cust_uma', 'hashed_pw_221', 3),
('cust_victor', 'hashed_pw_222', 3),
('cust_wendy', 'hashed_pw_223', 3),
('cust_xavier', 'hashed_pw_224', 3),
('cust_yolanda', 'hashed_pw_225', 3),
('cust_zack', 'hashed_pw_226', 3);

-- ============================================
-- INSERT: customer (30 rows)
-- user_id 8-37 are the customer users
-- Mix of loyalty and non-loyalty members
-- ============================================
INSERT INTO customer (user_id, name, email, account, is_loyalty_member, loyalty_points) VALUES
(8, 'Alice Johnson', 'alice.johnson@email.com', 'ACC001', TRUE, 5200),
(9, 'Bob Smith', 'bob.smith@email.com', 'ACC002', TRUE, 3800),
(10, 'Charlie Brown', 'charlie.brown@email.com', 'ACC003', FALSE, 0),
(11, 'Diana Prince', 'diana.prince@email.com', 'ACC004', TRUE, 7100),
(12, 'Edward Norton', 'edward.norton@email.com', 'ACC005', FALSE, 0),
(13, 'Fiona Apple', 'fiona.apple@email.com', 'ACC006', TRUE, 4500),
(14, 'George Lucas', 'george.lucas@email.com', 'ACC007', TRUE, 6200),
(15, 'Hannah Montana', 'hannah.montana@email.com', 'ACC008', FALSE, 0),
(16, 'Ian Fleming', 'ian.fleming@email.com', 'ACC009', TRUE, 2900),
(17, 'Julia Roberts', 'julia.roberts@email.com', 'ACC010', TRUE, 8500),
(18, 'Kevin Hart', 'kevin.hart@email.com', 'ACC011', FALSE, 0),
(19, 'Laura Palmer', 'laura.palmer@email.com', 'ACC012', TRUE, 1200),
(20, 'Mark Twain', 'mark.twain@email.com', 'ACC013', TRUE, 3100),
(21, 'Nancy Drew', 'nancy.drew@email.com', 'ACC014', FALSE, 0),
(22, 'Oliver Twist', 'oliver.twist@email.com', 'ACC015', TRUE, 4800),
(23, 'Patricia Williams', 'patricia.williams@email.com', 'ACC016', TRUE, 5500),
(24, 'Quinn Hughes', 'quinn.hughes@email.com', 'ACC017', FALSE, 0),
(25, 'Rachel Green', 'rachel.green@email.com', 'ACC018', TRUE, 6900),
(26, 'Steve Rogers', 'steve.rogers@email.com', 'ACC019', TRUE, 2100),
(27, 'Tina Turner', 'tina.turner@email.com', 'ACC020', FALSE, 0),
(28, 'Uma Thurman', 'uma.thurman@email.com', 'ACC021', TRUE, 4100),
(29, 'Victor Hugo', 'victor.hugo@email.com', 'ACC022', TRUE, 7800),
(30, 'Wendy Martin', 'wendy.martin@email.com', 'ACC023', FALSE, 0),
(31, 'Xavier Young', 'xavier.young@email.com', 'ACC024', TRUE, 3600),
(32, 'Yolanda Adams', 'yolanda.adams@email.com', 'ACC025', TRUE, 5100),
(33, 'Zack Morris', 'zack.morris@email.com', 'ACC026', FALSE, 0),
(34, 'Amy Lee', 'amy.lee@email.com', 'ACC027', TRUE, 9200),
(35, 'Brian May', 'brian.may@email.com', 'ACC028', FALSE, 0),
(36, 'Carol King', 'carol.king@email.com', 'ACC029', TRUE, 4700),
(37, 'Dan Brown', 'dan.brown@email.com', 'ACC030', TRUE, 2800);

-- ============================================
-- INSERT: accommodation (33 rows)
-- Mix of Hotels and Vacation Homes
-- ============================================
INSERT INTO accommodation (accommodation_type, room_type, base_price, amenities) VALUES
('Hotel', 'Single', 150.00, 'WiFi, Breakfast, Pool'),
('Hotel', 'Double', 220.00, 'WiFi, Breakfast, Pool, Gym'),
('Vacation Home', 'Family Suite', 350.00, 'WiFi, Kitchen, Garden, Parking'),
('Hotel', 'Single', 180.00, 'WiFi, Breakfast, Room Service'),
('Hotel', 'Double', 250.00, 'WiFi, Breakfast, Pool, Spa'),
('Vacation Home', 'Studio', 200.00, 'WiFi, Kitchen, Balcony'),
('Hotel', 'Suite', 450.00, 'WiFi, Breakfast, Pool, Spa, Gym'),
('Vacation Home', 'Family Suite', 380.00, 'WiFi, Kitchen, Garden, BBQ'),
('Hotel', 'Single', 160.00, 'WiFi, Breakfast, Parking'),
('Hotel', 'Double', 230.00, 'WiFi, Breakfast, Pool'),
('Vacation Home', 'Studio', 190.00, 'WiFi, Kitchen, Parking'),
('Hotel', 'Suite', 480.00, 'WiFi, Full Board, Pool, Spa, Gym'),
('Hotel', 'Single', 170.00, 'WiFi, Breakfast, Pool'),
('Vacation Home', 'Family Suite', 400.00, 'WiFi, Kitchen, Garden, Pool'),
('Hotel', 'Double', 240.00, 'WiFi, Breakfast, Gym'),
('Hotel', 'Single', 155.00, 'WiFi, Breakfast'),
('Vacation Home', 'Studio', 210.00, 'WiFi, Kitchen, Balcony, Parking'),
('Hotel', 'Suite', 500.00, 'WiFi, Full Board, Pool, Spa, Concierge'),
('Hotel', 'Double', 260.00, 'WiFi, Breakfast, Pool, Room Service'),
('Vacation Home', 'Family Suite', 370.00, 'WiFi, Kitchen, Garden, Fireplace'),
('Hotel', 'Single', 145.00, 'WiFi, Breakfast, Parking'),
('Hotel', 'Double', 215.00, 'WiFi, Breakfast, Pool, Gym'),
('Vacation Home', 'Studio', 195.00, 'WiFi, Kitchen, Garden'),
('Hotel', 'Suite', 470.00, 'WiFi, Full Board, Pool, Spa'),
('Hotel', 'Single', 175.00, 'WiFi, Breakfast, Pool, Parking'),
('Vacation Home', 'Family Suite', 360.00, 'WiFi, Kitchen, Garden, BBQ, Pool'),
('Hotel', 'Double', 235.00, 'WiFi, Breakfast, Gym, Room Service'),
('Hotel', 'Single', 165.00, 'WiFi, Breakfast, Pool'),
('Vacation Home', 'Studio', 205.00, 'WiFi, Kitchen, Balcony, Garden'),
('Hotel', 'Suite', 490.00, 'WiFi, Full Board, Pool, Spa, Gym, Concierge'),
('Hotel', 'Double', 245.00, 'WiFi, Breakfast, Pool, Parking'),
('Vacation Home', 'Family Suite', 390.00, 'WiFi, Kitchen, Garden, Pool, BBQ'),
('Hotel', 'Single', 158.00, 'WiFi, Breakfast, Room Service');

-- ============================================
-- INSERT: holiday_package (33 rows)
-- Mix of Beach Holiday, City Break, Lakes and Mountains
-- Each links to an accommodation
-- ============================================
INSERT INTO holiday_package (holiday_type, base_price, description, accommodation_id) VALUES
('Beach Holiday', 1200.00, 'Relaxing beach vacation with ocean views', 1),
('City Break', 850.00, 'Explore vibrant city life and culture', 5),
('Lakes and Mountains', 1500.00, 'Adventure in scenic mountain landscapes', 7),
('Beach Holiday', 1350.00, 'Luxury beach resort with spa', 2),
('City Break', 950.00, 'Historic city tour with museums', 6),
('Beach Holiday', 1100.00, 'Tropical island getaway', 3),
('Lakes and Mountains', 1600.00, 'Ski season mountain retreat', 8),
('City Break', 900.00, 'Modern city shopping experience', 4),
('Lakes and Mountains', 1450.00, 'Peaceful lake retreat', 9),
('Beach Holiday', 1250.00, 'Family beach adventure', 10),
('City Break', 1000.00, 'Cultural city immersion', 11),
('Lakes and Mountains', 1700.00, 'Luxury mountain lodge stay', 12),
('Beach Holiday', 1180.00, 'Sunset beach romance package', 13),
('City Break', 880.00, 'City nightlife experience', 14),
('Lakes and Mountains', 1550.00, 'Hiking and nature trails', 15),
('Beach Holiday', 1400.00, 'Island hopping adventure', 16),
('City Break', 920.00, 'Art and gallery city tour', 17),
('Lakes and Mountains', 1480.00, 'Winter mountain getaway', 18),
('Beach Holiday', 1300.00, 'Beach volleyball and water sports', 19),
('City Break', 870.00, 'Food and gastronomy city tour', 20),
('Lakes and Mountains', 1520.00, 'Mountain biking adventure', 21),
('Beach Holiday', 1150.00, 'Snorkeling and diving package', 22),
('City Break', 980.00, 'Historic monuments city walk', 23),
('Lakes and Mountains', 1650.00, 'Luxury alpine chalet retreat', 24),
('Beach Holiday', 1220.00, 'Beach yoga and wellness', 25),
('City Break', 910.00, 'Theatre and entertainment city break', 26),
('Lakes and Mountains', 1580.00, 'Camping under the stars', 27),
('Beach Holiday', 1320.00, 'Beachfront villa stay', 28),
('City Break', 940.00, 'Guided city architecture tour', 29),
('Lakes and Mountains', 1490.00, 'Mountain spa and relaxation', 30),
('Beach Holiday', 1270.00, 'Beach bonfire and barbecue package', 31),
('City Break', 860.00, 'City photography tour', 32),
('Lakes and Mountains', 1540.00, 'Highland exploration adventure', 33);

-- ============================================
-- INSERT: flights (33 rows)
-- Multiple airlines, routes, and classes
-- ============================================
INSERT INTO flights (airline, route, class_type, seat_capacity, price) VALUES
('British Airways', 'London - Cancun', 'Economy', 180, 450.00),
('Emirates', 'Dubai - Maldives', 'Business', 50, 1200.00),
('Air France', 'Paris - Barcelona', 'Economy', 150, 180.00),
('Turkish Airlines', 'Istanbul - Antalya', 'Economy', 200, 220.00),
('Lufthansa', 'Frankfurt - Munich', 'Business', 80, 350.00),
('Ryanair', 'Dublin - Edinburgh', 'Economy', 160, 95.00),
('Singapore Airlines', 'Singapore - Bali', 'First Class', 30, 2500.00),
('KLM', 'Amsterdam - Tenerife', 'Economy', 170, 280.00),
('Iberia', 'Madrid - Ibiza', 'Economy', 140, 160.00),
('easyJet', 'London - Mallorca', 'Economy', 155, 210.00),
('Qatar Airways', 'Doha - Santorini', 'Business', 60, 1100.00),
('Japan Airlines', 'Tokyo - Osaka', 'Economy', 200, 150.00),
('Wizz Air', 'Budapest - Bucharest', 'Economy', 180, 85.00),
('SAS', 'Stockholm - Oslo', 'Economy', 130, 120.00),
('Finnair', 'Helsinki - Rovaniemi', 'Economy', 140, 175.00),
('TAP Air Portugal', 'Lisbon - Porto', 'Economy', 150, 90.00),
('Aeroflot', 'Moscow - Saint Petersburg', 'Business', 70, 400.00),
('ITA Airways', 'Rome - Amalfi Coast', 'Economy', 160, 195.00),
('LOT Polish Airlines', 'Warsaw - Krakow', 'Economy', 145, 110.00),
('Norwegian Air', 'Oslo - Tromso', 'Economy', 150, 140.00),
('Vueling', 'Barcelona - Canary Islands', 'Economy', 170, 230.00),
('Austrian Airlines', 'Vienna - Innsbruck', 'Economy', 135, 130.00),
('Swiss', 'Zurich - Geneva', 'Business', 55, 380.00),
('Condor Airlines', 'Hamburg - Gran Canaria', 'Economy', 175, 260.00),
('Icelandair', 'Reykjavik - Akureyri', 'Economy', 120, 160.00),
('Air Portugal', 'Porto - Madeira', 'Economy', 130, 105.00),
('Royal Jordanian', 'Amman - Dead Sea', 'Economy', 140, 180.00),
('El Al', 'Tel Aviv - Eilat', 'Economy', 150, 145.00),
('Turkish Airlines', 'Istanbul - Cappadocia', 'Business', 65, 420.00),
('British Airways', 'London - Edinburgh', 'Economy', 160, 125.00),
('Wizz Air', 'Vienna - Montenegro', 'Economy', 170, 98.00),
('Ryanair', 'Manchester - Faro', 'Economy', 155, 155.00),
('easyJet', 'Gatwick - Paphos', 'Economy', 165, 200.00);

-- ============================================
-- INSERT: services (33 rows)
-- Extra Baggage, Tours, Activities, Insurance, etc.
-- ============================================
INSERT INTO services (service_type, description, price) VALUES
('Extra Baggage', '10kg additional luggage allowance', 35.00),
('Travel Insurance', 'Comprehensive travel insurance cover', 65.00),
('Airport Lounge', 'Access to departure lounge for 3 hours', 45.00),
('Guided Tour', 'Local guided sightseeing tour', 80.00),
('Water Sports', 'Snorkeling and kayaking package', 120.00),
('Meal Package', 'All-inclusive meal plan for duration', 55.00),
('Airport Transfer', 'Shared airport transfer service', 30.00),
('Private Transfer', 'Private airport transfer service', 75.00),
('Spa Package', 'Full body massage and treatment', 95.00),
('Photography', 'Professional holiday photography service', 150.00),
('Kids Activity', 'Children entertainment and activities', 40.00),
('Wine Tasting', 'Local wine and cheese tasting experience', 70.00),
('Sunset Cruise', 'Evening sunset cruise experience', 110.00),
('Hiking Tour', 'Guided mountain hiking experience', 90.00),
('Cultural Visit', 'Visit to local cultural heritage sites', 60.00),
('Beach Club', 'Full day beach club access', 50.00),
('Diving Lesson', 'Professional scuba diving lesson', 130.00),
('City Map Guide', 'Digital city map and guide app', 15.00),
('Evening Show', 'Local evening entertainment show', 85.00),
('Yoga Session', 'Beach yoga and meditation session', 45.00),
('BBQ Night', 'Beachside barbecue dinner experience', 75.00),
('Paragliding', 'Tandem paragliding experience', 180.00),
('Historical Tour', 'Guided historical sites tour', 70.00),
('Cooking Class', 'Learn local cuisine cooking class', 95.00),
('Bike Rental', 'Two day bicycle rental', 25.00),
('Snorkeling Kit', 'Premium snorkeling equipment rental', 20.00),
('Night Safari', 'Guided night wildlife safari', 140.00),
('Campfire Night', 'Guided campfire storytelling night', 55.00),
('River Rafting', 'White water river rafting adventure', 160.00),
('Jet Ski', 'One hour jet ski rental', 100.00),
('Bungee Jump', 'Supervised bungee jumping experience', 200.00),
('Zip Line', 'Forest zip line adventure', 90.00),
('Hot Air Balloon', 'Sunrise hot air balloon ride', 250.00);

-- ============================================
-- INSERT: booking (35 rows)
-- Links to customer, holiday_package, flights, services
-- Mix of Confirmed, Pending, Cancelled
-- ============================================
INSERT INTO booking (customer_id, package_id, date, status, total_price, flight_id, service_id) VALUES
(1, 1, '2024-11-15', 'Confirmed', 2150.00, 1, 1),
(2, 4, '2024-11-18', 'Confirmed', 3200.00, 6, 4),
(3, 2, '2024-11-20', 'Pending', 1450.00, 17, 5),
(4, 7, '2024-11-22', 'Confirmed', 2100.00, 4, 3),
(5, 3, '2024-11-25', 'Cancelled', 1850.00, 8, 9),
(6, 10, '2024-11-27', 'Confirmed', 2850.00, 10, 6),
(7, 12, '2024-11-30', 'Confirmed', 3900.00, 7, 2),
(8, 5, '2024-12-02', 'Pending', 1200.00, 3, 7),
(9, 8, '2024-12-05', 'Confirmed', 1920.00, 9, 11),
(10, 11, '2024-12-08', 'Confirmed', 1750.00, 12, 8),
(11, 6, '2024-12-10', 'Pending', 2580.00, 5, 10),
(12, 9, '2024-12-12', 'Cancelled', 1600.00, 14, 12),
(13, 13, '2024-12-15', 'Confirmed', 2950.00, 11, 13),
(14, 15, '2024-12-18', 'Confirmed', 2400.00, 15, 14),
(15, 16, '2024-12-20', 'Pending', 1980.00, 16, 15),
(16, 18, '2024-12-22', 'Confirmed', 2760.00, 18, 16),
(17, 20, '2024-12-24', 'Confirmed', 2090.00, 20, 17),
(18, 21, '2024-12-26', 'Cancelled', 1850.00, 21, 18),
(19, 22, '2024-12-28', 'Confirmed', 2650.00, 22, 19),
(20, 24, '2024-12-30', 'Confirmed', 2880.00, 24, 20),
(21, 25, '2025-01-02', 'Pending', 1750.00, 25, 21),
(22, 26, '2025-01-05', 'Confirmed', 2340.00, 26, 22),
(23, 27, '2025-01-08', 'Confirmed', 2990.00, 27, 23),
(24, 28, '2025-01-10', 'Pending', 2070.00, 28, 24),
(25, 29, '2025-01-12', 'Confirmed', 3450.00, 29, 25),
(26, 30, '2025-01-15', 'Confirmed', 3680.00, 30, 26),
(27, 1, '2025-01-18', 'Confirmed', 2150.00, 31, 27),
(28, 3, '2025-01-20', 'Pending', 2920.00, 32, 28),
(29, 5, '2025-01-22', 'Confirmed', 2070.00, 33, 29),
(30, 7, '2025-01-24', 'Cancelled', 2450.00, 2, 30),
(1, 10, '2025-01-26', 'Confirmed', 3350.00, 4, 31),
(2, 12, '2025-01-28', 'Confirmed', 2190.00, 6, 32),
(3, 15, '2025-01-30', 'Pending', 2580.00, 8, 33),
(4, 18, '2025-02-01', 'Confirmed', 2760.00, 10, 1),
(5, 20, '2025-02-03', 'Confirmed', 2090.00, 12, 3);

-- ============================================
-- INSERT: taxi_transfers (33 rows)
-- NOW includes booking_id and service_id
-- Links each taxi transfer to a booking AND a service
-- ============================================
INSERT INTO taxi_transfers (transfer_type, requests, price, booking_id, service_id) VALUES
('Shared', 'Airport to Hotel - up to 4 passengers', 25.00, 1, 7),
('Private', 'Airport to Hotel - up to 7 passengers', 55.00, 2, 8),
('Shared', 'Hotel to City Center - up to 4 passengers', 18.00, 3, 7),
('Private', 'Hotel to City Center - up to 7 passengers', 42.00, 4, 8),
('Shared', 'Airport to Resort - up to 4 passengers', 30.00, 6, 7),
('Private', 'Airport to Resort - up to 7 passengers', 65.00, 7, 8),
('Shared', 'Resort to Airport - up to 4 passengers', 30.00, 9, 7),
('Private', 'Resort to Airport - up to 7 passengers', 65.00, 10, 8),
('Shared', 'Hotel to Airport - up to 4 passengers', 22.00, 13, 7),
('Private', 'Hotel to Airport - up to 7 passengers', 48.00, 14, 8),
('Shared', 'City Center to Airport - up to 4 passengers', 20.00, 16, 7),
('Private', 'City Center to Airport - up to 7 passengers', 45.00, 17, 8),
('Shared', 'Airport to Villa - up to 4 passengers', 35.00, 19, 7),
('Private', 'Airport to Villa - up to 7 passengers', 75.00, 20, 8),
('Shared', 'Villa to City Center - up to 4 passengers', 28.00, 22, 7),
('Private', 'Villa to City Center - up to 7 passengers', 60.00, 23, 8),
('Shared', 'Hotel to Beach - up to 4 passengers', 15.00, 25, 7),
('Private', 'Hotel to Beach - up to 7 passengers', 38.00, 26, 8),
('Shared', 'Airport to Mountain Lodge - up to 4 passengers', 40.00, 27, 7),
('Private', 'Airport to Mountain Lodge - up to 7 passengers', 85.00, 29, 8),
('Shared', 'Mountain Lodge to Ski Resort - up to 4 passengers', 22.00, 31, 7),
('Private', 'Mountain Lodge to Ski Resort - up to 7 passengers', 50.00, 32, 8),
('Shared', 'Hotel to Shopping Mall - up to 4 passengers', 18.00, 34, 7),
('Private', 'Hotel to Shopping Mall - up to 7 passengers', 40.00, 35, 8),
('Shared', 'Airport to Campsite - up to 4 passengers', 32.00, 1, 7),
('Private', 'Airport to Campsite - up to 7 passengers', 70.00, 2, 8),
('Shared', 'Resort to Marina - up to 4 passengers', 20.00, 4, 7),
('Private', 'Resort to Marina - up to 7 passengers', 45.00, 6, 8),
('Shared', 'Hotel to Spa - up to 4 passengers', 16.00, 7, 7),
('Private', 'Hotel to Spa - up to 7 passengers', 36.00, 9, 8),
('Shared', 'Airport to Chalet - up to 4 passengers', 38.00, 10, 7),
('Private', 'Airport to Chalet - up to 7 passengers', 80.00, 13, 8),
('Shared', 'City Center to Hotel - up to 4 passengers', 18.00, 14, 7);

-- ============================================
-- INSERT: payment (35 rows)
-- Links to booking, matches booking statuses
-- Mix of Credit Card, Bank Transfer, Loyalty Points
-- ============================================
INSERT INTO payment (booking_id, payment_method, amount, payment_date) VALUES
(1, 'Credit Card', 2150.00, '2024-11-15'),
(2, 'Bank Transfer', 3200.00, '2024-11-18'),
(3, 'Credit Card', 1450.00, '2024-11-20'),
(4, 'Loyalty Points', 2100.00, '2024-11-22'),
(6, 'Credit Card', 2850.00, '2024-11-27'),
(7, 'Bank Transfer', 3900.00, '2024-11-30'),
(9, 'Credit Card', 1920.00, '2024-12-05'),
(10, 'Loyalty Points', 1750.00, '2024-12-08'),
(11, 'Credit Card', 2580.00, '2024-12-10'),
(13, 'Bank Transfer', 2950.00, '2024-12-15'),
(14, 'Credit Card', 2400.00, '2024-12-18'),
(15, 'Loyalty Points', 1980.00, '2024-12-20'),
(16, 'Credit Card', 2760.00, '2024-12-22'),
(17, 'Bank Transfer', 2090.00, '2024-12-24'),
(19, 'Credit Card', 2650.00, '2024-12-28'),
(20, 'Loyalty Points', 2880.00, '2024-12-30'),
(22, 'Credit Card', 2340.00, '2025-01-05'),
(23, 'Bank Transfer', 2990.00, '2025-01-08'),
(25, 'Credit Card', 3450.00, '2025-01-12'),
(26, 'Loyalty Points', 3680.00, '2025-01-15'),
(27, 'Credit Card', 2150.00, '2025-01-18'),
(29, 'Bank Transfer', 2070.00, '2025-01-22'),
(31, 'Credit Card', 3350.00, '2025-01-26'),
(32, 'Loyalty Points', 2190.00, '2025-01-28'),
(34, 'Credit Card', 2760.00, '2025-02-01'),
(35, 'Bank Transfer', 2090.00, '2025-02-03'),
(1, 'Credit Card', 500.00, '2024-11-16'),
(6, 'Credit Card', 350.00, '2024-11-28'),
(7, 'Loyalty Points', 200.00, '2024-12-01'),
(11, 'Credit Card', 280.00, '2024-12-11'),
(15, 'Credit Card', 150.00, '2024-12-21'),
(20, 'Bank Transfer', 420.00, '2024-12-31'),
(25, 'Loyalty Points', 300.00, '2025-01-13'),
(26, 'Credit Card', 180.00, '2025-01-16'),
(31, 'Credit Card', 450.00, '2025-01-27');

-- ============================================
-- INSERT: feedback (33 rows)
-- Ratings 1-5, linked to customers and bookings
-- ============================================
INSERT INTO feedback (customer_id, booking_id, ratings, comments, feedback_date) VALUES
(1, 1, 5, 'Excellent beach holiday! Highly recommend.', '2024-12-01'),
(2, 2, 4, 'Great mountain experience, but weather was unpredictable.', '2024-12-05'),
(3, 3, 3, 'Decent city break, could have better hotel options.', '2024-12-08'),
(4, 4, 5, 'Perfect romantic getaway!', '2024-12-10'),
(6, 6, 5, 'Luxury at its finest. Worth every penny.', '2024-12-15'),
(7, 7, 4, 'Skiing was amazing, accommodation was good.', '2024-12-18'),
(9, 9, 4, 'Lovely cultural tour, learned a lot.', '2024-12-22'),
(10, 10, 5, 'Best city shopping experience ever!', '2024-12-25'),
(11, 11, 3, 'Beach was nice but too crowded.', '2024-12-28'),
(13, 13, 5, 'Island paradise! Will visit again.', '2025-01-05'),
(14, 14, 4, 'Lake retreat was peaceful and relaxing.', '2025-01-08'),
(15, 15, 5, 'Adventure activities were thrilling!', '2025-01-10'),
(16, 16, 4, 'Good family vacation, kids loved it.', '2025-01-14'),
(17, 17, 3, 'Okay experience, expected more for the price.', '2025-01-17'),
(19, 19, 5, 'Fantastic honeymoon destination!', '2025-01-20'),
(20, 20, 4, 'Cruise was wonderful, food was exceptional.', '2025-01-23'),
(22, 22, 5, 'Historical tour was incredibly informative.', '2025-01-27'),
(23, 23, 4, 'Great hiking trails and scenery.', '2025-01-30'),
(25, 25, 5, 'Sailing through Greek islands was a dream!', '2025-02-02'),
(26, 26, 4, 'Modern city experience with great shopping.', '2025-02-05'),
(1, 27, 3, 'Nature tour was good but guide could be better.', '2025-02-08'),
(2, 28, 5, 'Cultural immersion was authentic and amazing.', '2025-02-11'),
(3, 29, 4, 'Historical sites were breathtaking.', '2025-02-14'),
(4, 30, 5, 'Volcanic landscape tour was once-in-a-lifetime!', '2025-02-17'),
(6, 31, 4, 'Beach escape was relaxing, perfect getaway.', '2025-02-20'),
(7, 32, 5, 'Highland exploration exceeded expectations!', '2025-02-23'),
(8, 1, 4, 'Overall service from EasyTravel is great!', '2025-02-25'),
(9, 2, 5, 'Love the loyalty program benefits!', '2025-02-26'),
(11, 3, 4, 'Customer service was responsive and helpful.', '2025-02-27'),
(13, 4, 5, 'Easy booking process, great variety of packages.', '2025-02-28'),
(15, 6, 3, 'Website could be more user-friendly.', '2025-03-01'),
(17, 7, 4, 'Good value for money across all packages.', '2025-03-02'),
(19, 9, 5, 'Best travel company I have used!', '2025-03-03');

-- ============================================
-- INSERT: campaigns (33 rows)
-- Each links to a holiday_package
-- Mix of loyalty exclusive and general campaigns
-- ============================================
INSERT INTO campaigns (campaign_name, discounts, start_date, end_date, is_loyalty_exclusive, package_id) VALUES
('Winter Wonderland Sale', 15.00, '2024-12-01', '2024-12-31', FALSE, 1),
('New Year Special', 20.00, '2025-01-01', '2025-01-15', TRUE, 2),
('Valentine Romance Package', 25.00, '2025-02-01', '2025-02-14', FALSE, 4),
('Spring Break Bonanza', 18.00, '2025-03-01', '2025-03-31', FALSE, 7),
('Early Bird Summer', 12.00, '2025-04-01', '2025-04-30', TRUE, 10),
('Beach Lovers Special', 22.00, '2025-05-01', '2025-05-31', FALSE, 1),
('Family Vacation Deal', 20.00, '2025-06-01', '2025-06-30', FALSE, 7),
('Loyalty Members Exclusive', 30.00, '2025-07-01', '2025-07-31', TRUE, 13),
('Last Minute Deals', 35.00, '2025-08-01', '2025-08-15', FALSE, 4),
('Fall Foliage Tours', 17.00, '2025-09-01', '2025-09-30', FALSE, 3),
('Halloween Adventure', 15.00, '2025-10-15', '2025-10-31', FALSE, 9),
('Black Friday Mega Sale', 40.00, '2024-11-24', '2024-11-27', FALSE, 1),
('Cyber Monday Special', 38.00, '2024-11-28', '2024-11-30', TRUE, 10),
('Holiday Season Celebration', 25.00, '2024-12-15', '2024-12-25', FALSE, 4),
('Ski Season Kickoff', 20.00, '2024-11-01', '2024-11-30', FALSE, 9),
('Tropical Paradise Promo', 28.00, '2025-01-20', '2025-02-20', FALSE, 16),
('City Explorer Discount', 16.00, '2025-03-15', '2025-04-15', TRUE, 2),
('Mountain Escape Deal', 19.00, '2025-05-15', '2025-06-15', FALSE, 3),
('Summer Solstice Sale', 24.00, '2025-06-15', '2025-06-30', FALSE, 22),
('Mid-Year Clearance', 33.00, '2025-07-01', '2025-07-15', FALSE, 1),
('August Adventure', 21.00, '2025-08-01', '2025-08-31', TRUE, 15),
('Back to School Parent Escape', 26.00, '2025-08-20', '2025-09-10', FALSE, 7),
('Autumn Getaway', 18.00, '2025-10-01', '2025-10-31', FALSE, 3),
('Thanksgiving Travel Deal', 23.00, '2024-11-15', '2024-11-23', FALSE, 13),
('Christmas Magic', 27.00, '2024-12-01', '2024-12-24', TRUE, 19),
('Year End Blowout', 45.00, '2024-12-26', '2024-12-31', FALSE, 1),
('New Destinations Launch', 15.00, '2025-02-01', '2025-02-28', FALSE, 28),
('Seniors Special', 20.00, '2025-03-01', '2025-12-31', FALSE, 11),
('Honeymoon Package Discount', 30.00, '2025-01-01', '2025-12-31', FALSE, 19),
('Group Booking Benefit', 25.00, '2025-01-01', '2025-12-31', FALSE, 10),
('Flash Weekend Sale', 50.00, '2025-03-15', '2025-03-17', TRUE, 25),
('Spring Renewal Offer', 22.00, '2025-04-15', '2025-05-15', FALSE, 20),
('Loyalty Points Boost', 10.00, '2025-01-01', '2025-12-31', TRUE, 4);

-- ============================================
-- End of File 2
-- ============================================
