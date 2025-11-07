-- Minimal Postgres schema for retail analytics
CREATE TABLE IF NOT EXISTS products(
  sku TEXT PRIMARY KEY,
  product_name TEXT,
  category TEXT,
  subcategory TEXT,
  cost_price NUMERIC
);

CREATE TABLE IF NOT EXISTS stores(
  store_id INT PRIMARY KEY,
  store_name TEXT,
  state TEXT,
  region TEXT
);

CREATE TABLE IF NOT EXISTS sales(
  order_id TEXT,
  order_date DATE,
  store_id INT REFERENCES stores(store_id),
  sku TEXT REFERENCES products(sku),
  qty INT,
  unit_price NUMERIC,
  discount NUMERIC,
  region TEXT
);

CREATE TABLE IF NOT EXISTS inventory(
  snapshot_date DATE,
  store_id INT REFERENCES stores(store_id),
  sku TEXT REFERENCES products(sku),
  on_hand INT,
  expiry_date DATE
);
