 -- Phone numbers must consist of exactly 10 digits.
 --Employees
 CREATE TRIGGER tr_sdtnv on NHAN_VIEN
 AFTER INSERT, UPDATE
 AS DECLARE @sdtnv CHAR(20);
 SELECT @sdtnv = sdt FROM INSERTED
 IF LEN(@sdtnv) <> 10
 BEGIN
	PRINT(N'Số điện thoại nhập vào không hợp lệ');
	ROLLBACK TRANSACTION;
 END

 --Customers
 CREATE TRIGGER tr_sdtkh on KHACH_HANG
 AFTER INSERT, UPDATE
 AS DECLARE @sdtkh CHAR(20);
 SELECT @sdtkh = sdt FROM INSERTED
 IF LEN(@sdtkh) <> 10
 BEGIN
	PRINT(N'Số điện thoại nhập vào không hợp lệ');
	ROLLBACK TRANSACTION;
 END

 --Suppliers
 CREATE TRIGGER tr_sdtncc on NHA_CUNG_CAP
 AFTER INSERT, UPDATE
 AS DECLARE @sdtncc CHAR(20);
 SELECT @sdtncc = sdt FROM INSERTED
 IF LEN(@sdtncc) <> 10
 BEGIN
	PRINT(N'Số điện thoại nhập vào không hợp lệ');
	ROLLBACK TRANSACTION;
 END