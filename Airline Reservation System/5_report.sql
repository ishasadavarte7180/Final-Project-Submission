-- 1️⃣ Monthly Spending Report
SELECT * FROM monthly_expense_summary;

-- 2️⃣ Category-wise Spending
SELECT * FROM category_expense_summary;

-- 3️⃣ User Balance Report
SELECT * FROM user_balance;

-- 4️⃣ Top 3 Spending Categories
SELECT c.category_name, SUM(e.amount) AS total_spent
FROM expenses e
JOIN categories c ON e.category_id = c.category_id
GROUP BY c.category_id
ORDER BY total_spent DESC
LIMIT 3;

-- 5️⃣ Compare Income vs Expense (per user)
SELECT 
  u.name,
  (SELECT SUM(amount) FROM income WHERE user_id = u.user_id) AS total_income,
  (SELECT SUM(amount) FROM expenses WHERE user_id = u.user_id) AS total_expense,
  (SELECT SUM(amount) FROM income WHERE user_id = u.user_id) -
  (SELECT SUM(amount) FROM expenses WHERE user_id = u.user_id) AS net_savings
FROM users u;
