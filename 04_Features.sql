-- 1. List trains with source & destination station names
SELECT 
    t.train_name,
    (s1.station_name || ' → ' || s2.station_name) AS route,
    s1.station_name AS source_station,
    s2.station_name AS destination_station,
    ts.departure_time,
    ts.arrival_time
        FROM Train t
JOIN Train_Schedule ts ON t.train_id = ts.train_id
JOIN Station s1 ON ts.source_station = s1.station_id -- Both are station ids 
JOIN Station s2 ON ts.destination_station = s2.station_id; -- Both are station ids

-- 2. Find trains that start from a specific city and ends to a specific city:
SELECT train_name
    FROM Train
WHERE train_id IN (
    SELECT train_id
        FROM Train_Schedule
    WHERE source_station IN (
        SELECT station_id
            FROM Station
        WHERE UPPER(city) = UPPER(:source_city)
    )
    AND destination_station IN (
        SELECT station_id
            FROM Station
        WHERE UPPER(city) = UPPER(:dest_city)
    )
);

-- 3. Passengers booked for a specific train (train_id starts from 101)
SELECT name
    FROM Passenger
WHERE passenger_id IN (
    SELECT passenger_id
        FROM Ticket
    WHERE train_id LIKE :train_id
);

-- 4. Display train schedule between a time range
SELECT *
    FROM Ticket
WHERE journey_date BETWEEN TO_DATE(:start_date,'YYYY-MM-DD')
                    AND TO_DATE(:end_date,'YYYY-MM-DD')
    AND booking_status LIKE 'CONFIRMED'
ORDER BY journey_date;
