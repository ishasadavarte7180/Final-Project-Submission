-- Flights Table
CREATE TABLE flights (
  flight_id INT AUTO_INCREMENT PRIMARY KEY,
  flight_number VARCHAR(10) UNIQUE NOT NULL,
  origin VARCHAR(50),
  destination VARCHAR(50),
  departure_time DATETIME,
  arrival_time DATETIME,
  total_seats INT CHECK (total_seats > 0),
  available_seats INT CHECK (available_seats >= 0)
);

-- Customers Table
CREATE TABLE customers (
  customer_id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
  email VARCHAR(100) UNIQUE,
  phone VARCHAR(15)
);

-- Bookings Table
CREATE TABLE bookings (
  booking_id INT AUTO_INCREMENT PRIMARY KEY,
  customer_id INT,
  flight_id INT,
  booking_date DATETIME DEFAULT CURRENT_TIMESTAMP,
  seat_number VARCHAR(5),
  status ENUM('booked','cancelled') DEFAULT 'booked',
  FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
  FOREIGN KEY (flight_id) REFERENCES flights(flight_id)
);

-- Seats Table
CREATE TABLE seats (
  seat_id INT AUTO_INCREMENT PRIMARY KEY,
  flight_id INT,
  seat_number VARCHAR(5),
  is_booked BOOLEAN DEFAULT FALSE,
  FOREIGN KEY (flight_id) REFERENCES flights(flight_id)
);
