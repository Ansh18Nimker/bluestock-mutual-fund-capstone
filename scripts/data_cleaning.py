import pandas as pd
from pathlib import Path

raw_path = Path("data/raw")
processed_path = Path("data/processed")

processed_path.mkdir(exist_ok=True)

# -----------------------------
# NAV HISTORY
# -----------------------------

nav_df = pd.read_csv(
    raw_path / "02_nav_history.csv"
)

nav_df["date"] = pd.to_datetime(
    nav_df["date"]
)

nav_df = nav_df.sort_values(
    ["amfi_code", "date"]
)

nav_df = nav_df.drop_duplicates()

nav_df = nav_df[
    nav_df["nav"] > 0
]

nav_df["nav"] = (
    nav_df.groupby("amfi_code")["nav"]
    .ffill()
)

nav_df.to_csv(
    processed_path /
    "02_nav_history_clean.csv",
    index=False
)

print("NAV history cleaned")


# -----------------------------
# INVESTOR TRANSACTIONS
# -----------------------------

txn_df = pd.read_csv(
    raw_path /
    "08_investor_transactions.csv"
)

txn_df["transaction_date"] = pd.to_datetime(
    txn_df["transaction_date"]
)

txn_df = txn_df[
    txn_df["amount_inr"] > 0
]

txn_df["transaction_type"] = (
    txn_df["transaction_type"]
    .str.strip()
    .str.title()
)

valid_kyc = [
    "Verified",
    "Pending",
    "Rejected"
]

invalid_kyc = txn_df[
    ~txn_df["kyc_status"].isin(valid_kyc)
]

print(
    "Invalid KYC records:",
    len(invalid_kyc)
)

txn_df.to_csv(
    processed_path /
    "08_investor_transactions_clean.csv",
    index=False
)

print("Transactions cleaned")



# -----------------------------
# SCHEME PERFORMANCE
# -----------------------------

perf_df = pd.read_csv(
    raw_path /
    "07_scheme_performance.csv"
)

return_cols = [
    "return_1yr_pct",
    "return_3yr_pct",
    "return_5yr_pct"
]

for col in return_cols:
    perf_df[col] = pd.to_numeric(
        perf_df[col],
        errors="coerce"
    )

anomalies = perf_df[
    (perf_df["expense_ratio_pct"] < 0.1)
    |
    (perf_df["expense_ratio_pct"] > 2.5)
]

print(
    "Expense Ratio Anomalies:",
    len(anomalies)
)

perf_df.to_csv(
    processed_path /
    "07_scheme_performance_clean.csv",
    index=False
)

print("Performance cleaned")

