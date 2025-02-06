CREATE TRIGGER minmaxgiolam ON NHAN_VIEN
AFTER INSERT, UPDATE
AS
DECLARE @sogiolam INT,
		@macv CHAR(4);
SELECT @sogiolam = sogiolam,
@macv = macv FROM INSERTED
IF @macv <> 'CV01' and @macv <> 'CV06' and (@sogiolam < 208 OR @sogiolam > 248)
BEGIN
	PRINT(N'Số giờ làm của nhân viên (ngoại trừ an ninh, quản lý) phải trong khoảng 208 đến 248')
	ROLLBACK TRANSACTION
END
ELSE IF @macv = 'CV01' and @sogiolam <> 312
BEGIN
	PRINT(N'Số giờ làm của nhân viên an ninh phải là 312')
	ROLLBACK TRANSACTION
END
ELSE IF @macv = 'CV06' and (@sogiolam < 260 or @sogiolam > 300)
BEGIN
	PRINT(N'Số giờ làm của nhân viên quản lý phải nằm trong khoảng 260 đến 300')
	ROLLBACK TRANSACTION
END