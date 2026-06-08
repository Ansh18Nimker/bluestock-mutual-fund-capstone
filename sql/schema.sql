CREATE TABLE dim_fund (
    amfi_code INTEGER PRIMARY KEY,
    fund_house TEXT,
    scheme_name TEXT,
    category TEXT,
    sub_category TEXT,
    plan TEXT,
    risk_category TEXT
);

CREATE TABLE fact_nav (
    amfi_code INTEGER,
    date DATE,
    nav REAL,
    FOREIGN KEY (amfi_code) REFERENCES dim_fund(amfi_code)
);

CREATE TABLE fact_transactions (
    investor_id TEXT,
    transaction_date DATE,
    amfi_code INTEGER,
    transaction_type TEXT,
    amount_inr REAL,
    state TEXT,
    city TEXT,
    city_tier TEXT,
    kyc_status TEXT,
    FOREIGN KEY (amfi_code) REFERENCES dim_fund(amfi_code)
);

CREATE TABLE fact_performance (
    amfi_code INTEGER,
    return_1yr_pct REAL,
    return_3yr_pct REAL,
    return_5yr_pct REAL,
    sharpe_ratio REAL,
    beta REAL,
    alpha REAL,
    expense_ratio_pct REAL,
    FOREIGN KEY (amfi_code) REFERENCES dim_fund(amfi_code)
);

CREATE TABLE fact_aum (
    fund_house TEXT,
    date DATE,
    aum_crore REAL
);

CREATE TABLE dim_fund (
amfi_code INTEGER PRIMARY KEY,
fund_house TEXT,
scheme_name TEXT,
category TEXT,
sub_category TEXT,
plan TEXT,
risk_category TEXT
);

CREATE TABLE fact_nav (
amfi_code INTEGER,
date DATE,
nav REAL,
FOREIGN KEY (amfi_code) REFERENCES dim_fund(amfi_code)
);

CREATE TABLE fact_transactions (
investor_id TEXT,
transaction_date DATE,
amfi_code INTEGER,
transaction_type TEXT,
amount_inr REAL,
state TEXT,
city TEXT,
city_tier TEXT,
kyc_status TEXT,
FOREIGN KEY (amfi_code) REFERENCES dim_fund(amfi_code)
);

CREATE TABLE fact_performance (
amfi_code INTEGER,
return_1yr_pct REAL,
return_3yr_pct REAL,
return_5yr_pct REAL,
sharpe_ratio REAL,
beta REAL,
alpha REAL,
expense_ratio_pct REAL,
FOREIGN KEY (amfi_code) REFERENCES dim_fund(amfi_code)
);

CREATE TABLE fact_aum (
fund_house TEXT,
date DATE,
aum_crore REAL
);
