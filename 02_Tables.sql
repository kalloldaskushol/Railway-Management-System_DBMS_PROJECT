-- Building TRAIN table:-
CREATE TABLE Train (
    train_id NUMBER PRIMARY KEY,
    train_name VARCHAR(50) NOT NULL,
    train_type VARCHAR(20),
    total_seats NUMBER CHECK (total_seats > 0)
);

-- Building STATION table:-
CREATE TABLE Station (
    station_id NUMBER PRIMARY KEY,
    station_name VARCHAR(50) UNIQUE NOT NULL,
    city VARCHAR(50)
);

-- Building TRAIN_SCHEDULE table:-
CREATE TABLE Train_Schedule (
    schedule_id NUMBER PRIMARY KEY,
    train_id NUMBER REFERENCES Train(train_id),
    source_station NUMBER REFERENCES Station(station_id),
    destination_station NUMBER REFERENCES Station(station_id),
    departure_time VARCHAR(10),
    arrival_time VARCHAR(10)
);

-- Building PASSENGER table:-
CREATE TABLE Passenger (
    passenger_id NUMBER PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    age NUMBER CHECK (age > 0),
    gender VARCHAR(10),
    phone VARCHAR(15) UNIQUE -- So that no two passengers can have the same phone number
);

-- Building TICKET table:-
CREATE TABLE Ticket (
    ticket_id NUMBER PRIMARY KEY,
    passenger_id NUMBER REFERENCES Passenger(passenger_id),
    train_id NUMBER REFERENCES Train(train_id),
    journey_date DATE,
    seat_number NUMBER,
    booking_status VARCHAR(20)   -- CONFIRMED / CANCELLED
);

-- Building PAYMENT table:-
CREATE TABLE Payment (
    payment_id NUMBER PRIMARY KEY,
    ticket_id NUMBER REFERENCES Ticket(ticket_id),
    amount NUMBER CHECK (amount > 0),
    payment_mode VARCHAR(20),
    payment_status VARCHAR(20)
);
