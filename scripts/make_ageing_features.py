import pandas as pd
from pathlib import Path

RAW = Path('data/raw')
CLEAN = Path('data/cleaned')
CLEAN.mkdir(parents=True, exist_ok=True)

inv = pd.read_csv(RAW/'inventory.csv', parse_dates=['snapshot_date','expiry_date'])
def ageing_band(days):
    if pd.isna(days): return '15+'
    if days <= 3: return '0-3'
    if days <= 7: return '4-7'
    if days <= 14: return '8-14'
    return '15+'

inv['days_to_expiry'] = (inv['expiry_date'] - inv['snapshot_date']).dt.days
inv['ageing_band'] = inv['days_to_expiry'].apply(ageing_band)
inv.to_csv(CLEAN/'inventory_ageing.csv', index=False)
print('Wrote', CLEAN/'inventory_ageing.csv')
