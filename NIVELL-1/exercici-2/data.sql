
INSERT INTO STORE (address, postal_code, city, province) 
VALUES 
('Calle Mayor 1', '28001', 'Madrid', 'Mad'),
('Avinguda Diagonal 45', '08001', 'Barcelona', 'Bcn'),
('Calle Betis 12', '41011', 'Sevilla', 'Sev');

INSERT INTO EMPLOYEE (name, surname, NIF, phone, STORE_idSTORE) 
VALUES 
('Carlos', 'Garcia', '12345678A', '+34 600111222', 1),
('Marta', 'Lopez', '87654321B', '+34 600333444', 1),

('Joan', 'Vila', '11223344X', '+34 611222333', 2),
('Sofia', 'Ruiz', '55667788Z', '+34 622444555', 2),
('Luis', 'Perez', '99887766Y', '+34 633555666', 3);

INSERT INTO CHEF (EMPLOYEE_idEMPLOYEE) 
VALUES (1), (2);

INSERT INTO DRIVER (EMPLOYEE_idEMPLOYEE) 
VALUES (3), (4), (5);


INSERT INTO PIZZA_TYPE (name) 
VALUES ('Classic'), ('Vegetarian'), ('Spicy');


INSERT INTO PRODUCT (name, price, image_url, description) 
VALUES 
('Margherita Pizza', 10.50, 'p_margherita.jpg', 'Tomato sauce, basil and mozzarella: for the classic ones.'),
('Pepperoni Pizza', 12.00, 'p_pepperoni.jpg', 'Classic pepperoni'),
('Veggie Pizza', 11.50, 'p_veggie.jpg', 'Fresh peppers, champis, and black olives');

INSERT INTO PIZZA (PRODUCT_idPRODUCT, PIZZA_TYPE_idPIZZA_TYPE) 
VALUES 
(1, 2),(2, 3),(3, 2); 

INSERT INTO PRODUCT (name, price, image_url, description) 
VALUES 
('Cheese Burger', 8.50, 'b_Cheese.jpg', 'Beef patty with cheddar'),
('Double Cheese Burger', 9.50, 'b_Double.jpg', 'Double Beef patty with cheddar: double the flavour!'),
('Classic',9.5,'Classic_b.jpg','BLT with cheese');

INSERT INTO BURGER (PRODUCT_idPRODUCT)
VALUES 
(4),(5),(6);

INSERT INTO PRODUCT (name, price, image_url, description) 
VALUES 
('Coca-Cola', 2.50, 'coke.jpg', '330ml can'),
('Fanta', 2.50, 'coke.jpg', '330ml can'),
('Water', 1.50, 'water.jpg', '500ml still water');

INSERT INTO DRINK (PRODUCT_idPRODUCT) 
VALUES 
(7), (8),(9);

INSERT INTO CUSTOMER (name, surname, phone_number, address, postal_code, city, province) 
VALUES 
('Elena', 'Martínez', '+34 655123456', 'Calle Goya 5', '28001', 'Madrid', 'Mad'),
('Jordi', 'Puig', '+34 688987654', 'Carrer Balmes 10', '08001', 'Barcelona', 'Bcn'),
('Ana', 'Sanz', '+34 600555444', 'Calle Sierpes 2', '41011', 'Sevilla', 'Sev'),
('Jorge', 'García', '+34 612345678', 'Calle Alcala 5', '28007', 'Madrid', 'Mad');


INSERT INTO `ORDER` (order_type, date_time, order_total_amount, CUSTOMER_idCUSTOMER, STORE_idSTORE, DRIVER_EMPLOYEE_idEMPLOYEE ) 
VALUES 
('delivery', NOW(), 0.00, 3, 1, 4); 

SET @order1 = LAST_INSERT_ID(); 

INSERT INTO ORDER_DETAILS (ORDER_idORDER, PRODUCT_idPRODUCT, product_quanity, unit_price, line_total) 
VALUES 
(@order1, 1, 2, 10.50, 0); 

INSERT INTO ORDER_DETAILS (ORDER_idORDER, PRODUCT_idPRODUCT, product_quanity, unit_price, line_total) 
VALUES 
(@order1, 8, 4, 2.50, 0);  

INSERT INTO `ORDER` (order_type, date_time, order_total_amount, CUSTOMER_idCUSTOMER, STORE_idSTORE) 
VALUES ('pickup', NOW(), 0.00, 1, 1); 

SET @order2 = LAST_INSERT_ID();

INSERT INTO ORDER_DETAILS (ORDER_idORDER, PRODUCT_idPRODUCT, product_quanity, unit_price, line_total) 
VALUES (@order2, 4, 1, 8.50, 0); 

INSERT INTO `ORDER` (order_type, date_time, order_total_amount, CUSTOMER_idCUSTOMER, STORE_idSTORE, DRIVER_EMPLOYEE_idEMPLOYEE) 
VALUES ('delivery', NOW(), 0.00, 2, 2, 4); 

SET @order3 = LAST_INSERT_ID();

INSERT INTO ORDER_DETAILS (ORDER_idORDER, PRODUCT_idPRODUCT, product_quanity, unit_price, line_total) 
VALUES (@order3, 2, 3, 12.00, 0); 

INSERT INTO ORDER_DETAILS (ORDER_idORDER, PRODUCT_idPRODUCT, product_quanity, unit_price, line_total) 
VALUES (@order3, 9, 4, 1.50, 0);  

