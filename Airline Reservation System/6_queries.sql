-- List all available flights from Mumbai
SELECT * FROM available_flights WHERE origin = 'Mumbai';

-- Search for flights between two cities
SELECT * FROM flights WHERE origin = 'Delhi' AND destination = 'Bangalore';

-- Show booking summary per customer
SELECT c.name, COUNT(b.booking_id) AS total_bookings
FROM bookings b
JOIN customers c ON b.customer_id = c.customer_id
GROUP BY c.customer_id;

-- Find flights with less than 10 seats remaining
SELECT flight_number, available_seats
FROM flights
WHERE available_seats < 10;
