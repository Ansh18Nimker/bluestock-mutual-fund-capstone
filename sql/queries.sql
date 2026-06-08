-- 1 Top 5 funds by AUM
SELECT fund_house, MAX(aum_crore)
FROM fact_aum
GROUP BY fund_house
ORDER BY MAX(aum_crore) DESC
LIMIT 5;

-- 2 Average NAV
SELECT strftime('%Y-%m', date),
AVG(nav)
FROM fact_nav
GROUP BY strftime('%Y-%m', date);

-- 3 Transactions by state
SELECT state,
COUNT(*) total_transactions
FROM fact_transactions
GROUP BY state
ORDER BY total_transactions DESC;

-- 4 Funds with expense ratio < 1
SELECT amfi_code,
expense_ratio_pct
FROM fact_performance
WHERE expense_ratio_pct < 1;

-- 5 Highest Sharpe Ratio
SELECT amfi_code,
sharpe_ratio
FROM fact_performance
ORDER BY sharpe_ratio DESC
LIMIT 10;

-- 6 Highest 5Y Return
SELECT amfi_code,
return_5yr_pct
FROM fact_performance
ORDER BY return_5yr_pct DESC
LIMIT 10;

-- 7 Average Expense Ratio by Category
SELECT category,
AVG(expense_ratio_pct)
FROM dim_fund d
JOIN fact_performance p
ON d.amfi_code=p.amfi_code
GROUP BY category;

-- 8 Transaction Volume by City Tier
SELECT city_tier,
SUM(amount_inr)
FROM fact_transactions
GROUP BY city_tier;

-- 9 Fund Count by Category
SELECT category,
COUNT(*)
FROM dim_fund
GROUP BY category;

-- 10 Average Alpha and Beta
SELECT
AVG(alpha),
AVG(beta)
FROM fact_performance;

-- 1 Top 5 funds by AUM
SELECT fund_house, MAX(aum_crore)
FROM fact_aum
GROUP BY fund_house
ORDER BY MAX(aum_crore) DESC
LIMIT 5;

-- 2 Average NAV per month
SELECT strftime('%Y-%m', date), AVG(nav)
FROM fact_nav
GROUP BY strftime('%Y-%m', date);

-- 3 Transactions by state
SELECT state, COUNT(*) total_transactions
FROM fact_transactions
GROUP BY state
ORDER BY total_transactions DESC;

-- 4 Funds with expense ratio < 1%
SELECT amfi_code, expense_ratio_pct
FROM fact_performance
WHERE expense_ratio_pct < 1;

-- 5 Highest Sharpe Ratio
SELECT amfi_code, sharpe_ratio
FROM fact_performance
ORDER BY sharpe_ratio DESC
LIMIT 10;

-- 6 Highest 5-Year Return
SELECT amfi_code, return_5yr_pct
FROM fact_performance
ORDER BY return_5yr_pct DESC
LIMIT 10;

-- 7 Average Expense Ratio by Category
SELECT category, AVG(expense_ratio_pct)
FROM dim_fund d
JOIN fact_performance p
ON d.amfi_code = p.amfi_code
GROUP BY category;

-- 8 Transaction Volume by City Tier
SELECT city_tier, SUM(amount_inr)
FROM fact_transactions
GROUP BY city_tier;

-- 9 Fund Count by Category
SELECT category, COUNT(*)
FROM dim_fund
GROUP BY category;

-- 10 Average Alpha and Beta
SELECT AVG(alpha), AVG(beta)
FROM fact_performance;
