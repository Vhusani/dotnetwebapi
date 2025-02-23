CREATE TABLE `OrderDetails` (
  `OrderId` varchar(50) NOT NULL,
  `ProductId` varchar(50) NOT NULL,
  `OrderNumber` bigint(15) NOT NULL,
  `Quantity` int(50) NOT NULL,
  `Price` decimal(10,2) NOT NULL,
  `CreatedAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO `OrderDetails` (`OrderId`, `ProductId`, `OrderNumber`, `Quantity`, `Price`, `CreatedAt`) VALUES
('ord000017we1245', 'prd000017we1245', 16437934625162832, 3, 299.99, '2024-06-06 15:32:05'),
('ord000017we1245', 'prd000017we1245', 16437934625162832, 3, 299.99, '2024-06-06 15:32:05'),

CREATE TABLE `OrderNotes` (
  `OrderNoteId` varchar(50) CHARACTER SET utf8mb4 NOT NULL,
  `OrderId` varchar(50) CHARACTER SET utf8mb4 NOT NULL,
  `OrderNumber` bigint(16) NOT NULL,
  `ActionPerformed` varchar(50) CHARACTER SET utf8mb4 NOT NULL,
  `CreatedAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO `OrderNotes` (`OrderNoteId`, `OrderId`, `OrderNumber`, `ActionPerformed`, `CreatedAt`) VALUES
('208dc895-3ffe-4dc6-98ec-fde63b037038', 'ord000017we1246', 7846253729509264, 'resendorder', '2024-08-17 14:54:47'),
('57cb3d98-434a-4755-8a9d-544aff4afb43', 'ord000017we1245', 16437934625162832, 'processing', '2025-02-21 23:50:11'),
('5f4dfebb-b47c-49d7-b5f6-f6ba54643cfd', 'ord000017we1245', 16437934625162832, 'emailinvoice', '2024-08-17 15:04:49'),
('65f6c9a5-4f38-4340-90a4-01f175cbdd45', 'ord000017we1245', 16437934625162832, 'cancelled', '2024-08-17 15:04:41'),
('67068c2f-21b2-465b-b0df-b6a47439be32', 'ord000017we1245', 16437934625162832, 'processing', '2025-02-22 17:38:20'),
('873df360-eb54-493b-a8ed-5c37bd17d12e', 'ord000017we1245', 16437934625162832, 'processing', '2024-08-17 14:55:58'),
('8c885d44-e845-4912-89ba-82de4ebab463', 'ord000017we1245', 16437934625162832, 'emailinvoice', '2024-08-17 14:53:48'),
('af9dadc4-583e-4dcd-b7f0-148f326fb106', 'ord000017we1246', 7846253729509264, 'resendorder', '2025-02-21 23:04:40'),
('e129b587-9c59-4963-9619-0802ba48a40e', 'ord000017we1245', 16437934625162832, 'emailinvoice', '2024-08-17 15:01:22'),
('e7b0da6e-8e57-4637-b63f-9e81807a9659', 'ord000017we1246', 7846253729509264, 'complete', '2024-08-17 14:54:39'),
('ec6e8f75-2b19-41af-b329-a11eec15277a', 'ord000017we1245', 16437934625162832, 'cancelled', '2025-02-22 17:37:59');

CREATE TABLE `Orders` (
  `OrderId` varchar(50) NOT NULL,
  `OrderNumber` bigint(16) NOT NULL,
  `StoreId` varchar(50) NOT NULL,
  `ProductId` varchar(50) NOT NULL,
  `UserId` varchar(50) NOT NULL,
  `AddressId` varchar(50) NOT NULL,
  `PaymethodId` varchar(50) NOT NULL,
  `ShippingMethodId` varchar(50) NOT NULL,
  `TrackNo` varchar(50) NOT NULL,
  `Status` varchar(50) NOT NULL,
  `OrderDate` datetime NOT NULL
);

INSERT INTO `Orders` (`OrderId`, `OrderNumber`, `StoreId`, `ProductId`, `UserId`, `AddressId`, `PaymethodId`, `ShippingMethodId`, `TrackNo`, `Status`, `OrderDate`) VALUES
('ord000017we1245', 16437934625162832, 'str000017we1245', 'prd000017we1245', 'usr00001pqdjs1z', 'addr00007qzux3ql', ' paym000015ydtnoo', 'ssm000017we1245', '556-764-962-653', 'processing', '2024-01-21 13:50:32'),
('ord000017we1246', 7846253729509264, 'str000017we1245', 'prd000017we1245', 'usr00001pqdjs1z', 'addr00007qzux3ql', ' paym000015ydtnoo', 'ssm000017we1245', '556-764-962-653', 'complete', '2024-01-31 13:50:32');

CREATE TABLE `Products` (
  `ProductId` varchar(50) NOT NULL,
  `CategoryId` varchar(50) DEFAULT NULL,
  `StoreId` varchar(50) DEFAULT NULL,
  `BrandId` varchar(50) NOT NULL,
  `IsActive` tinyint(1) NOT NULL,
  `HasVariations` tinyint(1) NOT NULL,
  `TrackStockQuantity` tinyint(1) NOT NULL,
  `ItemsPerOrder` int(11) NOT NULL,
  `IsOutOfStock` tinyint(1) NOT NULL,
  `Price` decimal(10,2) DEFAULT NULL,
  `Title` varchar(255) DEFAULT NULL,
  `Description` text,
  `ShortDescription` varchar(150) NOT NULL,
  `Thumbnails` varchar(255) DEFAULT NULL,
  `MetaTitle` varchar(255) DEFAULT NULL,
  `MetaDescription` text,
  `Dimensions` varchar(50) DEFAULT NULL,
  `Weight` decimal(10,2) DEFAULT NULL,
  `Discount` decimal(5,2) DEFAULT NULL,
  `Colors` varchar(255) DEFAULT NULL,
  `Sizes` varchar(255) DEFAULT NULL,
  `SKU` varchar(50) DEFAULT NULL,
  `QuantityPerUnit` int(11) DEFAULT NULL,
  `AdditionalInfo` text,
  `CreatedAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO `Products` (`ProductId`, `CategoryId`, `StoreId`, `BrandId`, `IsActive`, `HasVariations`, `TrackStockQuantity`, `ItemsPerOrder`, `IsOutOfStock`, `Price`, `Title`, `Description`, `ShortDescription`, `Thumbnails`, `MetaTitle`, `MetaDescription`, `Dimensions`, `Weight`, `Discount`, `Colors`, `Sizes`, `SKU`, `QuantityPerUnit`, `AdditionalInfo`, `CreatedAt`) VALUES
('base-product', 'womens-dress-shirts', 'str000017we1245', 'brn000017we1245', 0, 1, 1, 1, 0, 0.00, 'mens pants 1', 'cannot be purchased', 'cannot be purchased', '../../assets/images/products/product-1-500x500.jpg', 'xxxxx', 'the nigga that huns like', '', 0.00, 10.00, 'red', '50', 'GHTR96', NULL, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', '2024-01-21 08:08:06'),
('prd000017we1245', 'mens-dress-shirts', 'str000017we1245', 'brn000017we1245', 1, 1, 1, 10, 1, 299.99, 'Levis Pants for brakes', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. wew', 'Vhusani Libago', '../../assets/images/products/product-1-500x500.jpg', 'vhusani libagorrrr', 'rrrr', '400x400x400', 56.00, 10.00, 'red', '50', 'GHTR9694545', NULL, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', '2024-01-21 08:08:06'),
('prd000017we12453', 'womens-t-shirts', 'str000017we1245', 'brn000017we1245', 1, 0, 1, 1, 0, 799.99, 'Levi women shirt', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. ', 'test description', '../../assets/images/products/product-1-500x500.jpg', 'Lorem Ipsum\r\n', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', '400x400x400', 56.00, 10.00, 'white', '50', 'GHTR96', NULL, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', '2024-02-03 08:08:06')

CREATE TABLE `Users` (
  `UserId` varchar(50) NOT NULL,
  `FirstName` varchar(255) DEFAULT NULL,
  `LastName` varchar(255) DEFAULT NULL,
  `DOB` date DEFAULT NULL,
  `Email` varchar(255) DEFAULT NULL,
  `PhoneCode` varchar(5) NOT NULL,
  `PhoneNumber` varchar(20) DEFAULT NULL,
  `Password` text,
  `Role` varchar(50) DEFAULT NULL,
  `CreatedAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Gender` char(1) NOT NULL,
  `Newsletter` int(11) NOT NULL
);

INSERT INTO `Users` (`UserId`, `FirstName`, `LastName`, `DOB`, `Email`, `PhoneCode`, `PhoneNumber`, `Password`, `Role`, `CreatedAt`, `Gender`, `Newsletter`) VALUES
('usr00001mbm6zew', 'Vhusani', 'The-Dev', '2023-12-05', 'test@webapi.co.za', '+27', '713456783', '$2y$12$6rVB2WyX0ZXZTHewxuF0iOus5Qwn9VWLlaWAkmPJvqjH7jF8SZSQC', '0', '2023-12-27 23:16:09', 'M', 1);

CREATE PROCEDURE `sp_getusers` ()   SELECT * FROM `themlive`.`Users`;

CREATE PROCEDURE `sp_getuserbyid` (IN `p_user_id` VARCHAR(50))   SELECT * FROM Users WHERE UserId= p_user_id LIMIT 1;

ALTER TABLE `Users`
  ADD PRIMARY KEY (`UserId`);
COMMIT;

ALTER TABLE `Products`
  ADD PRIMARY KEY (`ProductId`);
COMMIT;

ALTER TABLE `Orders`
  ADD PRIMARY KEY (`OrderId`);
COMMIT;

ALTER TABLE `OrderNotes`
  ADD PRIMARY KEY (`OrderNoteId`);
COMMIT;