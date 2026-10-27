USE lana_dog_walking;

INSERT INTO walks
    (WalkID, WalkDate, StartTime, AmountCharged, WalkNotes, WalkerID, ServiceCode)
VALUES
    (1004, '2026-10-24', '08:00:00', 100.00, 'Well behaved', 1004, 1001),
    (1003, '2026-10-25', '10:30:00', 100.00, 'Had snack before', 1002, 1001),
    (1001, '2026-10-25', '14:40:00', 100.00, 'Pulling and barking', 1001, 1001),
    (1002, '2026-10-26', '16:00:00', 100.00, 'Peed twice', 1005, 1001),
    (1005, '2026-10-27', '10:30:00', 100.00, 'Well behaved', 1006, 1001),
    (1006, '2026-10-27', '12:30:00', 100.00, 'Met a dog', 1003, 1001);

SELECT * FROM walks;