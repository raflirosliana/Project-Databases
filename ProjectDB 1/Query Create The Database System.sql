

--CREATE DATABASE
CREATE DATABASE RA_Laundry

--USE DATABASE yang sudah dibuat
USE RA_Laundry
	
--QUERY CREATE TABLE Master, Header, dan Detail
CREATE TABLE MsStaff(
	StaffId CHAR(5) NOT NULL PRIMARY KEY CHECK (StaffId LIKE 'ST[0-9][0-9][0-9]'),
	StaffName VARCHAR(50) NOT NULL,
	StaffGender VARCHAR(10) NOT NULL CHECK (StaffGender = 'Male' OR StaffGender = 'Female'),
	StaffAddress VARCHAR(50) NOT NULL CHECK(LEN(StaffAddress) > 10),
	StaffSalary INT CHECK (StaffSalary >= 1500000 AND StaffSalary <= 3000000)
)
CREATE TABLE MsCustomer(
	CustomerId CHAR(5) NOT NULL PRIMARY KEY CHECK (CustomerId LIKE 'CU[0-9][0-9][0-9]'),
	CustomerName VARCHAR(50) NOT NULL,
	CustomerGender VARCHAR(10) NOT NULL CHECK (CustomerGender = 'Male' OR CustomerGender = 'Female'),
	CustomerAddress VARCHAR(50) NOT NULL CHECK(LEN(CustomerAddress) > 10),
	CustomerDOB DATE NOT NULL
)
CREATE TABLE MsVendor(
	VendorId CHAR(5) NOT NULL PRIMARY KEY CHECK (VendorId LIKE 'VE[0-9][0-9][0-9]'),
	VendorName VARCHAR(50) NOT NULL,
	VendorAddress VARCHAR(50) NOT NULL CHECK(LEN(VendorAddress) > 10),
	VendorPhone VARCHAR(12) NOT NULL
)
CREATE TABLE MsMaterial(
	MaterialId CHAR(5) NOT NULL PRIMARY KEY CHECK (MaterialId LIKE 'MA[0-9][0-9][0-9]'),
	MaterialName VARCHAR(50) NOT NULL,
	MaterialType VARCHAR(50) NOT NULL CHECK(MaterialType='Equipment' OR MaterialType='Supplies'),
	MaterialPrice INT NOT NULL
)
CREATE TABLE MsClothes(
	ClothesId CHAR(5) NOT NULL PRIMARY KEY CHECK (ClothesId LIKE 'CL[0-9][0-9][0-9]'),	
	ClothesName VARCHAR(50) NOT NULL,
	ClothesType VARCHAR(50) NOT NULL CHECK(ClothesType='Cotton' OR ClothesType = 'Viscose' OR ClothesType='Polyester' OR ClothesType='Linen' OR ClothesType='Wool')
)
CREATE TABLE HeaderServices(
	TransactionId CHAR(5) NOT NULL PRIMARY KEY CHECK (TransactionId LIKE 'SR[0-9][0-9][0-9]'),
	CustomerId CHAR(5) NOT NULL FOREIGN KEY REFERENCES MsCustomer(CustomerId),
	StaffId CHAR(5) NOT NULL FOREIGN KEY REFERENCES MsStaff(StaffId),
	ServiceDate DATE NOT NULL CHECK(year(ServiceDate) = '2019')
)
CREATE TABLE HeaderPurchase(
	PurchaseId CHAR(5) NOT NULL PRIMARY KEY CHECK (PurchaseId LIKE 'PU[0-9][0-9][0-9]'),
	StaffId CHAR(5) NOT NULL FOREIGN KEY REFERENCES MsStaff(StaffId),
	VendorId CHAR(5) NOT NULL FOREIGN KEY REFERENCES MsVendor(VendorId),
	PurchaseDate DATE NOT NULL CHECK(year(PurchaseDate) = '2019')
)
CREATE TABLE DetailServices(
	TransactionId CHAR(5) NOT NULL FOREIGN KEY REFERENCES HeaderServices(TransactionId),
	ClothesId CHAR(5) NOT NULL FOREIGN KEY REFERENCES MsClothes(ClothesId),
	ServiceType VARCHAR(30) NOT NULL CHECK(ServiceType='Laundry Service' OR ServiceType='Dry Cleaning Service' OR ServiceType='Ironing Service'),
	ServicePrice INT NOT NULL,
	PRIMARY KEY (TransactionId,ClothesId)
)
CREATE TABLE DetailPurchase(
	PurchaseId CHAR(5) NOT NULL FOREIGN KEY REFERENCES HeaderPurchase(PurchaseId),
	MaterialId CHAR(5) NOT NULL FOREIGN KEY REFERENCES MsMaterial(MaterialId),
	Quantity INT NOT NULL,s
	PRIMARY KEY (PurchaseId,MaterialId)
)



/*
select * from MsStaff
select * from MsCustomer
select * from MsVendor
select * from MsMaterial
select * from MsClothes
select * from HeaderServices
select * from HeaderPurchase
select * from DetailServices
select * from DetailPurchase

DROP TABLE MsStaff
DROP TABLE MsCustomer
DROP TABLE MsVendor
DROP TABLE MsMaterial
DROP TABLE MsClothes
DROP TABLE HeaderServices
DROP TABLE HeaderPurchase
DROP TABLE DetailServices
DROP TABLE DetailPurchase
*/