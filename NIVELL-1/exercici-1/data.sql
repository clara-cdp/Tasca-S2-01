INSERT INTO SUPPLIER (NIF, Name, Phone, Street, Number, City, Postal_code, Country, Fax) 
VALUES 
('12345678A', 'Optical illusions', '+34395554565', 'Blames', '10', 'Barcelona', '08001', 'Spain', NULL),
('98765432B', 'Opticalities', '+44654321987', 'Regents St', '25', 'London', 'E14RS', 'UK', NULL),
('11223344C', 'Lentillas Lentes', '+34915551234', 'Calle Alcalá', '5', 'Madrid', '28014', 'Spain', '915551234');

INSERT INTO SALES_ASSISTANT (Name) 
VALUES ('Huey'), ('Dewey'), ('Louie');

INSERT INTO BRAND (Name, SUPPLIER_ID)
VALUES ('Ray-Ban', 1), ('Persol', 1), ('Tom Ford', 2), ('Oakley', 3);

INSERT INTO CLIENT (Name, Phone, Register_date, Email, Postal_code, `recomended_by_ID CLIENT`)
VALUES 
('Anna Smith', '+34 600 111 222', '2025-01-10', 'anna.s@email.com', '08001', NULL),
('Marc Torrent', '+34 622 333 444', '2025-01-12', 'mtorrent@email.com', '08005', NULL),
('Elena Guiu', '+34 655 444 333', '2025-02-05', 'eguiu@email.com', '08010', NULL);

INSERT INTO GLASSES (PRICE, frame_type, frame_colour, left_graduation, right_graduation, left_colour_glass, right_colour_glass, `BRAND_ID BRAND`)
VALUES 
(125.50, 'P', 'Black', 1.25, 1.25, 'Clear', 'Clear', 1),
(185.00, 'M', 'Black', 0.00, 0.00, 'Green', 'Green', 2),
(99.99, 'F', 'Brown', 2.50, 2.75, 'Clear', 'Clear', 1),
(210.00, 'P', 'Black', 1.50, 1.50, 'Clear', 'Clear', 4),
(145.00, 'M', 'Silver', 3.00, 3.25, 'Pink', 'Pink', 3),
(160.00, 'F', 'Red', 0.75, 0.50, 'Clear', 'Clear', 1);

INSERT INTO SALE (Date, `GLASSES_GLASSES ID`, CLIENT_ID_CLIENT, SALES_ASSISTANT_ID) 
VALUES 
('2025-02-21', 1, 1, 1),
('2025-05-10', 2, 2, 2),
('2025-04-30', 3, 3, 1),
('2024-12-09', 4, 1, 3),
('2024-11-10', 5, 2, 1); 

INSERT INTO CLIENT (Name, Phone, Register_date, Email, Postal_code, `recomended_by_ID CLIENT`)
VALUES
('Jordi Valls', '+34 611 999 888', '2025-02-14', 'jvalls@email.com', '17001', 1),
('Lucia Mendez', '+34 688 777 666', '2025-03-01', 'lucia.m@email.com', '28001', 3);