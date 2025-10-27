-- Insert Flights
INSERT INTO flights (flight_number, origin, destination, departure_time, arrival_time, total_seats, available_seats)
VALUES
('AI101', 'Mumbai', 'Delhi', '2025-10-30 08:00:00', '2025-10-30 10:00:00', 100, 100),
('AI202', 'Delhi', 'Bangalore', '2025-10-30 14:00:00', '2025-10-30 16:30:00', 120, 120),
('AI303', 'Pune', 'Chennai', '2025-10-31 09:30:00', '2025-10-31 11:30:00', 90, 90);

-- Insert Customers
INSERT INTO customers (name, email, phone)
VALUES
('Isha Sadavarte', 'isha@gmail.com', '9876543210'),
('Rahul Sharma', 'rahul@gmail.com', '9998887776'),
('Sneha Patil', 'sneha@gmail.com', '8887776665');

-- Insert Seats for Each Flight
INSERT INTO seats (flight_id, seat_number)
SELECT f.flight_id, CONCAT('A', n)
FROM flights f
JOIN (
  SELECT 1 AS n UNION SELECT 2 UNION SELECT 3 UNION SELECT 4 UNION SELECT 5
) nums;

-- Insert sample bookings
INSERT INTO bookings (customer_id, flight_id, seat_number, status)
VALUES
(1, 1, 'A1', 'booked'),
(2, 2, 'A1', 'booked'),
(1, 3, 'A2', 'booked'),
(3, 1, 'A3', 'cancelled');
