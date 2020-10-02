
--1
SELECT 
	mc.CustomerId, 
	CustomerName,
	[TotalServicePrice] = SUM(ServicePrice)
FROM 
	MsCustomer mc, 
	HeaderServices hs, 
	DetailServices ds
WHERE 
	mc.CustomerId = hs.CustomerId AND hs.TransactionId = ds.TransactionId AND MONTH(ServiceDate) = 7 AND CustomerGender = 'Male'
GROUP BY 
	mc.CustomerId, CustomerName

--2
SELECT 
	StaffName, 
	PurchaseDate,
	[TotalTransaction] = COUNT(PurchaseId)
FROM 
	MsStaff ms, 
	HeaderPurchase hp
WHERE 
	ms.StaffId = hp.StaffId AND StaffName LIKE '%o%'
GROUP BY 
	StaffName, 
	PurchaseDate
HAVING 
	COUNT(PurchaseId) > 1

--3
SELECT 
	VendorName, 
	PurchaseDate = CONVERT(VARCHAR,PurchaseDate,107),
	[TotalTransaction] = COUNT(hp.PurchaseId),
	[TotalPurchasePrice] = SUM(Quantity*MaterialPrice)
FROM 
	MsVendor mv, 
	HeaderPurchase hp, 
	DetailPurchase dp, 
	MsMaterial mm
WHERE
	mv.VendorId=hp.VendorId AND 
	hp.PurchaseId=dp.PurchaseId AND 
	dp.MaterialId=mm.MaterialId AND
	VendorName LIKE 'PT.%' AND
	DAY(PurchaseDate)%2=1
GROUP BY
	VendorName,PurchaseDate


--4
SELECT
	StaffName, MaterialName, 
	[TotalTransaction] = COUNT(hp.PurchaseId),
	[TotalQuantity] = CONCAT(SUM(Quantity),' pcs')
FROM
	MsStaff ms, HeaderPurchase hp, DetailPurchase dp, MsMaterial mm
WHERE
	ms.StaffId=hp.StaffId AND 
	hp.PurchaseId = dp.PurchaseId AND 
	dp.MaterialId = mm.MaterialId
GROUP BY
	StaffName,MaterialName


--5
SELECT
	MaterialId = REPLACE(mm.MaterialId,'MA','Material '),
	MaterialName, 
	PurchaseDate, 
	Quantity
FROM 
	MsMaterial mm, 
	DetailPurchase dp, 
	HeaderPurchase hp,
	(
		SELECT AvgQuantity = AVG(Quantity)
		From DetailPurchase dp
	) as AverageQuantity
WHERE 
	mm.MaterialId = dp.MaterialId AND 
	dp.PurchaseId = hp.PurchaseId AND
	MaterialType = 'Supplies' AND
	Quantity > AvgQuantity
ORDER BY
	MaterialId


--6
SELECT
	StaffName, 
	CustomerName, 
	ServiceDate = CONVERT(VARCHAR,ServiceDate,106)
FROM
	MsStaff ms, 
	MsCustomer mc, 
	HeaderServices hp,
	(
		SELECT AvgSalary = AVG(StaffSalary)
		From MsStaff ms
	) as AverageSalary
WHERE
	ms.StaffId = hp.StaffId AND 
	hp.CustomerId = mc.CustomerId AND
	StaffSalary > AvgSalary AND
	charindex(' ', StaffName) = 0


--7
SELECT
	ClothesName,
	[TotalTransaction] = COUNT(ds.TransactionId),
	ServiceType = LEFT(ServiceType, CHARINDEX(' ',ServiceType)),
	ServicePrice
FROM 
	MsClothes mc, 
	DetailServices ds,
	(
		SELECT AvgServicePrice = AVG(ServicePrice)
		From DetailServices ds
	) as AverageServicePrice
WHERE
	mc.ClothesId = ds.ClothesId AND
	ClothesType = 'Cotton' AND
	ServicePrice < AvgServicePrice
GROUP BY
	ClothesName, 
	ServiceType, 
	ServicePrice



--8
SELECT
	[StaffFirstName] = LEFT(StaffName,charindex(' ',StaffName)),
	VendorName,
	[VendorPhoneNumber] = STUFF(VendorPhone, 1, 2, '+628'),
	[TotalTransaction] = COUNT(hp.PurchaseId)
FROM
	MsStaff ms, 
	HeaderPurchase hp, 
	MsVendor mv, 
	DetailPurchase dp,
	(
		SELECT AvgQuantity = AVG(Quantity)
		From DetailPurchase dp
	) as AverageQuantity
WHERE 
	ms.StaffId = hp.StaffId AND 
	hp.VendorId = mv.VendorId AND 
	hp.PurchaseId = dp.PurchaseId AND
	Quantity > AvgQuantity AND
	StaffName LIKE '% %' AND 
	StaffName NOT LIKE '% % %'
GROUP BY
	StaffName, 
	VendorName, 
	VendorPhone



--9
CREATE VIEW [ViewMaterialPurchase] AS
SELECT 
	MaterialName, 
	MaterialPrice = 'Rp. '+ CONVERT(VARCHAR(50), CAST(MaterialPrice AS money), -1),
	[TotalTransaction] = COUNT(PurchaseId),
	[TotalPrice] = 'Rp. '+ CONVERT(VARCHAR(50), CAST(SUM(Quantity*MaterialPrice) AS money), -1)
FROM
	MsMaterial mm JOIN DetailPurchase dp ON mm.MaterialId = dp.MaterialId
WHERE
	MaterialType = 'Supplies'
GROUP BY
	MaterialName,
	MaterialPrice
HAVING
	COUNT(PurchaseId) > 2

/*
DROP VIEW ViewMaterialPurchase
SELECT * FROM ViewMaterialPurchase
*/



--10
CREATE VIEW [ViewMaleCustomerTransaction] AS
SELECT
	CustomerName,
	ClothesName,
	[TotalTransaction] = COUNT(hs.TransactionId),
	[TotalPrice] = SUM(ServicePrice)
FROM
	MsCustomer mc JOIN HeaderServices hs ON mc.CustomerId = hs.CustomerId
	JOIN DetailServices ds ON hs.TransactionId = ds.TransactionId
	JOIN MsClothes mcl ON ds.ClothesId = mcl.ClothesId
WHERE
	CustomerGender = 'Male' AND
	ClothesType = 'Wool' OR 
	ClothesType = 'Linen'
GROUP BY
	CustomerName,
	ClothesName


/*
SELECT [c]=COUNT(TransactionId) FROM HeaderServices
DROP VIEW ViewMaleCustomerTransaction
SELECT * FROM ViewMaleCustomerTransaction
*/