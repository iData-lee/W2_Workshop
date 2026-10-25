DROP SCHEMA IF EXISTS lana_dog_walking;
CREATE SCHEMA lana_dog_walking;
USE lana_dog_walking;

-- Clients Table
CREATE TABLE Clients (
    ClientID INT AUTO_INCREMENT PRIMARY KEY,
    ClientName VARCHAR(100) NOT NULL,
    ClientEmail VARCHAR(100),
    ClientPhone VARCHAR(20),
    Address VARCHAR(255)
);
clients
-- Dogs Table
CREATE TABLE Dogs (
    DogID INT AUTO_INCREMENT PRIMARY KEY,
    DogName VARCHAR(100) NOT NULL,
    Breed VARCHAR(100),
    CareNotes TEXT,
    ClientID INT NOT NULL,
    FOREIGN KEY (ClientID)
        REFERENCES Clients(ClientID)
);

-- Walkers Table
CREATE TABLE Walkers (
    WalkerID INT AUTO_INCREMENT PRIMARY KEY,
    WalkerName VARCHAR(100) NOT NULL,
    WalkerEmail VARCHAR(100),
    WalkerPhone VARCHAR(20)
);

-- Service Types Table
CREATE TABLE ServiceTypes (
    ServiceCode VARCHAR(10) PRIMARY KEY,
    ServiceName VARCHAR(100) NOT NULL,
    DurationMinutes INT NOT NULL,
    StandardPricing DECIMAL(8,2) NOT NULL
);

-- Walks Table
CREATE TABLE Walks (
    WalkID INT AUTO_INCREMENT PRIMARY KEY,
    WalkDate DATE NOT NULL,
    StartTime TIME NOT NULL,
    AmountCharged DECIMAL(8,2),
    WalkNotes TEXT,
    WalkerID INT NOT NULL,
    ServiceCode VARCHAR(10) NOT NULL,
    FOREIGN KEY (WalkerID)
        REFERENCES Walkers(WalkerID),
    FOREIGN KEY (ServiceCode)
        REFERENCES ServiceTypes(ServiceCode)
);

-- Resolving Table for Group Walks
CREATE TABLE Walk_Dogs (
    WalkID INT,
    DogID INT,
    PRIMARY KEY (WalkID, DogID),
    FOREIGN KEY (WalkID)
        REFERENCES Walks(WalkID),
    FOREIGN KEY (DogID)
        REFERENCES Dogs(DogID)
);