-- Users
INSERT INTO users (name, email) VALUES
('Isha Sadavarte', 'isha@gmail.com'),
('Rahul Sharma', 'rahul@gmail.com');

-- Categories
INSERT INTO categories (category_name, type) VALUES
('Salary', 'income'),
('Freelance', 'income'),
('Food', 'expense'),
('Transport', 'expense'),
('Shopping', 'expense'),
('Rent', 'expense');

-- Income
INSERT INTO income (user_id, category_id, amount, income_date, description) VALUES
(1, 1, 50000, '2025-09-01', 'Monthly salary'),
(1, 2, 8000, '2025-09-10', 'Freelance writing'),
(2, 1, 40000, '2025-09-01', 'Monthly salary');

-- Expenses
INSERT INTO expenses (user_id, category_id, amount, expense_date, description) VALUES
(1, 3, 3000, '2025-09-02', 'Groceries'),
(1, 4, 1000, '2025-09-03', 'Bus pass'),
(1, 5, 2500, '2025-09-05', 'Clothes'),
(1, 6, 12000, '2025-09-08', 'Rent'),
(2, 3, 2500, '2025-09-02', 'Food'),
(2, 6, 10000, '2025-09-10', 'Rent');
