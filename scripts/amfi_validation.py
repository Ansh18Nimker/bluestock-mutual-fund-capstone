import pandas as pd

fund_master = pd.read_csv("data/raw/01_fund_master.csv")
nav_history = pd.read_csv("data/raw/02_nav_history.csv")

master_codes = set(fund_master["amfi_code"])
nav_codes = set(nav_history["amfi_code"])

missing_codes = master_codes - nav_codes

print(f"Fund Master Codes: {len(master_codes)}")
print(f"NAV History Codes: {len(nav_codes)}")
print(f"Missing Codes: {len(missing_codes)}")

if missing_codes:
    print("Missing AMFI Codes:")
    print(missing_codes)
else:
    print("All AMFI codes from fund_master exist in nav_history.")