-- Laboratory work 4

-- task 1
SELECT UPPER(airline_name) FROM airline;

-- task 2
SELECT REPLACE(airline_name, 'Air', 'Aero') FROM airline;

-- task 3
SELECT flight_no FROM flights WHERE airline_id = 1
INTERSECT
SELECT flight_no FROM flights WHERE airline_id = 2;

-- task 4
SELECT * FROM airport
WHERE airport_name LIKE '%Reginal%' AND airport_name LIKE '%Air%';

-- task 5
SELECT first_name, last_name, TO_CHAR(date_of_birth, 'Month DD, YYYY') AS birth_date
FROM passengers;

-- task 6
SELECT flight_no FROM flights
WHERE actual_arrival > scheduled_arrival;

-- task 7
SELECT * FROM flights
WHERE actual_arrival > scheduled_arrival;

-- task 8
SELECT * FROM airline
WHERE airline_country IN ('France', 'Portugal', 'Poland')
AND created_at BETWEEN '2023-11-01' AND '2024-03-31';

-- task 9
SELECT * FROM baggage
WHERE weight_in_kg > 25
ORDER BY weight_in_kg DESC
LIMIT 3;

-- task 10
SELECT first_name, last_name FROM passengers
WHERE date_of_birth = (SELECT MAX(date_of_birth) FROM passengers);

-- task 11
SELECT booking_platform, MIN(price) FROM booking
GROUP BY booking_platform;

-- task 12
SELECT * FROM airline
WHERE airline_code ~ '[0-9]';

-- task 13
SELECT * FROM airline
ORDER BY created_at DESC
LIMIT 5;

-- task 14
SELECT * FROM baggage_check
WHERE booking_id BETWEEN 200 AND 300 AND check_result <> 'Checked';

-- task 15
SELECT * FROM baggage_check
WHERE DATE_TRUNC('month', update_at) = DATE_TRUNC('month', created_at)
AND update_at < created_at;
