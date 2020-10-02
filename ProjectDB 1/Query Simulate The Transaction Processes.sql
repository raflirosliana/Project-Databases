--QUERY SIMULATE THE TRANSACTION

--USE DATABASE
USE RA_Laundry

--Services Transaction

--CASE 1
INSERT INTO
	HeaderServices (TransactionId,CustomerId,StaffId,ClothesId,ServiceDate)
VALUES
	('SR016','CU001','ST010','2019-07-09')

INSERT INTO
	DetailServices (TransactionId,ClothesId,ServiceType,ServicePrice)
VALUES
	('SR016','CL001','Laundry Service','30000'),
	('SR016','CL002','Dry Cleaning Services','50000'),
	('SR016','CL003','Ironing Service','15000')

--CASE 2
INSERT INTO
	HeaderServices (TransactionId,CustomerId,StaffId,ClothesId,ServiceDate)
VALUES
	('SR017','CU002','ST009','2019-08-29')

INSERT INTO
	DetailServices (TransactionId,ClothesId,ServiceType,ServicePrice)
VALUES
	('SR017','CL004','Laundry Service','30000'),
	('SR017','CL005','Dry Cleaning Services','50000'),
	('SR017','CL006','Ironing Service','15000')

--CASE 3
INSERT INTO
	HeaderServices (TransactionId,CustomerId,StaffId,ClothesId,ServiceDate)
VALUES
	('SR018','CU003','ST008','2019-09-17')

INSERT INTO
	DetailServices (TransactionId,ClothesId,ServiceType,ServicePrice)
VALUES
	('SR018','CL007','Laundry Service','30000'),
	('SR018','CL008','Dry Cleaning Services','50000'),
	('SR018','CL009','Ironing Service','15000')



--Purchase Transaction

--CASE 1
INSERT INTO
	HeaderPurchase (PurchaseId,StaffId,VendorId,PurchaseDate)
VALUES
	('PU016','ST001','VE010','2019-01-04')

INSERT INTO
	DetailPurchase (PurchaseId,MaterialId,Quantity)
VALUES
	('PU016','MA001','5'),
	('PU016','MA002','8'),
	('PU016','MA003','5')

--CASE 2
INSERT INTO
	HeaderPurchase (PurchaseId,StaffId,VendorId,PurchaseDate)
VALUES
	('PU017','ST002','VE010','2019-02-16')

INSERT INTO
	DetailPurchase (PurchaseId,MaterialId,Quantity)
VALUES
	('PU017','MA004','4'),
	('PU017','MA005','6'),
	('PU017','MA006','7')

--CASE 3
INSERT INTO
	HeaderPurchase (PurchaseId,StaffId,VendorId,PurchaseDate)
VALUES
	('PU018','ST003','VE010','2019-03-28')

INSERT INTO
	DetailPurchase (PurchaseId,MaterialId,Quantity)
VALUES
	('PU018','MA007','2'),
	('PU018','MA008','3'),
	('PU018','MA009','5')