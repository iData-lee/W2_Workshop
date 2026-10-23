USE lana_dog_walking;
DROP TABLE IF EXISTS WALKS;
DROP TABLE IF EXISTS DOGS;
DROP TABLE IF EXISTS SERVICE_TYPES;
DROP TABLE IF EXISTS WALKERS;
DROP TABLE IF EXISTS CLIENTS;

-- ===== CREATE TABLES (dependency order) =====

CREATE TABLE CLIENTS (
    client_id    VARCHAR(10) PRIMARY KEY,
    client_name  VARCHAR(100) NOT NULL,
    email        VARCHAR(100),
    phone        VARCHAR(20),
    address      VARCHAR(150),
    city         VARCHAR(50),
    state        CHAR(2),
    zip          VARCHAR(10)
);

CREATE TABLE WALKERS (
    walker_id     VARCHAR(10) PRIMARY KEY,
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
    dog_id      VARCHAR(10) PRIMARY KEY,
    dog_name    VARCHAR(50) NOT NULL,
    breed       VARCHAR(50),
    care_notes  TEXT,
    client_id   VARCHAR(10) NOT NULL,
    FOREIGN KEY (client_id) REFERENCES CLIENTS(client_id)
);

CREATE TABLE WALKS (
    walk_id         VARCHAR(10) PRIMARY KEY,
    walk_date       DATE NOT NULL,
    start_time      TIME,
    amount_charged  DECIMAL(8,2),
    walk_notes      TEXT,
    dog_id          VARCHAR(10) NOT NULL,
    walker_id       VARCHAR(10) NOT NULL,
    service_code    VARCHAR(10) NOT NULL,
    FOREIGN KEY (dog_id)       REFERENCES DOGS(dog_id),
    FOREIGN KEY (walker_id)    REFERENCES WALKERS(walker_id),
    FOREIGN KEY (service_code) REFERENCES SERVICE_TYPES(service_code)
);

-- ===== INSERT RECORDS (dependency order) =====

-- CLIENTS
INSERT INTO CLIENTS (client_id, client_name, email, phone, address, city, state, zip) VALUES
  ('C01', 'Henry Wilson', 'Wilson.h@zmail.com', '8565550101', '527 Benedict St.', 'Pennsauken', 'NJ', '08110'),
  ('C02', 'Maria Santos', 'maria.santos@zmail.com', '8565550102', '14 Elm Ave.', 'Haddonfield', 'NJ', '08033'),
  ('C03', 'Derek Park', 'dpark@zmail.com', '8565550103', '301 Collings Rd.', 'Collingswood', 'NJ', '08108'),
  ('C04', 'Priya Nair', 'priya.nair@zmail.com', '8565550104', '88 Kings Hwy.', 'Cherry Hill', 'NJ', '08002'),
  ('C05', 'Tom Reilly', 'treilly@zmail.com', '8565550105', '42 Maple Ln.', 'Voorhees', 'NJ', '08043'),
  ('C06', 'Aisha Johnson', 'aisha.j@zmail.com', '8565550106', '19 Chestnut St.', 'Moorestown', 'NJ', '08057'),
  ('C07', 'Greg Alvarez', 'galvarez@zmail.com', '856555017', '655 Rt. 73 N.', 'Marlton', 'NJ', '08053'),
  ('C08', 'Hannah Cole', 'hcole@zmail.com', '8565550108', '230 Park Dr.', 'Pennsauken', 'NJ', '08110');

-- WALKERS
INSERT INTO WALKERS (walker_id, walker_name, walker_email, walker_phone) VALUES
  ('W01', 'Johnny', 'johnny4dogs@zmail.com', '8563330201'),
  ('W02', 'Sofia', 'sofia.walks@zmail.com', '8563330202'),
  ('W03', 'Marcus', 'marcus.pawpatrol@zmail.com', '8563330203'),
  ('W04', 'Tess', 'tess4tails@zmail.com', '8563330204');

-- SERVICE_TYPES
INSERT INTO SERVICE_TYPES (service_code, service_name, duration_minutes, standard_price) VALUES
  ('SC01', '30 min walk', 30, 25),
  ('SC02', '45 min walk', 45, 27),
  ('SC03', '60 min walk', 60, 35),
  ('SC04', 'Puppy visit', 20, 15),
  ('SC05', 'Group Adventure', 90, 45);

-- DOGS
INSERT INTO DOGS (dog_id, dog_name, breed, care_notes, client_id) VALUES
  ('D01', 'Dawn', 'Syberian Husky', 'gets distracted by squirrels, allergic to cotton candy', 'C01'),
  ('D02', 'Biscuit', 'Beagle', 'follows his nose, Loves treats', 'C02'),
  ('D03', 'Luna', 'Labrador Retriever', 'very friendly, pulls at start of walk', 'C03'),
  ('D04', 'Max', 'German Shepherd', 'barks at skateboards and bikes', 'C04'),
  ('D05', 'Bella', 'Golden Retriever', 'loves water, stop at puddles', 'C05'),
  ('D06', 'Rocky', 'Boxer', 'strong puller, use harness', 'C06'),
  ('D07', 'Daisy', 'Dachshund', 'short walks only, back issues', 'C07'),
  ('D08', 'Cooper', 'Border Collie', 'herds other dogs, needs lots of exercise', 'C08'),
  ('D09', 'Pepper', 'Chihuahua', 'scared of large dogs, carry across busy streets', 'C08'),
  ('D10', 'Milo', 'Goldendoodle', 'allergic to chicken treats', 'C07');

-- WALKS
INSERT INTO WALKS (walk_id, walk_date, start_time, amount_charged, walk_notes, dog_id, walker_id, service_code) VALUES
  ('WK01', '2026-10-05', '08:00:00', 20, 'Chased a squirrel twice, recovered fast', 'D01', 'W01', 'SC01'),
  ('WK02', '2026-10-05', '09:30:00', 35, 'Great leash maners today', 'D05', 'W02', 'SC03'),
  ('WK03', '2026-10-06', '12:00:00', 20, 'Short loop, took breaks often', 'D07', 'W03', 'SC01'),
  ('WK04', '2026-10-07', '16:30:00', 27, 'Barked at a cyclist, redirected with treat', 'D04', 'W01', 'SC02'),
  ('WK05', '2026-10-08', '19:45:00', 35, 'Carried across Kings Hwy.', 'D05', 'W04', 'SC03'),
  ('WK06', '2026-10-09', '10:15:00', 15, 'Herded two beagles at dog park', 'D09', 'W02', 'SC04'),
  ('WK07', '2026-10-10', '14:00:00', 45, 'Pulled hard at start, harness helped', 'D08', 'W03', 'SC05'),
  ('WK08', '2026-10-11', '08:30:00', 27, NULL, 'D06', 'W01', 'SC02'),
  ('WK09', '2026-10-12', '11:00:00', 20, 'Met a friendly poodle, no issues', 'D02', 'W04', 'SC01'),
  ('WK10', '2026-10-13', '13:15:00', 27, 'Skipped treats, avioded chicken', 'D03', 'W02', 'SC02'),
  ('WK11', '2026-10-14', '09:00:00', 35, 'Calm and relaxed', 'D10', 'W03', 'SC03'),
  ('WK12', '2026-10-15', '17:00:00', 20, 'Led the group on the trail', 'D01', 'W01', 'SC01'),
  ('WK13', '2026-10-16', '20:15:00', 45, 'Fast walker, covered extra ground', 'D08', 'W04', 'SC05'),
  ('WK14', '2026-10-17', '12:30:00', 35, 'Nervous near school crossing', 'D03', 'W02', 'SC03'),
  ('WK15', '2026-10-18', '15:45:00', 15, NULL, 'D09', 'W03', 'SC04');

-- ===== CHECKS =====
SELECT COUNT(*) AS clients FROM CLIENTS;
SELECT COUNT(*) AS dogs FROM DOGS;
SELECT COUNT(*) AS walkers FROM WALKERS;
SELECT COUNT(*) AS service_types FROM SERVICE_TYPES;
