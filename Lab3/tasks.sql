-- 1
INSERT INTO passenger
(first_name, last_name, gender, date_of_birth,
 country_of_citizenship, country_of_residence, passport_number)
SELECT
    'Name' || gs,
    'Surname' || gs,
    CASE WHEN random() < 0.5 THEN 'Male' ELSE 'Female' END,
    DATE '1980-01-01' + (random() * 13000)::int,
    'Kazakhstan',
    'Kazakhstan',
    'P' || LPAD(gs::text, 7, '0')
FROM generate_series(1, 200) AS gs;


-- 2
INSERT INTO airline (airline_code, name, country)
VALUES ('KAZ', 'KazAir', 'Kazakhstan');


-- 3
UPDATE airline
SET country = 'Turkey'
WHERE name = 'KazAir';


-- 4
INSERT INTO airline (airline_code, name, country)
VALUES
    ('EAS', 'AirEasy', 'France'),
    ('FLH', 'FlyHigh', 'Brazil'),
    ('FLY', 'FlyFly', 'Poland');


-- 5
DELETE FROM flight
WHERE EXTRACT(YEAR FROM scheduled_arrival) = 2024;


-- 6
UPDATE booking
SET ticket_price = ROUND(ticket_price * 1.15, 2);


-- 7
DELETE FROM booking
WHERE ticket_price < 10000;


-- 8
UPDATE airline
SET airline_code = 'UNK'
WHERE airline_code IS NULL;


-- 9
DELETE FROM baggage_check
WHERE created_at < TIMESTAMP '2023-06-01 00:00:00'
  AND result = 'Not checked';


-- 10
DELETE FROM airport
WHERE state IS NULL
  AND city IN ('Mlawe', 'Kepuh');


-- 11
INSERT INTO baggage_check
(result, booking_id, passenger_id)
VALUES
(
    'Not checked',
    (SELECT booking_id FROM booking LIMIT 1),
    (SELECT passenger_id FROM passenger LIMIT 1)
)
RETURNING baggage_check_id, created_at;


-- 12
UPDATE airline
SET country = UPPER(country);


-- 13
UPDATE airline
SET
    name = 'Global Airways',
    country = 'United Kingdom',
    update_at = CURRENT_TIMESTAMP
WHERE airline_id = 5;


-- 14
UPDATE airport
SET state = 'Capital District'
WHERE city IN ('Astana', 'London', 'Tokyo');


-- 15
UPDATE baggage_check
SET
    result = 'Checked',
    updated_at = CURRENT_TIMESTAMP
WHERE created_at >= TIMESTAMP '2024-03-01 00:00:00'
  AND created_at < TIMESTAMP '2024-04-01 00:00:00'
  AND result = 'Not checked';
