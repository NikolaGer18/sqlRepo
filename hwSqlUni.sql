CREATE TABLE "Position"
(
    P_ID INTEGER NOT NULL,
    P_Name VARCHAR(30),
    CONSTRAINT Position_PK PRIMARY KEY (P_ID)
);

INSERT INTO "Position" VALUES (1, 'Store Manager');
INSERT INTO "Position" VALUES (2, 'Assistant Store Manager');
INSERT INTO "Position" VALUES (3, 'Cashier');
INSERT INTO "Position" VALUES (4, 'Clerk');
INSERT INTO "Position" VALUES (5, 'bagger'); -- Position name is written wrong. (Later updated)
INSERT INTO "Position" VALUES (6, 'Mechanic'); -- We do not offer such job positions. (Later deleted)

-- Fixing grammar.
UPDATE "Position"
SET P_Name = 'Bagger'
WHERE P_ID = 5;

-- Deleting a position that is not appropriate for the store.
DELETE FROM "Position"
WHERE P_ID = 6;

CREATE TABLE Employee
(
    E_ID INTEGER NOT NULL,
    E_Name VARCHAR(30),
    E_Phone_Number VARCHAR(30),
    Position_P_ID INTEGER NOT NULL,
    CONSTRAINT Employee_PK PRIMARY KEY (E_ID),
    CONSTRAINT Employee_Position_FK FOREIGN KEY (Position_P_ID) REFERENCES "Position" (P_ID)
);

INSERT INTO Employee VALUES (1, 'Aleksandar H.', '+359882702937', 1);
INSERT INTO Employee VALUES (2, 'Nikola G.', '+359881074536', 2);
INSERT INTO Employee VALUES (3, 'Mihail K.', '+359895603179', 3);
INSERT INTO Employee VALUES (4, 'Yancho S.', '+359892852965', 3);
INSERT INTO Employee VALUES (5, 'Svilen S.', '+359884916041', 3);
INSERT INTO Employee VALUES (6, 'Kaloyan A.', '+359886831943', 4);
INSERT INTO Employee VALUES (7, 'Darina U.', '+359892830965', 4);
INSERT INTO Employee VALUES (8, 'Emil K.', '+359899533930', 5);
INSERT INTO Employee VALUES (9, 'Nikolai K.', '+359881805433', 4); -- Employee is being moved to another position to compensate for the fired staff member. (Later updated)
INSERT INTO Employee VALUES (10, 'Stefan C.', '+359896031865', 5); -- This employee did not do their job well, thus he is getting fired. (Later deleted)

-- Moving employee to another position.
UPDATE Employee
SET Position_P_ID = 5
WHERE E_ID = 9;

-- Employee is being fired from the job.
DELETE FROM Employee
WHERE E_ID = 10;

CREATE TABLE Customer
(
    C_ID INTEGER NOT NULL,
    C_Name VARCHAR(30),
    C_Phone_Number VARCHAR(30),
    CONSTRAINT Customer_PK PRIMARY KEY (C_ID)
);

INSERT INTO Customer VALUES (1, 'Shaquille O.', '+359892988957');
INSERT INTO Customer VALUES (2, 'LeBron J.', '+359880592638');
INSERT INTO Customer VALUES (3, 'Kobe B.', '+359898964562');
INSERT INTO Customer VALUES (4, 'Dennis R.', '359881059382'); -- Wrong phone number format. (Later updated)
INSERT INTO Customer VALUES (5, 'Michael J.', '+359893892403'); -- Customer is being kicked out of the store for inappropriate actions. (Later deleted)

-- Fixing phone number format.
UPDATE Customer
SET C_Phone_Number = '+359881059382'
WHERE C_ID = 4;

-- Kicking customer out for inappropriate actions.
DELETE FROM Customer
WHERE C_ID = 5;

CREATE TABLE "Group"
(
    G_ID INTEGER NOT NULL,
    G_Name VARCHAR(30),
    CONSTRAINT Group_PK PRIMARY KEY (G_ID)
);

INSERT INTO "Group" VALUES (1, 'Fruits');
INSERT INTO "Group" VALUES (2, 'Vegetables');
INSERT INTO "Group" VALUES (3, 'Meats'); -- Product category name is written wrong. (Later updated)
INSERT INTO "Group" VALUES (4, 'Dairy');
INSERT INTO "Group" VALUES (5, 'Drinks');
INSERT INTO "Group" VALUES (6, 'Snacks');
INSERT INTO "Group" VALUES (7, 'Tools'); -- A tools product category exists, it has to be deleted as this is a grocery store. (Later deleted)

-- Fixing grammar for product category name.
UPDATE "Group"
SET G_Name = 'Meat'
WHERE G_ID = 3;

-- Deleting product category, as this is a grocery store. We do not sell tools.
DELETE FROM "Group"
WHERE G_ID = 7;

CREATE TABLE Product
(
    P_ID INTEGER NOT NULL,
    P_Name VARCHAR(30),
	P_Price NUMBER(7,2),
    Group_G_ID INTEGER NOT NULL,
    CONSTRAINT Product_PK PRIMARY KEY (P_ID),
    CONSTRAINT Product_Group_FK FOREIGN KEY (Group_G_ID) REFERENCES "Group" (G_ID)
);

-- Fruits
INSERT INTO Product VALUES (1, 'Apple', 0.60, 1);
INSERT INTO Product VALUES (2, 'Banana', 0.80, 1);
INSERT INTO Product VALUES (3, 'Strawberries', 6.00, 1);
INSERT INTO Product VALUES (4, 'Grapes', 4.00, 1);
INSERT INTO Product VALUES (5, 'Orange', 0.80, 1);
INSERT INTO Product VALUES (6, 'Fruit Juice', 1.50, 1); -- Product has been placed in the wrong product category. (Later deleted)

-- Vegetables
INSERT INTO Product VALUES (7, 'Potato', 0.40, 2);
INSERT INTO Product VALUES (8, 'Tomato', 0.80, 2);
INSERT INTO Product VALUES (9, 'Onion', 0.50, 2);
INSERT INTO Product VALUES (10, 'Carrot', 0.40, 2);
INSERT INTO Product VALUES (11, 'Lettuce', 3.00, 2);
INSERT INTO Product VALUES (12, 'Cucumber', 1.00, 2);

-- Meat
INSERT INTO Product VALUES (13, 'Ham', 2.80, 3);
INSERT INTO Product VALUES (14, 'Chicken', 4.50, 3);
INSERT INTO Product VALUES (15, 'Porkchop', 3.00, 3);
INSERT INTO Product VALUES (16, 'Steak', 3.50, 3);
INSERT INTO Product VALUES (17, 'Bacon', 2.50, 3);
INSERT INTO Product VALUES (18, 'Sausage', 1.80, 3);

-- Dairy
INSERT INTO Product VALUES (19, 'Milk', 2.20, 4);
INSERT INTO Product VALUES (20, 'Cheese', 3.30, 4);
INSERT INTO Product VALUES (21, 'Yellow Cheese', 2.00, 4);
INSERT INTO Product VALUES (22, 'Yogurt', 1.50, 4);
INSERT INTO Product VALUES (23, 'Cream', 1.20, 4);
INSERT INTO Product VALUES (24, 'Butter', 1.80, 4);

-- Drinks
INSERT INTO Product VALUES (25, 'Coca-Cola', 1.50, 5);
INSERT INTO Product VALUES (26, 'Fanta', 1.50, 5);
INSERT INTO Product VALUES (27, 'Sprite', 1.50, 5);
INSERT INTO Product VALUES (28, 'Ice Tea', 2.20, 5);
INSERT INTO Product VALUES (29, 'Energy Drink', 1.00, 5);
INSERT INTO Product VALUES (30, 'Bottled Water', 0.50, 5);
INSERT INTO Product VALUES (31, 'Grapefruit', 1.00, 5); -- A fruit is placed in the drink category, instead, it should be placed in the fruit category. (Later updated)

-- Snacks
INSERT INTO Product VALUES (32, 'Ruffles', 3.00, 6);
INSERT INTO Product VALUES (33, 'Cookies', 2.40, 6);
INSERT INTO Product VALUES (34, 'Doritos', 2.00, 6);
INSERT INTO Product VALUES (35, 'Snickers', 1.50, 6);
INSERT INTO Product VALUES (36, 'Pringles', 4.00, 6);
INSERT INTO Product VALUES (37, 'Cheetos', 2.80, 6);

-- Rearranging the fruit, out of the drinks category, back into the fruits category.
UPDATE Product
SET Group_G_ID = 1
WHERE P_ID = 31;

-- Deleting a product that shouldn't be in that product category.
DELETE FROM Product
WHERE P_ID = 6;

CREATE TABLE Cart
(
	CA_ID INTEGER NOT NULL,
	CA_Quantity INTEGER, -- Quantity of the product bought.
	Product_P_ID INTEGER NOT NULL,
	CONSTRAINT Cart_PK PRIMARY KEY (CA_ID),
	CONSTRAINT Cart_Product_FK FOREIGN KEY (Product_P_ID) REFERENCES Product (P_ID)
);

INSERT INTO Cart VALUES (1, 1, 1);
INSERT INTO Cart VALUES (2, 2, 19);
INSERT INTO Cart VALUES (3, 4, 7);
INSERT INTO Cart VALUES (4, 2, 16);
INSERT INTO Cart VALUES (5, 4, 30);
INSERT INTO Cart VALUES (6, 2, 35);
INSERT INTO Cart VALUES (7, 4, 18);
INSERT INTO Cart VALUES (8, 8, 29);
INSERT INTO Cart VALUES (9, 3, 5);
INSERT INTO Cart VALUES (10, 4, 8); -- Cashier did not scan the last item, they are supposed to be five. (Later updated)
INSERT INTO Cart VALUES (11, 6, 17); -- One of our customers changed their mind and decided not to buy anything. (Later deleted)

-- Scanning the last item.
UPDATE Cart
SET CA_Quantity = 5
WHERE CA_ID = 10;

-- Removing products from cart.
DELETE FROM Cart
WHERE CA_ID = 11;

CREATE TABLE "Transaction"
(
    T_ID INTEGER NOT NULL,
    T_Date DATE,
    Customer_C_ID INTEGER NOT NULL,
    Employee_E_ID INTEGER NOT NULL,
	Cart_CA_ID INTEGER NOT NULL,
    CONSTRAINT Transaction_PK PRIMARY KEY (T_ID),
    CONSTRAINT Transaction_Customer_FK FOREIGN KEY (Customer_C_ID) REFERENCES Customer (C_ID),
    CONSTRAINT Transaction_Employee_FK FOREIGN KEY (Employee_E_ID) REFERENCES Employee (E_ID),
	CONSTRAINT Transaction_Cart_FK FOREIGN KEY (Cart_CA_ID) REFERENCES Cart (CA_ID)
);

INSERT INTO "Transaction" VALUES (1, '18-JAN-21', 1, 5, 1);
INSERT INTO "Transaction" VALUES (2, '21-FEB-21', 2, 4, 2);
INSERT INTO "Transaction" VALUES (3, '10-MAR-23', 3, 3, 3); -- Wrong year on transaction date. (Later updated)
INSERT INTO "Transaction" VALUES (4, '23-AUG-21', 4, 5, 4);
INSERT INTO "Transaction" VALUES (5, '14-OCT-21', 4, 4, 5);
INSERT INTO "Transaction" VALUES (6, '30-DEC-21', 3, 3, 6);
INSERT INTO "Transaction" VALUES (7, '03-JUL-21', 2, 5, 7);
INSERT INTO "Transaction" VALUES (8, '20-SEP-21', 1, 4, 8);
INSERT INTO "Transaction" VALUES (9, '09-JUN-21', 1, 3, 9);
INSERT INTO "Transaction" VALUES (10, '27-NOV-21', 2, 4, 10);
INSERT INTO "Transaction" VALUES (11, '27-NOV-21', 2, 4, 10); -- Our cashier accidentally created a duplicate transaction, so it has to be deleted. (Later deleted)

-- Fixing the year of the transaction date.
UPDATE "Transaction"
SET T_Date = '10-MAR-21'
WHERE T_ID = 3;

-- Deleting the duplicate transaction.
DELETE FROM "Transaction"
WHERE T_ID = 11;

CREATE TABLE Receipt
(
	R_ID INTEGER NOT NULL,
    R_Total NUMBER(7,2), -- Total in BGN.
    Transaction_T_ID INTEGER NOT NULL,
	CONSTRAINT Receipt_PK PRIMARY KEY (R_ID),
    CONSTRAINT Receipt_Transaction_FK FOREIGN KEY (Transaction_T_ID) REFERENCES "Transaction" (T_ID)
);

INSERT INTO Receipt VALUES (1, 0.60, 1);
INSERT INTO Receipt VALUES (2, 4.40, 2);
INSERT INTO Receipt VALUES (3, 1.60, 3);
INSERT INTO Receipt VALUES (4, 7.00, 4);
INSERT INTO Receipt VALUES (5, 2.00, 5);
INSERT INTO Receipt VALUES (6, 3.00, 6);
INSERT INTO Receipt VALUES (7, 7.20, 7);
INSERT INTO Receipt VALUES (8, 8.00, 8); -- The total for the products bought is incorrect, the total has to be recalculated. (Later updated)
INSERT INTO Receipt VALUES (9, 2.40, 9);
INSERT INTO Receipt VALUES (10, 3.20, 10);
INSERT INTO Receipt VALUES (11, 3.20, 10); -- Our cashier printed a receipt twice, so we have to dispose of the duplicate receipt. (Later deleted)

-- Fixing the total for the receipt.
UPDATE Receipt
SET R_Total = 8.00
WHERE R_ID = 8;

-- Disposing of the duplicate receipt.
DELETE FROM Receipt
WHERE R_ID = 11;

-- Search

SELECT pr.P_Name, pr.P_Price, g.G_Name FROM Product pr
JOIN "Group" g ON g.G_ID = pr.Group_G_ID
WHERE pr.P_Price LIKE '%&P_Price%';

SELECT pr.P_Name, pr.P_Price, g.G_Name FROM Product pr
JOIN "Group" g ON g.G_ID = pr.Group_G_ID
WHERE pr.P_Name LIKE '%&P_Name%';

SELECT pr.P_Name, pr.P_Price, g.G_Name FROM Product pr
JOIN "Group" g ON g.G_ID = pr.Group_G_ID
WHERE g.G_Name LIKE '%&G_Name%';

-- Inquiry

SELECT e.E_Name, c.C_Name, ca.Product_P_ID, ca.CA_Quantity, t.T_Date FROM "Transaction" t
JOIN Employee e ON e.E_ID = t.Employee_E_ID
JOIN Customer c ON c.C_ID = t.Customer_C_ID
JOIN Cart ca ON ca.CA_ID = t.Cart_CA_ID
WHERE t.T_Date BETWEEN '&start_date' AND '&end_date';

SELECT e.E_Name, ca.Product_P_ID, ca.CA_Quantity, t.T_Date FROM "Transaction" t
JOIN Employee e ON e.E_ID = t.Employee_E_ID
JOIN Cart ca ON ca.CA_ID = t.Cart_CA_ID
WHERE e.E_Name LIKE '%&E_Name%'
ORDER BY t.T_Date;

SELECT c.C_Name, ca.Product_P_ID, ca.CA_Quantity, t.T_Date FROM "Transaction" t
JOIN Customer c ON c.C_ID = t.Customer_C_ID
JOIN Cart ca ON ca.CA_ID = t.Cart_CA_ID
WHERE c.C_Name LIKE '%&C_Name%'
