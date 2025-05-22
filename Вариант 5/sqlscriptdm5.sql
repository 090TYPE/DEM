-- �������: ���� ���������
CREATE TABLE PartnerTypes (
    PartnerTypeID INT PRIMARY KEY IDENTITY(1,1),
    TypeName NVARCHAR(100) NOT NULL
);

-- �������: ��������
CREATE TABLE Partners (
    PartnerID INT PRIMARY KEY IDENTITY(1,1),
    PartnerTypeID INT NOT NULL,
    CompanyName NVARCHAR(255) NOT NULL,
    LegalAddress NVARCHAR(255),
    INN NVARCHAR(12),
    DirectorFullName NVARCHAR(255),
    Phone NVARCHAR(20),
    Email NVARCHAR(100),
    Logo VARBINARY(MAX),
    Rating INT CHECK (Rating BETWEEN 1 AND 5),
    FOREIGN KEY (PartnerTypeID) REFERENCES PartnerTypes(PartnerTypeID)
);

-- �������: ����� ������ ���������
CREATE TABLE PartnerSalesLocations (
    SalesLocationID INT PRIMARY KEY IDENTITY(1,1),
    PartnerID INT NOT NULL,
    LocationType NVARCHAR(100),
    LocationAddress NVARCHAR(255),
    FOREIGN KEY (PartnerID) REFERENCES Partners(PartnerID)
);

-- �������: ������� ���������� ��������� ����������
CREATE TABLE PartnerSalesHistory (
    SalesHistoryID INT PRIMARY KEY IDENTITY(1,1),
    PartnerID INT NOT NULL,
    ProductID INT NOT NULL,
    SaleDate DATE NOT NULL,
    Quantity INT NOT NULL,
    FOREIGN KEY (PartnerID) REFERENCES Partners(PartnerID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

-- �������: ����������
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY IDENTITY(1,1),
    FullName NVARCHAR(255) NOT NULL,
    BirthDate DATE,
    PassportData NVARCHAR(50),
    BankDetails NVARCHAR(255),
    HasFamily BIT,
    HealthStatus NVARCHAR(255)
);

-- �������: ���������
CREATE TABLE Managers (
    ManagerID INT PRIMARY KEY,
    FOREIGN KEY (ManagerID) REFERENCES Employees(EmployeeID)
);

-- �������: ����������
CREATE TABLE Suppliers (
    SupplierID INT PRIMARY KEY IDENTITY(1,1),
    SupplierType NVARCHAR(100),
    CompanyName NVARCHAR(255) NOT NULL,
    INN NVARCHAR(12)
);

-- �������: ���������
CREATE TABLE Materials (
    MaterialID INT PRIMARY KEY IDENTITY(1,1),
    MaterialType NVARCHAR(100),
    MaterialName NVARCHAR(255) NOT NULL,
    SupplierID INT NOT NULL,
    QuantityPerPackage INT,
    Unit NVARCHAR(50),
    Description NVARCHAR(500),
    Image VARBINARY(MAX),
    Cost DECIMAL(18,2),
    QuantityInStock INT,
    MinQuantity INT,
    FOREIGN KEY (SupplierID) REFERENCES Suppliers(SupplierID)
);

-- �������: ������� ��������� ���������� ����������
CREATE TABLE MaterialQuantityHistory (
    HistoryID INT PRIMARY KEY IDENTITY(1,1),
    MaterialID INT NOT NULL,
    ChangeDate DATETIME NOT NULL DEFAULT GETDATE(),
    ChangeAmount INT NOT NULL,
    Reason NVARCHAR(255),
    FOREIGN KEY (MaterialID) REFERENCES Materials(MaterialID)
);

-- �������: ���������
CREATE TABLE Products (
    ProductID INT PRIMARY KEY IDENTITY(1,1),
    Article NVARCHAR(50) NOT NULL,
    ProductType NVARCHAR(100),
    ProductName NVARCHAR(255) NOT NULL,
    Description NVARCHAR(500),
    Image VARBINARY(MAX),
    MinPartnerPrice DECIMAL(18,2),
    PackageLength DECIMAL(10,2),
    PackageWidth DECIMAL(10,2),
    PackageHeight DECIMAL(10,2),
    WeightWithoutPackage DECIMAL(10,2),
    WeightWithPackage DECIMAL(10,2),
    QualityCertificate VARBINARY(MAX),
    StandardNumber NVARCHAR(100),
    ProductionTime INT,
    CostPrice DECIMAL(18,2),
    WorkshopNumber INT,
    EmployeesCount INT
);

-- �������: ������� ��������� ����������� ��������� ��� ��������
CREATE TABLE ProductPriceHistory (
    PriceHistoryID INT PRIMARY KEY IDENTITY(1,1),
    ProductID INT NOT NULL,
    ChangeDate DATETIME NOT NULL DEFAULT GETDATE(),
    OldPrice DECIMAL(18,2),
    NewPrice DECIMAL(18,2),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

-- �������: ���������, ������������ � ���������
CREATE TABLE ProductMaterials (
    ProductID INT NOT NULL,
    MaterialID INT NOT NULL,
    Quantity INT NOT NULL,
    PRIMARY KEY (ProductID, MaterialID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID),
    FOREIGN KEY (MaterialID) REFERENCES Materials(MaterialID)
);

-- �������: ������
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY IDENTITY(1,1),
    PartnerID INT NOT NULL,
    ManagerID INT NOT NULL,
    OrderDate DATETIME NOT NULL DEFAULT GETDATE(),
    PrepaymentDate DATETIME,
    ProductionStartDate DATETIME,
    ProductionEndDate DATETIME,
    DeliveryDate DATETIME,
    TotalAmount DECIMAL(18,2),
    OrderStatus NVARCHAR(50),
    FOREIGN KEY (PartnerID) REFERENCES Partners(PartnerID),
    FOREIGN KEY (ManagerID) REFERENCES Managers(ManagerID)
);

-- �������: ��������� � ������
CREATE TABLE OrderDetails (
    OrderDetailID INT PRIMARY KEY IDENTITY(1,1),
    OrderID INT NOT NULL,
    ProductID INT NOT NULL,
    Quantity INT NOT NULL,
    UnitPrice DECIMAL(18,2),
    ProductionDate DATE,
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

-- �������: ������ �����������
CREATE TABLE AccessCards (
    CardID INT PRIMARY KEY IDENTITY(1,1),
    EmployeeID INT NOT NULL,
    CardNumber NVARCHAR(50) NOT NULL,
    FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID)
);

-- �������: ����������� �����������
CREATE TABLE EmployeeMovements (
    MovementID INT PRIMARY KEY IDENTITY(1,1),
    EmployeeID INT NOT NULL,
    MovementTime DATETIME NOT NULL DEFAULT GETDATE(),
    MovementType NVARCHAR(50),
    FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID)
);

-- �������: ����� (������ � ������������)
CREATE TABLE EmployeeEquipmentAccess (
    AccessID INT PRIMARY KEY IDENTITY(1,1),
    EmployeeID INT NOT NULL,
    EquipmentName NVARCHAR(100),
    AccessGrantedDate DATE,
    FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID)
);

-- �������: ��������� ��������
CREATE TABLE WarehouseOperations (
    OperationID INT PRIMARY KEY IDENTITY(1,1),
    MaterialID INT NOT NULL,
    OperationDate DATETIME NOT NULL DEFAULT GETDATE(),
    OperationType NVARCHAR(50),
    Quantity INT NOT NULL,
    FOREIGN KEY (MaterialID) REFERENCES Materials(MaterialID)
);
CREATE TABLE MaterialTypes (
    MaterialTypeID INT PRIMARY KEY IDENTITY(1,1),
    TypeName NVARCHAR(100) NOT NULL,
    LossPercentage DECIMAL(5,4) NOT NULL  -- ��������, 0.0055 = 0.55%
);
-- �������� �����������
INSERT INTO Suppliers (SupplierType, CompanyName, INN) VALUES
('�������������', '��� "��������"', '7701234567'),
('�������', '��� "�������������"', '7812345678');

-- �������� ���������
INSERT INTO Materials (MaterialType, MaterialName, SupplierID, QuantityPerPackage, Unit, Description, Image, Cost, QuantityInStock, MinQuantity) VALUES
('������', '�������� ��������', 1, 100, '��', '�������� ��� �������� �����������', NULL, 1200.50, 500, 50),
('�������', '����������� �����', 2, 20, '�', '����� ��� ��������� 50 ��', NULL, 300.00, 1000, 100);

-- �������� ���������
INSERT INTO Products (Article, ProductType, ProductName, Description, Image, MinPartnerPrice, PackageLength, PackageWidth, PackageHeight, WeightWithoutPackage, WeightWithPackage, QualityCertificate, StandardNumber, ProductionTime, CostPrice, WorkshopNumber, EmployeesCount) VALUES
('PRD-001', '������������ ��������', '�������� �����', '������������� �������� ����� ����� �300', NULL, 1500.00, 50.00, 30.00, 20.00, 1000.00, 1050.00, NULL, '���� 7473-94', 5, 1200.00, 3, 15),
('PRD-002', '���������', '�������� �������', '����� ������ � ���� ��� �������', NULL, 500.00, 10.00, 10.00, 5.00, 2.00, 2.50, NULL, '���� 7798-70', 2, 400.00, 1, 8);

INSERT INTO ProductMaterials (ProductID, MaterialID, Quantity) VALUES
(1, 6, 5.0),  -- ������� 1 ���������� �������� 1 � ���������� 5 ������
(1, 7, 2.5),  -- ������� 1 ���������� �������� 2 � ���������� 2.5 ������
(2, 8, 3.0);  -- ������� 2 ���������� �������� 1 � ���������� 3 ������

INSERT INTO MaterialTypes (TypeName, LossPercentage) VALUES
('������', 0.0055),
('��������� �����', 0.0030),
('��������', 0.0015),
('������', 0.0045),
('������', 0.0010),
('�������', 0.0005);

ALTER TABLE Materials
DROP COLUMN MaterialType;

ALTER TABLE Materials
ADD MaterialTypeID INT ;

ALTER TABLE Materials
ADD CONSTRAINT FK_Materials_MaterialTypes FOREIGN KEY (MaterialTypeID) REFERENCES MaterialTypes(MaterialTypeID);



