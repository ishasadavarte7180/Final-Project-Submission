-- Monthly Expense Summary per User
CREATE OR REPLACE VIEW monthly_expense_summary AS
SELECT 
    u.name AS user_name,
    DATE_FORMAT(e.expense_date, '%Y-%m') AS month,
    SUM(e.amount) AS total_expense
FROM expenses e
JOIN users u ON e.user_id = u.user_id
GROUP BY u.user_id, month;

-- Category-wise Expense Summary
CREATE OR REPLACE VIEW category_expense_summary AS
SELECT 
    u.name AS user_name,
    c.category_name,
    SUM(e.amount) AS total_spent
FROM expenses e
JOIN users u ON e.user_id = u.user_id
JOIN categories c ON e.category_id = c.category_id
GROUP BY u.user_id, c.category_name;

-- Balance View
CREATE OR REPLACE VIEW user_balance AS
SELECT 
    u.name AS user_name,
    COALESCE(SUM(i.amount), 0) - COALESCE(SUM(e.amount), 0) AS balance
FROM users u
LEFT JOIN income i ON u.user_id = i.user_id
LEFT JOIN expenses e ON u.user_id = e.user_id
GROUP BY u.user_id;
