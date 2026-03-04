-- Security Policies for Supplier Performance System
-- Allows authenticated users full CRUD access to all tables

ALTER TABLE suppliers ENABLE ROW LEVEL SECURITY;
CREATE POLICY supplier_policy ON suppliers
    FOR ALL 
    USING (auth.role() = 'authenticated');


ALTER TABLE purchase_orders ENABLE ROW LEVEL SECURITY;
CREATE POLICY purchase_order_policy ON purchase_orders
    FOR ALL 
    USING (auth.role() = 'authenticated');


ALTER TABLE order_items ENABLE ROW LEVEL SECURITY;
CREATE POLICY order_items_policy ON order_items
    FOR ALL 
    USING (auth.role() = 'authenticated');

ALTER TABLE deliveries ENABLE ROW LEVEL SECURITY;
CREATE POLICY deliveries_policy ON deliveries
    FOR ALL 
    USING (auth.role() = 'authenticated');

ALTER TABLE supplier_kpis ENABLE ROW LEVEL SECURITY;
CREATE POLICY supplier_kpis_policy ON supplier_kpis     
    FOR ALL 
    USING (auth.role() = 'authenticated');

