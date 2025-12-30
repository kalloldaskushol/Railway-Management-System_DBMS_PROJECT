


-- To clear the variables
UNDEFINE start_date;
UNDEFINE end_date;



-- Train schedule with ticket count
SELECT t.train_name, ts.departure_time, ts.arrival_time,
       COUNT(tk.ticket_id) AS Total_Tickets
FROM Train t
JOIN Train_Schedule ts ON t.train_id = ts.train_id
LEFT JOIN Ticket tk ON t.train_id = tk.train_id
GROUP BY t.train_name, ts.departure_time, ts.arrival_time;

--  Payment details for tickets of a specific train (train_id = 101)
SELECT p.payment_id, t.ticket_id, tr.train_name, p.amount, p.payment_mode
FROM Payment p
JOIN Ticket t ON p.ticket_id = t.ticket_id
JOIN Train tr ON t.train_id = tr.train_id
WHERE tr.train_id = 102;


-- 1. plm sattenebt , scope off the projecct
-- 2. team manager
-- 3. ER diagram


-- Passenger name, train name, journey date, booking status
SELECT p.name, t.train_name, tk.journey_date, tk.booking_status
    FROM Passenger p
JOIN Ticket tk ON p.passenger_id = tk.passenger_id
JOIN Train t ON tk.train_id = t.train_id;