 --Import and export dates must not be later than the current date.
 CREATE TRIGGER tr_ngaynhap ON PHIEU_NHAP
 AFTER INSERT, UPDATE
 AS DECLARE @nn DATE;
 SELECT @nn = ngaynhap FROM INSERTED
 IF @nn > GETDATE()
 BEGIN
	PRINT(N'Ngày nhập hàng không được lớn hơn ngày hiện tại');
	ROLLBACK TRANSACTION;
 END

 CREATE TRIGGER tr_ngayxuat ON PHIEU_XUAT
 AFTER INSERT, UPDATE
 AS DECLARE @nx DATE;
 SELECT @nx = ngayxuat FROM INSERTED
 IF @nx > GETDATE()
 BEGIN
	PRINT(N'Ngày xuất hàng không được lớn hơn ngày hiện tại');
	ROLLBACK TRANSACTION;
 END