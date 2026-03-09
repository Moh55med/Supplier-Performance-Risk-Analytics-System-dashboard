# Supplier Performance System - API Documentation


 [Mohammed Alshuaibi]
**Project:** Supplier Performance & Risk Analytics System

---

## Connection Information

**Base URL:** `https://vafouvsqqxejyryvbacc.supabase.co/rest/v1`

**Authentication:**
- All requests require authentication headers
- Use the anon/public API key

**Required Headers:**
```
apikey: [YOUR-ANON-KEY - get from Supabase Settings > API]
Authorization: Bearer [YOUR-ANON-KEY]
Content-Type: application/json (for POST/PATCH only)
```

---

## Available Endpoints

### **Suppliers**

#### Get All Suppliers
```
GET /suppliers?select=*
```
**Response:** List of all suppliers with details

#### Get Supplier by ID
```
GET /suppliers?id=eq.[SUPPLIER_ID]
```

#### Create Supplier
```
POST /suppliers
Body: {
  "name": "Supplier Name",
  "email": "email@example.com",
  "phone": "+966-XX-XXX-XXXX",
  "category": "Category"
}
```

#### Update Supplier
```
PATCH /suppliers?id=eq.[SUPPLIER_ID]
Body: { "phone": "new-phone" }
```

#### Delete Supplier
```
DELETE /suppliers?id=eq.[SUPPLIER_ID]
```

---

### **Purchase Orders**

#### Get All Orders
```
GET /purchase_orders?select=*
```

#### Get Orders with Supplier Info
```
GET /purchase_orders?select=*,suppliers(name,category)
```

#### Get Orders by Supplier
```
GET /purchase_orders?supplier_id=eq.[SUPPLIER_ID]
```

#### Create Order
```
POST /purchase_orders
Body: {
  "supplier_id": 1,
  "order_date": "2024-03-05",
  "expected_delivery_date": "2024-03-10",
  "total_amount": 1000.00,
  "order_status": "pending"
}
```

---

### **Deliveries**

#### Get All Deliveries
```
GET /deliveries?select=*
```

#### Get Deliveries with Order Info
```
GET /deliveries?select=*,purchase_orders(order_date,supplier_id)
```

#### Record New Delivery
```
POST /deliveries
Body: {
  "order_id": 1,
  "delivery_date": "2024-03-10",
  "received_quantity": 100,
  "is_on_time": true,
  "notes": "Delivery notes"
}
```

---

### **Supplier Performance KPIs** ⭐

#### Get All Supplier Performance Data
```
GET /supplier_performance?select=*
```

#### Get Suppliers Ranked by Score
```
GET /supplier_performance?select=*&order=overall_score.desc
```

#### Get Top Performers (score > 80)
```
GET /supplier_performance?overall_score=gte.80&order=overall_score.desc
```

#### Get Specific Supplier Performance
```
GET /supplier_performance?supplier_id=eq.1
```

---

## Query Parameters (Filtering)

**Operators:**
- `eq` = equals: `?id=eq.1`
- `gt` = greater than: `?total_amount=gt.5000`
- `lt` = less than: `?score=lt.50`
- `gte` = greater than or equal: `?score=gte.80`
- `like` = contains: `?name=like.*Food*`

**Ordering:**
- `order=column.asc` - ascending
- `order=column.desc` - descending

**Limiting:**
- `limit=10` - return only 10 results

---

## For Person 3 (Dashboard Developer)

**Most Important Endpoints:**

1. **Supplier Performance View:** `/supplier_performance?select=*&order=overall_score.desc`
   - Use this for main dashboard
   - Contains all KPIs pre-calculated

2. **Orders by Supplier:** `/purchase_orders?select=*,suppliers(name)&supplier_id=eq.[ID]`
   - Use for supplier detail view

3. **Deliveries Timeline:** `/deliveries?select=*,purchase_orders(supplier_id,suppliers(name))&order=delivery_date.desc`
   - Use for timeline charts

---

## Testing

Use Thunder Client or Postman with the URLs above.



---

## Notes

- RLS is currently disabled for development
- All data is read/write accessible
- Re-enable RLS before production deployment