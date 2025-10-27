-- Total Bookings by Flight
SELECT f.flight_number, COUNT(b.booking_id) AS total_bookings
FROM bookings b
JOIN flights f ON b.flight_id = f.flight_id
GROUP BY f.flight_id
ORDER BY total_bookings DESC;

-- Cancelled Bookings Report
SELECT c.name, f.flight_number, b.status
FROM bookings b
JOIN customers c ON b.customer_id = c.customer_id
JOIN flights f ON b.flight_id = f.flight_id
WHERE b.status = 'cancelled';
