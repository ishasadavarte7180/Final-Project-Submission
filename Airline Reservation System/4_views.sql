-- View for available flights
CREATE OR REPLACE VIEW available_flights AS
SELECT flight_number, origin, destination, departure_time, arrival_time, available_seats
FROM flights
WHERE available_seats > 0;

-- View for flight bookings
CREATE OR REPLACE VIEW flight_bookings AS
SELECT b.booking_id, c.name AS customer_name, f.flight_number, b.seat_number, b.status, b.booking_date
FROM bookings b
JOIN customers c ON b.customer_id = c.customer_id
JOIN flights f ON b.flight_id = f.flight_id;
