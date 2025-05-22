CREATE DATABASE PartnerOrderSystem;
GO

USE PartnerOrderSystem;
GO

-- ������� ����� ���������
CREATE TABLE PartnerTypes (
    Id INT PRIMARY KEY IDENTITY(1,1),
    Name NVARCHAR(100) NOT NULL,
    Description NVARCHAR(500)
);

-- ������� ���������
CREATE TABLE Partners (
    Id INT PRIMARY KEY IDENTITY(1,1),
    PartnerTypeId INT NOT NULL,
    Name NVARCHAR(200) NOT NULL,
    DirectorName NVARCHAR(200) NOT NULL,
    Address NVARCHAR(500) NOT NULL,
    INN NVARCHAR(20) NOT NULL,
    Phone NVARCHAR(20) NOT NULL,
    Email NVARCHAR(100),
    Logo VARBINARY(MAX),
    Rating INT DEFAULT 0 CHECK (Rating >= 0),
    CreatedDate DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (PartnerTypeId) REFERENCES PartnerTypes(Id)
);

-- ������� ����� ���������
CREATE TABLE ProductTypes (
    Id INT PRIMARY KEY IDENTITY(1,1),
    Name NVARCHAR(100) NOT NULL,
    Description NVARCHAR(500),
    ProductionCoefficient FLOAT DEFAULT 1.0
);

-- ������� ���������
CREATE TABLE Products (
    Id INT PRIMARY KEY IDENTITY(1,1),
    ProductTypeId INT NOT NULL,
    Article NVARCHAR(50) NOT NULL UNIQUE,
    Name NVARCHAR(200) NOT NULL,
    Description NVARCHAR(500),
    Image VARBINARY(MAX),
    MinPartnerPrice DECIMAL(18,2) NOT NULL CHECK (MinPartnerPrice >= 0),
    PackageLength DECIMAL(10,2),
    PackageWidth DECIMAL(10,2),
    PackageHeight DECIMAL(10,2),
    NetWeight DECIMAL(10,2),
    GrossWeight DECIMAL(10,2),
    ProductionTime INT,
    CostPrice DECIMAL(18,2),
    WorkshopNumber INT,
    FOREIGN KEY (ProductTypeId) REFERENCES ProductTypes(Id)
);

-- ������� ������
CREATE TABLE Applications (
    Id INT PRIMARY KEY IDENTITY(1,1),
    PartnerId INT NOT NULL,
    ApplicationDate DATETIME DEFAULT GETDATE(),
    Status NVARCHAR(50) DEFAULT 'New',
    TotalAmount DECIMAL(18,2) DEFAULT 0 CHECK (TotalAmount >= 0),
    PrepaymentDate DATETIME,
    CompletionDate DATETIME,
    ManagerNotes NVARCHAR(1000),
    FOREIGN KEY (PartnerId) REFERENCES Partners(Id)
);

-- ������� ��������� � �������
CREATE TABLE ApplicationProducts (
    Id INT PRIMARY KEY IDENTITY(1,1),
    ApplicationId INT NOT NULL,
    ProductId INT NOT NULL,
    Quantity INT NOT NULL CHECK (Quantity > 0),
    UnitPrice DECIMAL(18,2) NOT NULL CHECK (UnitPrice >= 0),
    ProductionDate DATETIME,
    FOREIGN KEY (ApplicationId) REFERENCES Applications(Id),
    FOREIGN KEY (ProductId) REFERENCES Products(Id)
);

-- ������� �����������
CREATE TABLE Employees (
    Id INT PRIMARY KEY IDENTITY(1,1),
    FullName NVARCHAR(200) NOT NULL,
    BirthDate DATE NOT NULL,
    PassportData NVARCHAR(200) NOT NULL,
    BankDetails NVARCHAR(200),
    HealthStatus NVARCHAR(500)
);

-- ������� ����������
CREATE TABLE Managers (
    Id INT PRIMARY KEY IDENTITY(1,1),
    EmployeeId INT NOT NULL,
    FOREIGN KEY (EmployeeId) REFERENCES Employees(Id)
);

-- ������� ����� ����������
CREATE TABLE MaterialTypes (
    Id INT PRIMARY KEY IDENTITY(1,1),
    Name NVARCHAR(100) NOT NULL,
    Description NVARCHAR(500),
    DefectPercentage FLOAT DEFAULT 0.0
);

-- ������� �����������
CREATE TABLE Suppliers (
    Id INT PRIMARY KEY IDENTITY(1,1),
    Name NVARCHAR(200) NOT NULL,
    INN NVARCHAR(20) NOT NULL,
    ContactInfo NVARCHAR(500)
);

-- ������� ����������
CREATE TABLE Materials (
    Id INT PRIMARY KEY IDENTITY(1,1),
    MaterialTypeId INT NOT NULL,
    SupplierId INT NOT NULL,
    Name NVARCHAR(200) NOT NULL,
    Description NVARCHAR(500),
    Image VARBINARY(MAX),
    PackageQuantity INT NOT NULL,
    UnitOfMeasure NVARCHAR(50) NOT NULL,
    Price DECIMAL(18,2) NOT NULL,
    FOREIGN KEY (MaterialTypeId) REFERENCES MaterialTypes(Id),
    FOREIGN KEY (SupplierId) REFERENCES Suppliers(Id)
);

-- ������� ��������� ������� ����������
CREATE TABLE MaterialStocks (
    Id INT PRIMARY KEY IDENTITY(1,1),
    MaterialId INT NOT NULL,
    Quantity INT NOT NULL CHECK (Quantity >= 0),
    MinQuantity INT NOT NULL CHECK (MinQuantity >= 0),
    LastUpdate DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (MaterialId) REFERENCES Materials(Id)
);

-- ������� ��������� �� ������
CREATE TABLE ProductStocks (
    Id INT PRIMARY KEY IDENTITY(1,1),
    ProductId INT NOT NULL,
    Quantity INT NOT NULL CHECK (Quantity >= 0),
    LastUpdate DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (ProductId) REFERENCES Products(Id)
);

-- ������� ���������� ��� ������������ ���������
CREATE TABLE ProductMaterials (
    Id INT PRIMARY KEY IDENTITY(1,1),
    ProductId INT NOT NULL,
    MaterialId INT NOT NULL,
    Parameter1 FLOAT NOT NULL CHECK (Parameter1 > 0),
    Parameter2 FLOAT NOT NULL CHECK (Parameter2 > 0),
    FOREIGN KEY (ProductId) REFERENCES Products(Id),
    FOREIGN KEY (MaterialId) REFERENCES Materials(Id)
);

-- ������� �������� ������
INSERT INTO PartnerTypes (Name, Description) VALUES 
('��������� �������', '��������� ��������, ��������� ��������� �������� ������������'),
('������� ���������', '��������, ���������� ��������� ��� �����������'),
('��������-�������', '������-��������� ��� ������� ���������');

INSERT INTO ProductTypes (Name, Description) VALUES 
('��������� ��������', '�������, ������, �������� � ������ ��������� ���������'),
('�������� ������', '������������ ������ ��� ���������� ������� ����'),
('��������', '������������ � �������������� �������� ��� ���� � �������');

INSERT INTO Products (ProductTypeId, Article, Name, Description, MinPartnerPrice) VALUES
(1, 'FL001', '������� "��� ������������"', '������� 32 ������, ������� 8��', 850.00),
(1, 'FL002', '��������� ����� "�����"', '3-�������� ��������� �����', 1200.00),
(2, 'WP101', '�������� ������ "������"', '������ ��� 2500�500��', 450.00),
(3, 'SK201', '������� "���������"', '����������� ������� ������ �����', 150.00);