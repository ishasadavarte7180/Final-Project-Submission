# 💰 Personal Finance Tracker (SQL Project)

## 📖 Introduction
The **Personal Finance Tracker** is a SQL-based project that helps users efficiently manage and analyze their income and expenses.  
It allows users to categorize transactions, track monthly spending, and view budget summaries for better financial planning.

---

## 🧩 Abstract
This project demonstrates how a structured **SQL database** can be used to store and analyze personal financial data.  
It focuses on understanding relationships between **Users, Income, Expenses, and Categories**, while using **queries and views** to summarize monthly spending patterns.

---

## 🧰 Tools Used
- **Database:** MySQL / SQLite  
- **Environment:** MySQL Workbench / dbdiagram.io  
- **Language:** SQL  

---

## 🏗️ Steps Involved in Building the Project

### 1️⃣ Create Database & Tables
```sql
CREATE DATABASE FinanceTrackerDB;
USE FinanceTrackerDB;

CREATE TABLE Users (
    user_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    email VARCHAR(100)
);

CREATE TABLE Categories (
    category_id INT PRIMARY KEY AUTO_INCREMENT,
    category_name VARCHAR(50)
);

CREATE TABLE Income (
    income_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    amount DECIMAL(10,2),
    source VARCHAR(100),
    income_date DATE,
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);

CREATE TABLE Expenses (
    expense_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    category_id INT,
    amount DECIMAL(10,2),
    expense_date DATE,
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    FOREIGN KEY (category_id) REFERENCES Categories(category_id)
);
```

🖼️ *Screenshot:*  
![Database Schema](./Screenshotes/Create_database.PNG)

---

### 2️⃣ Insert Sample Data
```sql
INSERT INTO Users (name, email)
VALUES ('Isha Sadavarte', 'isha@gmail.com');

INSERT INTO Categories (category_name)
VALUES ('Food'), ('Transport'), ('Shopping'), ('Bills');

INSERT INTO Income (user_id, amount, source, income_date)
VALUES (1, 50000, 'Salary', '2025-10-01'),
       (1, 2000, 'Freelance', '2025-10-10');

INSERT INTO Expenses (user_id, category_id, amount, expense_date)
VALUES 
(1, 1, 3000, '2025-10-02'),
(1, 2, 1500, '2025-10-05'),
(1, 3, 2000, '2025-10-09'),
(1, 4, 4000, '2025-10-15');
```

🖼️ *Screenshot:*  
![Inserted Data](./Screenshots/Insert_data.PNG)

---

### 3️⃣ Queries for Analysis

#### 🔹 a) Total Income and Expenses per Month
```sql
SELECT 
    MONTH(income_date) AS month, 
    SUM(amount) AS total_income
FROM Income
GROUP BY MONTH(income_date);

SELECT 
    MONTH(expense_date) AS month, 
    SUM(amount) AS total_expenses
FROM Expenses
GROUP BY MONTH(expense_date);
```
🖼️ *Screenshot:*  
![Monthly Summary](./Screenshots/Compare Income vs Expense (per user).PNG)

---

#### 🔹 b) Category-wise Expense Summary
```sql
SELECT c.category_name, SUM(e.amount) AS total_spent
FROM Expenses e
JOIN Categories c ON e.category_id = c.category_id
GROUP BY c.category_name;
```
🖼️ *Screenshot:*  
![Category Summary](./Screenshots/Category-wise Spending.PNG)

---

### 4️⃣ Create Views for Reports
```sql
CREATE VIEW MonthlyReport AS
SELECT 
    u.name,
    (SELECT SUM(amount) FROM Income WHERE user_id = u.user_id) AS total_income,
    (SELECT SUM(amount) FROM Expenses WHERE user_id = u.user_id) AS total_expense,
    ((SELECT SUM(amount) FROM Income WHERE user_id = u.user_id) -
     (SELECT SUM(amount) FROM Expenses WHERE user_id = u.user_id)) AS balance
FROM Users u;
```
🖼️ *Screenshot:*  
![Monthly Report View](./Screenshots/Monthly Spending Report.PNG)

---

## 📊 Outputs
- Displays **monthly income and expense summaries**.  
- Shows **category-wise breakdown** of spending.  
- Calculates **monthly balance** automatically.  
- Provides a consolidated **monthly report view** for each user.


---

## 🧾 Conclusion
The **Personal Finance Tracker** project demonstrates effective **SQL database design** for financial management.  
It helps users monitor income and expenses, gain insights into spending behavior, and maintain a balanced budget.  
Through **GROUP BY, JOIN, and VIEW**, the project shows how data can be transformed into useful reports for financial decision-making.


