-- Microsoft Access SELECT queries, UTF-8. Execute each statement separately.

-- Какие заказы, продавцы и даты уже есть в базе
SELECT Orders.id AS OrderID, Clients.name AS ClientName, Employees.name AS SellerName, Orders.order_date AS OrderDate
FROM (Orders INNER JOIN Clients ON Orders.client_id = Clients.id) INNER JOIN Employees ON Orders.seller_id = Employees.id;

-- Наличие или отсутствие товаров
SELECT name, stock_quantity, IIf(stock_quantity>0,"В наличии","Нет в наличии") AS Состояние
FROM Products;

-- Общая сумма покупок по чеку
SELECT Orders.id AS Чек, Clients.name AS Клиент, SUM(OrderItems.quantity * OrderItems.price) AS Сумма
FROM (Orders INNER JOIN Clients ON Orders.client_id = Clients.id) INNER JOIN OrderItems ON Orders.id = OrderItems.order_id
WHERE Orders.id = 1
GROUP BY Orders.id, Clients.name;

-- Покупатели, купившие товары у продавца в период больше n раз
SELECT Clients.name AS ClientName, COUNT(Orders.id) AS PurchaseCount
FROM (Clients INNER JOIN Orders ON Clients.id = Orders.client_id) INNER JOIN Employees ON Orders.seller_id = Employees.id
WHERE Employees.name = "Джим Халперт"
    AND Orders.order_date >= #2025-05-01#
    AND Orders.order_date < #2025-06-01#
GROUP BY Clients.id, Clients.name
HAVING COUNT(Orders.id) > 1;

-- Поставщики выбранного товара
SELECT DISTINCT Suppliers.name, Products.name
FROM (Products INNER JOIN Supplies ON Products.id = Supplies.product_id) INNER JOIN Suppliers ON Supplies.supplier_id = Suppliers.id
WHERE Products.name = "Кукла Одиннадцать";

-- Список заказов
SELECT *
FROM Orders;

-- Список клиентов
SELECT *
FROM Clients;

-- Список поставщиков
SELECT *
FROM Suppliers;

-- Список: клиенты, заказанные товары и их цена
SELECT Clients.name AS Клиент, Products.name AS Товар, OrderItems.quantity, OrderItems.price
FROM ((Orders INNER JOIN Clients ON Orders.client_id = Clients.id) INNER JOIN OrderItems ON Orders.id = OrderItems.order_id) INNER JOIN Products ON OrderItems.product_id = Products.id;

-- Стоимость и количество товара
SELECT name, price, stock_quantity, hall_quantity
FROM Products
WHERE name = "Динозавр Рекс";

-- Товары и цены поставщи
SELECT DISTINCT Products.name AS ProductName, Products.price AS ProductPrice
FROM (Products INNER JOIN Supplies ON Products.id = Supplies.product_id) INNER JOIN Suppliers ON Supplies.supplier_id = Suppliers.id
WHERE Suppliers.name =
        "Чендлер Бинг ООО ""Игрушки""";
