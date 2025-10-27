-- Users Table
CREATE TABLE users (
  user_id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
  email VARCHAR(100) UNIQUE,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Categories Table
CREATE TABLE categories (
  category_id INT AUTO_INCREMENT PRIMARY KEY,
  category_name VARCHAR(100) NOT NULL,
  type ENUM('income', 'expense') NOT NULL
);

-- Income Table
CREATE TABLE income (
  income_id INT AUTO_INCREMENT PRIMARY KEY,
  user_id INT,
  category_id INT,
  amount DECIMAL(10,2) NOT NULL,
  income_date DATE,
  description VARCHAR(255),
  FOREIGN KEY (user_id) REFERENCES users(user_id),
  FOREIGN KEY (category_id) REFERENCES categories(category_id)
);

-- Expenses Table
CREATE TABLE expenses (
  expense_id INT AUTO_INCREMENT PRIMARY KEY,
  user_id INT,
  category_id INT,
  amount DECIMAL(10,2) NOT NULL,
  expense_date DATE,
  description VARCHAR(255),
  FOREIGN KEY (user_id) REFERENCES users(user_id),
  FOREIGN KEY (category_id) REFERENCES categories(category_id)
);
