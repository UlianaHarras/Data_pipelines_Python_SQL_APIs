/***************************
Setting up the environment
***************************/

-- Drop the database if it already exists
DROP DATABASE IF EXISTS sql_cities ;

-- Create the database
CREATE DATABASE sql_cities;

-- Use the database
USE sql_cities;

-- Create the 'cities' table
CREATE TABLE cities (
    city_id INT AUTO_INCREMENT NOT NULL, 
    city_name VARCHAR(255) NOT NULL,
    country_code VARCHAR(255) NOT NULL,
    latitude FLOAT NOT NULL,
    longitude FLOAT NOT NULL,
    PRIMARY KEY (city_id) 
);

select * from cities;

-- Create the 'population' table
CREATE TABLE population (
    city_id INT NOT NULL, 
    population VARCHAR(255) NOT NULL, 
    timestamp_population DATE NOT NULL, 
    FOREIGN KEY (city_id) REFERENCES cities(city_id)
);

select * from population;

-- Create table weather
CREATE TABLE weather (
    city_id INT NOT NULL, 
    forecast_time DATETIME NOT NULL,
    outlook VARCHAR(255) NOT NULL,
    temperature FLOAT NOT NULL,
    feels_like FLOAT NOT NULL,
    wind_speed FLOAT NOT NULL,
    rain_prob FLOAT NOT NULL,
    rain_in_last_3h FLOAT NOT NULL,
    snow_in_last_3h FLOAT NOT NULL,
    data_retrieved_at DATETIME NOT NULL,
    FOREIGN KEY (city_id) REFERENCES cities(city_id)
);

select * from weather;

-- Create table cities_airports
CREATE TABLE cities_airports (
    city_id INT NOT NULL, 
    airport_icao VARCHAR(5) NOT NULL,
    PRIMARY KEY (airport_icao),
    FOREIGN KEY (city_id) REFERENCES cities(city_id)
);

select * from cities_airports;

-- Create table airports
CREATE TABLE airports (
    airport_icao VARCHAR(5) NOT NULL,
    airport_name VARCHAR(255) NOT NULL,
    PRIMARY KEY (airport_icao)
);

ALTER TABLE airports
ADD CONSTRAINT fk_airport_icao
FOREIGN KEY (airport_icao) REFERENCES cities_airports(airport_icao);

select * from airports;

-- Create the 'flights' table
CREATE TABLE flights (
    flight_id INT AUTO_INCREMENT, 
    flight_num VARCHAR(25),
    departure_icao VARCHAR(25),
    arrival_icao VARCHAR(25),
    arrival_time DATETIME,
    PRIMARY KEY (flight_id),
    FOREIGN KEY (arrival_icao) REFERENCES airports(airport_icao)
);

select * from flights order by arrival_icao, arrival_time;
