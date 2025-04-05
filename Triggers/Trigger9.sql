 CREATE TRIGGER tr_tendv ONHANG_HOA
 AFTER INSERT, UPDATE
 AS DECLARE @dvt NVARCHAR(15);
 SELECT @dvt = donvitinh FROM INSERTED
 IF EXISTS(SELECT 1 FROM INSERTED WHERE donvitinh NOT IN(N'Cái',N'Cặp',N'Bộ')
 BEGIN
	PRINT(N'Ngày nhập hàng không được lớn hơn ngày hiện tại');
	ROLLBACK TRANSACTION;
 END