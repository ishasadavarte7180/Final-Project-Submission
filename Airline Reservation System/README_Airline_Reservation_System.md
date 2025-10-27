# ✈️ Airline Reservation System (SQL Project)



## 📖 Introduction
The **Airline Reservation System** is a database project built using **MySQL**.  
It manages flights, customers, seat availability, and booking operations efficiently.  
This project demonstrates SQL skills such as:
- Database schema design  
- Data normalization  
- Foreign key relationships  
- Triggers and constraints  
- Analytical queries and reports  

---

## ⚙️ Tools Used
- **MySQL Workbench 8.0+**

---

## 🧩 Database Schema

### 1️⃣ Create Database
```sql
CREATE DATABASE AirlineDB;
USE AirlineDB;
```
📸 *Screenshot Path:* `/Screenshots/create_database.PNG`

---

### 2️⃣ Create Tables
```sql
-- Flights Table
CREATE TABLE flights (
  flight_id INT AUTO_INCREMENT PRIMARY KEY,
  flight_number VARCHAR(10) NOT NULL UNIQUE,
  origin VARCHAR(50),
  destination VARCHAR(50),
  departure_time DATETIME,
  arrival_time DATETIME,
  total_seats INT,
  available_seats INT
);

-- Customers Table
CREATE TABLE customers (
  customer_id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100),
  email VARCHAR(100) UNIQUE,
  phone VARCHAR(15)
);

-- Bookings Table
CREATE TABLE bookings (
  booking_id INT AUTO_INCREMENT PRIMARY KEY,
  customer_id INT,
  flight_id INT,
  booking_date DATETIME DEFAULT CURRENT_TIMESTAMP,
  seat_number VARCHAR(10),
  status ENUM('booked', 'cancelled') DEFAULT 'booked',
  FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
  FOREIGN KEY (flight_id) REFERENCES flights(flight_id)
);
```
📸 *Screenshot Path:* `/Airline Reservation System/Screenshots/create_table.PNG`

---

## 📥 Insert Sample Data
```sql
-- Insert Flights
INSERT INTO flights (flight_number, origin, destination, departure_time, arrival_time, total_seats, available_seats)
VALUES
('AI101', 'Mumbai', 'Delhi', '2025-11-01 10:00:00', '2025-11-01 12:00:00', 180, 175),
('AI102', 'Delhi', 'Pune', '2025-11-02 14:00:00', '2025-11-02 16:00:00', 180, 178),
('AI103', 'Pune', 'Bangalore', '2025-11-03 09:00:00', '2025-11-03 10:30:00', 180, 180);

-- Insert Customers
INSERT INTO customers (name, email, phone) VALUES
('Isha Sadavarte', 'isha@gmail.com', '9876543210'),
('Rahul Sharma', 'rahul@gmail.com', '9876500001'),
('Sneha Patil', 'sneha@gmail.com', '9999900000');

-- Insert Bookings
INSERT INTO bookings (customer_id, flight_id, seat_number, status)
VALUES
(1, 1, 'A1', 'booked'),
(2, 2, 'A2', 'booked'),
(1, 3, 'A3', 'booked'),
(3, 1, 'A4', 'cancelled');
```
📸 *Screenshot Path:* `/Screenshots/Insert_data.PNG`

---


### 3️⃣ Booking Summary per Customer
```sql
SELECT c.name, COUNT(b.booking_id) AS total_bookings
FROM bookings b
JOIN customers c ON b.customer_id = c.customer_id
GROUP BY c.customer_id;
```
📸 *Screenshot Path:* `/Screenshots/CaptureShow booking summary per customer.PNG`

**✅ Expected Output:**
| name            | total_bookings |
|------------------|----------------|
| Isha Sadavarte   | 2              |
| Rahul Sharma     | 1              |
| Sneha Patil      | 1              |

---

### 4️⃣ Low Availability Flights
```sql
SELECT flight_number, available_seats
FROM flights
WHERE available_seats < 10;
```
📸 *Screenshot Path:* `/Screenshots/Find flights with less than 10 seats remaining.PNG`

*Note:* If you see an empty result, reduce seats manually:
```sql
UPDATE flights SET available_seats = 5 WHERE flight_number = 'AI101';
```

---

### 5️⃣ Triggers for Booking Updates
```sql
DELIMITER $$
CREATE TRIGGER trg_booking_insert
AFTER INSERT ON bookings
FOR EACH ROW
BEGIN
  UPDATE flights
  SET available_seats = available_seats - 1
  WHERE flight_id = NEW.flight_id;
END$$
DELIMITER ;
```
📸 *Screenshot Path:* `/Screenshots/triggers.PNG`

---

## 📊 Reports

### a) Most Popular Routes
```sql
SELECT f.flight_number, COUNT(b.booking_id) AS total_bookings
FROM bookings b
JOIN flights f ON b.flight_id = f.flight_id
GROUP BY f.flight_id
ORDER BY total_bookings DESC;
```
📸 *Screenshot Path:* `/Screenshots/Total Bookings by Flight.PNG`

---

### b) Active vs Cancelled Bookings
```sql
SELECT status, COUNT(*) AS total
FROM bookings
GROUP BY status;
```
📸 *Screenshot Path:* `/Screenshots/Cancelled Bookings Report.PNG`

---

## 🧠 Conclusion
This project demonstrates how to design and manage a **complete Airline Reservation Database System** using MySQL.  
It includes:
- Schema design  
- Data relationships  
- Triggers for automation  
- Real-world analytical reports  

Future improvements can include:
- Web UI for bookings  
- Payment system integration  
- Admin analytics dashboard  

---

## 📂 Folder Structure
```
Airline_Reservation_System/
│
├── 1_create_database.sql
├── 2_create_tables.sql
├── 3_insert_data.sql
├── 4_queries.sql
├── 5_triggers.sql
├── 6_reports.sql
├── README.md
└── /screenshots/
    ├── create_tables.png
    ├── insert_data.png
    ├── booking_summary_output.png
    ├── available_seats_output.png
    └── report_booking_status.png
```

---

### 🏁 End of Project
**Thank You! 🙌**  
Developed by: *Isha Sunil Sadavarte*  
📧 Email: `isha@gmail.com`
