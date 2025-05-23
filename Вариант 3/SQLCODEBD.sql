CREATE DATABASE PartnerOrderSystem;
GO

USE PartnerOrderSystem;
GO

-- Таблица типов партнеров
CREATE TABLE PartnerTypes (
    Id INT PRIMARY KEY IDENTITY(1,1),
    Name NVARCHAR(100) NOT NULL,
    Description NVARCHAR(500)
);

-- Таблица партнеров
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

-- Таблица типов продукции
CREATE TABLE ProductTypes (
    Id INT PRIMARY KEY IDENTITY(1,1),
    Name NVARCHAR(100) NOT NULL,
    Description NVARCHAR(500),
    ProductionCoefficient FLOAT DEFAULT 1.0
);

-- Таблица продукции
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

-- Таблица заявок
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

-- Таблица продукции в заявках
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

-- Таблица сотрудников
CREATE TABLE Employees (
    Id INT PRIMARY KEY IDENTITY(1,1),
    FullName NVARCHAR(200) NOT NULL,
    BirthDate DATE NOT NULL,
    PassportData NVARCHAR(200) NOT NULL,
    BankDetails NVARCHAR(200),
    HealthStatus NVARCHAR(500)
);

-- Таблица менеджеров
CREATE TABLE Managers (
    Id INT PRIMARY KEY IDENTITY(1,1),
    EmployeeId INT NOT NULL,
    FOREIGN KEY (EmployeeId) REFERENCES Employees(Id)
);

-- Таблица типов материалов
CREATE TABLE MaterialTypes (
    Id INT PRIMARY KEY IDENTITY(1,1),
    Name NVARCHAR(100) NOT NULL,
    Description NVARCHAR(500),
    DefectPercentage FLOAT DEFAULT 0.0
);

-- Таблица поставщиков
CREATE TABLE Suppliers (
    Id INT PRIMARY KEY IDENTITY(1,1),
    Name NVARCHAR(200) NOT NULL,
    INN NVARCHAR(20) NOT NULL,
    ContactInfo NVARCHAR(500)
);

-- Таблица материалов
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

-- Таблица складских запасов материалов
CREATE TABLE MaterialStocks (
    Id INT PRIMARY KEY IDENTITY(1,1),
    MaterialId INT NOT NULL,
    Quantity INT NOT NULL CHECK (Quantity >= 0),
    MinQuantity INT NOT NULL CHECK (MinQuantity >= 0),
    LastUpdate DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (MaterialId) REFERENCES Materials(Id)
);

-- Таблица продукции на складе
CREATE TABLE ProductStocks (
    Id INT PRIMARY KEY IDENTITY(1,1),
    ProductId INT NOT NULL,
    Quantity INT NOT NULL CHECK (Quantity >= 0),
    LastUpdate DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (ProductId) REFERENCES Products(Id)
);

-- Таблица материалов для производства продукции
CREATE TABLE ProductMaterials (
    Id INT PRIMARY KEY IDENTITY(1,1),
    ProductId INT NOT NULL,
    MaterialId INT NOT NULL,
    Parameter1 FLOAT NOT NULL CHECK (Parameter1 > 0),
    Parameter2 FLOAT NOT NULL CHECK (Parameter2 > 0),
    FOREIGN KEY (ProductId) REFERENCES Products(Id),
    FOREIGN KEY (MaterialId) REFERENCES Materials(Id)
);


-- 1. Вставляем типы партнеров (из столбца "Тип партнера")
INSERT INTO PartnerTypes (Name) VALUES
('ЗАО'), ('ООО'), ('ПАО'), ('ОАО');

-- 2. Вставляем партнеров
INSERT INTO Partners (PartnerTypeId, Name, DirectorName, Email, Phone, Address, INN, Rating) VALUES
((SELECT Id FROM PartnerTypes WHERE Name = 'ЗАО'), 'Стройдвор', 'Андреева Ангелина Николаевна', 'angelina77@kart.ru', '492 452 22 82', '143001, Московская область, город Одинцово, уд. Ленина, 21', '9432455179', 5),
((SELECT Id FROM PartnerTypes WHERE Name = 'ЗАО'), 'Самоделка', 'Мельников Максим Петрович', 'melnikov.maksim88@hm.ru', '812 267 19 59', '306230, Курская область, город Обоянь, ул. 1 Мая, 89', '7803888520', 3),
((SELECT Id FROM PartnerTypes WHERE Name = 'ООО'), 'Деревянные изделия', 'Лазарев Алексей Сергеевич', 'aleksejlazarev@al.ru', '922 467 93 83', '238340, Калининградская область, город Светлый, ул. Морская, 12', '8430391035', 4),
((SELECT Id FROM PartnerTypes WHERE Name = 'ООО'), 'Декор и отделка', 'Саншокова Мадина Муратовна', 'mmsanshokova@lss.ru', '413 230 30 79', '685000, Магаданская область, город Магадан, ул. Горького, 15', '4318170454', 7),
((SELECT Id FROM PartnerTypes WHERE Name = 'ООО'), 'Паркет', 'Иванов Дмитрий Сергеевич', 'ivanov.dmitrij@mail.ru', '921 851 21 22', '606440, Нижегородская область, город Бор, ул. Свободы, 3', '7687851800', 7),
((SELECT Id FROM PartnerTypes WHERE Name = 'ПАО'), 'Дом и сад', 'Аникеева Екатерина Алексеевна', 'ekaterina.anikeeva@ml.ru', '499 936 29 26', '393760, Тамбовская область, город Мичуринск, ул. Красная, 50', '6119144874', 7),
((SELECT Id FROM PartnerTypes WHERE Name = 'ОАО'), 'Легкий шаг', 'Богданова Ксения Владимировна', 'bogdanova.kseniya@bkv.ru', '495 445 61 41', '307370, Курская область, город Рыльск, ул. Гагарина, 16', '1122170258', 6),
((SELECT Id FROM PartnerTypes WHERE Name = 'ПАО'), 'СтройМатериалы', 'Холодова Валерия Борисовна', 'holodova@education.ru', '499 234 56 78', '140300, Московская область, город Егорьевск, ул. Советская, 24', '8355114917', 5),
((SELECT Id FROM PartnerTypes WHERE Name = 'ОАО'), 'Мир отделки', 'Крылов Савелий Тимофеевич', 'stkrylov@mail.ru', '908 713 51 88', '344116, Ростовская область, город Ростов-на-Дону, ул. Артиллерийская, 4', '3532367439', 8),
((SELECT Id FROM PartnerTypes WHERE Name = 'ОАО'), 'Технологии комфорта', 'Белов Кирилл Александрович', 'kirill_belov@kir.ru', '918 432 12 34', '164500, Архангельская область, город Северодвинск, ул. Ломоносова, 29', '2362431140', 4),
((SELECT Id FROM PartnerTypes WHERE Name = 'ПАО'), 'Твой дом', 'Демидов Дмитрий Александрович', 'dademidov@ml.ru', '919 698 75 43', '354000, Краснодарский край, город Сочи, ул. Больничная, 11', '4159215346', 10),
((SELECT Id FROM PartnerTypes WHERE Name = 'ЗАО'), 'Новые краски', 'Алиев Дамир Игоревич', 'alievdamir@tk.ru', '812 823 93 42', '187556, Ленинградская область, город Тихвин, ул. Гоголя, 18', '9032455179', 9),
((SELECT Id FROM PartnerTypes WHERE Name = 'ОАО'), 'Политехник', 'Котов Михаил Михайлович', 'mmkotov56@educat.ru', '495 895 71 77', '143960, Московская область, город Реутов, ул. Новая, 55', '3776671267', 5),
((SELECT Id FROM PartnerTypes WHERE Name = 'ОАО'), 'СтройАрсенал', 'Семенов Дмитрий Максимович', 'semenov.dm@mail.ru', '896 123 45 56', '242611, Брянская область, город Фокино, ул. Фокино, 23', '7447864518', 5),
((SELECT Id FROM PartnerTypes WHERE Name = 'ПАО'), 'Декор и порядок', 'Болотов Артем Игоревич', 'artembolotov@ab.ru', '950 234 12 12', '309500, Белгородская область, город Старый Оскол, ул. Цветочная, 20', '9037040523', 5),
((SELECT Id FROM PartnerTypes WHERE Name = 'ПАО'), 'Умные решения', 'Воронова Анастасия Валерьевна', 'voronova_anastasiya@mail.ru', '923 233 27 69', '652050, Кемеровская область, город Юрга, ул. Мира, 42', '6221520857', 3),
((SELECT Id FROM PartnerTypes WHERE Name = 'ЗАО'), 'Натуральные покрытия', 'Горбунов Василий Петрович', 'vpgorbunov24@vvs.ru', '902 688 28 96', '188300, Ленинградская область, город Гатчина, пр. 25 Октября, 17', '2262431140', 9),
((SELECT Id FROM PartnerTypes WHERE Name = 'ООО'), 'СтройМастер', 'Смирнов Иван Андреевич', 'smirnov_ivan@kv.ru', '917 234 75 55', '184250, Мурманская область, город Кировск, пр. Ленина, 24', '4155215346', 9),
((SELECT Id FROM PartnerTypes WHERE Name = 'ООО'), 'Гранит', 'Джумаев Ахмед Умарович', 'dzhumaev.ahmed@amail.ru', '495 452 55 95', '162390, Вологодская область, город Великий Устюг, ул. Железнодорожная, 36', '3961234561', 5),
((SELECT Id FROM PartnerTypes WHERE Name = 'ЗАО'), 'Строитель', 'Петров Николай Тимофеевич', 'petrov.nikolaj31@mail.ru', '916 596 15 55', '188910, Ленинградская область, город Приморск, ш. Приморское, 18', '9600275878', 10);

-- 3. Вставляем типы продукции
INSERT INTO ProductTypes (Name, ProductionCoefficient) VALUES
('Древесно-плитные материалы', 1.5),
('Декоративные панели', 3.5),
('Плитка', 5.25),
('Фасадные материалы', 4.5),
('Напольные покрытия', 2.17);

-- 4. Вставляем продукты
INSERT INTO Products (ProductTypeId, Name, Article, MinPartnerPrice) VALUES
((SELECT Id FROM ProductTypes WHERE Name = 'Древесно-плитные материалы'), 'Фанера ФСФ 1800х1200х27 мм бежевая береза', '6549922', 5100.00),
((SELECT Id FROM ProductTypes WHERE Name = 'Декоративные панели'), 'Мягкие панели прямоугольник велюр цвет оливковый 600х300х35 мм', '7018556', 1880.00),
((SELECT Id FROM ProductTypes WHERE Name = 'Фасадные материалы'), 'Бетонная плитка Белый кирпич микс 30х7,3 см', '5028272', 2080.00),
((SELECT Id FROM ProductTypes WHERE Name = 'Плитка'), 'Плитка Мозаика 10x10 см цвет белый глянец', '8028248', 2500.00),
((SELECT Id FROM ProductTypes WHERE Name = 'Напольные покрытия'), 'Ламинат Дуб Античный серый 32 класс толщина 8 мм с фаской', '9250282', 4050.00),
((SELECT Id FROM ProductTypes WHERE Name = 'Декоративные панели'), 'Стеновая панель МДФ Флора 1440x500x10 мм', '7130981', 2100.56),
((SELECT Id FROM ProductTypes WHERE Name = 'Фасадные материалы'), 'Бетонная плитка Красный кирпич 20x6,5 см', '5029784', 2760.00),
((SELECT Id FROM ProductTypes WHERE Name = 'Напольные покрытия'), 'Ламинат Канди Дизайн 33 класс толщина 8 мм с фаской', '9658953', 3200.96),
((SELECT Id FROM ProductTypes WHERE Name = 'Древесно-плитные материалы'), 'Плита ДСП 11 мм влагостойкая 594x1815 мм', '6026662', 497.69),
((SELECT Id FROM ProductTypes WHERE Name = 'Напольные покрытия'), 'Ламинат с натуральным шпоном Дуб Эксперт толщина 6 мм с фаской', '9159043', 3750.00),
((SELECT Id FROM ProductTypes WHERE Name = 'Плитка'), 'Плитка настенная Формат 20x40 см матовая цвет мята', '8588376', 2500.00),
((SELECT Id FROM ProductTypes WHERE Name = 'Древесно-плитные материалы'), 'Плита ДСП Кантри 16 мм 900x1200 мм', '6758375', 1050.96),
((SELECT Id FROM ProductTypes WHERE Name = 'Декоративные панели'), 'Стеновая панель МДФ Сосна Полярная 60х280х4мсм цвет коричневый', '7759324', 1700.00),
((SELECT Id FROM ProductTypes WHERE Name = 'Фасадные материалы'), 'Клинкерная плитка коричневая 29,8х29,8 см', '5118827', 860.00),
((SELECT Id FROM ProductTypes WHERE Name = 'Плитка'), 'Плитка настенная Цветок 60x120 см цвет зелено-голубой', '8559898', 2300.00),
((SELECT Id FROM ProductTypes WHERE Name = 'Декоративные панели'), 'Пробковое настенное покрытие 600х300х3 мм белый', '7259474', 3300.00),
((SELECT Id FROM ProductTypes WHERE Name = 'Плитка'), 'Плитка настенная Нева 30x60 см цвет серый', '8115947', 1700.00),
((SELECT Id FROM ProductTypes WHERE Name = 'Фасадные материалы'), 'Гипсовая плитка настенная Дом на берегу кирпич белый 18,5х4,5 см', '5033136', 499.00),
((SELECT Id FROM ProductTypes WHERE Name = 'Напольные покрытия'), 'Ламинат Дуб Северный белый 32 класс толщина 8 мм с фаской', '9028048', 2550.00),
((SELECT Id FROM ProductTypes WHERE Name = 'Древесно-плитные материалы'), 'Дерево волокнистая плита Дуб Винтаж 1200х620х3 мм светло-коричневый', '6123459', 900.50);

-- 5. Вставляем типы материалов
INSERT INTO MaterialTypes (Name, DefectPercentage) VALUES
('Тип материала 1', 0.002),
('Тип материала 2', 0.005),
('Тип материала 3', 0.003),
('Тип материала 4', 0.0015),
('Тип материала 5', 0.0018);

-- 6. Вставляем заявки и продукты в заявках
-- Сначала создаем заявки для каждого партнера
DECLARE @PartnerId INT;
DECLARE @ApplicationId INT;
DECLARE @ProductId INT;
DECLARE @Quantity INT;

-- Для каждого партнера создаем одну заявку со всеми его продуктами
DECLARE partner_cursor CURSOR FOR 
SELECT Id FROM Partners;

OPEN partner_cursor;
FETCH NEXT FROM partner_cursor INTO @PartnerId;

WHILE @@FETCH_STATUS = 0
BEGIN
    -- Создаем заявку
    INSERT INTO Applications (PartnerId, ApplicationDate, Status)
    VALUES (@PartnerId, GETDATE(), 'New');
    
    SET @ApplicationId = SCOPE_IDENTITY();
    
    -- Вставляем все продукты этого партнера в заявку
    -- (используем данные из Partner_products_request_import)
    DECLARE product_cursor CURSOR FOR 
    SELECT 
        p.Id, 
        pr.[Количество продукции]
    FROM Partner_products_request_import pr
    JOIN Partners pt ON pr.[Наименование партнера] = pt.Name
    JOIN Products p ON pr.Продукция = p.Name
    WHERE pt.Id = @PartnerId;
    
    OPEN product_cursor;
    FETCH NEXT FROM product_cursor INTO @ProductId, @Quantity;
    
    WHILE @@FETCH_STATUS = 0
    BEGIN
        INSERT INTO ApplicationProducts (ApplicationId, ProductId, Quantity, UnitPrice)
        SELECT 
            @ApplicationId, 
            @ProductId, 
            @Quantity, 
            MinPartnerPrice
        FROM Products WHERE Id = @ProductId;
        
        FETCH NEXT FROM product_cursor INTO @ProductId, @Quantity;
    END
    
    CLOSE product_cursor;
    DEALLOCATE product_cursor;
    
    FETCH NEXT FROM partner_cursor INTO @PartnerId;
END

CLOSE partner_cursor;
DEALLOCATE partner_cursor;



--✅ Основные таблицы по заданию (по модулю 1 и 2):
--Эти таблицы необходимы для реализации подсистемы заявок партнёров:

--Partners — информация о партнёрах.

--PartnerTypes — типы партнёров.

--Applications — заявки партнёров.

--ApplicationProducts — продукция, указанная в заявках.

--Products — продукция, которую можно заказать.

--ProductTypes — типы продукции.


--❕ Таблицы, потенциально используемые в следующих модулях (по модулю 4):
--Эти таблицы нужны для расчётов, логики материалов и производства (расчёт количества материалов и т.п.):

--ProductMaterials — связь продукции с материалами и параметры.

--MaterialTypes — типы материалов (для расчёта брака).

--Materials — справочник материалов.

--ProductStocks — остатки продукции на складе (для учёта при производстве).

--MaterialStocks — остатки материалов (косвенно может использоваться).


--❎ Вспомогательные таблицы (необязательные по текущему заданию):
--Эти таблицы в рамках первых двух модулей задания не используются, но могут быть полезны при расширении проекта:

--Employees — общая информация о сотрудниках.

--Managers — привязка менеджеров к сотрудникам.

--Suppliers — поставщики материалов.

--Кадровая информация, пропущенная в скрипте — логины, доступ и т.п.


--💡 Вывод:
--Если вы выполняете первые два модуля задания демонстрационного экзамена (создание БД, подсистема заявок), достаточно реализовать следующие таблицы:

--PartnerTypes

--Partners

--ProductTypes

--Products

--Applications

--ApplicationProducts

--Остальные таблицы можно добавить позднее — в модуле 4 (расчёт материала), если вы будете реализовывать расчёт требуемого количества материала.

