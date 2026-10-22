DROP schema IF EXISTS lana_dog_walking;
CREATE SCHEMA lana_dog_walking;
USE lana_dog_walking;
CREATE TABLE CLIENTS (
client_id INT AUTO_INCREMENT PRIMARY KEY,
client_name VARCHAR(100) NOT NULL,
email VARCHAR(100),
phone VARCHAR(20),
address VARCHAR(150),
city VARCHAR(50),
state CHAR(2),
zip VARCHAR(10)
);
CREATE TABLE WALKERS( 
walker_id     INT AUTO_INCREMENT PRIMARY KEY,
    walker_name   VARCHAR(100) NOT NULL,
    walker_email  VARCHAR(100),
    walker_phone  VARCHAR(20) 
    );
    CREATE TABLE SERVICE_TYPES (
    service_code      VARCHAR(10) PRIMARY KEY,
    service_name      VARCHAR(100) NOT NULL,
    duration_minutes  INT,
    standard_price    DECIMAL(8,2)
);
CREATE TABLE DOGS (
    dog_id      INT AUTO_INCREMENT PRIMARY KEY,
    dog_name    VARCHAR(50) NOT NULL,
    breed       VARCHAR(50),
    care_notes  TEXT,
    client_id   INT NOT NULL,
    FOREIGN KEY (client_id) REFERENCES CLIENTS(client_id)
);
CREATE TABLE WALKS (
    walk_id         INT AUTO_INCREMENT PRIMARY KEY,
    walk_date       DATE NOT NULL,
    start_time      TIME,
    amount_charged  DECIMAL(8,2),
    walk_notes      TEXT,
    dog_id          INT NOT NULL,
    walker_id       INT NOT NULL,
    service_code    VARCHAR(10) NOT NULL,
    FOREIGN KEY (dog_id)       REFERENCES DOGS(dog_id),
    FOREIGN KEY (walker_id)    REFERENCES WALKERS(walker_id),
    FOREIGN KEY (service_code) REFERENCES SERVICE_TYPES(service_code)
);