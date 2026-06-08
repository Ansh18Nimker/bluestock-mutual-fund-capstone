import pandas as pd

print("FUND MASTER")
print(pd.read_csv("data/raw/01_fund_master.csv").columns.tolist())

print("\nINVESTOR TRANSACTIONS")
print(pd.read_csv("data/raw/08_investor_transactions.csv").columns.tolist())

print("\nSCHEME PERFORMANCE")
print(pd.read_csv("data/raw/07_scheme_performance.csv").columns.tolist())