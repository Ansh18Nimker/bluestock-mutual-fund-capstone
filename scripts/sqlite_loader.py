import pandas as pd
from pathlib import Path
from sqlalchemy import create_engine

raw_path = Path("data/raw")
processed_path = Path("data/processed")
db_path = "data/db/bluestock_mf.db"

engine = create_engine(
    f"sqlite:///{db_path}"
)

# FUND MASTER
fund_master = pd.read_csv(
    raw_path / "01_fund_master.csv"
)

fund_master.to_sql(
    "dim_fund",
    engine,
    if_exists="replace",
    index=False
)

# NAV
nav = pd.read_csv(
    processed_path /
    "02_nav_history_clean.csv"
)

nav.to_sql(
    "fact_nav",
    engine,
    if_exists="replace",
    index=False
)

# TRANSACTIONS
txn = pd.read_csv(
    processed_path /
    "08_investor_transactions_clean.csv"
)

txn.to_sql(
    "fact_transactions",
    engine,
    if_exists="replace",
    index=False
)

# PERFORMANCE
perf = pd.read_csv(
    processed_path /
    "07_scheme_performance_clean.csv"
)

perf.to_sql(
    "fact_performance",
    engine,
    if_exists="replace",
    index=False
)

# AUM
aum = pd.read_csv(
    raw_path /
    "03_aum_by_fund_house.csv"
)

aum.to_sql(
    "fact_aum",
    engine,
    if_exists="replace",
    index=False
)

print("SQLite database loaded successfully")