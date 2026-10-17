-- Wholesale store database | Microsoft Access / ACE SQL
-- Reconstructed from DAO metadata exported from Database1.accdb.
-- Execute ONE statement at a time in a NEW, EMPTY Access database.
-- Does not contain personal data or sample records.
-- Original table names, field types/sizes and Required flags retained.
-- Constraints and cascade behavior must be validated in Access.

-- Table: Clients
CREATE TABLE [Clients] (
    [id] AUTOINCREMENT,
    [name] TEXT(255) NOT NULL,
    [phone] TEXT(20),
    [email] TEXT(100),
    CONSTRAINT [PK_Clients] PRIMARY KEY ([id])
);

-- Table: Employees
CREATE TABLE [Employees] (
    [id] AUTOINCREMENT,
    [name] TEXT(255) NOT NULL,
    [position] TEXT(100) NOT NULL,
    CONSTRAINT [PK_Employees] PRIMARY KEY ([id])
);

-- Table: Suppliers
CREATE TABLE [Suppliers] (
    [id] AUTOINCREMENT,
    [name] TEXT(255) NOT NULL,
    [inn] TEXT(20),
    [kpp] TEXT(20),
    [address] MEMO,
    [phone] TEXT(20),
    [email] TEXT(100),
    CONSTRAINT [PK_Suppliers] PRIMARY KEY ([id])
);

-- Table: Products
CREATE TABLE [Products] (
    [id] AUTOINCREMENT,
    [name] TEXT(255) NOT NULL,
    [category] TEXT(100),
    [characteristics] MEMO,
    [price] CURRENCY NOT NULL,
    [stock_quantity] LONG,
    [hall_quantity] LONG,
    CONSTRAINT [PK_Products] PRIMARY KEY ([id])
);

-- Table: Orders
CREATE TABLE [Orders] (
    [id] AUTOINCREMENT,
    [client_id] LONG,
    [seller_id] LONG,
    [order_date] DATETIME,
    CONSTRAINT [PK_Orders] PRIMARY KEY ([id])
);

-- Table: Supplies
CREATE TABLE [Supplies] (
    [id] AUTOINCREMENT,
    [supplier_id] LONG,
    [product_id] LONG,
    [supply_date] DATETIME NOT NULL,
    [quantity] LONG NOT NULL,
    [purchase_price] CURRENCY NOT NULL,
    CONSTRAINT [PK_Supplies] PRIMARY KEY ([id])
);

-- Table: SupplierRequests
CREATE TABLE [SupplierRequests] (
    [id] AUTOINCREMENT,
    [supplier_id] LONG,
    [request_date] DATETIME,
    CONSTRAINT [PK_SupplierRequests] PRIMARY KEY ([id])
);

-- Table: OrderItems
CREATE TABLE [OrderItems] (
    [id] AUTOINCREMENT,
    [order_id] LONG,
    [product_id] LONG,
    [quantity] LONG NOT NULL,
    [price] CURRENCY NOT NULL,
    CONSTRAINT [PK_OrderItems] PRIMARY KEY ([id])
);

-- Table: SupplierRequestItems
CREATE TABLE [SupplierRequestItems] (
    [id] AUTOINCREMENT,
    [request_id] LONG,
    [product_id] LONG,
    [requested_quantity] LONG NOT NULL,
    CONSTRAINT [PK_SupplierRequestItems] PRIMARY KEY ([id])
);

-- Referential constraints (add after all tables have been created)
-- DAO Attributes=256 -> cascade UPDATE; 4352 -> cascade UPDATE and DELETE.
-- Validate these flags and SQL syntax on an empty Access database.

ALTER TABLE [Orders] ADD CONSTRAINT [FK_Orders_client_id] FOREIGN KEY ([client_id]) REFERENCES [Clients] ([id]) ON UPDATE CASCADE;
ALTER TABLE [Orders] ADD CONSTRAINT [FK_Orders_seller_id] FOREIGN KEY ([seller_id]) REFERENCES [Employees] ([id]) ON UPDATE CASCADE;
ALTER TABLE [OrderItems] ADD CONSTRAINT [FK_OrderItems_order_id] FOREIGN KEY ([order_id]) REFERENCES [Orders] ([id]) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE [OrderItems] ADD CONSTRAINT [FK_OrderItems_product_id] FOREIGN KEY ([product_id]) REFERENCES [Products] ([id]) ON UPDATE CASCADE;
ALTER TABLE [SupplierRequestItems] ADD CONSTRAINT [FK_SupplierRequestItems_product_id] FOREIGN KEY ([product_id]) REFERENCES [Products] ([id]) ON UPDATE CASCADE;
ALTER TABLE [Supplies] ADD CONSTRAINT [FK_Supplies_product_id] FOREIGN KEY ([product_id]) REFERENCES [Products] ([id]) ON UPDATE CASCADE;
ALTER TABLE [SupplierRequestItems] ADD CONSTRAINT [FK_SupplierRequestItems_request_id] FOREIGN KEY ([request_id]) REFERENCES [SupplierRequests] ([id]) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE [SupplierRequests] ADD CONSTRAINT [FK_SupplierRequests_supplier_id] FOREIGN KEY ([supplier_id]) REFERENCES [Suppliers] ([id]) ON UPDATE CASCADE;
ALTER TABLE [Supplies] ADD CONSTRAINT [FK_Supplies_supplier_id] FOREIGN KEY ([supplier_id]) REFERENCES [Suppliers] ([id]) ON UPDATE CASCADE;
