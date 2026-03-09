# Connection Guide for Person 3 (Dashboard Developer)

**For:** Power BI Dashboard Development
**Backend by:** [Mohammed alshuaibi]


---

## Option 1: Connect Power BI Directly to Database (Recommended)

### **Step 1: Get Database Connection Details**

From Supabase Dashboard → Settings → Database:
```
Host: `db.vafouvsqqxejyryvbacc.supabase.co`
Database: postgres
Port: 5432
User: postgres
Password: []
```

**Fill in your actual values above!**

---

### **Step 2: Connect in Power BI Desktop**

1. Open Power BI Desktop
2. Click **Get Data**
3. Search for **"PostgreSQL database"**
4. Click **Connect**
5. Enter:
   - **Server:** `db.vafouvsqqxejyryvbacc.supabase.co`
   - **Database:** `postgres`
6. Click **OK**
7. Choose **Database** authentication
8. Enter credentials from Step 1
9. Click **Connect**

---

### **Step 3: Select Tables/Views**

You'll see all tables. Import these:

**Essential:**
- ✅ `supplier_performance` (Main KPI view - use this!)
- ✅ `suppliers`
- ✅ `purchase_orders`
- ✅ `deliveries`

**Optional:**
- `order_items`
- `supplier_kpis`

Click **Load**

---

## What Each View/Table Contains

### **supplier_performance (USE THIS FOR MAIN DASHBOARD)**

**Columns:**
- `supplier_id` - Unique ID
- `name` - Supplier name
- `category` - Supplier category
- `total_orders` - Count of orders
- `total_deliveries` - Count of deliveries
- `on_time_delivery_rate` - Percentage (0-100)
- `overall_score` - Performance score (0-100)

**Use for:**
- Main supplier ranking chart
- KPI cards
- Performance comparison

**Example Power BI measures:**
- Average on-time rate
- Top 5 suppliers
- Suppliers needing attention (score < 70)

---

### **suppliers**

Basic supplier information. Use for filtering and details.

---

### **purchase_orders**

Order history. Use for:
- Order trends over time
- Order value analysis
- Status tracking

---

### **deliveries**

Delivery records. Use for:
- Late delivery analysis
- Delivery timeline
- On-time trends

---

## Sample Power BI Visualizations

### **1. Supplier Ranking (Bar Chart)**
- **Data:** `supplier_performance`
- **Axis:** `name`
- **Values:** `overall_score`
- **Sort by:** overall_score descending

### **2. On-Time Delivery Rate (KPI Card)**
- **Data:** `supplier_performance`
- **Value:** Average of `on_time_delivery_rate`

### **3. Top 5 Suppliers (Table)**
- **Data:** `supplier_performance`
- **Columns:** name, on_time_delivery_rate, overall_score
- **Filter:** Top 5 by overall_score

### **4. Category Performance (Pie Chart)**
- **Data:** `supplier_performance`
- **Legend:** `category`
- **Values:** Average of `overall_score`

---

## If You Need Help

**Backend Developer (Person 2):** [Your contact]
**Questions about:**
- Database connection issues
- Missing data
- New KPIs needed
- API access

---

## Testing Your Connection

**Run this query in Power BI (Power Query Editor):**
```sql
SELECT * FROM supplier_performance 
ORDER BY overall_score DESC
LIMIT 5
```

You should see top 5 suppliers with all their metrics!

---

## Important Notes

- Data updates in real-time (no caching)
- Use `supplier_performance` view - it's optimized
- Don't directly modify database from Power BI
- Report any connection issues immediately