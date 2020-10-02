--USE DATABASE yang sudah dibuat
USE RA_Laundry

--QUERY INSERT DATA Master(10 Data), Header(15 Data), dan Detail(25 Data)
INSERT INTO
	MsStaff (StaffId,StaffName,StaffGender,StaffAddress,StaffSalary)
VALUES
	('ST001','Putri Dara','Female','Rasuna Said road No.86','2000000'),
	('ST002','Zara Dea Imanuel','Female','Gunawarman road No.11','1800000'),
	('ST003','Steffani Ardi','Female','Senopati road No.44','1700000'),
	('ST004','Kevin Angkasa','Male','Cempaka Putih No.28','2200000'),
	('ST005','Maya Tambunan','Female','Rawa Belong road No.99','1900000'),
	('ST006','Michael Ardi','Male','Budi Kemuliaan road No.75','2400000'),
	('ST007','Jonathan','Male','West Menteng No.67','2800000'),
	('ST008','Renita Joel','Female','Permata Hijau No.88','1900000'),
	('ST009','Christian Henry Gumilang','Male','Raden Saleh road No.26','2500000'),
	('ST010','Giovanni','Male','Ismail Marzuki road No.39','2700000')



INSERT INTO
	MsCustomer (CustomerId,CustomerName,CustomerGender,CustomerAddress,CustomerDOB)
VALUES
	('CU001','James Gordon','Male','Bangau road No .1','1999-02-11'),
	('CU002','Peter','Male','Cempaka road No .2','1998-03-19'),
	('CU003','Jonas Glue','Male','Penjernihan road No .14','1990-03-21'),
	('CU004','Jonathan','Male','Plavez road No .6','1983-07-21'),
	('CU005','Kevin Julius','Male','Anggrek road No .12','1999-03-18'),
	('CU006','Okto Josua Summer','Male','Rawa road No .13','1991-09-21'),
	('CU007','Chaka Natalie','Female','Penjernihan road No .87','1992-04-14'),
	('CU008','Yosevine','Female','Plavez road No .6','1989-09-29'),
	('CU009','Clay Aiken Phil','Male','Penjernihan road No .194','1988-08-18'),
	('CU010','Chris Scott Kennedy','Male','Plavez road No .92','1995-11-23')



INSERT INTO
	MsVendor (VendorId,VendorName,VendorAddress,VendorPhone)
VALUES
	('VE001','PT. Angkasa Pura','Sudirman road No.42','081218674367'),
	('VE002','Stark Industries','Penjernihan road No .19','081537589354'),
	('VE003','Wayne Enterprise','Pajajaran road No. 9','082538505477'),
	('VE004','Xeon Group','Majapahit road No. 23','081756285739'),
	('VE005','PT. Adaro Energy','Plavez road No .63','081516378225'),
	('VE006','BCA Finance','Kuyang road No. 54','085746287599'),
	('VE007','PT. Saratoga Investama','Kebon Sirih road No.21','081637599756'),
	('VE008','Astra Insurance','Thamrin road No. 45','082646648675'),
	('VE009','PT. Indah Permata','Yos Sudarso road No.22','083548769758'),
	('VE010','Vens Cargo','S.Parman road No.88','082437646578')



INSERT INTO
	MsMaterial (MaterialId,MaterialName,MaterialType,MaterialPrice)
VALUES
	('MA001','Wood','Equipment','300000'),
	('MA002','Garmen','Supplies','500000'),
	('MA003','Bag','Equipment','900000'),
	('MA004','Softener','Equipment','650000'),
	('MA005','Perfume','Supplies','450000'),
	('MA006','Petrochemical','Equipment','875000'),
	('MA007','Soap','Supplies','220000'),
	('MA008','Iron','Supplies','375000'),
	('MA009','Aluminium','Equipment','525000'),
	('MA010','Litium','Equipment','750000')



INSERT INTO
	MsClothes (ClothesId,ClothesName,ClothesType)
VALUES
	('CL001','Suvreme','Cotton'),
	('CL002','Kompaz','Viscose'),
	('CL003','Yizih','Cotton'),
	('CL004','ErZordan','Polyester'),
	('CL005','Agigas','Linen'),
	('CL006','Naiki','Wool'),
	('CL007','LuiVutonk','Polyester'),
	('CL008','Sara','Viscose'),
	('CL009','KarlandMarx','Linen'),
	('CL010','Guci','Wool')



INSERT INTO
	HeaderServices (TransactionId,CustomerId,StaffId,ServiceDate)
VALUES
	('SR001','CU001','ST001','2019-07-09'),
	('SR002','CU002','ST003','2019-12-29'),
	('SR003','CU004','ST005','2019-08-17'),
	('SR004','CU005','ST008','2019-07-21'),
	('SR005','CU007','ST004','2019-02-16'),
	('SR006','CU001','ST002','2019-04-25'),
	('SR007','CU009','ST007','2019-06-03'),
	('SR008','CU008','ST010','2019-07-26'),
	('SR009','CU003','ST003','2019-11-19'),
	('SR010','CU008','ST009','2019-10-22'),
	('SR011','CU004','ST008','2019-04-25'),
	('SR012','CU006','ST001','2019-07-13'),
	('SR013','CU002','ST007','2019-06-12'),
	('SR014','CU010','ST009','2019-03-09'),
	('SR015','CU007','ST004','2019-08-27')


INSERT INTO
	HeaderPurchase (PurchaseId,StaffId,VendorId,PurchaseDate)
VALUES
	('PU001','ST001','VE001','2019-07-13'),
	('PU002','ST003','VE005','2019-11-24'),
	('PU003','ST004','VE006','2019-12-08'),
	('PU004','ST006','VE008','2019-04-17'),
	('PU005','ST003','VE002','2019-07-24'),
	('PU006','ST001','VE009','2019-06-28'),
	('PU007','ST008','VE005','2019-02-19'),
	('PU008','ST010','VE004','2019-07-12'),
	('PU009','ST009','VE010','2019-09-13'),
	('PU010','ST002','VE001','2019-02-28'),
	('PU011','ST008','VE003','2019-07-08'),
	('PU012','ST005','VE008','2019-05-16'),
	('PU013','ST006','VE007','2019-10-28'),
	('PU014','ST010','VE009','2019-03-23'),
	('PU015','ST007','VE002','2019-07-21')



INSERT INTO
	DetailServices (TransactionId,ClothesId,ServiceType,ServicePrice)
VALUES
	('SR001','CL001','Laundry Service','30000'),
	('SR002','CL002','Dry Cleaning Service','50000'),
	('SR003','CL003','Ironing Service','15000'),
	('SR004','CL004','Laundry Service','30000'),
	('SR005','CL005','Dry Cleaning Service','50000'),
	('SR006','CL006','Laundry Service','30000'),
	('SR007','CL007','Laundry Service','30000'),
	('SR008','CL008','Ironing Service','15000'),
	('SR009','CL009','Dry Cleaning Service','50000'),
	('SR010','CL010','Laundry Service','30000'),
	('SR011','CL001','Ironing Service','15000'),
	('SR012','CL002','Dry Cleaning Service','50000'),
	('SR013','CL003','Ironing Service','15000'),
	('SR014','CL004','Ironing Service','15000'),
	('SR015','CL005','Dry Cleaning Service','50000'),
	('SR005','CL006','Dry Cleaning Service','50000'),
	('SR006','CL007','Dry Cleaning Service','50000'),
	('SR007','CL008','Laundry Service','30000'),
	('SR011','CL009','Laundry Service','30000'),
	('SR012','CL010','Dry Cleaning Service','50000'),
	('SR013','CL006','Ironing Service','15000'),
	('SR014','CL007','Laundry Service','30000'),
	('SR015','CL008','Dry Cleaning Service','50000'),
	('SR001','CL009','Dry Cleaning Service','50000'),
	('SR002','CL010','Ironing Service','15000')


INSERT INTO
	DetailPurchase (PurchaseId,MaterialId,Quantity)
VALUES
	('PU001','MA001','5'),
	('PU002','MA007','8'),
	('PU003','MA003','5'),
	('PU004','MA001','4'),
	('PU005','MA002','6'),
	('PU006','MA008','7'),
	('PU007','MA007','2'),
	('PU008','MA002','3'),
	('PU009','MA004','5'),
	('PU010','MA006','3'),
	('PU011','MA003','7'),
	('PU012','MA002','4'),
	('PU013','MA009','8'),
	('PU014','MA003','5'),
	('PU015','MA001','9'),
	('PU001','MA004','7'),
	('PU002','MA006','3'),
	('PU003','MA010','7'),
	('PU004','MA005','3'),
	('PU005','MA009','6'),
	('PU006','MA004','4'),
	('PU007','MA010','7'),
	('PU008','MA010','4'),
	('PU009','MA008','8'),
	('PU010','MA005','7')
	
