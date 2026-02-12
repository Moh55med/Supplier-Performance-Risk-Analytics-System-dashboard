-- Sample Data for Supplier Performance System

INSERT INTO suppliers (name,contact_person,email,phone,address,category) VALUES
('ABC Food Supplies', 'Ahmed Ali', 'ahmed@abcfood.sa', '+966-11-234-5678', 'Industrial Area, Riyadh', 'Raw Materials'),
('Fresh Packaging Co', 'Sara Mohamed', 'sara@freshpack.sa', '+966-12-345-6789', 'Jeddah Industrial City', 'Packaging'),
('Quality Ingredients Ltd', 'Khalid Hassan', 'khalid@quality.sa', '+966-13-456-7890', 'Dammam Business Park', 'Raw Materials'),
('Express Logistics', 'Fatima Ahmed', 'fatima@express.sa', '+966-11-567-8901', 'Riyadh Logistics Hub', 'Logistics'),
('Premium Suppliers', 'Omar Abdullah', 'omar@premium.sa', '+966-12-678-9012', 'Jeddah Port Area', 'Raw Materials');


INSERT INTO purchase_orders (supplier_id,order_date,expected_delivery_date,actual_delivery_date,total_amount,order_status) VALUES 
(1, '2024-01-05', '2024-01-10', '2024-01-10', 5000.00, 'delivered'),
(1, '2024-01-15', '2024-01-20', '2024-01-22', 7500.00, 'delivered'),
(1, '2024-02-01', '2024-02-05', '2024-02-05', 6000.00, 'delivered'),
(1, '2024-02-10', '2024-02-15', '2024-02-13', 800.00, 'delivered'),

-- Supplier 2 orders (Fresh Packaging)
(2, '2024-01-08', '2024-01-12', '2024-01-15', 3000.00, 'delivered'),
(2, '2024-01-20', '2024-01-25', '2024-01-28', 4500.00, 'delivered'),
(2, '2024-02-05', '2024-02-10', '2024-02-10', 3500.00, 'delivered'),

-- Supplier 3 orders (Quality Ingredients)
(3, '2024-01-10', '2024-01-15', '2024-01-14', 9000.00, 'delivered'),
(3, '2024-01-25', '2024-01-30', '2024-01-30', 10000.00, 'delivered'),
(3, '2024-02-08', '2024-02-12', '2024-02-12', 8500.00, 'delivered'),

-- Supplier 4 orders (Express Logistics) - Poor performer
(4, '2024-01-12', '2024-01-17', '2024-01-25', 2000.00, 'delivered'),
(4, '2024-01-28', '2024-02-02', '2024-02-10', 2500.00, 'delivered'),

-- Supplier 5 orders (Premium Suppliers)
(5, '2024-01-18', '2024-01-23', '2024-01-23', 12000.00, 'delivered'),
(5, '2024-02-03', '2024-02-08', '2024-02-07', 15000.00, 'delivered');


INSERT INTO order_items (order_id,product_name,quantity,unit_price,total_price) VALUES
-- Order 1 items
(1, 'Sugar 1kg', 100, 25.00, 2500.00),
(1, 'Flour 1kg', 100, 25.00, 2500.00),

-- Order 2 items
(2, 'Rice 1kg', 150, 30.00, 4500.00),
(2, 'Oil 1L', 100, 30.00, 3000.00),

-- Order 3 items
(3, 'Sugar 1kg', 120, 25.00, 3000.00),
(3, 'Salt 1kg', 120, 25.00, 3000.00),

--Order 4 items
(4,'bottles',80,10,800),

-- Order 5 items
(5, 'Plastic Bottles 500ml', 1000, 3.00, 3000.00),

-- Order 6 items
(6, 'Cardboard Boxes', 500, 9.00, 4500.00),

-- Order 7 items
(7, 'Plastic Bags', 700, 5.00, 3500.00),

-- Order 8 items
(8, 'Wheat Flour Premium', 200, 45.00, 9000.00),

-- Order 9 items
(9, 'Corn Flour', 250, 40.00, 10000.00),

-- Order 10 items
(10, 'Baking Powder', 170, 50.00, 8500.00),

-- Order 11 items
(11, 'Delivery Service', 10, 200.00, 2000.00),

-- Order 12 items
(12, 'Express Shipping', 10, 250.00, 2500.00),

-- Order 13 items
(13, 'Premium Sugar', 300, 40.00, 12000.00),

-- Order 14 items
(14, 'Organic Flour', 300, 50.00, 15000.00);


INSERT INTO deliveries (order_id,delivery_date,received_quantity,notes,is_on_time) VALUES
(1, '2024-01-10', 200, 'Perfect delivery, all items intact', TRUE),
(2, '2024-01-22', 250, 'Delivery was 2 days late', FALSE),
(3, '2024-02-05', 240, 'On time, good condition', TRUE),
(4, '2024-02-13', 80, 'on time', TRUE),
(5, '2024-01-15', 1000, 'Late delivery, 3 days delay', FALSE),
(6, '2024-01-28', 500, 'Late delivery, 3 days delay', FALSE),
(7, '2024-02-10', 700, 'Perfect on-time delivery', TRUE),
(8, '2024-01-14', 200, 'Early delivery! Excellent', TRUE),
(9, '2024-01-30', 250, 'On time delivery', TRUE),
(10, '2024-02-12', 170, 'On time, good packaging', TRUE),
(11, '2024-01-25', 10, 'Very late, 8 days delay', FALSE),
(12, '2024-02-10', 10, 'Very late, 8 days delay', FALSE),
(13, '2024-01-23', 300, 'Perfect on-time delivery', TRUE),
(14, '2024-02-07', 300, 'Early delivery by 1 day', TRUE);


INSERT INTO quality_inspections (delivery_id,total_items,defective_items,inspection_date,inspector_notes,passed) VALUES
(1, 200, 2, '2024-01-10', 'Found 2 damaged bags, overall good', TRUE),
(2, 250, 15, '2024-01-22', 'Found 15 items damaged, poor packaging', FALSE),
(3, 240, 0, '2024-02-05', 'Perfect quality, zero defects', TRUE),
(4, 1000, 50, '2024-01-15', 'Found 50 bottles with cracks', FALSE),
(5, 500, 30, '2024-01-28', '30 boxes crushed during transport', FALSE),
(6, 700, 0, '2024-02-10', 'Excellent quality', TRUE),
(7, 200, 3, '2024-01-14', '3 bags torn, acceptable', TRUE),
(8, 250, 0, '2024-01-30', 'Perfect condition', TRUE),
(9, 170, 2, '2024-02-12', '2 containers damaged', TRUE),
(10, 10, 0, '2024-01-25', 'Service completed but very late', TRUE),
(11, 10, 0, '2024-02-10', 'Service completed but very late', TRUE),
(12, 300, 0, '2024-01-23', 'Premium quality, zero defects', TRUE),
(13, 300, 5, '2024-02-07', '5 bags had minor issues', TRUE);


INSERT INTO supplier_kpis (supplier_id,period_start,period_end,on_time_delivery_rate,defect_rate,total_orders,total_deliveries,overall_score,risk_level) VALUES
(1, '2024-01-01', '2024-01-31', 66.67, 3.78, 3, 3, 75.50, 'Medium'),
(2, '2024-01-01', '2024-01-31', 33.33, 8.00, 2, 2, 55.20, 'High'),
(3, '2024-01-01', '2024-01-31', 100.00, 0.67, 2, 2, 95.80, 'Low'),
(4, '2024-01-01', '2024-01-31', 0.00, 0.00, 2, 2, 45.00, 'High'),
(5, '2024-01-01', '2024-01-31', 100.00, 0.00, 1, 1, 98.50, 'Low');