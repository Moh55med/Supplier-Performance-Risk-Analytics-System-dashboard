-- Demo Data for Supplier Performance System
-- Purpose: Final presentation showcase data
-- Created: March 9, 2026
-- Based on: Electronics suppliers dataset


-- Clear existing data
TRUNCATE TABLE deliveries CASCADE;
TRUNCATE TABLE order_items CASCADE;
TRUNCATE TABLE purchase_orders CASCADE;
TRUNCATE TABLE suppliers CASCADE;
TRUNCATE TABLE supplier_kpis CASCADE;

-- Insert Suppliers (21 unique suppliers from dataset)
INSERT INTO suppliers (name, contact_person, email, phone, address, category) VALUES
('Volvo Group', 'Jean Dupont', 'contact@volvogroup.com', '+33-1-234-5678', 'Paris, France', 'Electronics'),
('Hilti', 'Hans Mueller', 'contact@hilti.com', '+49-89-123-4567', 'Munich, Germany', 'Electronics'),
('Otis', 'Jan de Vries', 'contact@otis.com', '+31-20-123-4567', 'Amsterdam, Netherlands', 'Electronics'),
('ThyssenKrupp', 'Peter Schmidt', 'contact@thyssenkrupp.com', '+49-30-234-5678', 'Berlin, Germany', 'Electronics'),
('Intel', 'Mika Virtanen', 'contact@intel.com', '+358-9-1234-567', 'Helsinki, Finland', 'Electronics'),
('General Electric', 'Robert Johnson', 'contact@ge.com', '+1-617-123-4567', 'Boston, USA', 'Electronics'),
('Assa Abloy', 'Lars Andersson', 'contact@assaabloy.com', '+41-44-123-4567', 'Zurich, Switzerland', 'Electronics'),
('Siemens', 'Klaus Wagner', 'contact@siemens.com', '+49-89-987-6543', 'Munich, Germany', 'Electronics'),
('Toshiba', 'Kim Min-jun', 'contact@toshiba.com', '+82-2-1234-5678', 'Seoul, South Korea', 'Electronics'),
('Daikin', 'Tanaka Hiroshi', 'contact@daikin.com', '+81-3-1234-5678', 'Tokyo, Japan', 'Electronics'),
('Atlas Copco', 'Erik Johansson', 'contact@atlascopco.com', '+46-8-123-4567', 'Stockholm, Sweden', 'Electronics'),
('KONE', 'Sami Koskinen', 'contact@kone.com', '+358-20-123-4567', 'Espoo, Finland', 'Electronics'),
('Sika', 'Sven Bergstrom', 'contact@sika.com', '+46-8-234-5678', 'Stockholm, Sweden', 'Electronics'),
('Dell Technologies', 'Michael Brown', 'contact@dell.com', '+1-512-123-4567', 'Austin, USA', 'Electronics'),
('Philips', 'Mark Williams', 'contact@philips.com', '+31-40-123-4567', 'Eindhoven, Netherlands', 'Electronics'),
('Applied Materials', 'David Chen', 'contact@amat.com', '+1-408-123-4567', 'Santa Clara, USA', 'Electronics'),
('Bosch', 'Wolfgang Schneider', 'contact@bosch.com', '+49-711-123-4567', 'Stuttgart, Germany', 'Electronics'),
('POSCO', 'Park Sung-min', 'contact@posco.com', '+82-2-234-5678', 'Seoul, South Korea', 'Electronics'),
('Qualcomm', 'James Anderson', 'contact@qualcomm.com', '+1-858-123-4567', 'San Diego, USA', 'Electronics'),
('Cisco', 'Yamamoto Kenji', 'contact@cisco.com', '+81-3-234-5678', 'Tokyo, Japan', 'Electronics'),
('Panasonic', 'Suzuki Takeshi', 'contact@panasonic.com', '+81-6-1234-5678', 'Osaka, Japan', 'Electronics');

-- Insert Purchase Orders (based on your dataset)
-- Order dates from 2021-2025, with calculated totals
INSERT INTO purchase_orders (supplier_id, order_date, expected_delivery_date, actual_delivery_date, total_amount, order_status) VALUES
-- Orders from 2021
(1, '2021-04-13', '2021-04-20', '2021-04-18', 966251.92, 'delivered'),  -- Volvo: On time
(5, '2021-01-28', '2021-02-05', '2021-02-04', 1916878.88, 'delivered'), -- Intel: On time
(6, '2021-10-09', '2021-10-16', '2021-10-14', 731580.75, 'delivered'),  -- GE: On time
(10, '2021-10-11', '2021-10-18', '2021-10-23', 869318.83, 'delivered'), -- Daikin: Late 5 days
(13, '2021-11-30', '2021-12-07', '2021-12-06', 1346322.76, 'delivered'), -- Sika: On time
(12, '2021-11-28', '2021-12-05', '2021-12-08', 442801.04, 'delivered'), -- POSCO: Late 3 days
(15, '2021-11-15', '2021-11-22', '2021-11-28', 856996.40, 'delivered'), -- Philips: Late 6 days

-- Orders from 2022
(7, '2022-09-02', '2022-09-09', '2022-09-08', 586697.24, 'delivered'),  -- Assa Abloy: On time
(9, '2022-10-31', '2022-11-07', '2022-11-05', 322460.70, 'delivered'),  -- Toshiba: On time
(11, '2022-08-02', '2022-08-09', '2022-08-15', 172965.50, 'delivered'), -- Atlas Copco: Late 6 days

-- Orders from 2023
(8, '2023-06-14', '2023-06-21', '2023-06-20', 47030.65, 'delivered'),   -- Siemens: On time
(3, '2023-09-20', '2023-09-27', '2023-10-02', 1189270.46, 'delivered'), -- Otis: Late 5 days
(12, '2023-03-08', '2023-03-15', '2023-03-14', 874518.14, 'delivered'), -- KONE: On time
(17, '2023-10-13', '2023-10-20', '2023-10-18', 823719.16, 'delivered'), -- Bosch: On time
(19, '2023-08-18', '2023-08-25', '2023-08-30', 780321.18, 'delivered'), -- Qualcomm: Late 5 days
(16, '2023-10-29', '2023-11-05', '2023-11-03', 1927525.48, 'delivered'), -- Intel: On time

-- Orders from 2024
(2, '2024-07-23', '2024-07-30', '2024-07-28', 1280399.02, 'delivered'), -- Hilti: On time
(4, '2024-12-28', '2025-01-04', NULL, 431525.83, 'pending'),            -- ThyssenKrupp: Pending
(6, '2024-03-29', '2024-04-05', '2024-04-03', 1467003.56, 'delivered'), -- GE: On time
(14, '2024-07-19', '2024-07-26', '2024-07-25', 126020.70, 'delivered'), -- Dell: On time
(15, '2024-12-18', '2024-12-25', NULL, 1188595.80, 'pending'),          -- Philips: Pending
(1, '2024-07-04', '2024-07-11', '2024-07-13', 390802.13, 'delivered'),  -- Volvo: Late 2 days
(16, '2024-06-22', '2024-06-29', '2024-06-28', 40470.57, 'delivered'),  -- Applied Materials: On time
(18, '2024-06-21', '2024-06-28', '2024-07-05', 1438425.38, 'delivered'), -- POSCO: Late 7 days
(20, '2024-09-25', '2024-10-02', '2024-10-10', 17787.86, 'delivered'),  -- Cisco: Late 8 days

-- Orders from 2025
(21, '2025-01-29', '2025-02-05', NULL, 208503.90, 'pending');           -- Panasonic: Pending

-- Insert Order Items (matching the purchase orders)
INSERT INTO order_items (order_id, product_name, quantity, unit_price, total_price) VALUES
(1, 'Power Supply', 421, 2295.52, 966251.92),
(2, 'Microcontroller', 406, 4720.98, 1916878.88),
(3, 'Industrial Controller', 171, 4278.25, 731580.75),
(4, 'Sensor Module', 379, 2293.77, 869318.83),
(5, 'Power Supply', 304, 4428.69, 1346322.76),
(6, 'Microcontroller', 188, 2355.33, 442801.04),
(7, 'Network Switch', 380, 2255.28, 856996.40),
(8, 'Microcontroller', 118, 4972.18, 586697.24),
(9, 'Power Supply', 71, 4541.70, 322460.70),
(10, 'Power Supply', 61, 2835.50, 172965.50),
(11, 'Microcontroller', 335, 140.39, 47030.65),
(12, 'Network Switch', 318, 3739.97, 1189270.46),
(13, 'Sensor Module', 333, 2625.58, 874518.14),
(14, 'Industrial Controller', 482, 1709.38, 823719.16),
(15, 'Network Switch', 279, 2795.42, 780321.18),
(16, 'Microcontroller', 436, 4420.93, 1927525.48),
(17, 'Sensor Module', 334, 3833.53, 1280399.02),
(18, 'Power Supply', 149, 2894.67, 431525.83),
(19, 'Microcontroller', 343, 4276.92, 1467003.56),
(20, 'Industrial Controller', 117, 1077.10, 126020.70),
(21, 'Sensor Module', 310, 3834.18, 1188595.80),
(22, 'Network Switch', 127, 3077.19, 390802.13),
(23, 'Microcontroller', 207, 195.51, 40470.57),
(24, 'Industrial Controller', 449, 3203.62, 1438425.38),
(25, 'Industrial Controller', 173, 102.82, 17787.86),
(26, 'Network Switch', 490, 425.41, 208503.90);

-- Insert Deliveries (for delivered orders only)
INSERT INTO deliveries (order_id, delivery_date, received_quantity, notes, is_on_time) VALUES
(1, '2021-04-18', 421, 'Perfect delivery, early by 2 days', TRUE),
(2, '2021-02-04', 406, 'On time delivery', TRUE),
(3, '2021-10-14', 171, 'Early delivery', TRUE),
(4, '2021-10-23', 379, 'Late delivery, 5 days delay', FALSE),
(5, '2021-12-06', 304, 'On time', TRUE),
(6, '2021-12-08', 188, 'Late by 3 days', FALSE),
(7, '2021-11-28', 380, 'Late by 6 days', FALSE),
(8, '2022-09-08', 118, 'Early by 1 day', TRUE),
(9, '2022-11-05', 71, 'Early by 2 days', TRUE),
(10, '2022-08-15', 61, 'Late by 6 days', FALSE),
(11, '2023-06-20', 335, 'Early by 1 day', TRUE),
(12, '2023-10-02', 318, 'Late by 5 days', FALSE),
(13, '2023-03-14', 333, 'Early by 1 day', TRUE),
(14, '2023-10-18', 482, 'Early by 2 days', TRUE),
(15, '2023-08-30', 279, 'Late by 5 days', FALSE),
(16, '2023-11-03', 436, 'Early by 2 days', TRUE),
(17, '2024-07-28', 334, 'Early by 2 days', TRUE),
(19, '2024-04-03', 343, 'Early by 2 days', TRUE),
(20, '2024-07-25', 117, 'Early by 1 day', TRUE),
(22, '2024-07-13', 127, 'Late by 2 days', FALSE),
(23, '2024-06-28', 207, 'Early by 1 day', TRUE),
(24, '2024-07-05', 449, 'Late by 7 days', FALSE),
(25, '2024-10-10', 173, 'Late by 8 days - Significant delay', FALSE);

-- Note: Orders 18 (ThyssenKrupp), 21 (Philips), and 26 (Panasonic) are still pending