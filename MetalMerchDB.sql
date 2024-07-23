CREATE DATABASE MetalMerchDB

USE MetalMerchDB

CREATE TABLE Users (
    UserID INT IDENTITY(1,1) PRIMARY KEY,
    Username VARCHAR(50) NOT NULL UNIQUE,
    PasswordHash VARCHAR(255) NOT NULL,
    Email VARCHAR(100) NOT NULL UNIQUE,
    Role VARCHAR(10) CHECK (Role IN ('admin', 'client')) NOT NULL DEFAULT 'client',
    RegistrationDate DATETIME2 DEFAULT SYSDATETIME()
);

INSERT INTO Users (Username, PasswordHash, Email, Role)
VALUES
('user1', 'password1', 'user1@example.com', 'client'),
('user2', 'password2', 'user2@example.com', 'client'),
('user3', 'password3', 'user3@example.com', 'client'),
('user4', 'password4', 'user4@example.com', 'client'),
('user5', 'password5', 'user5@example.com', 'client'),
('user6', 'password6', 'user6@example.com', 'client'),
('user7', 'password7', 'user7@example.com', 'client'),
('admin1', 'adminpass1', 'admin1@example.com', 'admin'),
('admin2', 'adminpass2', 'admin2@example.com', 'admin'),
('admin3', 'adminpass3', 'admin3@example.com', 'admin');

DROP TABLE IF EXISTS Products;

CREATE TABLE Products (
    ProductID INT IDENTITY(1,1) PRIMARY KEY,
    ProductName VARCHAR(100) NOT NULL,
    Description TEXT,
    Price DECIMAL(10, 2) NOT NULL,
    StockQuantity INT NOT NULL,
    Category VARCHAR(50) NOT NULL,
    ImagePath VARCHAR(255) NOT NULL
);

INSERT INTO Products (ProductName, Description, Price, StockQuantity, Category, ImagePath)
VALUES 
('"Benediction - Dark is the season" T-shirt', 'High quality t-shirt with the cover of the album "Dark is the season" of the famous death metal band Benediction. Available in sizes S through 3XL ', 19.99, 50, 'Clothing', '/images/products/Benediction_Dark_is_the_season.png'),
('"Benediction - Transcend the Rubicon" woven patch', 'A woven patch of the album "Transcend the Rubicon" of the famous death metal band Benediction. Available in size 10x10cm ', 15, 30, 'Patches', '/images/products/Benediction_Transcend_the_Rubicon_woven_patch.png'),
('"Amorhis - Karelian isthmus" woven T-shirt', 'A T-shirt with the cover of the album "Karelian isthmus" of the famous metal band Amorphis. Available in sizes S through 3XL', 19.99, 30, 'Clothing', '/images/products/Amorphis_The_Karelian_isthmus.png'),
('"Carnage - Dark Recollections" vinyl record', 'Mint condition vinyl record of the album "Dark Recollections" by Carnage', 49.99, 10,'Media', '/images/products/Carnage_Dark_recollections_Vinyl.png'),
('"Death -The Sound of Perseverance" back patch', 'Back patch with the cover of the album "The Sound of Perseverance" by the famous death metal band Death. Available in size 30x20cm.',30,20,'Patches','/images/products/Death_The_sound_of_perseverance_BackPatch.png'),
('"Dissection - Storm of the Lights bane" patch', 'A patch with the cover of the album "Storm of the lights bane" by the band Dissection. Availabel in size 10x10cm.',15,30,'Patches','/images/products/Dissection_Storm_of_the_lights_bane_Patch.png'),
('"Entombed - Left hand path" CD', 'Mint condition CD of the album "Left hand path" by the band Entombed.', 39.99,10,'Media','/images/products/Entomed_Left_hand_path_CD.png'),
('"Hypocrisy - The fourth dimension" vinyl record', 'Mint condition vinyl record of the album "The fourth dimension" by the famous swedish metal band Hypocrisy.', 39.99, 10,'Media','/images/products/Hypocrisy_The_fourth_dimension_Vinyl.png'),
('"Sepultura - Arise" T-shirt', 'High quality t-shirt with the cover of the album "Arise" by the famous band Sepultura', 19.99,50,'Clothing','/images/products/Sepultura_Arise_T-shirt.png'),
('"Slayer" pin/badge', 'A pin/badge with the logo of the famous band Slayer',5,30,'Pins','/images/products/Slayer_PinBadge.png');

SELECT * FROM UpcomingEvents

CREATE TABLE UpcomingEvents (
		EventID INT IDENTITY(1,1) PRIMARY KEY,
		EventName VARCHAR(100) NOT NULL,
		EventDate DATE NOT NULL,
		Location VARCHAR(150) NOT NULL,
		Description TEXT NOT NULL,
		TicketsLeft INT,
		Price DECIMAL(10, 2) NOT NULL,
		ImagePath VARCHAR(100) NOT NULL		
);

INSERT INTO UpcomingEvents (EventName, EventDate, Location, Description, TicketsLeft, Price, ImagePath) VALUES
('Junge Rot live in Sofia','2024-07-21','Grinhouse skateboard club (Tzarigradsko 73, Sofia)','SWWS and Grindhouse proudly present Wisconsin death metal legends JUNGLE ROT for the first time in Bulgaria!With more than 30 years of history, numerous brutal releases and countless extreme live acts of violence, the band earned a cult status in the underground metal community. Sofia will be part of this year`s European invasion with an exclusive mad sunday night at the Grindhouse!',100,50, '/images/events/Junge_Rot_Grindhouse_2024.png'),
('Running Free Festival ed.VII','2024-08-30','camp "Strinava", Dryanovo, Bulgaria','Running Free Festival ed.VII will take place again at the Strinava camp on August 30 and 31, 2024.Visitors to the festival will be able to enjoy the live performance by Bulgarian and foreign metal bands, invited by Metal Force HMC.',200, 90,'/images/events/Running_Free_festival_2024.png');
 

 select * from users

 
 CREATE TABLE Orders (
		OrderID INT IDENTITY(1,1) PRIMARY KEY,
		UserID INT NOT NULL,
		FOREIGN KEY (UserID) REFERENCES Users(UserID),
		OrderDate DATETIME NOT NULL DEFAULT GETDATE(),
		Total DECIMAL(10, 2) NOT NULL,
		ShippingAddress NVARCHAR(200) NOT NULL,
		BillingAddress NVARCHAR(200) NOT NULL,
		Status NVARCHAR(50) NOT NULL DEFAULT 'Pending',
		UpdatedAt DATETIME NULL	
);


CREATE TABLE OrderItems (
    ID INT PRIMARY KEY IDENTITY(1,1),
    OrderID INT NOT NULL,
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    ProductID INT NOT NULL,
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID),
    ProductQuantity INT NOT NULL,
    ProductPrice DECIMAL(10, 2) NOT NULL,
    CreatedAt DATETIME NOT NULL DEFAULT GETDATE(),
    UpdatedAt DATETIME NULL
);



