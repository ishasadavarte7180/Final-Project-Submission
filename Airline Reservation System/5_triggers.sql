DELIMITER $$

-- Reduce available seats when a booking is made
CREATE TRIGGER trg_booking_insert
AFTER INSERT ON bookings
FOR EACH ROW
BEGIN
  UPDATE flights
  SET available_seats = available_seats - 1
  WHERE flight_id = NEW.flight_id;
END$$

-- Increase available seats when a booking is cancelled
CREATE TRIGGER trg_booking_update
AFTER UPDATE ON bookings
FOR EACH ROW
BEGIN
  IF NEW.status = 'cancelled' THEN
    UPDATE flights
    SET available_seats = available_seats + 1
    WHERE flight_id = NEW.flight_id;
  END IF;
END$$

DELIMITER ;
