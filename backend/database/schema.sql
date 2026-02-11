--Suppliers Table 
CREATE TABLE suppliers (
    suppliers_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    contact_person VARCHAR(100),
    email VARCHAR(100),
    phone VARCHAR(20),
    address TEXT,
    category VARCHAR(50),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


-- Purchase Orders Table
CREATE TABLE purchase_orders (
    order_id SERIAL PRIMARY KEY,
    suppliers_id INT REFERENCES suppliers(suppliers_id),
    order_date DATE NOT NULL,
    expected_delivery_date DATE,
    actual_delivery_date DATE,
    total_amount DECIMAL(10,2)
    status VARCHAR(20) DEFAULT 'pending',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP 
);


-- Order Items Table
CREATE TABLE order_items (
    item_id SERIAL PRIMARY KEY,
    order_id INT REFERENCES purchase_orders(order_id),
    product_name VARCHAR(100),
    quantity INT NOT NULL,
    unit_price DECIMAL(10, 2),
    total_price DECIMAL(10, 2)
);

-- Deliveries Table
CREATE TABLE deliveries (
    delivery_id SERIAL PRIMARY KEY,
    order_id INT REFERENCES purchase_orders(order_id),
    delivery_date DATE NOT NULL,
    received_quantity INT,
    notes TEXT,
    is_on_time BOOLEAN
);

-- Quality Inspections Table
CREATE TABLE quality_inspections (
    inspection_id SERIAL PRIMARY KEY,
    delivery_id INT REFERENCES deliveries(delivery_id),
    total_items INT NOT NULL,
    defective_items INT DEFAULT 0,
    inspection_date DATE NOT NULL,
    inspector_notes TEXT,
    passed BOOLEAN
);

-- Supplier KPIs Table
CREATE TABLE supplier_kpis (
    kpi_id SERIAL PRIMARY KEY,
    supplier_id INT REFERENCES suppliers(supplier_id),
    period_start DATE,
    period_end DATE,
    on_time_delivery_rate DECIMAL(5, 2),
    defect_rate DECIMAL(5, 2),
    total_orders INT,
    total_deliveries INT,
    overall_score DECIMAL(5, 2),
    risk_level VARCHAR(20),
    calculated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP