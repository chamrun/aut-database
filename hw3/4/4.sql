-- POSTGRESQL

CREATE TABLE Drivers
(
    id           SERIAL PRIMARY KEY,
    first_name   VARCHAR(20),
    last_name    VARCHAR(20),
    phone_number VARCHAR(20)
);

CREATE TABLE Cars
(
    id           SERIAL PRIMARY KEY,
    color        VARCHAR(20),
    model        VARCHAR(20),
    plate_number VARCHAR(20),
    driver_id    INTEGER REFERENCES Drivers (id)
);

CREATE TABLE Passengers
(
    id           SERIAL PRIMARY KEY,
    first_name   VARCHAR(20),
    last_name    VARCHAR(20),
    phone_number VARCHAR(20),
    created_at   TIMESTAMP DEFAULT NOW()
);

CREATE Table Rides
(
    passenger_id    INTEGER REFERENCES Passengers (id),
    driver_id       INTEGER REFERENCES Drivers (id),
    car_id          INTEGER REFERENCES Cars (id),
    origin_lat      VARCHAR(20),
    origin_lng      VARCHAR(20),
    destination_lat VARCHAR(20),
    destination_lng VARCHAR(20),
    ride_status     VARCHAR(20),
    created_at      TIMESTAMP DEFAULT NOW()
);