# Retail Sales & Inventory Analytics Dashboard (Woolworths-Inspired)

**Role signal:** Data Analyst / BI Analyst  
**Tech:** Python · SQL · Pandas · Tableau

## Objective
Build a realistic retail analytics stack to analyse revenue, inventory ageing, and out-of-stock (OOS) risk with a polished Tableau dashboard.

## Data Options (choose one)
- Kaggle: "Superstore Sales" (any standard Superstore dataset)
- Maven Analytics: "Retail Sales" (free samples)
- Your own CSVs (sales.csv, products.csv, inventory.csv, stores.csv)

### Expected CSV schemas
- `sales.csv`: `order_id, order_date, store_id, sku, qty, unit_price, discount, region`
- `products.csv`: `sku, product_name, category, subcategory, cost_price`
- `inventory.csv`: `snapshot_date, store_id, sku, on_hand, expiry_date`
- `stores.csv`: `store_id, store_name, state, region`

## How to Run
1. Put CSVs in `data/raw/`.
2. Open and run `notebooks/01_data_cleaning.ipynb` to produce cleaned tables in `data/cleaned/`.
3. (Optional) Load cleaned CSVs into a local Postgres using `sql/create_tables.sql`.
4. Build the dashboard in Tableau using the cleaned files (or Postgres connection).
5. Export `tableau/retail_dashboard.twbx`.

## Dashboard Must-Haves
- Revenue by category/store over time (line/area)
- Inventory ageing bands (<=3 days, 4–7, 8–14, 15+)
- OOS risk (low on-hand + high recent sales)
- Top 10 SKUs contributing ~80% revenue (Pareto)

## Business Questions to Answer
- Which categories/stores drive most revenue? Trends?
- Which SKUs are ageing (capital locked up)?
- Where are repeat OOS events occurring?
- Weekday vs weekend sales differences?

## Stretch Goals
- Add simple demand forecast (7-day moving average)
- Simple anomaly detection for sudden dips/spikes

## Repo Structure
```
retail-analytics-dashboard/
├── data/
│   ├── raw/
│   └── cleaned/
├── notebooks/
│   ├── 01_data_cleaning.ipynb
│   └── 02_eda.ipynb
├── sql/
│   ├── create_tables.sql
│   └── analysis_queries.sql
├── scripts/
│   └── make_ageing_features.py
├── tableau/
│   └── retail_dashboard.twbx  (to be created in Tableau)
├── requirements.txt
└── README.md
```