-- Microsoft Access action queries, UTF-8.
-- WARNING: Statements below modify data. Run INDIVIDUALLY and only on a backup.
-- INSERT statements will create new rows on every execution; UPDATE/DELETE alter or remove existing records.

-- Добавление заказа
INSERT INTO Orders ( client_id, seller_id, order_date )
SELECT Clients.id, Employees.id, #2025-05-10 12:00:00#
FROM Clients, Employees
WHERE Clients.name = "Майкл Скотт"
    AND Employees.name = "Джим Халперт";

-- Добавление поставщика
INSERT INTO Suppliers ( name, inn, kpp, address, phone, email )
VALUES ("Новый Поставщик", "555666777", "123456789", "Москва", "+7-123-456-78-90", "test@supplier.com");

-- Добавление товара
INSERT INTO Products ( name, category, characteristics, price, stock_quantity, hall_quantity )
VALUES ("Новинка 3000", "Игрушки", "Описание...", 1999, 20, 5);

-- Изменение цены товара
UPDATE Products SET price = 3199
WHERE name = "Кукла Одиннадцать";

-- Удаление поставщика
DELETE *
FROM Suppliers
WHERE name = "Новый Поставщик";

-- Удаление товара
DELETE *
FROM Products
WHERE name = "Новинка 3000";
